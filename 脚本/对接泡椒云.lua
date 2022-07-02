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
	if  getDeviceId() ~= "" then
    	if type(getDeviceId()) == "number" then
        	return string.format("%d",getDeviceId())
        else
        	return getDeviceId()
        end
		
	end
	if fileExist("sdcard/��ʯ/ID.txt") == false then -- ĳЩ�豸����ֱ�ӻ�ȡID ���Ծ�Ū���ļ�����һ��15λ����������豸ID
		local ID=""
		extractAssets("�߲���ʯ.rc","sdcard/��ʯ","ID.txt") -- ������Լ���Դ���� �ļ�·��
		io.output("sdcard/��ʯ/ID.txt")
		for i=1,15 do
			ID=ID..string.format("%d",rnd(0,9))
		end
		io.write(tostring(ID))
        writeLog(ID)
		return ID
	else
		local ID = readFile("sdcard/��ʯ/ID.txt")
		io.close()
		return ID
	end
end
�豸ID = get�豸ID()

function getNonce()
	local Nonce = MD5(�豸ID..��ȡʱ���()..string.format("%d",rnd(1,1000)))
	return Nonce
end

function ��ȡʱ���()
	local body, code = httpGet("http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp")
	if code == 200 then
		ret = jsonLib.decode(body)
		return math.floor(ret["data"]["t"]/1000)
	else
		return os.time()
	end
end

function ��������(Ƶ��) -- ����
	local path = "/v1/trial/heartbeat"
	writeLog("�������óɹ�")
	while (true) do
		for i=1,Ƶ�� do
			sleep(60000)
		end
		params = "app_key="..key.."&device_id="..�豸ID.."&nonce="..getNonce().."&timestamp="..��ȡʱ���()
		sign=MD5(method..host..path..params..secret)
		ps = params .. "&sign=" .. sign
		json = httpPost(protocol .. host .. path, ps)
		local ������� = jsonLib.decode(json)
		if �������["code"] ~= 0 then
			print(�������["message"])
            writeLog(�������["message"].." �����ű�����")
			setTimer(exitScript(),100)
		end
	end
end

function ��������(����,Ƶ��) -- ����
	local path = "/v1/card/heartbeat"
	writeLog("���������ɹ�")
	while (true) do
		for i=1,Ƶ�� do
			sleep(60000)
		end
		local params = "app_key="..key.."&card="..����.."&nonce="..getNonce().."&timestamp="..��ȡʱ���().."&token="..��¼���["result"]["token"]
		local sign=MD5(method..host..path..params..secret)
		local ps = params .. "&sign=" .. sign
		local json = httpPost(protocol .. host .. path, ps)
		local ������� = jsonLib.decode(json)
		
		if �������["code"] ~= 0 then
			print(�������["message"])
            writeLog(�������["message"].." �����ű�����")
			setTimer(exitScript(),100)
		end
	end
end

function ���ܵ�¼(����)  -- ��¼�ɹ����������߳�
	writeLog("���ܵ�¼")
	path  = "/v1/card/login"
	local params = "app_key="..key.."&card="..����.."&device_id="..�豸ID.."&nonce="..getNonce().."&timestamp="..��ȡʱ���()
	local sign=MD5(method..host..path..params..secret)
	local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	��¼���=jsonLib.decode(json)
	if ��¼���["code"] == 0 then
        --writeLog(��¼���["result"]["card_type"] .. " ����ʱ��: "..��¼���["result"]["expires"],0,0,20)
		return true
	else
		toast("����"..��¼���["message"],0,0,20)
		sleep(2000)
		exitScript()
	end
end

function ��������(����)
	local path  = "/v1/card/logout"
	local params = "app_key="..key.."&card="..����.."&nonce="..getNonce().."&timestamp="..��ȡʱ���().."&token="..��¼���["result"]["token"]
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
	writeLog("���õ�¼")
	local path  = "/v1/trial/login"
	local params = "app_key="..key.."&device_id="..�豸ID.."&nonce="..getNonce().."&timestamp="..��ȡʱ���()
    local sign=MD5(method..host..path..params..secret)
    local ps = params .. "&sign=" .. sign
	local json = httpPost(protocol .. host .. path, ps)
	��¼���=jsonLib.decode(json)
	if ��¼���["code"] == 0 then
		--toast("���ý���ʱ��: "..��¼���["result"]["expires"],0,0,20)
		return true
	else
		toast("����:"..��¼���["message"],0,0,20)
		sleep(2000)
		exitScript()
	end
end

writeLog("�ݽ��ƿ�������By��ʯ:3416918055....")
