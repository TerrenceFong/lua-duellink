method = "POST"
protocol = "http://"
host = "api.paojiaoyun.com"
key = "c6ob3q3dqusthdt13f80" -- appkey
secret = "xswwNdYkszx7Xxcx2ZGEsfULCjRSh2vs" -- appsecret
�������={}
��¼���={}
--[[
������ΪĬ�ϲ��� appkey appsecret �����޸�
��Ӧʾ�������ص���֤��Ϣ�ľ����ȡ,�뿴�ݽ��ٷ��ĵ� ��ַ:docs.paojiaoyun.com
]]--

function get�豸ID()
	return string.format("%d",getDeviceId())
end

function getNonce()
	return MD5(get�豸ID()..os.time()..rnd(1,1000))
end


function ��������(Ƶ��) -- ����
	local path = "/v1/trial/heartbeat"
	print("�������óɹ�")
	while (true) do
		for i=1,Ƶ�� do
			sleep(60000)
		end
		params = "app_key="..key.."&device_id="..get�豸ID().."&nonce="..getNonce().."&timestamp="..os.time()
		sign=MD5(method..host..path..params..secret)
		ps = params .. "&sign=" .. sign
		json = httpPost(protocol .. host .. path, ps)
		local ������� = jsonLib.decode(json)
		if �������["code"] ~= 0 then
			print(�������["message"])
			setTimer(exitScript(),100)
		end
	end
end

function ��������(����,Ƶ��) -- ����
	local path = "/v1/card/heartbeat"
	print("���������ɹ�")
	while (true) do
		for i=1,Ƶ�� do
			sleep(60000)
		end
		local params = "app_key="..key.."&card="..����.."&nonce="..getNonce().."&timestamp="..os.time().."&token="..��¼���["result"]["token"]
		local sign=MD5(method..host..path..params..secret)
		local ps = params .. "&sign=" .. sign
		local json = httpPost(protocol .. host .. path, ps)
		local ������� = jsonLib.decode(json)
		
		if �������["code"] ~= 0 then
			print(�������["message"])
			setTimer(exitScript(),100)
		end
	end
end

function ���ܵ�¼(����)  -- ��¼�ɹ����������߳�
	path  = "/v1/card/login"
	local params = "app_key="..key.."&card="..����.."&device_id="..get�豸ID().."&nonce="..getNonce().."&timestamp="..os.time()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	��¼���=jsonLib.decode(json)
	if ��¼���["code"] == 0 then
		toast(��¼���["result"]["card_type"] .. " ����ʱ��: "..��¼���["result"]["expires"],0,0,20)
		return true
	else
		toast("����"..��¼���["message"],0,0,20)
		sleep(3000)
		exitScript()
	end
end

function ��������(����)
	local path  = "/v1/card/logout"
	local params = "app_key="..key.."&card="..����.."&nonce="..getNonce().."&timestamp="..os.time().."&token="..��¼���["result"]["token"]
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
    local result = jsonLib.decode(json)
    if result["code"] ==  0 then
    	print("���߳ɹ�..")
    else
    	toast("����ʧ�� : "..result["message"],0,0,20)
    end
end

function ���õ�¼()
	local path  = "/v1/trial/login"
	local params = "app_key="..key.."&device_id="..get�豸ID().."&nonce="..getNonce().."&timestamp="..os.time()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	��¼���=jsonLib.decode(json)
	if ��¼���["code"] == 0 then
		toast("���ý���ʱ��: "..��¼���["result"]["expires"],0,0,20)
		return true
	else
		toast("����:"..��¼���["message"],0,0,20)
		sleep(3000)
		exitScript()
	end
end

print("�ݽ��ƿ�������By��ʯ:3416918055....")
