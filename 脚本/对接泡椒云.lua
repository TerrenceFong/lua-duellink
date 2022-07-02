method = "POST"
protocol = "http://"
host = "api.paojiaoyun.com"
key = "c6ob3q3dqusthdt13f80" -- appkey
secret = "xswwNdYkszx7Xxcx2ZGEsfULCjRSh2vs" -- appsecret
心跳结果={}
登录结果={}

--[[
以上是为默认参数 appkey appsecret 自行修改
相应示例及返回的验证信息的具体读取,请看泡椒官方文档 网址:docs.paojiaoyun.com
]]--

function get设备ID()
	if  getDeviceId() ~= "" then
    	if type(getDeviceId()) == "number" then
        	return string.format("%d",getDeviceId())
        else
        	return getDeviceId()
        end
		
	end
	if fileExist("sdcard/青石/ID.txt") == false then -- 某些设备不能直接获取ID 所以就弄个文件生成一个15位的随机数当设备ID
		local ID=""
		extractAssets("斑驳青石.rc","sdcard/青石","ID.txt") -- 这里改自己资源名称 文件路径
		io.output("sdcard/青石/ID.txt")
		for i=1,15 do
			ID=ID..string.format("%d",rnd(0,9))
		end
		io.write(tostring(ID))
        writeLog(ID)
		return ID
	else
		local ID = readFile("sdcard/青石/ID.txt")
		io.close()
		return ID
	end
end
设备ID = get设备ID()

function getNonce()
	local Nonce = MD5(设备ID..获取时间戳()..string.format("%d",rnd(1,1000)))
	return Nonce
end

function 获取时间戳()
	local body, code = httpGet("http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp")
	if code == 200 then
		ret = jsonLib.decode(body)
		return math.floor(ret["data"]["t"]/1000)
	else
		return os.time()
	end
end

function 试用心跳(频率) -- 分钟
	local path = "/v1/trial/heartbeat"
	writeLog("心跳启用成功")
	while (true) do
		for i=1,频率 do
			sleep(60000)
		end
		params = "app_key="..key.."&device_id="..设备ID.."&nonce="..getNonce().."&timestamp="..获取时间戳()
		sign=MD5(method..host..path..params..secret)
		ps = params .. "&sign=" .. sign
		json = httpPost(protocol .. host .. path, ps)
		local 心跳结果 = jsonLib.decode(json)
		if 心跳结果["code"] ~= 0 then
			print(心跳结果["message"])
            writeLog(心跳结果["message"].." 结束脚本运行")
			setTimer(exitScript(),100)
		end
	end
end

function 卡密心跳(卡密,频率) -- 分钟
	local path = "/v1/card/heartbeat"
	writeLog("心跳启动成功")
	while (true) do
		for i=1,频率 do
			sleep(60000)
		end
		local params = "app_key="..key.."&card="..卡密.."&nonce="..getNonce().."&timestamp="..获取时间戳().."&token="..登录结果["result"]["token"]
		local sign=MD5(method..host..path..params..secret)
		local ps = params .. "&sign=" .. sign
		local json = httpPost(protocol .. host .. path, ps)
		local 心跳结果 = jsonLib.decode(json)
		
		if 心跳结果["code"] ~= 0 then
			print(心跳结果["message"])
            writeLog(心跳结果["message"].." 结束脚本运行")
			setTimer(exitScript(),100)
		end
	end
end

function 卡密登录(卡密)  -- 登录成功自启心跳线程
	writeLog("卡密登录")
	path  = "/v1/card/login"
	local params = "app_key="..key.."&card="..卡密.."&device_id="..设备ID.."&nonce="..getNonce().."&timestamp="..获取时间戳()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	登录结果=jsonLib.decode(json)
	if 登录结果["code"] == 0 then
        --writeLog(登录结果["result"]["card_type"] .. " 到期时间: "..登录结果["result"]["expires"],0,0,20)
		return true
	else
		toast("错误"..登录结果["message"],0,0,20)
		sleep(2000)
		exitScript()
	end
end

function 卡密下线(卡密)
	local path  = "/v1/card/logout"
	local params = "app_key="..key.."&card="..卡密.."&nonce="..getNonce().."&timestamp="..获取时间戳().."&token="..登录结果["result"]["token"]
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	local result = jsonLib.decode(json)
	if result["code"] ==  0 then
		print("下线成功..")
	else
		toast("下线失败 : "..result["message"],0,0,20)
	end
end

function 试用登录()
	writeLog("试用登录")
	local path  = "/v1/trial/login"
	local params = "app_key="..key.."&device_id="..设备ID.."&nonce="..getNonce().."&timestamp="..获取时间戳()
    local sign=MD5(method..host..path..params..secret)
    local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	登录结果=jsonLib.decode(json)
	if 登录结果["code"] == 0 then
		--toast("试用结束时间: "..登录结果["result"]["expires"],0,0,20)
		return true
	else
		toast("错误:"..登录结果["message"],0,0,20)
		sleep(2000)
		exitScript()
	end
end

writeLog("泡椒云库加载完毕By青石:3416918055....")
