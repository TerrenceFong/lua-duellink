local this = {}

this.debug = false
this.lib_version = "v1.03"
this.protocol = "https"
this.host = "api.paojiaoyun.com"
this._device_id = systeminfo.serial()

this._app_key = ""
this._app_secret = ""
this._card = ""
this._username = ""
this._password = ""
this._token = ""

this.is_trial = false  -- 是否是试用用户
this.login_result = {
	card_type="",
	expires="",
	expires_ts=0,
	config="",
}

this.auto_heartbeat = true
this._heartbeat_gap = 60*1000

global = thread.newGlobalVar("global")
global._heartbeat_ret = {code=-9, message="还未开始验证"}
global._prev_nonce = nil

this._onHeartbeatFailed = function(ret)
	toast(ret.message)
	logcat(ret.message)
	xscript.stop()
end

function this.onHeartbeatFailed(callback)
	this._onHeartbeatFailed = callback
end

function this.init(app_key, app_secret)
	this._app_key = app_key
	this._app_secret = app_secret
end

function this.setCard(card)
	this._card = string.trim(card)
end

function this.setUser(username, password)
	this._username = string.trim(username)
	this._password = string.trim(password)
end

local function clear()
	this._token = ""
	this.login_result = {
		card_type="",
		expires="",
		expires_ts=0,
		config="",
	}
end

function this.getTimestamp()
	local http = require("socket.http")
	local body, code = http.request("http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp")
	if code == 200 then
		ret = json.decode(body)
		return math.floor(ret["data"]["t"]/1000)
	else 
		logcat("获取网络时间戳失败，用本地时间戳")
		return os.time()
	end
end

local charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function this.randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return this.randomString(length - 1) .. charset[math.random(1, #charset)]
end

local function genNonce()
	return this.randomString(20)
end

local function joinParams(params)
	local ps = {}
	for k, v in pairs(params) do
		table.insert(ps, tostring(k).."="..tostring(v))
	end
	table.sort(ps)
	return table.concat(ps, "&")
end

function this._to_pretty(value, indent, vmap)
    local str = ''
    indent = indent or ''
    vmap = vmap or {}
	
	--递归结束条件
    if (type(value) ~= 'table') then
        if (type(value) == 'string') then
			--字符串
            str = string.format("\"%s\"", value)
        else
			--整数
            str = tostring(value)
        end
    else
        if type(vmap) == 'table' then
            if vmap[value] then return '('..tostring(value)..')' end
            vmap[value] = true
        end
		
        local auxTable = {}  	--保存元表KEY(非整数)
        local iauxTable = {}	--保存元表value
        local iiauxTable = {}	--保存数组(key为0)
        table.foreach(value, function(i, v)
            if type(i) == 'number' then
                if i == 0 then
                    table.insert(iiauxTable, i)
                else
                    table.insert(iauxTable, i)
                end
            elseif type(i) ~= 'table' then
                table.insert(auxTable, i)
            end
        end)
        table.sort(iauxTable)

        str = str..'{\n'
        local separator = ""
        local entry = "\n"
        local barray = true
        local kk,vv
        table.foreachi (iauxTable, function (i, k)
            if i == k and barray then
                entry = this._to_pretty(value[k], indent..'  \t', vmap)
                str = str..separator..indent..'  \t'..entry
                separator = ", \n"
            else
                barray = false
                table.insert(iiauxTable, k)
            end
        end)
        table.sort(iiauxTable)
		
        table.foreachi (iiauxTable, function (i, fieldName)
            
            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            entry = kk .. " = " .. this._to_pretty(value[fieldName],indent..'  \t',vmap)
            
            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)
        table.sort(auxTable)
		
        table.foreachi (auxTable, function (i, fieldName)

            kk = tostring(fieldName)
            if type(fieldName) == "number" then 
                kk = '['..kk.."]"
            end 
            vv = value[fieldName]
            entry = kk .. " = " .. this._to_pretty(value[fieldName],indent..'  \t',vmap)

            str = str..separator..indent..'  \t'..entry
            separator = ", \n"
        end)
		
        str = str..'\n'..indent..'}'
    end
	
    return str
end

local function CheckRespSign(resp)
	if (resp.code ~= 0 and resp.nonce == "" and resp.sign == "") then
		return resp
	end
	
	local ps = ""
	if (resp["result"] ~= nil) then
		ps = joinParams(resp["result"])
	end

	local s = resp["code"]..resp["message"]..ps..resp["nonce"]..this._app_secret
	local sign = security.md5(s)
	if (sign == resp["sign"]) then
		if (global._prev_nonce == nil) then
			global._prev_nonce = resp["nonce"]
			return {code=0, message="OK"}
		else
			if (global._prev_nonce == resp["nonce"]) then
				return {code=-98, message="轻点，疼~"}
			else
				return {code=0, message="OK"}
			end
		end
	end
	return {code=-99, message="轻点，疼~"}
end

local function _debug(method, path, params, result)
	if this.debug then
		local r = result
		if type(result) == "table" then
			r = this._to_pretty(result)
		end
		logcat(string.format("%s %s:\nparams:%s\nresult:%s", method, path, this._to_pretty(params), r))
	end
end

local function Request(method, path, params)
	local http = require("socket.http")
	-- 构建公共参数
	params["app_key"] = this._app_key
	
	local url = this.protocol.."://"..this.host..path
	local max_retries = 5
	local retries_count = 0
	
	local data = {code=-1, message="连接服务器失败"}
	while (retries_count < max_retries) do
		params["nonce"] = genNonce()
		params["timestamp"] = this.getTimestamp()
		
		local ps = joinParams(params)
		local s = method..this.host..path..ps..this._app_secret
		local sign = security.md5(s)
		
		retries_count = retries_count + 1
		local body = ""
		if (method == "GET") then
			body = http.request(url.."?"..ps.."&sign="..sign)
		else 
			body = http.request(url, ps.."&sign="..sign)
		end
		
		if string.startsWith(body, "{") then
			data = json.decode(body)
			_debug(method, path, params, data)
			local crs = CheckRespSign(data)
			if (crs.code == 0) then
				return data
			else 
				return crs
			end
		else 
			_debug(method, path, params, body)
			sleep(2000)
		end
	end
	return data
end

function this.GetHeartbeatResult()
	return global._heartbeat_ret
end

function this.GetTimeRemaining()
	local g = this.login_result.expires_ts - this.getTimestamp()
	if g < 0 then
		return 0
	else 
		return g
	end
end

function this.CardLogin()
	if (this._card == "") then
		return {code=-4, message="请先设置卡密"}
	end
	if (this._token ~= "") then
		return {code=-3, message="请先退出登录"}
	end
	local method = "POST"
	local path = "/v1/card/login"
	local data = {card=this._card, device_id=this._device_id}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.is_trial = false
		this._token = ret.result.token
		this.login_result = ret.result
		if (this.auto_heartbeat) then
			this._startCardHeartbeat()
		end
	end
	return ret
end

function this.CardHeartbeat()  -- 卡密心跳，默认会自动调用
	if (this._token == "") then
		return {code=-2, message="请在卡密登录成功后调用"}
	end
	local method = "POST"
	local path = "/v1/card/heartbeat"
	local data = {card=this._card, token=this._token}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.login_result.expires = ret.result.expires
		this.login_result.expires_ts = ret.result.expires_ts
	end
	return ret
end

function this._startCardHeartbeat()
	global._heartbeat_ret = this.CardHeartbeat()
	setTrigger.timeLoop(this._heartbeat_gap, function()
		global._heartbeat_ret = this.CardHeartbeat()
		if (global._heartbeat_ret.code ~= 0) then
			this._onHeartbeatFailed(global._heartbeat_ret)
			clear()
		end
	end)  
end

function this.CardLogout()  -- 卡密退出登录
	this._heartbeat_ret = {code=-9, message="还未开始验证"}
	if (this._token == "") then
		return {code=0, message="OK"}
	end
	local method = "POST"
	local path = "/v1/card/logout"
	local data = {card=this._card, token=this._token}
	local ret = Request(method, path, data)
	-- 清理
	clear()
	return ret
end

function this.CardUnbindDevice()  -- 卡密解绑设备，需开发者后台配置
	if (this._token == "") then
		return {code=-2, message="请在卡密登录成功后调用"}
	end
	local method = "POST"
	local path = "/v1/card/unbind_device"
	local data = {card=this._card, device_id=this._device_id, token=this._token}
	return Request(method, path, data)
end

function this.SetCardUnbindPassword(password)  -- 自定义设置解绑密码
	if (this._token == "") then
		return {code=-2, message="请在卡密登录成功后调用"}
	end
	local method = "POST"
	local path = "/v1/card/unbind_password"
	local data = {card=this._card, password=password, token=this._token}
	return Request(method, path, data)
end

function this.CardUnbindDeviceByPassword(password)  -- 用户通过解绑密码解绑设备
	local method = "POST"
	local path = "/v1/card/unbind_device/by_password"
	local data = {card=this._card, password=password}
	return Request(method, path, data)
end

function this.CardRecharge(card, use_card)  -- 以卡充卡
	local method = "POST"
	local path = "/v1/card/recharge"
	local data = {card=card, use_card=use_card}
	return Request(method, path, data)
end

function this.UserRegister(username, password, card)  -- 用户注册（通过卡密）
	local method = "POST"
	local path = "/v1/user/register"
	local data = {username=username, password=password, card=card, device_id=this._device_id}
	return Request(method, path, data)
end

function this.UserLogin()  -- 用户账号登录
	if (this._username == "" or this._password == "") then
		return {code=-4, message="请先设置用户账号密码"}
	end
	if (this._token ~= "") then
		return {code=-3, message="请先退出登录"}
	end
	local method = "POST"
	local path = "/v1/user/login"
	local data = {username=this._username, password=this._password, device_id=this._device_id}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.is_trial = false
		this._token = ret.result.token
		this.login_result = ret.result
		if (this.auto_heartbeat) then
			this._startUserHeartbeat()
		end
	end
	return ret
end

function this.UserHeartbeat()  -- 用户心跳，默认会自动调用
	if (this._token == "") then
		return {code=-2, message="请在用户登录成功后调用"}
	end
	local method = "POST"
	local path = "/v1/user/heartbeat"
	local data = {username=this._username, token=this._token}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.login_result.expires = ret.result.expires
		this.login_result.expires_ts = ret.result.expires_ts
	end
	return ret
end

function this._startUserHeartbeat()
	global._heartbeat_ret = this.UserHeartbeat()
	setTrigger.timeLoop(this._heartbeat_gap, function()
		global._heartbeat_ret = this.UserHeartbeat()
		if (global._heartbeat_ret.code ~= 0) then
			this._onHeartbeatFailed(global._heartbeat_ret)
			clear()
		end
	end)  
end

function this.UserLogout()  -- 用户退出登录
	this._heartbeat_ret = {code=-9, message="还未开始验证"}
	if (this._token == "") then
		return {code=0, message="OK"}
	end
	local method = "POST"
	local path = "/v1/card/logout"
	local data = {username=this._username, token=this._token}
	local ret = Request(method, path, data)
	-- 清理
	clear()
	return ret
end

function this.UserChangePassword(username, password, new_password)  -- 用户修改密码
	local method = "POST"
	local path = "/v1/user/password"
	local data = {username=username, password=password, new_password=new_password}
	return Request(method, path, data)
end

function this.UserRecharge(username, card)  -- 用户通过卡密充值
	local method = "POST"
	local path = "/v1/user/recharge"
	local data = {username=username, card=card}
	return Request(method, path, data)
end

function this.UserUnbindDevice()  -- 用户解绑设备，需开发者后台配置
	if (this._token == "") then
		return {code=-2, message="请在用户登录成功后调用"}
	end
	local method = "POST"
	local path = "/v1/user/unbind_device"
	local data = {username=this._username, token=this._token}
	return Request(method, path, data)
end

function this.GetCardConfig()  -- 获取卡密配置
	local method = "GET"
	local path = "/v1/card/config"
	local data = {card=this._card}
	return Request(method, path, data)
end

function this.UpdateCardConfig(config)  -- 更新卡密配置
	local method = "POST"
	local path = "/v1/card/config"
	local data = {card=this._card, config=config}
	return Request(method, path, data)
end

function this.GetUserConfig()  -- 获取用户配置
	local method = "GET"
	local path = "/v1/user/config"
	local data = {username=this._username}
	return Request(method, path, data)
end

function this.UpdateUserConfig(config)  -- 更新用户配置
	local method = "POST"
	local path = "/v1/user/config"
	local data = {username=this._username, config=config}
	return Request(method, path, data)
end

function this.GetSoftwareConfig()  -- 获取软件配置
	local method = "GET"
	local path = "/v1/software/config"
	return Request(method, path, {})
end

function this.GetSoftwareNotice()  -- 获取软件通知
	local method = "GET"
	local path = "/v1/software/notice"
	return Request(method, path, {})
end

function this.GetSoftwareLatestVersion(current_ver)  -- 获取软件最新版本
	local method = "GET"
	local path = "/v1/software/latest_ver"
	local data = {version=current_ver}
	return Request(method, path, data)
end

function this.TrialLogin()  -- 试用登录
	if (this._token ~= "") then
		return {code=-3, message="请先退出登录"}
	end
	local method = "POST"
	local path = "/v1/trial/login"
	local data = {device_id=this._device_id}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.is_trial = true
		this.login_result = ret.result
		if (this.auto_heartbeat) then
			this._startTrialHeartbeat()
		end
	end
	return ret
end

function this.TrialHeartbeat()  -- 试用心跳，默认会自动调用
	local method = "POST"
	local path = "/v1/trial/heartbeat"
	local data = {device_id=this._device_id}
	local ret = Request(method, path, data)
	if (ret.code == 0) then
		this.login_result.expires = ret.result.expires
		this.login_result.expires_ts = ret.result.expires_ts
	end
	return ret
end

function this._startTrialHeartbeat()
	global._heartbeat_ret = this.TrialHeartbeat()
	setTrigger.timeLoop(this._heartbeat_gap, function()
		global._heartbeat_ret = this.TrialHeartbeat()
		if (global._heartbeat_ret.code ~= 0) then
			this._onHeartbeatFailed(global._heartbeat_ret)
			clear()
		end
	end)  
end

function this.TrialLogout()  -- 试用退出登录
	this.is_trial = false
	this._heartbeat_ret = {code=-9, message="还未开始验证"}
	-- 清理
	clear()
	return ret
end

function this.GetRemoteVar(key)  -- 获取远程变量
	local method = "GET"
	local path = "/v1/af/remote_var"
	local data = {key=key}
	return Request(method, path, data)
end

function this.GetRemoteData(key)  -- 获取远程数据
	local method = "GET"
	local path = "/v1/af/remote_data"
	local data = {key=key}
	return Request(method, path, data)
end

function this.CreateRemoteData(key, value)  -- 创建远程数据
	local method = "POST"
	local path = "/v1/af/remote_data"
	local data = {action="create", key=key, value=value}
	return Request(method, path, data)
end

function this.UpdateRemoteData(key, value)  -- 修改远程数据
	local method = "POST"
	local path = "/v1/af/remote_data"
	local data = {action="update", key=key, value=value}
	return Request(method, path, data)
end

function this.DelocaleRemoteData(key, value)  -- 删除远程数据
	local method = "POST"
	local path = "/v1/af/remote_data"
	local data = {action="delocale", key=key}
	return Request(method, path, data)
end

function this.CallRemoteFunc(func_name, params)  -- 执行远程函数
	local method = "POST"
	local path = "/v1/af/call_remote_func"
	local ps = json.encode(params)
	local data = {func_name=func_name, params=ps}
	local ret = Request(method, path, data)
	if (ret.code == 0 and ret.result["return"] ~= nil) then
		ret.result = json.decode(ret.result["return"])
	end
	return ret
end

function this.run()
	logcat(_debug("POST", "/v1/timestamp", {abc="123", bcd="345"}, "123"))
	logcat(this._app_key, this._app_secret)
end

return this

