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
	return string.format("%d",getDeviceId())
end

function getNonce()
	return MD5(get设备ID()..os.time()..rnd(1,1000))
end


function 试用心跳(频率) -- 分钟
	local path = "/v1/trial/heartbeat"
	print("心跳启用成功")
	while (true) do
		for i=1,频率 do
			sleep(60000)
		end
		params = "app_key="..key.."&device_id="..get设备ID().."&nonce="..getNonce().."&timestamp="..os.time()
		sign=MD5(method..host..path..params..secret)
		ps = params .. "&sign=" .. sign
		json = httpPost(protocol .. host .. path, ps)
		local 心跳结果 = jsonLib.decode(json)
		if 心跳结果["code"] ~= 0 then
			print(心跳结果["message"])
			setTimer(exitScript(),100)
		end
	end
end

function 卡密心跳(卡密,频率) -- 分钟
	local path = "/v1/card/heartbeat"
	print("心跳启动成功")
	while (true) do
		for i=1,频率 do
			sleep(60000)
		end
		local params = "app_key="..key.."&card="..卡密.."&nonce="..getNonce().."&timestamp="..os.time().."&token="..登录结果["result"]["token"]
		local sign=MD5(method..host..path..params..secret)
		local ps = params .. "&sign=" .. sign
		local json = httpPost(protocol .. host .. path, ps)
		local 心跳结果 = jsonLib.decode(json)
		
		if 心跳结果["code"] ~= 0 then
			print(心跳结果["message"])
			setTimer(exitScript(),100)
		end
	end
end

function 卡密登录(卡密)  -- 登录成功自启心跳线程
	path  = "/v1/card/login"
	local params = "app_key="..key.."&card="..卡密.."&device_id="..get设备ID().."&nonce="..getNonce().."&timestamp="..os.time()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	登录结果=jsonLib.decode(json)
	if 登录结果["code"] == 0 then
		toast(登录结果["result"]["card_type"] .. " 到期时间: "..登录结果["result"]["expires"],0,0,20)
		return true
	else
		toast("错误"..登录结果["message"],0,0,20)
		sleep(3000)
		exitScript()
	end
end

function 卡密下线(卡密)
	local path  = "/v1/card/logout"
	local params = "app_key="..key.."&card="..卡密.."&nonce="..getNonce().."&timestamp="..os.time().."&token="..登录结果["result"]["token"]
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
	local path  = "/v1/trial/login"
	local params = "app_key="..key.."&device_id="..get设备ID().."&nonce="..getNonce().."&timestamp="..os.time()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	登录结果=jsonLib.decode(json)
	if 登录结果["code"] == 0 then
		toast("试用结束时间: "..登录结果["result"]["expires"],0,0,20)
		return true
	else
		toast("错误:"..登录结果["message"],0,0,20)
		sleep(3000)
		exitScript()
	end
end

print("泡椒云库加载完毕By青石:3416918055....")
