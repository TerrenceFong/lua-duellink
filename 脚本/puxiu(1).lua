
--toast(msg.."\n"..genxin)
--sleep(1000)
--/storage/emulated/0/Pictures/
--http://puxiu.picp.vip/readall/puxiu

��_ͼɫ = {}
��_��ʱ�� = {}
��_ϵͳ = {}
��_�ļ� = {}
��_�ַ��� = {}
��_���ݿ� = {}
��_ʱ����� = {}
��_������ʽ = {}
��_Json = {}
��_�� = {}
��_XML = {}
��_ʱ�� = {}
��_�ڵ� = {}
��_SQL3 = {}
��_�ӿ� = {}
��_���ļ� = {}
��_UI = {}
��_���� = {}
��_Ӧ�� = {}
��_JD = {}
��_TS = {}
��_FZ = {}
��_��è = {}
��_��־ = {}
��_���� = {}
jd_���ڵ�={}
��_����={}
��_ͼ��={}
��_����={}

jd_ˢ��=0
jd_�ڵ�ȫ���жϱ仯=0
tl_ͼ���ֿ�·��=""
local VerifyData = {}
local  qj_����ǩ
local qj_uiArr
local  row_id
local qj_�رմ���={}
local qj_�رղ���={}
local qj_���ڸ���=0
local qj_ȫ�ֹر�
local qj_��ʱ�ر� = true
setControlBarPosNew(1.0,0.25)
xs_HUd = createHUD()

local function open_url(url)--����ַ
	exec(string.format("am start -a android.intent.action.VIEW -d '%s'",url))
end
function ��_��������(text)
	--��_��������("/storage/emulated/0/Pictures/����.txt")
	return load(��_�ļ�.��ȡ�ļ�(text))()
end

function ��_����(������,��)
	--[===[����= ��_����(foo,{"aaa","sss"})
	if ����[1] then
	print("��������:"..����[2])
	else
	print("ǿ������")
	end]===]
	local pxz ={}
	for pxn =1,10 do
		if ��[pxn]  == nil then ��[pxn] = "" end
	end
	local pxa,px=pcall(������,��[1],��[2],��[3],��[4],��[5],��[6],��[7],��[8],��[9],��[10])
	pxz[1]=pxa
	pxz[2]=px
	if pxz[1] ==  false then
		print(pxz[2])
		local path2 =  "/storage/emulated/0/�쳣����.txt"
		��_�ļ�.д���ļ�(path2,"\n"..pxz[2])
	end
	return pxz
end

function ��_TS.ƥ����ͼ(��,��,��,��,��ͼ����,�Ƿ���)
	local x=-1 y=-1
	keepCapture()
	ret,x,y=findImage(��,��,��,��,��ͼ����,0.95)
	releaseCapture()
	if x~=-1 and y ~=-1 then
		if �Ƿ��� then
			tap(x,y)
		end
		return true
	end
end

function ��_TS.�߼���ͼ(��,��,��,��,��ͼ����,�Ƿ���)
	local x=-1 y=-1
	keepCapture()
	ret,x,y=findPicEx(��,��,��,��,��ͼ����,0.9)
	releaseCapture()
	if x~=-1 and y ~=-1 then
		if �Ƿ��� then
			tap(x,y)
		end
		return true
	end
end

function ��_TS.�����ɫ(��,��,��,��,����ɫ,����ɫ,�Ƿ���)
	local intX=-1 intY=-1
	keepCapture()
	intX,intY = findMultiColor(��,��,��,��,����ɫ,����ɫ,0,0.9)
	releaseCapture()
	if intX>-1 and intY>-1 then
		if �Ƿ��� then
			tap(intX,intY)
		end
		return true
	end
end
function ��_TS.��ɫ�Ա�(ԭɫ,�Ա�ɫ,ƫɫ)
	local r1,g1,b1 = colorToRGB("0x"..ԭɫ)
	print(r1,g1,b1)
	local r2,g2,b2 = colorToRGB("0x"..�Ա�ɫ)
	print(r2,g2,b2)
	if  r1 <=  r2  + ƫɫ and r1 >= r2  - ƫɫ then
		if  g1 <=  g2  + ƫɫ and g1 >= g2  - ƫɫ then
			if  b1 <=  b2  + ƫɫ and b1 >= b2  - ƫɫ then
				--print("�������ƶ�")
				return true
			else
				--print("���������ƶ�")
				return false
			end
		end
	end
end
function ��_TS.����ɫ(����,�Ƿ���)
	keepCapture()
	local r = cmpColorEx(����,0.9)
	releaseCapture()
	if r == 1then
		if �Ƿ��� then
			local zb = splitStr(����,"|")
			tap(math.floor(zb[1]),math.floor(zb[2]))
		end
		return true
	end
end
function ��_JD.ȫ�ֽڵ����仯��ʱ(��ʱ��)
	jd_�ڵ�ȫ���жϱ仯 = ��ʱ��
end
function ��_JD.�жϵ��(�ڵ���,���,���ж�)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	if �ڵ��� == nil  or  �ڵ��� == ""  or  �ڵ��� == 0 then
		�ڵ��� =jd_���ڵ�[���]
	end
	local ret = nodeLib.findOne(�ڵ���,true)
	if ret ~= nil then
		jd_ˢ��=jd_ˢ��+1
		if jd_ˢ�� >= 3 then
			nodeLib.updateNode()
			jd_ˢ��=0
		end
		jd_���ڵ�[���]=ret
		return  ��_JD.�ڵ���(ret,���,���ж�)
	end
	return false
end
function ��_JD.�ڵ���(�ڵ���,���,���ж�)
	showControlBar(False)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	if �ڵ��� == nil  or  �ڵ��� == ""  or  �ڵ��� == 0 then
		�ڵ��� =jd_���ڵ�[���]
	end
	if ���ж� or jd_�ڵ�ȫ���жϱ仯 == nil or  jd_�ڵ�ȫ���жϱ仯 == ""  or  jd_�ڵ�ȫ���жϱ仯 == 0 then
		nodeLib.click(�ڵ���)
		sleep(100)
		showControlBar(true)
		return true
	else
		--print(�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
		--print(jd_�ڵ�ȫ���жϱ仯)
		local �����ʱ = math.ceil(jd_�ڵ�ȫ���жϱ仯/2/200)
		snapShot("/mnt/sdcard/zzfwjs"..���..".png",�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
		nodeLib.click(�ڵ���)
		sleep(200)
		for ifw = 1,�����ʱ-1 do
			sleep(140)
			if ��_TS.ƥ����ͼ(�ڵ���.bounds["l"]-2,�ڵ���.bounds["t"]-2,�ڵ���.bounds["r"]+2,�ڵ���.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..���..".png")then
			else
				--print("�ڵ����ѱ仯һ"..ifw)
				showControlBar(true)
				return true
			end
		end
		snapShot("/mnt/sdcard/zzfwjs"..���..".png",�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
		nodeLib.click(�ڵ���)
		sleep(200)
		for ifw = 1,�����ʱ-1 do
			sleep(140)
			if ��_TS.ƥ����ͼ(�ڵ���.bounds["l"]-2,�ڵ���.bounds["t"]-2,�ڵ���.bounds["r"]+2,�ڵ���.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..���..".png")then
			else
				--print("�ڵ����ѱ仯��"..ifw)
				showControlBar(true)
				return true
			end
		end
		showControlBar(true)
		return false
	end
end
function ��_JD.ָ����(�ڵ���,���,���ж�)
	showControlBar(False)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	if �ڵ��� == nil  or  �ڵ��� == ""  or  �ڵ��� == 0 then
		�ڵ��� =jd_���ڵ�[���]
	end
	if �ڵ��� ~= nil then
		local x=math.floor((math.floor(�ڵ���.bounds["r"])-math.floor(�ڵ���.bounds["l"]))/2+math.floor(�ڵ���.bounds["l"]))
		local y=math.floor((math.floor(�ڵ���.bounds["b"])-math.floor(�ڵ���.bounds["t"]))/2+math.floor(�ڵ���.bounds["t"]))
		if ���ж� or jd_�ڵ�ȫ���жϱ仯 == nil or  jd_�ڵ�ȫ���жϱ仯 == ""  or  jd_�ڵ�ȫ���жϱ仯 == 0 then
			tap(x,y)
			sleep(100)
			showControlBar(true)
			return true
		else
			--print(�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
			local �����ʱ = math.ceil(jd_�ڵ�ȫ���жϱ仯/2/200)
			snapShot("/mnt/sdcard/zzfwjs"..���..".png",�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
			tap(x,y)
			sleep(200)
			for ifw = 1,�����ʱ-1 do
				sleep(140)
				if ��_TS.ƥ����ͼ(�ڵ���.bounds["l"]-2,�ڵ���.bounds["t"]-2,�ڵ���.bounds["r"]+2,�ڵ���.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..���..".png")then
				else
					--print("ָ�����ѱ仯һ"..ifw)
					showControlBar(true)
					return true
				end
			end
			snapShot("/mnt/sdcard/zzfwjs"..���..".png",�ڵ���.bounds["l"],�ڵ���.bounds["t"],�ڵ���.bounds["r"],�ڵ���.bounds["b"])
			tap(x,y)
			sleep(200)
			for ifw = 1,�����ʱ-1 do
				sleep(140)
				if ��_TS.ƥ����ͼ(�ڵ���.bounds["l"]-2,�ڵ���.bounds["t"]-2,�ڵ���.bounds["r"]+2,�ڵ���.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..���..".png")then
				else
					--print("ָ�����ѱ仯��"..ifw)
					showControlBar(true)
					return true
				end
			end
			showControlBar(true)
			return false
		end
	end
end

function ��_JD.��������(����,�ڵ���,���)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	if �ڵ��� == nil  or  �ڵ��� == ""  or  �ڵ��� == 0 then
		�ڵ��� = jd_���ڵ�[���]
	end
	return nodeLib.setText(�ڵ���,����)
end

function ��_JD.�����ӽڵ�(�ڵ���,�ڼ���,�Ƿ���,���,���ж�)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	local ret = nodeLib.findChildNodes(�ڵ���,true)
	if ret ~= nil then
		if �ڼ��� <= #ret then
			if jd_ˢ�� >= 3 then
				nodeLib.updateNode()
				jd_ˢ��=0
			end
			jd_���ڵ�[���]=ret[�ڼ���]
			if �Ƿ���  then
				��_JD.�ڵ���(ret[�ڼ���],���,���ж�)
			end
			return true
		end
	end
end

function ��_JD.��ڵ�(�ڵ���)
	local ret = nodeLib.findAll(�ڵ���,true)
	if ret ~= nil then
		jd_ˢ��=jd_ˢ��+1
		if jd_ˢ�� >= 3 then
			nodeLib.updateNode()
			jd_ˢ��=0
		end
		return  ret
	else
		return ""
	end
end
function ��_JD.��Χ�ڵ�(�ڵ���,��,��,��,��)
	local �ڵ�����={}
	local ret=��_JD.��ڵ�(�ڵ���)
	local cc = 1
	for i=1,#ret do
		if ret[i].bounds["l"] >= �� and ret[i].bounds["t"] >=�� and ret[i].bounds["r"] <= �� and  ret[i].bounds["b"] <= �� then
			�ڵ�����[cc]=ret[i]
			cc=cc+1
		end
	end
	return �ڵ�����
end
function ��_JD.���ڵ�(�ڵ���,�Ƿ���,���,���ж�)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	local ret = nodeLib.findOne(�ڵ���,true)
	if ret ~= nil then
		jd_ˢ��=jd_ˢ��+1
		if jd_ˢ�� >= 3 then
			nodeLib.updateNode()
			jd_ˢ��=0
		end
		jd_���ڵ�[���]=ret
		if �Ƿ���  then
			��_JD.�ڵ���(ret,���,���ж�)
		end
		return true
	end
	return false
end

function ��_JD.ȡ����(����,�ڵ���Ϣ,���)
	if ��� == nil  or  ��� == ""  or  ��� == 0 then
		��� = 1
	end
	if �ڵ���Ϣ == nil or  �ڵ���Ϣ == ""  or  �ڵ���Ϣ == 0 then
		�ڵ���Ϣ =jd_���ڵ�[���]
	end
	if �ڵ���Ϣ ~= nil then
		return(�ڵ���Ϣ[����])
	end
end

function ��_Ӧ��.��ǰ����()
	return frontAppName()
end
function ��_Ӧ��.�ر�(����)
	exec(" am force-stop "..����)
	return stopApp(����)
end
function ��_Ӧ��.�������(����)
	exec("pm clear "..����)
end
function ��_Ӧ��.ж��(����)
	exec(" pm uninstall "..����)
end
function ��_Ӧ��.����(����)
	
	local pkg = frontAppName()
	if pkg~= ���� then
		runApp(����)
		sleep(3000)
		return true
	end
	return false
end
function ��_Ӧ��.ȡ���а���(��������)
	local ����={}
	local ajd= exec("  pm list packages")
	if ajd ~= "" then
		ajd= string.gsub(ajd, "package:","")
		local gjhf= splitStr(ajd,"\n")
		if �������� == nil then
			for fghi=1,#gjhf do
				����[fghi]=gjhf[fghi]
			end
		else
			local ������=0
			for fghi=1,#gjhf do
				if string.find(gjhf[fghi],��������) ~= nil then
					������=������+1
					����[������]=gjhf[fghi]
				end
				
			end
		end
	end
	return ����
end
function ��_Ӧ��.�����Ϣ()
	return  exec(" dumpsys activity activities")
end
function ��_FZ.�������1��Ч(x,y,x1,y1,��ֵ��)
	local ����=0
	local w,h,arr = getScreenPixel(x,y,x1,y1)
	print("image size:"..w..","..h)
	local ��ֵ={}
	local cd =0
	for iw=1,h do
		local rzhh=""
		for ih=1,w do
			local r,g,b = colorToRGB(arr[iw * w + (ih)])
			local rgb = (r+g+b)/2
			-- print(rgb)
			if rgb > ��ֵ�� then
				rzhh=rzhh.."0"
				����=0
			else
				rzhh=rzhh.."1"
				����=����+1
			end
			if ���� >= 10 then
				print(iw * w + (ih))
				return false
			end
		end
		cd = cd +1
		��ֵ[cd]=rzhh
		--print(��ֵ[cd])
		��_�ļ�.д���ļ�("/storage/emulated/0/Pictures/��ֵ��.txt","\n"..��ֵ[cd])
	end
end
function ��_FZ.�������2��Ч(x,y,x1,y1,��ֵ��,ƫɫ)
	local r,g,b = colorToRGB(��ֵ��)
	print(r,g,b)
	local rgb = (r+g+b)/2
	��ֵ�� = rgb
	print(��ֵ��)
	��ֵ�� = ((r+ƫɫ)+(g+ƫɫ)+(b+ƫɫ))/2
	print(��ֵ��)
	ƫɫ = ((r-ƫɫ)+(g-ƫɫ)+(b-ƫɫ))/2
	print(ƫɫ)
	local w,h,arr = getScreenPixel(x,y,x1,y1)
	print("image size:"..w..","..h)
	local ��ֵ={}
	local cd =0
	cccc=1
	for iw=1,h do
		local rzhh=""
		for ih=1,w do
			--r,g,b = colorToRGB(arr[iw * w + (ih)])
			r,g,b = colorToRGB(arr[cccc])
			rgb = (r+g+b)/2
			-- print(rgb)
			if rgb > ƫɫ  and rgb < ��ֵ�� then
				rzhh=rzhh.."1"
			else
				rzhh=rzhh.."0"
			end
			cccc=cccc+1
		end
		cd = cd +1
		��ֵ[cd]=rzhh
		print(��ֵ[cd])
		��_�ļ�.д���ļ�("/storage/emulated/0/Pictures/��ֵ��.txt","\n"..��ֵ[cd])
	end
end
function  ��_FZ.Ӣ����ֵ����(Ӣ��)
	--��֧�����ϰ�
	Ӣ�� = string.lower(Ӣ��)
	local ���� = string.len(Ӣ��)
	local ��ֵ��={
	k0= 7,k1 = 8,k2 = 9,k3 = 10,k4 = 11,k5 = 12,k6 = 13,k7 = 14,k8 = 15,
	k9= 16,ka = 29,kb = 30,kc = 31,kd = 32,ke = 33,kf = 34,kg = 35,kh = 36,
	ki= 37,kj = 38,kk = 39,kl = 40,km = 41,kn = 42,ko = 43,kp = 44,kq = 45,
	kr= 46,ks = 47,kt = 48,ku = 49,kv = 50,kw = 51,kx = 52,ky = 53,kz = 54}
	for i=1,���� do
		local  ��ֵ= "k"..utf8.mid(Ӣ��,i,1)
		if ��ֵ��[��ֵ] ~= nil then
			keyPress(��ֵ��[��ֵ])
		else
			exec(" input text "..utf8.mid(Ӣ��,i,1))
		end
		sleep(50)
	end
end
function ��_FZ.ʯī����(����)
	--��_FZ.ʯī����("https://shimo.im/docs/TWQWCwddkYj3wvcc")
	if  string.find(����,"/read") == nil then
		���� =����.."/read"
	end
	local ret,code = httpGet(����)
	--print(ret)
	local aa=string.match(ret, "line="..'"'.."(.*)".."/p>")
	local as=splitStr(aa,"/p>")
	local ����=""
	--print(#as)
	for i=1,#as do
		--print(as[i])
		aa=string.match(as[i], ">".."(.-)".."<")
		if aa ~= "" then
			����=����..aa.."\n"
			if  string.find(as[i],"nofollow"..'"'..">") ~= nil then
				aa=string.match(as[i], "href="..'"'.."(.-)"..'"')
				����=����..aa.."\n"
			end
		end
		
	end
	return ��_�ַ���.ȥ��β��(����)
end
function ��_FZ.�ȸ���(����)
	--��_FZ.�ȸ���("http://1574z6066r.qicp.vip/duqu?ku=����&text=0")
	local ret
	if  string.find(����,"----") ~= nil then
		ret = ����
	else
		ret= httpGet(����)
	end
	-- �汾��-��������
	--print(����)
	local evr=splitStr(ret,"----")
	if utf8.inStr(1,evr[1],"html")<=0 and evr[1] ~=nil then
		--print(evr)
		local val = getStringConfig("evr")
		print(val)
		if val==evr[1] then
			toast("�������°汾:"..evr[1],0,0,15)
			print("�������°汾:"..evr[1])
			sleep(1000)
			return false --����Ҫ����
		end
		toast("�����°汾:"..evr[1],0,0,15)
		print("�����°汾:"..evr[1])
		--print(evr[2])
		local lBenDiLr = getWorkPath().."/".."script.lr"
		if downloadFile(��_�ַ���.ȥ��β��(evr[2]),lBenDiLr,progress)==0 then
			--os.remove("/data/data/"..getPackageName().."/files/script.lr")--ɾ���ɽű�
			-- if installLrPkg(lBenDiLr) == 1 then
			print( os.rename("/data/data/"..getPackageName().."/files/scriptbak.lr","/data/data/"..getPackageName().."/files/script.lr"))
			installLrPkg(getWorkPath().."/".."script.lr")
			setStringConfig("evr",evr[1])--���汾�ذ汾��
			toast("������ɣ���������",0,0,15)
			print("������ɣ���������")
			sleep(1000)
			restartScript()
			--end
		end
	end
	return false --����Ҫ����
end
function ��_FZ.��ȡ��ӡ���()
	return createHUD()
end
function ��_FZ.��ӡ(����,x,y,��ӡ���)
	if x == nil or x == 0 then x = 100 end
	if y == nil or y == 0 then y = 1 end
	if ��ӡ��� == nil or ��ӡ��� == 0 then ��ӡ��� = xs_HUd end
	showHUD(��ӡ���,����,12,"0xffff0000","0xffffffff",0,x,y,0,0)
end
function ��_FZ.���ش�ӡ���(��ӡ���)
	if ��ӡ��� == nil or ��ӡ��� == 0 then ��ӡ��� = xs_HUd end
	return hideHUD(��ӡ���)
end
function ��_FZ.szk�ر���Ļ()
	exec("app_process -Djava.class.path=/storage/emulated/0/classes101402.dex /data/local/tmp com.yashu.aaaaaaaaaaaaaaaaaaaaaa.SurfaceControl  screen off")
end
function ��_FZ.szk������Ļ()
	exec("app_process -Djava.class.path=/storage/emulated/0/classes101402.dex /data/local/tmp com.yashu.aaaaaaaaaaaaaaaaaaaaaa.SurfaceControl  screen on")
end
function ��_FZ.szk����()
	--classes101402.dex��װ��/storage/emulated/0/classes101402.dex
	exec("sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh")
end
function ��_FZ.����������(x,y,x1,y1,text,���,��׼ʶ��)
	local lr = ""
	if x == nil or x == true then
		���=x
		x1,y1 = getDisplaySize()
		x=0
		y=0
	end
	local r = ocrEx(x,y,x1,y1)
	--print(r)
	if r ~= nil then
		for i=1,#r do
			--print(r[i])
			if text ~= nil then
				if ��׼ʶ�� then
					if r[i]["text"] ==  text then
						if ��� then
							tap (r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
							print(r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
						end
						return true
					end
				else
					if  string.find(r[i]["text"],text) ~= nil then
						if ��� then
							tap (r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
							print(r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
						end
						return true
					end
				end
			else
				lr=lr..r[i]["text"]
			end
		end
		if text == nil then
			return lr
		end
	end
end
function ��_FZ.���ϰ�����(x,y,x1,y1,sim)
	local gesture = Gesture:new() --����һ�����ƻ�������
	local path = Path:new() --����һ���켣·��
	path:setStartTime(10) --�Ӵ����¼��ĵ�100�����ʼ����
	path:setDurTime(sim) --������ʱ��
	path:addPoint(x,y) --�켣�ϵĵ�һ����
	path:addPoint(x1,y1) --�켣�ϵĵڶ�����
	gesture:addPath(path) --���һ������·��
	onFinishEvent=function (type) --ִ�н���ص����� typeΪ0ִ����ɣ�Ϊ1��ִ����;��ȡ��
		print("event:"..type)
	end
	local r = gesture:dispatch(onFinishEvent)
	sleep(sim+500)
	if r then
		print("ִ�гɹ�")
		return true
	else
		print("ִ��ʧ��")
		return false
	end
end
function ��_FZ.��λ���(����ֵ,����)
	--��_FZ.��λ���("69,932|250,939|340,930|685,935",20)
	local r =math.random(-10,10)
	local x,y,����,������
	������=splitStr(����ֵ,"|")
	for i=1,#������ do
		����=splitStr(������[i],",")
		if i == 1then
			x=tonumber(����[1])
			y=tonumber(����[2])
			touchDown(1,x,y)
			sleep(100)
		else
			for j=1,���� do
				touchMove(1,math.floor(x+(tonumber(����[1])-x)*(j/����)+(10*r-10)),math.floor(y+(tonumber(����[2])-y)*(j/����)+(10*r-10)))
				sleep(math.random(100,200))
				--print(math.floor(x+(tonumber(����[1])-x)*(j/����)+(10*r-10)))
				--print(math.floor(y+(tonumber(����[2])-y)*(j/����)+(10*r-10)))
			end
			x=tonumber(����[1])
			y=tonumber(����[2])
		end
	end
	touchUp(1)
end

function ��_FZ.adb��ת(���,����)
	--print(��_FZ.adb��ת(" sg.bigo.live/sg.bigo.live.user.UserInfoDetailActivity "," --ei uid 552239610"))
	return exec(" am start -n "..���.." "..����)
end

function ��_FZ.url��ת(url)
	--��_FZ.url��ת("snssdk1128://user/profile/826437155953198?gd_label=click_wap_profile_bottom&needlaunchlog=1&refer=web&scene_from=share_reflow&type=need_follow")
	open_url(string.format(url))
end


function ��_FZ.�ɽ�ʶ��(xx,yy,x1,y1,��������,�Ƿ���)
	--paddle = require("libpaddleocr")
	--���ͷŷɽ���ԴextractAssets("paddle.rc",getWorkPath(),"*")
	--��_FZ.�ɽ�ʶ��(65,373,535,719,"*����",true)
	local x,y
	if x1 == nil or x1 == 0 then
		local w,h
		w,h = getDisplaySize()
		xx=1 yy=1 x1=w y1=h
	end
	local image = "/mnt/sdcard/feijiangsb.png"
	snapShot(image,xx,yy,x1,y1)
	local begintm = tickCount()
	local ret = paddle.ocr(getWorkPath(),image)
	--print("���:",ret,"��ʱ:",(tickCount() - begintm).."����")
	if ret ~= "" then
		local list=��_Json.��Json��ʽ(ret)
		if #list.words_result==0	then
			return nil
		else
			if �������� ~= nil then
				if  string.find(��������,"*") ~= nil then
					�������� = string.gsub(��������, "*","")
					for i=1,#list.words_result do
						--print(list.words_result[i].words.."--"..list.words_result[i].pos)
						if  string.find(list.words_result[i].words, ��������) ~= nil then
							if �Ƿ��� then
								image	= splitStr(list.words_result[i].pos,",")
								x= (tonumber(image[3])-tonumber(image[1]))/2+tonumber(image[1])
								y= (tonumber(image[4])-tonumber(image[2]))/2+tonumber(image[2])
								tap(x,y)
							end
							return true
						end
					end
					return false
				else
					for i=1,#list.words_result do
						--print(list.words_result[i].words.."--"..list.words_result[i].pos)
						if list.words_result[i].words == �������� then
							if �Ƿ��� then
								image	= splitStr(list.words_result[i].pos,",")
								x= (tonumber(image[3])-tonumber(image[1]))/2+tonumber(image[1])
								y= (tonumber(image[4])-tonumber(image[2]))/2+tonumber(image[2])
								tap(x,y)
							end
							return true
						end
					end
					return false
				end
			else
				return list
			end
		end
	end
end

function ��_FZ.ƽ����(x,y)
	local w,h
	w = x^2
	h = y^2
	return math.sqrt(w+h)
end
function ��_FZ.�ʼ�����(�����ʼ�,��������,�ռ�����,�ʼ�����,�ʼ�����)
	--��_FZ.�ʼ�����("1730076400@qq.com","glrdtyckfwpwfci","1730076400@qq.com","����","c��˹��esd12fgs")
	if string.find(�����ʼ�,"@qq") ~= nil  then
		serve = "smtp.qq.com"
	elseif  string.find(�����ʼ�,"@163") ~= nil  then
		serve =  "smtp.ym.163.com"
	end
	local smtp = require("socket.smtp")
	local mime = require("mime")
	local ltn12 = require("ltn12")
	smtp.TIMEOUT = 30;
	local from = "<"..�����ʼ�..">";
	local rcpt = {"<"..�ռ�����..">"};
	local bodys="";
	local source = smtp.message{
	headers = {
	from = from,
	to ="<"..�ռ�����..">",
	subject = �ʼ�����  },
	body={
	preamble = "",
	[1] = {
	body = mime.eol(1, �ʼ�����)
	},}}
	local r, e = smtp.send{
	server =serve ,
	user=�����ʼ�,
	password=��������,
	from = from,
	rcpt = rcpt,
	source = source
	}
	if r  == 1 then
		return "�ɹ�"
	else
		return "ʧ��--"..e
	end
end
wxa16Round=function (x)
	return math.floor(x + 0.5)
end

wxa16Exist=function (path)
	local r = exec("ls /data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/")
	--print(#r)
	if #r >0 then
		return true
	else
		return false
	end
end

wxa16Write=function (FileName, text,user)
	exec('echo "'..text..'" > '..FileName)
	exec('chown '..user..' '..FileName)
end
wxa16SSS=function (HEX_DATA)
	local D, H, I, IA
	D = 0
	H = string.upper(HEX_DATA)
	for i = 1, #H, 1 do
		IA = string.byte(utf8.mid(H, i, 1)) - 48
		if IA > 9 then
			IA = IA - 7
		end
		D = D * 16 + IA
	end
	--printEx(D)
	return D
end
wxa16CRC=function (DATA)
	local SRT = ""
	for i = 1, #DATA, 1 do
		--print(wxa16Round(string.byte(utf8.mid(DATA, i, 1))))
		Temp = string.format('%x', wxa16Round(string.byte(utf8.mid(DATA, i, 1))))
		if #Temp == 1 then
			SRT = SRT .. "+0" .. Temp
		else
			SRT = SRT .. "+" .. Temp
		end
	end
	local DATABOOK = utf8.right(SRT, #SRT)
	local ret, code = httpPost("http://api.ip33.com/crc/c", "data=" .. DATABOOK .. "&width=32&poly=04C11DB7&init=FFFFFFFF&xor=FFFFFFFF&refin=true&refout=true")
	--printEx(ret)
	SRT = jsonLib.decode(ret)
	SRT = SRT["hex"]
	return wxa16SSS(SRT)
end
function ��_FZ.΢��A16��ԭ(A16)
	exec("pm clear com.tencent.mm")
	exec("pm grant com.tencent.mm android.permission.WRITE_EXTERNAL_STORAGE")
	exec("pm grant com.tencent.mm android.permission.READ_PHONE_STATE")
	local UUID = wxa16CRC(A16)
	local PATH = "/data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/"
	--print(A16 .. "," .. UUID)
	while true do
		if wxa16Exist(PATH .. "4") == false then
			print("��ʼ��ԭ�豸")
			break
		end
		sleep(1000)
	end
	runApp "com.tencent.mm"
	print"���ڻ�ԭ�豸"
	sleep(6000)
	while true do
		--print(wxa16Exist(PATH .. "4"))
		if wxa16Exist(PATH .. "4") == true then
			stopApp "com.tencent.mm"
			break
		end
		sleep(1000)
	end
	local ret =exec('ls -l /data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/0')
	user=splitStr(ret," ")
	for k,v in pairs(user) do
		if string.find(v,'u0') then
			--print(v)
			user=v
			break
		end
	end
	for i = 0, 4, 1 do
		wxa16Write(PATH .. i, A16 .. "," .. UUID,user)
	end
	sleep(1000)
	keyPress("home")
	print "���ݻ�ԭ�ɹ���"
	toast("���ݻ�ԭ�ɹ���",0,0,20)
	sleep(2000)
end




function ��_FZ.΢��A16��ȡ()
	local a = io.popen("echo -nE \"$(su -c \"sed -n '1 p' " .. "/data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/0" .. "\")\"")
	local t = a:read("*all")
	a:close()
	return t
end




function ��_��־.�ر���־()
	console.dismiss()
end
function ��_��־.����־(x,y,��,��)
	local w,h
	w,h = getDisplaySize()
	if x == nil then x = 100 end
	if y == nil then y = 100 end
	if �� == nil then
		�� = w/5*3.5
	end
	if �� == nil then �� = 400 end
	console.show()
	console.setPos(x,y,��,��)
end
function ��_��־.д����־(����,����)
	if ���� == nil then
		���� = 3
	end
	console.println(����,����)
end
function ��_��־.�����־()
	console.clearLog()
end

function ��_ͼ��.�����ֿ�·��(�ֿ�·������)
	if �ֿ�·������ == nil then
		if (io.open(getSdPath().. "/ʶ���.lib", "r")) then
			tl_ͼ���ֿ�·�� =getSdPath().. "/ʶ���.lib"
		elseif (io.open(getSdPath().. "/Pictures/ʶ���.lib", "r")) then
			tl_ͼ���ֿ�·�� =getSdPath().. "/Pictures/ʶ���.lib"
		else
			tl_ͼ���ֿ�·��="��"
		end
		print("��ǰ�ֿ�·������:"..tl_ͼ���ֿ�·��)
		toast("��ǰ�ֿ�·������:"..tl_ͼ���ֿ�·��,0,0,15)
		sleep(1000)
	else
		tl_ͼ���ֿ�·��=�ֿ�·������
	end
end

function ��_ͼ��.��Χʶ��(x1,y1,x2,y2,��ֵ��ɫ,�м��,�м��,������,������,���ظ�ʽ,�ַ����,���ƶ�)
	--��_ͼ��.��Χʶ��(52,176,526,378,"0-72")
	--��_ͼ��.��Χʶ��(52,176,526,378,"0-72",0,0,0,0,2,5)
	if �м�� == nil  or �м�� == 0  then �м�� = 1 end
	if �м�� == nil  or �м�� == 0  then �м�� = 1 end
	if ������ == nil  or ������ == 0  then ������ = "0-"..tostring(x2-x1) end
	if ������ == nil  or ������ == 0  then ������ = "0-"..tostring(y2-y1) end
	if ���ظ�ʽ == nil  or ���ظ�ʽ == 0  then ���ظ�ʽ = 0 end
	if �ַ���� == nil  or �ַ���� == 0  then �ַ���� = 0 end
	if ���ƶ� == nil  or ���ƶ� == 0  then ���ƶ� = 80 end
	TURING.��Դ_��ȡ��Ļ����(x1,y1,x2,y2)
	TURING.�˾�_��ɫ_��ֵ��(��ֵ��ɫ)
	TURING.�и�_��ΧͶӰ�и�(�м��,�м��,������,������)
	TURING.�ֿ�_����ʶ���ֿ�(tl_ͼ���ֿ�·��)
	��Χʶ���� = TURING.OCR(���ƶ�,���ظ�ʽ,�ַ����)
	return ��Χʶ����
end

��_ͼ��.ƫɫ���� = function (x,y,��ֵ��,ƫɫ)
	local  rgb = getPixelColor(x,y)
	local r,g,b = colorToRGB(rgb)
	rgb = (r+g+b)/2
	r,g,b = colorToRGB(��ֵ��)
	ƫɫ�� = ((r+ƫɫ)+(g+ƫɫ)+(b+ƫɫ))/2
	ƫɫС = ((r-ƫɫ)+(g-ƫɫ)+(b-ƫɫ))/2
	if tonumber(rgb) >= tonumber(ƫɫС)  and tonumber(rgb) <= tonumber(ƫɫ��) then
		return "1"
	else
		return "0"
	end
end


function ��_ͼ��.ͼ��ʶ��X(x1,y1,x2,y2,��ɫƫɫ,�ߵ���ɫ,������,������)
	--ͼ��ʶ��X(879,35,1070,219,"FBFBFA-303030",false)
	local begintm = tickCount()
	ֵ�� = splitStr(��ɫƫɫ,"-")
	if ������ == nil  or ������ == 0  then ������ = "15-50" end
	if ������ == nil  or ������ == 0  then ������ = "15-50" end
	keepCapture()
	TURING.��Դ_��ȡ��Ļ����(x1,y1,x2,y2)
	TURING.�˾�_��ɫ_��ֵ��(��ɫƫɫ)
	if �ߵ���ɫ then
		TURING.�˾�_�ڰ�_�ߵ���ɫ(2)
	end
	TURING.��Դ_��������Ԥ��()
	TURING.�и�_��ͨ�����и�(true,������,������)
	sp=TURING.�и�_��ȡ�и��ַ�����()
	--print(#sp)
	for i=1,#sp do
		��� = {sp[i][1]+x1,sp[i][2]+y1}
		б�߳� =��_FZ.ƽ����(sp[i][3],sp[i][4])
		--print(б�߳�)
		xx=sp[i][1]+x1
		yy=sp[i][2]+y1
		--print(xx..","..yy)
		for i=1,б�߳�/3*2 do
			if �ߵ���ɫ then
				if ��_ͼ��.ƫɫ����(xx+i,yy+i,ֵ��[1],utf8.mid(ֵ��[2],1,2)) == "1"then
					��� = ""
					break
				end
			else
				if ��_ͼ��.ƫɫ����(xx+i,yy+i,ֵ��[1],utf8.mid(ֵ��[2],1,2)) == "0"then
					��� = ""
					break
				end
			end
		end
		if ��� ~= "" then
			print("��ʱ:",(tickCount() - begintm).."����")
			releaseCapture()
			return ���
		end
	end
	print("��ʱ:",(tickCount() - begintm).."����")
	releaseCapture()
	return ���
end

--[===[����= ��_����(��_ͼ��.ͼ����Ѷ����,{530,156,660,349})
print(����)
if ����[1] then
if #���� >= 2 then
print("��������:"..����[2][1])
aa=����[2][1]
swipe(332,392,aa-50,392,200)
else
print("ʶ��ʧ������ʶ��")
end
end]===]
function ��_ͼ��.ͼ����Ѷ����(x,y,x1,y1)
	local ԭ�߶�=y1-y
	local ԭ���=x1-x
	local ���x,���y,һ��,rzhh,����,ASD
	TURING.��Դ_��ȡ��Ļ����(x,y,x1,y1)
	TURING.�˾�_�ڰ�_��ȡ����(50,1,255,0,0)
	ASD=TURING.�˾�_��ɫ_��ֵ��("0-100")
	--TURING.��Դ_��������Ԥ��()
	local ��ֵ={}
	local cd =0
	for iy=1,ԭ�߶�-2 do
		rzhh=""
		һ��=0
		���y= iy
		for ix=1,ԭ���-1 do
			if ASD[ix][iy][1] == 255 and ASD[ix][iy+1][1] == 0 then
				rzhh=rzhh.."1"
				һ��=һ��+1
				if һ�� == 1 then
					���x= ix-1
					if ���x == 0 then
						���x = 1
					end
				end
			else
				rzhh=rzhh.."0"
				һ��=0
			end
			if һ�� >= 10 and ���x < ԭ��� then
				--print(һ��)
				-- ���x=���x-1
				for ik=1,3 do
					���� =0
					for ig=1,11 do
						--print(���x+x.."--"..���y+ig+y)
						--print(ASD[���x][���y+ig][1].."=="..���x.."="..���y+ig)
						if ASD[���x+ik][���y+ig][1] == 255 then
							���� = ����+1
						else
							break
						end
					end
					--print(����)
					if ���� >= 10 then
						print(���x+x.."--"..���y+y)
						return {���x+x,���y+y}
					else
						���x=���x+1
					end
				end
				
			end
		end
		cd = cd +1
		��ֵ[cd]=rzhh
		--��_�ļ�.д���ļ�("/storage/emulated/0/Pictures/��ֵ��.txt","\n"..��ֵ[cd])
	end
end
function ��_����.������(�����˺�,��������)
	local tb={user_name=�����˺�,user_pw=��������}
	����=jsonLib.encode(tb)
	Э��ͷ="Content-Type:application/json"
	local ret,code = httpPost("http://v1-http-api.jsdama.com/api.php?mod=php&act=point",����,30,Э��ͷ)
	--print(ret)
	if ret ~= ""then
		ret = jsonLib.decode(ret)
		return ret["data"]
	end
end
function ��_����.��ȡ���(B64,ͼƬ����,�˺�,����,���V2secret,���ID,��С����,��󳤶�,�˹���ʾģ��ID)
	--��_����.��ȡ���(B64,ͼƬ����,�˺�,����)
	if ���V2secret == nil  or ���V2secret == "" then
		���V2secret="pktsgCPXvsHV83OybsL56CNIuaQjlpQepXgEuqaa"
		���ID="21306"
	end
	if ��С���� == nil or ��С���� == "" then  ��С����=0 end
	if ��󳤶� == nil or ��󳤶� == ""  then  ��󳤶�=0 end
	if �˹���ʾģ��ID == nil or �˹���ʾģ��ID == ""  then  �˹���ʾģ��ID=0 end
	local tb={
	captchaData= B64 ,
	captchaType= ͼƬ���� ,
	username= �˺� ,
	password= ���� ,
	softwareSecret= ���V2secret ,
	softwareId= ���ID,
	captchaMinLength= ��С���� ,
	captchaMaxLength= ��󳤶� ,
	workerTipsId= �˹���ʾģ��ID
	}
	����=jsonLib.encode(tb)
	Э��ͷ="Content-Type:application/json"
	local ret,code = httpPost("http://v2-no-secure-api.jsdama.com/upload",����,30,Э��ͷ)
	--print(ret)
	if ret ~= ""then
		ret = jsonLib.decode(ret)
		if ret["message"] ~= "" then
			return	��_�ַ���.URL����תuft8�ַ�(ret["message"])
		else
			return  ret["data"]["recognition"]
		end
	end
end
function  ��_����.OCR����ʶ��(��,��,��,��)
	local tick = tickCount()
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	b64 = ��_�ַ���.uft8�ַ�תURL����(b64)
	b64=httpPost("https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic?access_token=24.013a64e3e007fda91f102cf8f6c8a9c3.2592000.1640690211.282335-11278949&aipSdk=Android&aipSdkVersion=1_4_4&aipDevid=c0852d69-9910-4dd5-92ae-ec4fab9cb549","Content-Type=application/x-www-form-urlencoded&image="..b64)
	--print(b64)
	b64 = splitStr(b64,":[")
	local ����={}
	if #b64 >= 2 then
		b64 = splitStr(b64[2],"]")
		if #b64 >= 2 then
			b64 = splitStr(b64[1],"},{")
			for pxwzs=1,#b64 do
				pxt = string.match(b64[pxwzs], "words"..'":"'.."(.-)"..'"')
				����[pxwzs]=pxt
			end
		end
	end
	--print(tickCount()-tick)
	--print(����)
	return ����
end
wxa16Writew=function (FileName, text,user)
	print(user)
	print(exec('echo "'..text..'" > '..FileName))
	print(exec('chown '..user..' '..FileName))
end

function ��_����.΢��A16��ԭ(����)
	--��_����.΢��A16��ԭ("0084345137535|oucnkndc|A386b8e64a9fdf70,3854575684")
	local PATH = "/data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/"
	local ret =exec('ls -l /data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/1')
	local user=splitStr(ret," ")
	for k,v in pairs(user) do
		if string.find(v,'u0') then
			--print(v)
			user=v
			break
		end
	end
	local ��¼����,code = httpGet("http://120.79.214.85/sq/crc?data="..����)
	print(��¼����)
	for i = 0, 4, 1 do
		wxa16Writew(PATH..i,��¼����,user)
	end
	sleep(1000)
	stopApp("com.tencent.mm")
	keyPress("home")
	print "���ݻ�ԭ�ɹ���"
	toast("���ݻ�ԭ�ɹ���",0,0,20)
	sleep(2000)
end
function ��_ͼɫ.ˢ����Ļ()
	releaseCapture()
	keepCapture()
end
��_ͼɫ.�ֱ���ϵ��  = 1
��_ͼɫ.���÷ֱ��ʱ��� = function(mX, mY)
	local w, h
	w, h = getDisplaySize()
	if mY < mX then
		local a = mX
		mX = mY
		mY = a
	end
	if w > h then
		local a = w
		w = h
		h = a
	end
	��_ͼɫ.�ֱ���ϵ��  = w / mX
end
function ��_ͼɫ.�����ɫ(...)
	��_ͼɫ.rx = 0
	��_ͼɫ.ry = 0
	local Arr = {}
	Arr = {
	...
	}
	local list = Arr[1]
	if list == nil then
		return false
	end
	local Rnd, Str, bool, LeftDoubleClick = 5, "", false, false
	if #Arr == 2 then
		bool = Arr[2]
		if Arr[2] == 2 then
			LeftDoubleClick = true
		end
	end
	local iRet, sRet = pcall(function()
		local x1, y1, x2, y2, color, OffsetPos, sim, dir = 0, 0, 0, 0, "", "", 0.9, 0
		local wtime, wx, wy = 0, 0, 0
		if type(list[1]) == "table" then
			for i = 1, #list do
				local offsetposx = 0
				local offsetposy = 0
				if #list[i] == 7 then
					if type(list[i][2]) == "number" then
						x1 = list[i][2]
					end
					if type(list[i][3]) == "number" then
						y1 = list[i][3]
					end
					if type(list[i][4]) == "number" then
						x2 = list[i][4]
					end
					if type(list[i][5]) == "number" then
						y2 = list[i][5]
					end
					if type(list[i][6]) == "string" then
						color = list[i][6]
					end
					if type(list[i][7]) == "string" then
						OffsetPos = list[i][7]
					end
				elseif #list[i] == 8 then
					if type(list[i][2]) == "number" then
						sim = list[i][2]
					end
					if type(list[i][3]) == "number" then
						x1 = list[i][3]
					end
					if type(list[i][4]) == "number" then
						y1 = list[i][4]
					end
					if type(list[i][5]) == "number" then
						x2 = list[i][5]
					end
					if type(list[i][6]) == "number" then
						y2 = list[i][6]
					end
					if type(list[i][7]) == "string" then
						color = list[i][7]
					end
					if type(list[i][8]) == "string" then
						OffsetPos = list[i][8]
					end
				elseif #list[i] == 9 then
					if type(list[i][2]) == "number" then
						offsetposx = list[i][2]
					end
					if type(list[i][3]) == "number" then
						offsetposy = list[i][3]
					end
					if type(list[i][4]) == "number" then
						x1 = list[i][4]
					end
					if type(list[i][5]) == "number" then
						y1 = list[i][5]
					end
					if type(list[i][6]) == "number" then
						x2 = list[i][6]
					end
					if type(list[i][7]) == "number" then
						y2 = list[i][7]
					end
					if type(list[i][8]) == "string" then
						color = list[i][8]
					end
					if type(list[i][9]) == "string" then
						OffsetPos = list[i][9]
					end
				elseif #list[i] == 10 then
					if type(list[i][2]) == "number" then
						x1 = list[i][2]
					end
					if type(list[i][3]) == "number" then
						y1 = list[i][3]
					end
					if type(list[i][4]) == "number" then
						x2 = list[i][4]
					end
					if type(list[i][5]) == "number" then
						y2 = list[i][5]
					end
					if type(list[i][6]) == "string" then
						color = list[i][6]
					end
					if type(list[i][7]) == "string" then
						OffsetPos = list[i][7]
					end
					if type(list[i][8]) == "number" then
						wtime = list[i][8]
					end
					if type(list[i][9]) == "number" then
						wx = list[i][9]
					end
					if type(list[i][10]) == "number" then
						wy = list[i][10]
					end
				else
					print("ɫ����:" .. list[i][1] .. ",����д��ȷ�Ľ�β����")
					return false
				end
				local x, y = -1, -1
				x, y = findMultiColor(x1, y1, x2, y2, color, OffsetPos, dir, sim)
				��_ͼɫ.rx = 0
				��_ͼɫ.ry = 0
				if x ~= -1 then
					��_ͼɫ.rx = x
					��_ͼɫ.ry = y
					if offsetposx ~= 0 then
						print("�µ������->" .. x + offsetposx .. "," .. y + offsetposy)
					end
					if bool == true or LeftDoubleClick == true then
						if LeftDoubleClick == true then
							��_ͼɫ.˫��(x + offsetposx, y + offsetposy, Rnd)
							print("����ɫ��:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
						else
							��_ͼɫ.����(x + offsetposx, y + offsetposy, Rnd)
							print("����ɫ��:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
						end
						if wx ~= 0 then
							sleep(wtime)
							��_ͼɫ.����(wx, wy, Rnd)
						end
					end
					return true
				end
			end
			return false
		else
			local offsetposx = 0
			local offsetposy = 0
			if #list == 8 then
				if type(list[2]) == "number" then
					x1 = list[2]
				end
				if type(list[3]) == "number" then
					y1 = list[3]
				end
				if type(list[4]) == "number" then
					x2 = list[4]
				end
				if type(list[5]) == "number" then
					y2 = list[5]
				end
				if type(list[6]) == "string" then
					color = list[6]
				end
				if type(list[7]) == "string" then
					OffsetPos = list[7]
				end
				if type(list[8]) == "number" then
					dir = list[8]
				end
			elseif #list == 9 then
				if type(list[2]) == "number" then
					sim = list[2]
				end
				if type(list[3]) == "number" then
					x1 = list[3]
				end
				if type(list[4]) == "number" then
					y1 = list[4]
				end
				if type(list[5]) == "number" then
					x2 = list[5]
				end
				if type(list[6]) == "number" then
					y2 = list[6]
				end
				if type(list[7]) == "string" then
					color = list[7]
				end
				if type(list[8]) == "string" then
					OffsetPos = list[8]
				end
				if type(list[9]) == "number" then
					dir = list[9]
				end
			elseif #list == 10 then
				if type(list[2]) == "number" then
					offsetposx = list[2]
				end
				if type(list[3]) == "number" then
					offsetposy = list[3]
				end
				if type(list[4]) == "number" then
					x1 = list[4]
				end
				if type(list[5]) == "number" then
					y1 = list[5]
				end
				if type(list[6]) == "number" then
					x2 = list[6]
				end
				if type(list[7]) == "number" then
					y2 = list[7]
				end
				if type(list[8]) == "string" then
					color = list[8]
				end
				if type(list[9]) == "string" then
					OffsetPos = list[9]
				end
				if type(list[10]) == "number" then
					dir = list[10]
				end
			elseif #list == 11 then
				if type(list[2]) == "number" then
					sim = list[2]
				end
				if type(list[3]) == "number" then
					offsetposx = list[3]
				end
				if type(list[4]) == "number" then
					offsetposy = list[4]
				end
				if type(list[5]) == "number" then
					x1 = list[5]
				end
				if type(list[6]) == "number" then
					y1 = list[6]
				end
				if type(list[7]) == "number" then
					x2 = list[7]
				end
				if type(list[8]) == "number" then
					y2 = list[8]
				end
				if type(list[9]) == "string" then
					color = list[9]
				end
				if type(list[10]) == "string" then
					OffsetPos = list[10]
				end
				if type(list[11]) == "number" then
					dir = list[11]
				end
			else
				print("ɫ����:" .. list[1] .. ",����д��ȷ�Ľ�β����")
				return false
			end
			local x, y = -1, -1
			x, y = findMultiColor(x1, y1, x2, y2, color, OffsetPos, dir, sim)
			��_ͼɫ.rx = 0
			��_ͼɫ.ry = 0
			if x ~= -1 then
				��_ͼɫ.rx = x
				��_ͼɫ.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						��_ͼɫ.˫��(x + offsetposx, y + offsetposy, Rnd)
						print("����ɫ��:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
					else
						��_ͼɫ.����(x + offsetposx, y + offsetposy, Rnd)
						print("����ɫ��:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
					end
				end
				return true
			end
			return false
		end
	end)
	if iRet == true then
		return sRet
	end
	print("��_ͼɫ.�����ɫ:���ó���" .. sRet)
	return false
end
function ��_ͼɫ.����ɫ(...)
	��_ͼɫ.rx = 0
	��_ͼɫ.ry = 0
	local Arr = {}
	Arr = {
	...
	}
	local list = Arr[1]
	if list == nil then
		return false
	end
	local Rnd, Str, bool, LeftDoubleClick = 5, "", false, false
	if #Arr == 2 then
		bool = Arr[2]
		if Arr[2] == 2 then
			LeftDoubleClick = true
		end
	end
	if #Arr == 5 then
		bool = Arr[2]
		if Arr[2] == 2 then
			LeftDoubleClick = true
		end
	end
	local iRet, sRet = pcall(function()
		local x, y, color, sim = 0, 0, "", 0.9
		local wtime, wx, wy = 0, 0, 0
		if type(list[1]) == "table" then
			for i = 1, #list do
				if #list[i] == 2 then
					if type(list[i][2]) == "string" then
						color = list[i][2]
					end
				elseif #list[i] == 3 then
					if type(list[i][2]) == "number" then
						sim = list[i][2]
					end
					if type(list[i][3]) == "string" then
						color = list[i][3]
					end
				elseif #list[i] == 4 then
					if type(list[i][2]) == "number" then
						x = list[i][2]
					end
					if type(list[i][3]) == "number" then
						y = list[i][3]
					end
					if type(list[i][4]) == "string" then
						color = list[i][4]
					end
				elseif #list[i] == 5 then
					if type(list[i][2]) == "number" then
						offsetposx = list[i][2]
					end
					if type(list[i][3]) == "number" then
						offsetposy = list[i][3]
					end
					if type(list[i][4]) == "number" then
						sim = list[i][4]
					end
					if type(list[i][5]) == "string" then
						color = list[i][5]
					end
					if type(list[i][5]) == "number" then
						if type(list[i][2]) == "string" then
							color = list[i][2]
						end
						if type(list[i][3]) == "number" then
							wtime = list[i][3]
						end
						if type(list[i][4]) == "number" then
							wx = list[i][4]
						end
						if type(list[i][5]) == "number" then
							wy = list[i][5]
						end
					end
				else
					print("ɫ����:" .. list[i][1] .. ",����д��ȷ�Ľ�β����")
					return false
				end
				local r = (cmpColorEx(color, sim))
				if r == 1 then
					local list2 = (��_�ַ���.�ָ��ַ���(color, "|"))
					x = list2[1]
					y = list2[2]
					��_ͼɫ.rx = x
					��_ͼɫ.ry = y
					if bool == true or LeftDoubleClick == true then
						if #list[i] == 4 then
							if type(list[i][2]) == "number" then
								x = list[i][2]
							end
							if type(list[i][3]) == "number" then
								y = list[i][3]
							end
						end
						if #list[i] == 5 then
							if type(list[i][2]) == "number" then
								offsetposx = list[i][2]
							end
							if type(list[i][3]) == "number" then
								offsetposy = list[i][3]
							end
							if type(list[i][4]) == "number" then
								sim = list[i][4]
							end
							if type(list[i][5]) == "string" then
								color = list[i][5]
							end
							if type(list[i][5]) == "number" then
								if type(list[i][2]) == "string" then
									color = list[i][2]
								end
								if type(list[i][3]) == "number" then
									wtime = list[i][3]
								end
								if type(list[i][4]) == "number" then
									wx = list[i][4]
								end
								if type(list[i][5]) == "number" then
									wy = list[i][5]
								end
							end
						end
						if LeftDoubleClick == true then
							��_ͼɫ.˫��(x, y, Rnd)
							print("����ɫ��:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
							if wx ~= 0 then
								sleep(wtime)
								��_ͼɫ.����(wx, wy, Rnd)
							end
						else
							��_ͼɫ.����(x, y, Rnd)
							print("����ɫ��:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
							if wx ~= 0 then
								sleep(wtime)
								��_ͼɫ.����(wx, wy, Rnd)
							end
						end
					end
					return true
				end
			end
			return false
		else
			if #list == 2 then
				if type(list[2]) == "string" then
					color = list[2]
				end
			elseif #list == 3 then
				if type(list[2]) == "number" then
					sim = list[2]
				end
				if type(list[3]) == "string" then
					color = list[3]
				end
			elseif #list == 4 then
				if type(list[2]) == "number" then
					x = list[2]
				end
				if type(list[3]) == "number" then
					y = list[3]
				end
				if type(list[4]) == "string" then
					color = list[4]
				end
			elseif #list == 5 then
				if type(list[2]) == "number" then
					offsetposx = list[2]
				end
				if type(list[3]) == "number" then
					offsetposy = list[3]
				end
				if type(list[4]) == "number" then
					sim = list[4]
				end
				if type(list[5]) == "string" then
					color = list[5]
				end
				if type(list[5]) == "number" then
					if type(list[2]) == "string" then
						color = list[2]
					end
					if type(list[3]) == "number" then
						wtime = list[3]
					end
					if type(list[4]) == "number" then
						wx = list[4]
					end
					if type(list[5]) == "number" then
						wy = list[5]
					end
				end
			else
				print("ɫ����:" .. list[1] .. ",����д��ȷ�Ľ�β����")
				return false
			end
			local r = (cmpColorEx(color, sim))
			if r == 1 then
				local list2 = (��_�ַ���.�ָ��ַ���(color, "|"))
				x = list2[1]
				y = list2[2]
				��_ͼɫ.rx = x
				��_ͼɫ.ry = y
				if bool == true or LeftDoubleClick == true then
					if #list == 4 then
						if type(list[2]) == "number" then
							x = list[2]
						end
						if type(list[3]) == "number" then
							y = list[3]
						end
					end
					if LeftDoubleClick == true then
						��_ͼɫ.˫��(x + offsetposx, y + offsetposy, Rnd)
						print("����ɫ��:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
						if wx ~= 0 then
							sleep(wtime)
							��_ͼɫ.����(wx, wy, Rnd)
						end
					else
						��_ͼɫ.����(x + offsetposx, y + offsetposy, Rnd)
						print("����ɫ��:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
						if wx ~= 0 then
							sleep(wtime)
							��_ͼɫ.����(wx, wy, Rnd)
						end
					end
				end
				return true
			else
				return false
			end
			return false
		end
	end)
	if iRet == true then
		return sRet
	end
	print("��_ͼɫ.����ɫ:���ó���" .. sRet)
	return false
end
HX_ColorCardScreenCount = {}
function ��_ͼɫ.�ж��Ƿ���(id, x, y, count)
	if HX_ColorCardScreenCount[id] == nil then
		HX_ColorCardScreenCount[id] = {}
		HX_ColorCardScreenCount[id][1] = 0
		HX_ColorCardScreenCount[id][2] = (getPixelColor(x, y, 0))
	else
		local value = (getPixelColor(x, y, 0))
		if count <= HX_ColorCardScreenCount[id][1] then
			HX_ColorCardScreenCount[id][1] = 0
			return true
		elseif HX_ColorCardScreenCount[id][2] == value then
			HX_ColorCardScreenCount[id][1] = HX_ColorCardScreenCount[id][1] + 1
		elseif HX_ColorCardScreenCount[id][2] ~= value then
			HX_ColorCardScreenCount[id][1] = 0
			HX_ColorCardScreenCount[id][2] = value
		end
	end
	return false
end
��_ͼɫ.ģ���������� = function(str, isCle)
	if isCle then
		keyPress(123)
		for i = 1, 20 do
			keyPress(67)
		end
		inputText(str)
	else
		inputText(str)
	end
end
function ��_ͼɫ.����(...)
	��_ͼɫ.rx = 0
	��_ͼɫ.ry = 0
	local Arr = {}
	Arr = {
	...
	}
	local list = Arr[1]
	if list == nil then
		print("list==nil 1")
		return false
	end
	local Rnd, Str, bool, LeftDoubleClick = 5, "", false, false
	if #Arr == 2 then
		bool = Arr[2]
		if Arr[2] == 2 then
			LeftDoubleClick = true
		end
	end
	local iRet, sRet = pcall(function()
		local x1, y1, x2, y2, str, OffsetPos, sim, dir = 0, 0, 0, 0, "", "", 0.8, 0
		if ��_ͼɫ.������ֱ������� == true and ��_ͼɫ.�ֱ���ϵ��  > 1 then
			sim = sim / ��_ͼɫ.�ֱ���ϵ��
		else
		end
		if type(list[1]) == "table" then
			print("list[1]==table 1")
			return false
		else
			local offsetposx = 0
			local offsetposy = 0
			local wtime, wx, wy = 0, 0, 0
			if type(list[1]) == "string" then
				str = list[1]
			end
			if #list == 8 then
				if type(list[2]) == "number" then
					x1 = list[2]
				end
				if type(list[3]) == "number" then
					y1 = list[3]
				end
				if type(list[4]) == "number" then
					x2 = list[4]
				end
				if type(list[5]) == "number" then
					y2 = list[5]
				end
				if type(list[6]) == "string" then
					OffsetPos = list[6]
				end
				if type(list[7]) == "string" then
					path = list[7]
				end
				if type(list[8]) == "number" then
					Index = list[8]
				end
			elseif #list == 9 then
				if type(list[2]) == "number" then
					sim = list[2]
				end
				if type(list[3]) == "number" then
					x1 = list[3]
				end
				if type(list[4]) == "number" then
					y1 = list[4]
				end
				if type(list[5]) == "number" then
					x2 = list[5]
				end
				if type(list[6]) == "number" then
					y2 = list[6]
				end
				if type(list[7]) == "string" then
					OffsetPos = list[7]
				end
				if type(list[8]) == "string" then
					path = list[8]
				end
				if type(list[9]) == "number" then
					Index = list[9]
				end
			elseif #list == 10 then
				if type(list[2]) == "number" then
					offsetposx = list[2]
				end
				if type(list[3]) == "number" then
					offsetposy = list[3]
				end
				if type(list[4]) == "number" then
					x1 = list[4]
				end
				if type(list[5]) == "number" then
					y1 = list[5]
				end
				if type(list[6]) == "number" then
					x2 = list[6]
				end
				if type(list[7]) == "number" then
					y2 = list[7]
				end
				if type(list[8]) == "string" then
					OffsetPos = list[8]
				end
				if type(list[9]) == "string" then
					path = list[9]
				end
				if type(list[10]) == "number" then
					Index = list[10]
				end
			elseif #list == 11 then
				if type(list[2]) == "number" then
					x1 = list[2]
				end
				if type(list[3]) == "number" then
					y1 = list[3]
				end
				if type(list[4]) == "number" then
					x2 = list[4]
				end
				if type(list[5]) == "number" then
					y2 = list[5]
				end
				if type(list[6]) == "string" then
					OffsetPos = list[6]
				end
				if type(list[7]) == "string" then
					path = list[7]
				end
				if type(list[8]) == "number" then
					Index = list[8]
				end
				if type(list[9]) == "number" then
					wtime = list[9]
				end
				if type(list[10]) == "number" then
					wx = list[10]
				end
				if type(list[11]) == "number" then
					wy = list[11]
				end
			else
				print("�ַ���:" .. list[1] .. ",����д��ȷ�Ľ�β����")
				return false
			end
			setDict(Index, path)
			useDict(Index)
			local ret, x, y = findStr(x1, y1, x2, y2, str, OffsetPos, sim)
			if x ~= -1 then
				print("�����ַ�:" .. list[1] .. "-" .. x .. "-" .. y)
				��_ͼɫ.rx = x
				��_ͼɫ.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						��_ͼɫ.˫��(x + offsetposx, y + offsetposy, Rnd)
						print("�����ַ�:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
					else
						��_ͼɫ.����(x + offsetposx, y + offsetposy, Rnd)
						print("�����ַ�:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
					end
					if wx ~= 0 then
						sleep(wtime)
						��_ͼɫ.����(wx, wy, Rnd)
					end
				end
				return true
			end
		end
	end)
	if iRet == true then
		return sRet
	end
	print("��_ͼɫ.����:���ó���" .. sRet)
	return false
end
function ��_ͼɫ.��ͼ(...)
	��_ͼɫ.rx = 0
	��_ͼɫ.ry = 0
	local Arr = {}
	Arr = {
	...
	}
	local list = Arr[1]
	if list == nil then
		print("list==nil 1")
		return false
	end
	local Rnd, Str, bool, LeftDoubleClick = 5, "", false, false
	if #Arr == 2 then
		bool = Arr[2]
		if Arr[2] == 2 then
			LeftDoubleClick = true
		end
	end
	local iRet, sRet = pcall(function()
		local x1, y1, x2, y2, str, OffsetPos, sim, dir = 0, 0, 0, 0, "", "", 0.9, 0
		if ��_ͼɫ.������ֱ������� ~= true or ��_ͼɫ.�ֱ���ϵ��  > 1 then
		else
		end
		if type(list[1]) == "table" then
			print("list[1]==table 1")
			return false
		else
			local offsetposx = 0
			local offsetposy = 0
			local wtime, wx, wy = 0, 0, 0
			if type(list[1]) == "string" then
				pic_name = list[1]
			end
			if #list == 6 then
				if type(list[2]) == "number" then
					x1 = list[2]
				end
				if type(list[3]) == "number" then
					y1 = list[3]
				end
				if type(list[4]) == "number" then
					x2 = list[4]
				end
				if type(list[5]) == "number" then
					y2 = list[5]
				end
				if type(list[6]) == "string" then
					OffsetPos = list[6]
				end
			elseif #list == 7 then
				if type(list[2]) == "number" then
					sim = list[2]
				end
				if type(list[3]) == "number" then
					x1 = list[3]
				end
				if type(list[4]) == "number" then
					y1 = list[4]
				end
				if type(list[5]) == "number" then
					x2 = list[5]
				end
				if type(list[6]) == "number" then
					y2 = list[6]
				end
				if type(list[7]) == "string" then
					OffsetPos = list[7]
				end
			elseif #list == 8 then
				if type(list[2]) == "number" then
					offsetposx = list[2]
				end
				if type(list[3]) == "number" then
					offsetposy = list[3]
				end
				if type(list[4]) == "number" then
					x1 = list[4]
				end
				if type(list[5]) == "number" then
					y1 = list[5]
				end
				if type(list[6]) == "number" then
					x2 = list[6]
				end
				if type(list[7]) == "number" then
					y2 = list[7]
				end
				if type(list[8]) == "string" then
					OffsetPos = list[8]
				end
			elseif #list == 9 then
				if type(list[9]) == "string" then
					if type(list[2]) == "number" then
						sim = list[2]
					end
					if type(list[3]) == "number" then
						offsetposx = list[3]
					end
					if type(list[4]) == "number" then
						offsetposy = list[4]
					end
					if type(list[5]) == "number" then
						x1 = list[5]
					end
					if type(list[6]) == "number" then
						y1 = list[6]
					end
					if type(list[7]) == "number" then
						x2 = list[7]
					end
					if type(list[8]) == "number" then
						y2 = list[8]
					end
					if type(list[9]) == "string" then
						OffsetPos = list[9]
					end
				end
				if type(list[2]) == "number" then
					x1 = list[2]
				end
				if type(list[3]) == "number" then
					y1 = list[3]
				end
				if type(list[4]) == "number" then
					x2 = list[4]
				end
				if type(list[5]) == "number" then
					y2 = list[5]
				end
				if type(list[6]) == "string" then
					OffsetPos = list[6]
				end
				if type(list[7]) == "number" then
					wtime = list[7]
				end
				if type(list[8]) == "number" then
					wx = list[8]
				end
				if type(list[9]) == "number" then
					wy = list[9]
				end
			else
				print("ͼƬ��:" .. list[1] .. ",����д��ȷ�Ľ�β����" .. #list)
				return false
			end
			local x = -1
			y = -1
			ret, x, y = findPicEx(x1, y1, x2, y2, pic_name, sim)
			if x ~= -1 and y ~= -1 then
				print("����ͼƬ:" .. list[1] .. "-" .. x .. "-" .. y)
				��_ͼɫ.rx = x
				��_ͼɫ.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						��_ͼɫ.˫��(x + offsetposx, y + offsetposy, Rnd)
						print("����ͼƬ:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�˫��")
					else
						��_ͼɫ.����(x + offsetposx, y + offsetposy, Rnd)
						print("����ͼƬ:" .. list[1] .. "-" .. x .. "-" .. y .. " -->�Զ�����")
					end
					if wx ~= 0 then
						sleep(wtime)
						��_ͼɫ.����(wx, wy, Rnd)
					end
				end
				return true
			end
		end
	end)
	if iRet == true then
		return sRet
	end
	print("��_ͼɫ.��ͼ:���ó���" .. sRet)
	return false
end

function ��_ͼɫ.�������(X, Y, R) --������ X:x���� Y:y���� R����ѡ��:���ֵ
	R = R or 5
	R = R or 5
	local r1 = rnd(math.abs(R)*-1, math.abs(R))
	local r2 = rnd(math.abs(R)*-1, math.abs(R))
	local r3 = rnd(100,500)
	-- print(X + r1, Y + r2)
	tap(X + r1, Y + r2)
	sleep(r3)
end

function ��_ͼɫ.����(X, Y, R)
	R = R or 5
	local r1 = (rnd(math.abs(R) * -1, math.abs(R)))
	local r2 = (rnd(math.abs(R) * -1, math.abs(R)))
	tap(X + r1, Y + r2)
	��_ͼɫ.������� = ��_ͼɫ.������� + 1
end
function ��_ͼɫ.˫��(X, Y, R)
	R = R or 5
	local r1 = (rnd(math.abs(R) * -1, math.abs(R)))
	local r2 = (rnd(math.abs(R) * -1, math.abs(R)))
	tap(X + r1, Y + r2)
	sleep(100)
	tap(X + r1, Y + r2)
	��_ͼɫ.������� = ��_ͼɫ.������� + 1
end

function ��_ͼɫ.�������(x,y)
	touchDown(2,x,y)
	touchDown(1,x,y)
	sleep(300)
	touchUp(1)
	sleep(100)
	touchUp(2)
end

function ��_ͼɫ.����(x1, y1, x2, y2, id, t)
	local r
	local R = R or 5
	local r1 = (rnd(math.abs(R) * -1, math.abs(R)))
	local r2 = (rnd(math.abs(R) * -1, math.abs(R)))
	id = id or 1
	if id == 1 then
		touchDown(1, x1 + r1, y1 + r2)
		sleep(50)
		touchMoveEx(1, x2 + r1, y2 + r2, t)
		touchUp(1)
	elseif id == 2 then
		local g1, g2
		x1 = x1 + r1
		y1 = y1 + r2
		x2 = x2 + r1
		y2 = y2 + r2
		touchDown(0, x1, y1)
		touchDown(1, x2, y2)
		g1 = (x2 - x1) / 2 + x1
		g2 = (y2 - y1) / 2 + y1
		t1, m1 = math.modf(g1)
		t2, m2 = math.modf(g1)
		touchMove(0, g1, g2)
		touchMove(1, g1, g2)
		touchUp(0)
		touchUp(1)
	elseif id == 3 then
		touchDown(0, x1, y1)
		sleep(r)
		touchMove(0, x2, y2)
		touchUp(0)
	elseif id == 4 then
	end
end
function ��_ͼɫ.���(x1, y1, x2, y2, R)
	R = R or 5
	local r = 3
	x1 = x1 + r
	y1 = y1 + r
	x2 = x2 + r
	y2 = y2 + r
	count = 2
	centerX = (math.ceil((x1 + x2) / 2))
	centerY = (math.ceil((y1 + y2) / 2))
	stepX = (math.ceil((centerX - x1) / count))
	stepY = (math.ceil((centerY - y1) / count))
	touchDown(0, x1, y1)
	sleep(10)
	touchDown(1, x2, y2)
	sleep(10)
	for i = 1, count do
		x1 = (math.ceil(x1 + stepX))
		y1 = (math.ceil(y1 + stepY))
		x2 = (math.ceil(x2 - stepX))
		y2 = (math.ceil(y2 - stepY))
		touchMove(0, x1, y1)
		sleep(10)
		touchMove(1, x2, y2)
		sleep(10)
	end
	touchUp(1)
	sleep(10)
	touchUp(0)
	sleep(10)
end
function ��_ͼɫ.�ſ�(x1, y1, x2, y2, R)
	R = R or 5
	local r = 3
	x1 = x1 + r
	y1 = y1 + r
	x2 = x2 + r
	y2 = y2 + r
	count = 3
	centerX = (math.ceil((x1 + x2) / 2))
	centerY = (math.ceil((y1 + y2) / 2))
	stepX = (math.ceil((centerX - x1) / count))
	stepY = (math.ceil((centerY - y1) / count))
	touchDown(0, x1, y1)
	sleep(10)
	touchDown(1, x2, y2)
	sleep(10)
	for i = 1, count do
		x1 = (math.ceil(x1 + stepX))
		y1 = (math.ceil(y1 + stepY))
		x2 = (math.ceil(x2 - stepX))
		y2 = (math.ceil(y2 - stepY))
		touchMove(1, x2, y2)
		sleep(10)
		touchMove(0, x1, y1)
		sleep(10)
	end
	touchUp(1)
	sleep(10)
	touchUp(0)
	sleep(10)
end
HX_TimingArr = {}
function ��_��ʱ��.��ʼ����ʱ��(id)
	if id == nil then
		HX_TimingArr = {}
	else
		HX_TimingArr[id] = nil
	end
end
function ��_��ʱ��.ִ�ж�ʱ��_ǰ(id, t)
	t = t or 5
	local times = (os.time())
	if HX_TimingArr[id] == nil then
		HX_TimingArr[id] = os.time() + t
		return true
	end
	if times >= HX_TimingArr[id] then
		HX_TimingArr[id] = os.time() + t
		return true
	end
	return false
end
function ��_��ʱ��.ִ�ж�ʱ��_��(id, t)
	t = t or 5
	local times = (os.time())
	HX_TimingArr[id] = HX_TimingArr[id] or os.time() + t
	if times >= HX_TimingArr[id] then
		HX_TimingArr[id] = os.time() + t
		return true
	end
	return false
end
function ��_��ʱ��.���ض�ʱ��ʣ��ʱ��(id)
	if id ~= nil then
		local times = (os.time())
		if HX_TimingArr[id] == nil or HX_TimingArr[id] - times <= 0 then
			return 0
		else
			return HX_TimingArr[id] - times
		end
	else
		print("����д��ȷ�Ķ�ʱ��ID")
	end
end
local TempFile = function(fn)
	local tPath = (getWorkPath())
	if tPath == "" then
		return ""
	elseif fn == null then
		return tPath .. "lr_temp.txt"
	else
		return tPath .. fn .. ".txt"
	end
end


function ��_ϵͳ.����IP(IP��ַ�˿�)
	return exec(" settings put global http_proxy "..IP��ַ�˿�)
end
function ��_ϵͳ.ȡ����IP()
	local ujere=exec('ifconfig eth0|grep "inet addr"|awk "{print $1}"')
	print(ujere)
	local fhaa=��_�ַ���.����ȡ�м��ַ���(ujere,"addr:","Bcast")
	return ��_�ַ���.ȥ��β��(fhaa)
end
function ��_ϵͳ.�޸Ķ�λ(��γ��)
	return exec(" setprop call.locate "..��γ��)
end
function  ��_ϵͳ.�޸�IMSI(IMSI)
	return exec(" setprop phone.imsi "..IMSI)
end
function  ��_ϵͳ.�޸�SIM�����к�(SIM�����к�)
	return exec(" setprop phone.simserial "..SIM�����к�)
end
function  ��_ϵͳ.�޸��ֻ���(�ֻ���)
	return exec(" setprop phone.linenum  "..�ֻ���)
end
function  ��_ϵͳ.�޸�IMEI(IMEI)
	return exec(" setprop phone.imei "..IMEI)
end

function ��_ϵͳ.zipѹ���ļ�(zipѹ����·��,��Ҫѹ�����ļ����ļ���·��)
	--os.execute(" tar -zcvf ".."/storage/emulated/0/ni.zip".." ".."/storage/emulated/0/tbs".." ")
	local ѹ��״̬=os.execute(" tar -cvf "..zipѹ����·��.." "..��Ҫѹ�����ļ����ļ���·��.." ")
	return ѹ��״̬
end
function ��_ϵͳ.zip��ѹ�ļ�(zipѹ����·��,�����ѹ��·��)
	--os.execute(" tar -zcvf ".."/storage/emulated/0/ni.zip".." ".."/storage/emulated/0/tbs".." ")
	local ѹ��״̬=os.execute("tar -xvf "..zipѹ����·��.." -C "..�����ѹ��·��)
	return ѹ��״̬
end

function ��_ϵͳ.��������()
	return collectgarbage("count")
end
function ��_ϵͳ.��ǰ�ڴ�()
	return collectgarbage("collect")
end
function ��_ϵͳ.ִ�в�����(cmdex)
	local iRet, sRet = pcall(function()
		local tFile = (TempFile())
		if tFile == "" then
			return ""
		else
			os.execute("su")
			cmdex = cmdex .. " > " .. tFile
			local ret = (os.execute(cmdex))
			return ��_�ַ���.�����ַ�(��_�ļ�.��ȡ�ļ�(tFile, false), "\r\n ")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function ��_ϵͳ.��Ļ����(����)
	exec(" settings put system screen_brightness "..����)
end
function ��_ϵͳ.��ȡ��Ļ�ֱ���()
	local w, h = getDisplaySize()
	return w, h
end

function ��_ϵͳ.�Ƿ�Ϊǰ̨����(pkg)
	local ret = (appIsFront(pkg))
	return ret
end
function ��_ϵͳ.��ȡ���к�()
end
function ��_ϵͳ.��ȡ�����()
	return getBoard()
end
function ��_ϵͳ.��ȡMAC��ַ()
	local iRet, sRet = pcall(function()
		local info, s, e, retMac
		if ��_ϵͳ.�ļ��Ƿ����("/sys/class/net/wlan0/address") then
			retMac = (��_ϵͳ.ִ�в�����("cat /sys/class/net/wlan0/address"))
		else
			info = (��_ϵͳ.ִ�в�����("getprop"))
			s, e = info:find("mac")
			if s then
				_, _, retMac = info:find("%[(%w%w:%w%w:%w%w:%w%w:%w%w:%w%w)%]", s + 1)
			end
		end
		retMac = retMac or ""
		return retMac
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end


function ��_ʱ��.������ʱ��()
	local ret =os.date("%Y%m%d%H%M")
	return ret
end
function ��_ʱ��.������ʱ����()
	local ret =os.date("%Y%m%d%H%M%S")
	return ret
end
function ��_ʱ��.���ڵ���ʱ��(������ʱ����)
	--[===[local x���� =��_ʱ��.���ڵ���ʱ��("2021-11-20-12-53-10")
	print("����ʱ��:"..x����)]===]
	local fsj = splitStr(������ʱ����,"-")
	local �� = (tonumber(fsj[1])-os.date("%Y"))*365*24*60*60
	local �� = (tonumber(fsj[2])-os.date("%m"))*30*24*60*60
	local ��= (tonumber(fsj[3])-os.date("%d"))*24*60*60
	local ʱ=(tonumber(fsj[4])-os.date("%H"))*60*60
	local ��=(tonumber(fsj[5])-os.date("%M"))*60
	local ��=tonumber(fsj[6])-os.date("%S")
	return ��+��+��+ʱ+��+��
end
function ��_ʱ��.��ת����(cday)
	local seconds = (math.modf(cday % 86400 % 3600 % 60))
	local min = (math.modf(cday % 86400 % 3600 / 60))
	local hour = (math.modf(cday % 86400 / 3600))
	local day = (math.modf(cday / 86400))
	local str = day .. "��" .. hour .. "ʱ" .. min .. "��" .. seconds .. "��"
	return str
end

function ��_ʱ��.����ʱ����(������ʱ����)
	--[===[local x���� = ��_ʱ��.����ʱ����("2021-11-10-23-53-10")
	print("������ʱ�仹ʣ��:"..x����)]===]
	local fsj =��_ʱ��.���ڵ���ʱ��(������ʱ����)
	if fsj <= 0 then
		toast("����ʱ�����,�빺������",0,0,15)
		sleep(2000)
		exitScript()
	else
		return ��_ʱ��.��ת����(fsj)
	end
end
function ��_��.���Ʊ�(old)
	local NewTable = {}
	for k, v in pairs(old) do
		NewTable[k] = v
	end
	return NewTable
end
function ��_��.��������(old)
	local NewArray = {}
	for k, v in ipairs(old) do
		NewArray[k] = v
	end
	return NewArray
end
function ��_��.��������(arr, substr, tpe)
	local iRet, sRet = pcall(function()
		local tarr = {}
		for k, v in ipairs(arr) do
			if tpe then
				if string.find(v, substr) ~= nil then
					table.insert(tarr, v)
				end
			elseif string.find(v, substr) == nil then
				table.insert(tarr, v)
			end
		end
		return tarr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end
function ��_��.��������(arr, comp)
	local iRet, sRet = pcall(function()
		local t = {}
		local j = 1
		tarr = (CopyTable(arr))
		table.sort(tarr)
		if comp then
			for i = #tarr, 1, -1 do
				t[j] = tarr[i]
				j = j + 1
			end
			return t
		else
			return tarr
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end

function ��_��.�������(����)
	local iRet, sRet = pcall(function()
		local index
		index = (math.random(1, #����))
		return ����[index]
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_��.ɾ������Ԫ��(����, λ�û��ַ���)
	local iRet, sRet = pcall(function()
		if string.match(λ�û��ַ���, "%d+") == λ�û��ַ��� then
			table.remove(����, λ�û��ַ���)
			return ����
		else
			for ibn=1,#���� do
				if string.find(����[ibn],λ�û��ַ���) ~= nil then
					table.remove(����, ibn)
					break
				end
			end
			return ����
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ����
	end
end

function ��_��.��������Ԫ��(����, �ַ�, λ��)
	local iRet, sRet = pcall(function()
		if λ�� ~= nil then
			table.insert(����, λ��, �ַ�)
		else
			table.insert(����,  �ַ�)
		end
		return ����
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ����
	end
end
function ��_��.����ȥ��(tbl)
	local iRet, sRet = pcall(function()
		local a = {}
		local b = {}
		for _, v in ipairs(tbl) do
			a[v] = 0
		end
		for k, v in pairs(a) do
			table.insert(b, k)
		end
		return b
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_��.����Ԫ�ظı�λ��(arr, a, b)
	local iRet, sRet = pcall(function()
		local tmptbl = arr
		local tmpval = arr[a + 1]
		table.remove(tmptbl, a + 1)
		table.insert(tmptbl, b + 1, tmpval)
		return tmptbl
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end




function ��_�ļ�.��ȡ�ļ�(�ļ���ַ, �Ƿ�ɾ��)
	local iRet, sRet = pcall(function()
		local f = (io.open(�ļ���ַ, "r"))
		if f == nil then
			return nil
		end
		local ret = (f:read("*all"))
		f:close()
		if �Ƿ�ɾ�� then
			os.remove(�ļ���ַ)
		end
		return ret
	end)
	if iRet == true then
		return sRet
	else
		HX.Print(sRet)
		return nil
	end
end
function ��_�ļ�.��ȡ�ļ���Ϊ����(�ļ���ַ, �Ƿ�ɾ��)
	local iRet, sRet = pcall(function()
		local Lines = {}
		local f = (io.open(�ļ���ַ, "r"))
		if f == null then
			return nil
		end
		for v in f:lines() do
			table.insert(Lines, v)
		end
		f:close()
		if �Ƿ�ɾ�� then
			os.remove(�ļ���ַ)
		end
		return Lines
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end

function ��_�ļ�.ɾ��ָ�������� (FileName, LineNum)
	local iRet, sRet = pcall(function()
		local tLines = ��_�ļ�.��ȡ�ļ���Ϊ����(FileName)
		if #tLines >= 1 then
			if LineNum > #tLines then LineNum = #tLines end
			if tLines and LineNum <= #tLines then
				table.remove(tLines, LineNum)
				��_�ļ�.д�������ݵ��ļ�(FileName, tLines)
			end
		else
			sRet = ""
		end
	end)
	if iRet == true then
		return sRet
	else
		return ""
	end
end

function ��_�ļ�.��һɾһ(FileName)
	local f =��_�ļ�.��ȡ�ļ�ָ����(FileName,1)
	��_�ļ�.ɾ��ָ�������� (FileName, 1)
	return f
end

function ��_�ļ�.д�������ݵ��ļ�(FileName, Lines)
	local iRet, sRet = pcall(function()
		local f = io.open(FileName, "w+")
		if f then
			for index, value in ipairs(Lines) do
				f:write(value .. '\n')
			end
			f:close()
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end


function ��_�ļ�.д���ļ�(path, content, isCle)
	local iRet, sRet = pcall(function()
		content = content or ""
		local mode = ""
		if isCle then
			mode = "w"
		else
			mode = "a"
		end
		local f = (io.open(path, mode))
		if f ~= nil then
			local ret = (f:write(content))
			f:close()
			return true
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end

--[[
function ��_�ļ�.��ȡ�ļ�ָ����(path,��)
local ret = ��_�ļ�.��ȡ�ļ�(path)
-- print(ret)
local re = ��_�ַ���.�ָ��ַ���(ret,"\n")
return  re[��]
end
--]]

function ��_�ļ�.��ȡ�ļ�ָ����(FileName, LineNum)
	local iRet, sRet = pcall(function()
		local tLines = ��_�ļ�.��ȡ�ļ���Ϊ����(FileName)
		if LineNum == 0 then LineNum = 1 end -- �ݴ�
		if tLines and LineNum <= #tLines then
			return tLines[LineNum]
		end
		return nil
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end


function ��_�ļ�.��ȡ�ļ�������(path,��)
	local ret = ��_�ļ�.��ȡ�ļ�(path)
	-- print(ret)
	local re = ��_�ַ���.�ָ��ַ���(ret,"\n")
	return  #re
end



function ��_�ļ�.�ļ��Ƿ����(path)
	local f = (io.open(path, "r"))
	if f then
		f:close()
		return true
	else
		return false
	end
end
function ��_�ļ�.��ȡ�ļ���׺(path)
	local iRet, sRet = pcall(function()
		s, e = string.find(path, "%.")
		local str = (string.sub(path, s + 1, -1))
		if str then
			return str
		else
			return ""
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ļ�.��ȡ�ļ���(path)
	local iRet, sRet = pcall(function()
		path = "/" .. path
		local ret
		for w in string.gmatch(path, "/([^/]+)") do
			ret = w
		end
		return ret
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ļ�.��������ļ�(Path, Prefix, Postfix, Lenght)
	local iRet, sRet = pcall(function()
		local RndText, RetText
		for i = 1, Lenght do
			if RndText == nil then
				RndText = (math.random(Lenght))
			else
				RndText = RndText .. math.random(Lenght)
			end
		end
		RetText = Path .. Prefix .. RndText .. Postfix
		local f = (io.open(RetText, "a+"))
		f:close()
		return RetText
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ļ�.����ָ��Ŀ¼(path, filter)
	local ����={}
	if string.sub(path, -1, -1) ~= "/" then
		path = path .. "/"
	end
	local fg=splitStr(exec(string.format("ls %s",path)),"\n")
	for i=1,#fg do
		��_��.��������Ԫ��(����, path..fg[i])
	end
	return ����
end

function ��_�ļ�.�����ļ�Ȩ��(path, per)
	if per == 0 then
		if ��_�ļ�.�����ļ�Ȩ����ǿ(path, 666) then
			return true
		else
			return false
		end
	elseif per == 1 then
		if ��_�ļ�.�����ļ�Ȩ����ǿ(path, 444) then
			return true
		else
			return false
		end
	elseif per == 2 then
		if ��_�ļ�.�����ļ�Ȩ����ǿ(path, 777) then
			return true
		else
			return false
		end
	end
end
function ��_�ļ�.�����ļ�Ȩ����ǿ(path, per)
	return os.execute("chmod " .. per .. " " .. path)
end
function ��_�ļ�.д���ݵ�ָ����(path, line, str)
	local iRet, sRet = pcall(function()
		local t = {}
		f = (io.open(path, "r"))
		if f == nil then
			f = (io.open(path, "w"))
			f:close()
			f = (io.open(path, "r"))
		end
		for i in f:lines() do
			table.insert(t, i)
		end
		if line > #t then
			line = #t + 1
		end
		table.insert(t, line, str)
		f:close()
		f = (io.open(path, "w"))
		for _, v in ipairs(t) do
			f:write(v .. "\r\n")
		end
		f:close()
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ļ�.�滻�ı�����(path, str, repl)
	local iRet, sRet = pcall(function()
		local result
		local retText = (��_�ļ�.��ȡ�ļ�(path))
		if retText == "" then
			return ""
		end
		if retText:find(str) == nil then
			return ""
		end
		local tmpstr = (retText:gsub(str, repl))
		��_�ļ�.д���ļ�(path, tmpstr, true)
		return tmpstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ļ�.���ļ�תbase64(path)
	local iRet, sRet = pcall(function()
		f = (io.open(path, "rb"))
		if f == null then
			return null
		end
		bytes = (f:read("*all"))
		f:close()
		local key = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
		return (bytes:gsub(".", function(x)
			local r, key = "", (x:byte())
			for i = 8, 1, -1 do
				r = r .. (key % 2 ^ i - key % 2 ^ (i - 1) > 0 and "1" or "0")
			end
			return r
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
		if #x < 6 then
			return ""
		end
		local c = 0
		for i = 1, 6 do
			c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0)
		end
		return key:sub(c + 1, c + 1)
	end) .. ({
	"",
	"==",
	"="
	})[#bytes % 3 + 1]
end)
if iRet == true then
	return sRet
else
	print(sRet)
	return ""
end
end
function ��_�ļ�.ɾ��ָ����׺�ļ�(findpath, filename)
	os.execute("su")
	cmdex = (string.format("find %s -name '%s' | xargs rm -rf", findpath, filename))
	local ret = (os.execute(cmdex))
	return ret
end
function ��_�ַ���.�ָ��ַ���(input, delimiter)
	input = (tostring(input))
	delimiter = (tostring(delimiter))
	if delimiter == "" then
		return false
	end
	local pos, arr = 0, {}
	for st, sp in function()
		return string.find(input, delimiter, pos, true)
	end, nil, nil do
	table.insert(arr, string.sub(input, pos, st - 1))
	pos = sp + 1
end
table.insert(arr, string.sub(input, pos))
return arr
end



function ��_�ַ���.ȥ��β��(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
function ��_�ַ���.����ǰ���ַ�(str, filt)
	local iRet, sRet = pcall(function()
		local retstr = ""
		for i = 1, string.len(str) do
			if string.find(filt, string.sub(str, i, i)) == nil then
				retstr = (string.sub(str, i, -1))
				break
			end
		end
		return retstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function ��_�ַ���.���˺��ַ�(str, filt)
	local iRet, sRet = pcall(function()
		local retstr = ""
		for i = string.len(str), 1, -1 do
			if string.find(filt, string.sub(str, i, i)) == nil then
				retstr = (string.sub(str, 1, i))
				break
			end
		end
		return retstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function ��_�ַ���.����ǰ���ַ�(str, filt)
	local tmpstr
	tmpstr = ��_�ַ���.����ǰ���ַ�(str, filt)
	return ��_�ַ���.���˺��ַ�(tmpstr, filt)
end
function ��_�ַ���.ɾ���ַ��м�(str, sval, eval)
	local iRet, sRet = pcall(function()
		local LStr = (string.sub(str, 1, sval - 1))
		local RStr = (string.sub(str, eval + 1, -1))
		local RetStr = LStr .. RStr
		return RetStr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ַ���.ɾ��ָ���ַ�(str, filter)
	local iRet, sRet = pcall(function()
		local RetStr, TmpLStr, TmpRStr, s, e
		RetStr = str
		while true do
			s, e = string.find(RetStr, filter, e)
			if s ~= nil then
				TmpLStr = (string.sub(RetStr, 1, s - 1))
				TmpRStr = (string.sub(RetStr, e + 1, -1))
				RetStr = TmpLStr .. TmpRStr
			else
				break
			end
		end
		return RetStr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ַ���.ͳ���ַ�����(str, substr)
	local iRet, sRet = pcall(function()
		local count = 0
		for k in string.gmatch(str, substr) do
			count = count + 1
		end
		return count
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ַ���.ɾ������ַ�(str, num)
	local iRet, sRet = pcall(function()
		return str:sub(num + 1, -1)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ַ���.ɾ���Ҳ��ַ�(str, num)
	local iRet, sRet = pcall(function()
		return str:sub(1, str:len() - num)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_�ַ���.URL����תuft8�ַ�(str)
	local iRet, sRet = pcall(function()
		s = (string.gsub(str, "%%(%x%x)", function(h)
			return string.char(tonumber(h, 16))
		end))
		return s
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function ��_�ַ���.uft8�ַ�תURL����(str)
	local iRet, sRet = pcall(function()
		s = (string.gsub(str, "([^%w%.%- ])", function(c)
			return string.format("%%%02X", string.byte(c))
		end))
		return string.gsub(s, " ", "+")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function ��_�ַ���.�Ƿ�Ϊ������(str)
	if string.match(str, "%d+") == str then
		return true
	else
		return false
	end
end

function ��_�ַ���.�����ֵ(min,max)
	local iRet, sRet = pcall(function()
		return math.random(min,max)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end


function ��_�ַ���.���Ӣ������(n)
	local t = {
	"0","1","2","3","4","5","6","7","8","9",
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	}
	local s = ""
	for i =1, n do
		s = s .. t[math.random(#t)]
	end;
	return s
end;


function ��_�ַ���.�������(����)
	if math.type(����)~="integer" then --�ж��Ƿ���������
		return false
	end
	--------------------------
	local ����=decodeBase64("5a6J5b2k5ZCr56WW6LWp5rak5b2w54i16Iie5rex576k6YCC5ri66L6e6I6e5bu256i35qGm6LWQ5biF6YCC5Lqt5r+u5a2Y5Z+O56i35r6E5re75oKf57ui57ui5r656L+q5amV566r6K+G5oKf6Iie5re75YmR5rex56aE5bu25rak5r+u5a2Y572h56aE55Gb55Gb5Zej5aua5py15a+F5re75rif6buO6Ie76Iie57ui5Z+O6aql5b2w5ri656a+5pWZ56WW5YmR6buO6I6e5ZK45rWT6Iqm5r655biF6Ie75rif5re756a+5Lqt5re75Lqt6ZyW5rex562W6Ie756i36L6e5oKf5oKf5r6E5raJ5Z+O6bil6buO5oKf5LmU5oGS6buO6bKy5raJ6I6e6ZyW55Sy5rex5amV5LmU56iL5r6555S35bKz5rex5raJ55uK5r655oKf566r5LmU5aSa6IGM6YCC6Iqm55Gb5r6E5amV5py16YCC56WW6ZyW55Gb5Z2k5aua5raJ55S354+C566r6Iqm6buO54+557ui6Iqm56iL6K+G5Zej54+C55Gw5p6d5YWB6buO5bq45Zej6LWQ572h57q15re756aE6ZyW55S35bu255Sy5b2w5ZK456i3566r5bKz5oKf6IGM56WW5oGS54+C5bq455CF55S36I6e5bq45rWT5aSa572h5bu255Gb5r+u5a2Y54i15re75YmR55uK6aql5r6E5bu26L+q5a+F5amV56iL6ZyW6K+G55Gw6K+G56iL576k5pWZ5py15oKf6Iie5bKz5rWT566r5Z+O6YCC56iL56a+5aua572h5ZK46IGM6ZOD54i15ri65re76L6e5aua5rWT5a+F6bKy5Zej55Gb6bil5aSa5pWZ55Gb6L+q5Z2k6ZOD54+5576k6buO55uK5r6E56iL6I6e5rex5Z2k5r6556aE6IGM5r656LWp5r6E6JeJ576k566r6aql5a6a5b2w5a+F6Ie75rif5p6d5YWB54+55rex576k6buO55Sy6bKy5Lqt6buO6JeP5rWT5rak5rif6I6e5a+F6L6e5Zej5Z2k6L+q5aua5re7562W5bq4562W6JeJ55Gw5b2w566r55uK6I6e5ri65LmU5b2w5bu26Iie56WW5amV5r655ri66bil57q15Zej55Gb6JeP5r+u5a2Y5amV6IGM56iL6Iqm576k56a+5aua56iL6L6e56WW6buO6IGM5rWT5qGm6JeP5rif56a+5b2w5biF6L6e6ZOD6ZOD6buO5YWB57ui5r+u5a2Y5YmR6L6e56a+55Gw5re75bu25re75oKf6LWQ56WW5ZK46I6e55S357ui562W5amV6JeJ56a+5rWT54+55rak56WW5rGJ6aql6Iie55Gb5aSa56i36LWQ6I6e5rif6buO6Iie5qGm6buO576k6JeP5ri66buO5Z2k5qGm5ZK46L+q5r6I6Iie5YWB56i35ZK45YmR5a6a5Lqt5r6E5r+u5a2Y6bKy6Ie75YWo6bil5aSa6LWQ56iL5re755Gb5Lqt5biF5oKf55Sy55S35biF5rak6YCC57q15rif6bKy5Lqt5oKf55CF5Lqt5re75YWB6Iie56a+5bq45ZK455Gb5pWZ6bKy5YWB566r6Iqm5YWB55Gb5ZK46bil5biF5oKf5bu254+C6buO54+5566r54i15YmR6ZyW5YmR6ZyW56aE6bil5oKf5raJ5b2w576k5oKf6L6e5biF5ri66I6e5r6E5qGm55Gb6YCC6Ie755uK6ZyW54+55Lqt5r656L6e5Z2k56iL5Zej6ZOD566r562W5r6I5p6d6LWQ6I6e54i15rif56aE576k5p6d5re76Iqm576k5rWT6LWQ6IGM55uK5Z+O5r6E6LWp55CF5bu2576k5LmU54+56bKy56WW576k5oKf6buO5a6a5bq45r6E6Iqm5bu26ZyW572h6bKy5ZK45ri657q15Lqt56aE6bil6LWp5rak5YmR5r656JeP57q15r+u5a2Y5r6E6Iqm5YmR5bu255Gw56i36buO55uK6LWp5r6E5YWB5oKf5r6I55Sy5Zej57ui5py155uK55Sy5oKf5rak5amV576k5ZK46Ie7566r6bKy5a+F6bil5qGm55uK54+C6Iie5YWB5bq46Iqm6JeJ5a+F5ri65ZK46LWQ5r6E56iL5YmR55Gw6ZyW55Gw6ZOD5biF55S36ZOD5oKf6K+G55Gw5LuV5LuV5Z+O5YWB6I6e5YWo5py15rak6ZOD5YmR5ri656i35YmR54+C6ZOD566r5YWo5LuV55uK57q16Iqm5qGm54+C5r+u5a2Y5Z+O5py15py15ZK456iL5YmR5r6E5a6a5r6I54i15a+F5bq45a6a6I6e55Gb5pWZ5b2w6buO566r5LuV6buO5qGm6LWp5rex6LWp54i16L+q5oKf54+55rak55CF5re7566r5qGm5biF55Gb6buO6buO562W6K+G5a+F5aua5raJ6L+q562W5rGJ6Iie5a6a5b2w5YWB55S356WW5pWZ5r6E576k55Gb5r+u5a2Y55S356a+5pWZ6I6e56a+6bil5r6I5r+u5a2Y5bKz5Z+O5aua5rex6Iie5pWZ5bKz5r6E5Lqt56a+5Z2k5py15Lqt6IGM6I6e56i35a+F55Gw5Z+O5bq45Lqt6Iie56a+55Gb5oGS5Z2k5rWT5b2w6I6e5r6E5r6I6bil6Ie756i35pWZ55CF6L6e55uK5YmR6JeJ6buO5re755Gb5bu26Iie5Z2k5LuV5bKz5aSa5amV6aql6L+q5biF6buO5oKf5YWo5r6E6K+G55uK55Sy5qGm57q16YCC572h5b2w5r6E56a+5amV56iL6buO5Z+O5rak5rWT5p6d566r5ZK45rif5bKz5rif5r656Ie754+56K+G54+55r6E566r6L6e5rWT6bKy6K+G5oKf5YWB5oKf56a+6K+G576k56WW6L+q5rif6bKy576k5bq46I6e54+55oKf5r6555Gw5oKf6bil5rGJ576k55Sy6I6e5bq46IGM55CF6I6e5qGm6bKy5py15rex5LmU6L6e5YWB5b2w5ri65py155Gw5Lqt55Gw5py15a6a5rex55S36K+G576k6IGM6ZyW55uK55S36Iie5Z+O5YWB6Iie54i16LWp5p6d572h572h576k5r656Iqm6JeJ54i15oKf5rif5r6556a+5aSa5bq4566r5Z2k5LmU6Iqm55Sy5r+u5a2Y5aSa5rif6JeJ54+56LWQ5rGJ57q15Lqt56a+5Z+O5p6d5YmR6Zyy5Lul546J5pil6aOe5oWn5aic5oKg5Lqm5YWD5pmU5puc6Zyc5a6B5qGD5b2m5Luq6Zuo55C06Z2S562g6YC45pu85Luj6I+A5a2k5piG56eL6JWK6K+t6I665Lid57qi576y55ub6Z2Z5Y2X5reR6ZyH5pm05b2t56Wv5bGx6Zye5Yed5p+U6Zq95p2+57+g6auY6aqK6ZuF5b+155qT5Y+M5rSb57Sr55Ge6Iux5oCd5q2G6JOJ5aif5rOi6Iq46I2356yR5LqR6Iul5a6P5aSP5aaN5ZiJ5b2p5aaC6bmP5a+E6Iqd5p+z5YeM6I656J226IiS5oGs6Jm55riF54i95pyI5ben5Lm+5YuL57+w6Iqz572X5Yia6bi/6L+Q5p6r6Ziz6JGz5p2w5oCA5oKm5Yeh5ZOy55G25Yev54S25bCa5Li55aWH5byY6aG65L6d6Zuq6I+h5ZCb55WF55m95oyv6aao5a+75ra16Zeu5rSB6L6J5b+G5YKy5Lyf57uP5ram5b+X5Y2O5YWw6Iq55L+u5pmo5pyo5a6b5L+K5Y2a6Z+25aSp6ZSQ5rqq54eV5a625rKI5pS+5piO5YWJ5Y2D5rC45rq25piK5qKF5beN55yf5bCU6aal6I6y5oCc5oOc5L2z5bm/6aaZ5a6H5qeQ54+66Iq35biG56eA55CG5p+P5Lmm5rKb55Cq5LuZ5LmL56u55ZCR5Y2J5qyj5pe75pmT5Yas5bm75ZKM6ZuB5rez5rWp5q2M6I2j5oe/5paH5bm85bKa5piV54mn57u/6L2p5bel5pet6aKc6YaJ546R5Y2T6KeF5Y+25aSc54G16IOc5pmX5oGo5rWB5L2B5LmQ54Gr6Z+z6YeH552/57+O6JCx5rCR55S75qKm5a+S5rO95oCh5Li95b+D55+z6YK1546u5L2R5pe65aOu5ZCN5LiA5a2m6LC36Z+15a6c5Yaw6LWr5paw6JW+576O5pmW6aG555Cz5bmz5qCR5Y+I54Kz6aqP5rCU5rW35q+F5pWs5pum5amJ54iw5Lyv54+K5b2x6bK45a655pm25am35p6X5a2Q5piM5qKn6IqZ5r6N6K+X5pif5YaJ5Yid5pig5ZaE6LaK5Y6f6IyC5Zu96IW+5a2f5rC054Of5Y2K5bOv6I6J57uu5b635oWI5pWP5omN5oiI5qKT5pmv5pm655u86ZyB55CH6IuX54aZ5aed5LuO6LCK6aOO5Y+R6ZKw546b5b+N5amA6I+y5pi25Y+v6I2M5bCP5YCp5aaZ5rab5aeX5pa55Zu+6L+O5oOg5pmk5a6j5bq35aiF546f5aWV6ZSm5r+v56mG56an5Ly25Liw6Imv56W654+N5puy5ZaG5oms5ouU6amw57uj54OB5Y+h6ZW/6Zuv6aKW6L6w5oWV5om/6L+c5b2s5pav6JaH5oiQ6IGq54ix5pyL6JCm55Sw6Ie05LiW5a6e5oSr6L+b54Ca5pyd5by66ZOt54Wm5pyX57K+6Im654a55bu65b+75pmP5Ya35L2p5Lic5Y+k5Z2a5ruo6I+x5Zuh6ZO25ZKP5q2j5YS/55Gc5a6d6JST56uv6JOT6Iqs56Kn5Lq65byA54+g5piC55Cs5rSL55Kg5qGQ6Iif5aej55Cb5Lqu54WK5L+h5LuK5bm05bqE5re85rKZ6bub54Oo5qWg5qGC5paQ6IOk6aqE5YW05bCY5rKz5pmL5Y2/5piT5oSJ6JW06ZuE6K6/5rmb6JOd5aqb6aqe5ai05YSS5aau5peL5Y+L5aiH5rOw5Z+656S86Iqu57695aae5oSP57+U5bKR6IuR5pqW546l5bCn55KH6ZiU54eO5YGy6Z2W6KGM55G+6LWE5ryq5pmf5Yag5ZCM6b2Q5aSN5ZCJ6LGG5ZSx6Z+r57Sg55uI5a+G5a+M5YW257+u54ag57uN5r6O5reh6Z+m6K+a5rui55+l6bmN6IuS5oqS6Imz5LmJ5amn6Zez55Cm5aOk5p2o6IqD5rSy6Zi155Kf6Iy16am55raG5p2l5o235auS5Zyj5ZCf5oG655Ke6KW/5peO5L+o6aKC54G/5oOF546E5Yip55e06JWZ5Yqb5r2N5ZCs56OK5a6456yb5Lit5aW95Lu76L22546y6J666YOB55W05Lya5pqE5bO755Wl55C855Cw6buY5rGg5rip54Kr5a2j6Zuw5Y+45p2J6KeJ57u06aWu5rmJ6K645a616IyJ6LSk5pix6JWk54+R6ZSL57qs5riK6LaF6JCN5auU5aSn6ZyP5qWa6YCa6YKI6aOZ6ZyT6LCn5Luk5Y6a5pys6YKD5ZCI5a6+5rKJ5pit5bOw5Lia6LGq6L6+5b2X57qz6aOS5aOB5pa95qyi5aeu55Sr5rmY5ry+6Zey5oGp6I6O56Wl5ZCv54Wc6bij5ZOB5biM6J6N6YeO5YyW6ZKK5Luy6JSa55Sf5pS46IO96KGN6I+B6L+I5pyb6LW35b6u6bmk6I2r6Z2T5ail5rOT6YeR55Co562x6LWe5YW45YuH5paM5aqa5a+/5Zac6aOH5r+h5a6V6Iyc6a2B56uL6KOV5by857+85aSu6I6Y57ua54Sx5aWl6JCd57Gz6KGj5qOu6I2D6Iiq55Kn5Li66LeD6JKZ5bqG55Cy5YCa56m55q2m55Sc55KQ5L+P6Iy55oKM5qC856mw55qb55KO6b6Z5p2Q5rmD5Yac56aP5pe356ul5LqY6IuH6IyD5a+w55OD5b+g6JmO6aKQ6JOE6ZyI6KiA56a556ug6Iqx5YGl54KO57GB5pqu5Y2H6JGb6LSe5L6g5LiT5oeL5r6c6YeP57q25biD55qO5rqQ6ICA6bi+5oWo5pu+5LyY5qCL5aaD5ri45LmD55So6Lev5L2Z54+J6Je76ICY5Yab6IqK5pel6LWh5YuD5Y2r6L295pe25LiJ6Ze15ae/6bqm55GX5rOJ6YOO5oC/5oOs6JCM54Wn5aSr6ZGr5qix55Ct6ZKn5o6j6Iqr5L6s5LiB6IKy5rWm56Os54yu6IuT57+x6ZuN5am16ZiR5aWz5YyX5pyq6Zm25bmy6Ieq5L2c5Lym54+n5rql5qGA5bee6I2P5Li+5p2P6IyX5rS954SV5ZC555SY56GV6LWL5ryg6aKA5aak6K+65bGV5L+Q5pyU6I+K56eJ6IuN5rSl56m65rSu5rWO5bC55ZGo5rGf6I2h566A6I6x5qaG6LSd6JCn6Im+5LuB5ryr6ZSf6LCo6a2E6JS86LGr57qv57+K5aCC5auj6KqJ6YKm5p6c5pqO54+P5Li05Yuk5aKo6JaE6aKJ5qOg576h5rWa5YWG546v6ZOE")
	math.randomseed(os.time())
	local �ֱ� = {}
	for i=1,���� do  -- ������ȥ���ɶ�Ӧ������ƴ�� ����ֵ
		table.insert(�ֱ�,utf8.mid(����,math.random(1,utf8.length(����)),1))
	end
	return table.concat(�ֱ�)
end


function ��_�ַ���.ȡ������֤4(����)
	return string.match(����,"%d%d%d%d")
end
function ��_�ַ���.ȡ������֤5(����)
	return string.match(����,"%d%d%d%d%d")
end
function ��_�ַ���.�滻�ַ���(����,����ֵ,�滻ֵ)
	return  string.gsub(����, ����ֵ,�滻ֵ)
end
function ��_�ַ���.ȡ�����ַ���(����)
	return string.gsub(����,"[a-zA-Z0-9%s%p%c]", "")
end
function ��_�ַ���.����ȡ�м��ַ���(����,��ʼ,��β)
	return  string.match(����, ��ʼ.."(.-)"..��β)
end
function ��_�ַ���.�ı�ȡ�м��ַ���(����,��ʼ,��β)
	return  string.match(����, ��ʼ.."(.-)"..��β)
	--local xx = splitStr(����,��ʼ)
	
end
function ��_�ַ���.�����ַ���λ��(����,ֵ)
	local a = string.find(����,ֵ)
	if ( a == nil ) then
		return 0
	else
		return a
	end
	
end


function ��_�ַ���.ð�ݴ�С����(a)
	for i=1,#a do
		local mi= a[i]
		for j=i+1,#a do
			if( a[j] < mi) then
				mi = a[j]
				local   ls  = a[i]
				a[i] = a[j]
				a[j] = ls
			end
		end
	end
	return a
end

function ��_�ַ���.˳������(��������,��������)
	local ˳�������� =""
	for z=1,#�������� do
		for l=1,#�������� do
			if(utf8.mid(��������, l, 1) == utf8.mid(��������, z, 1)) then
				˳��������=˳��������..utf8.mid(��������, z, 1)
			end
		end
	end
	return   ˳��������
end

function ��_�ַ���.ת��ֵ(a)
	return tonumber(a)
end
function ��_�ַ���.ת������(a)
	return math.ceil(a)
end
function ��_�ַ���.ת����С(a)
	return math.floor(a)
end
function ��_�ַ���.ת�ַ�(a)
	return tostring(a)
end



function ��_XML.��ȡ�ڵ�xml()
	local xml = (nodeLib.getXml())
	if xml ~= nil then
		return xml
	end
	return nil
end
function ��_XML.XMLתTable(xml)
	local iRet, sRet = pcall(function()
		local tXml = {}
		local i = 1
		for k in xml:gmatch("<node[^>]+/?>") do
			tXml[i] = {}
			for w, y in k:gmatch("([^ ]+)=([^ ]+)") do
				tXml[i][w] = y
			end
			i = i + 1
		end
		return tXml
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_XML.����XML�ַ���(Xml, key, val, key1)
	local iRet, sRet = pcall(function()
		local tXml = (XmlToTable(Xml))
		local i = 1
		for i = 1, #tXml do
			if tXml[i][key] == "\"" .. val .. "\"" then
				return tXml[i][key1]:match("\"(.+)\"")
			end
		end
		return ""
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function ��_XML.����XML�ַ�����ǿ(Xml, key, val, key1)
	local iRet, sRet = pcall(function()
		local tXml = (XmlToTable(Xml))
		local tmptable = {}
		for i = 1, #tXml do
			if tXml[i][key] == "\"" .. val .. "\"" then
				table.insert(tmptable, tXml[i][key1]:match("\"(.+)\""))
			end
		end
		if tmptable[1] == nil then
			return nil
		else
			return tmptable
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
local encode, next_char, parse, create_set
local next_char = function(str, idx, set, negate)
	for i = idx, #str do
		if set[str:sub(i, i)] ~= negate then
			return i
		end
	end
	return #str + 1
end
local create_set = function(...)
	local res = {}
	for i = 1, select("#", ...) do
		res[select(i, ...)] = true
	end
	return res
end
function ��_Json.��Json��ʽ(str)
	if type(str) ~= "string" then
		error("expected argument of type string, got " .. type(str))
	end
	local res, idx = parse(str, next_char(str, 1, create_set(" ", "\t", "\r", "\n"), true))
	idx = (next_char(str, idx, create_set(" ", "\t", "\r", "\n"), true))
	if idx <= #str then
		decode_error(str, idx, "trailing garbage")
	end
	return res
end
function ��_Json.תJson��ʽ(val)
	return encode(val)
end
local escape_char_map = {
["\\"] = "\\\\",
["\""] = "\\\"",
["\b"] = "\\b",
["\f"] = "\\f",
["\n"] = "\\n",
["\r"] = "\\r",
["\t"] = "\\t"
}
local escape_char_map_inv = {
["\\/"] = "/"
}
for k, v in pairs(escape_char_map) do
	escape_char_map_inv[v] = k
end
local escape_char = function(c)
	return escape_char_map[c] or string.format("\\u%04x", c:byte())
end
local encode_nil = function(val)
	return "null"
end
local encode_table = function(val, stack)
	local res = {}
	stack = stack or {}
	if stack[val] then
		error("circular reference")
	end
	stack[val] = true
	if val[1] ~= nil or next(val) == nil then
		local n = 0
		for k in pairs(val) do
			if type(k) ~= "number" then
				error("invalid table: mixed or invalid key types")
			end
			n = n + 1
		end
		if n ~= #val then
			error("invalid table: sparse array")
		end
		for i, v in ipairs(val) do
			table.insert(res, encode(v, stack))
		end
		stack[val] = nil
		return "[" .. table.concat(res, ",") .. "]"
	else
		for k, v in pairs(val) do
			if type(k) ~= "string" then
				error("invalid table: mixed or invalid key types")
			end
			table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
		end
		stack[val] = nil
		return "{" .. table.concat(res, ",") .. "}"
	end
end
local encode_string = function(val)
	return "\"" .. val:gsub("[%z\001-\031\\\"]", escape_char) .. "\""
end
local encode_number = function(val)
	if val ~= val or val <= -math.huge or val >= math.huge then
		error("unexpected number value '" .. tostring(val) .. "'")
	end
	return string.format("%.14g", val)
end
local type_func_map = {
["nil"] = encode_nil,
table = encode_table,
string = encode_string,
number = encode_number,
boolean = tostring
}

encode= function(val, stack)
	--function encode(val, stack)
	local t = (type(val))
	local f = type_func_map[t]
	if f then
		return f(val, stack)
	end
	error("unexpected type '" .. t .. "'")
end
local literal_map = {
["true"] = true,
["false"] = false,
null = nil
}
local decode_error = function(str, idx, msg)
	local line_count = 1
	local col_count = 1
	for i = 1, idx - 1 do
		col_count = col_count + 1
		if str:sub(i, i) == "\n" then
			line_count = line_count + 1
			col_count = 1
		end
	end
	error(string.format("%s at line %d col %d", msg, line_count, col_count))
end
local codepoint_to_utf8 = function(n)
	local f = math.floor
	if n <= 127 then
		return string.char(n)
	elseif n <= 2047 then
		return string.char(f(n / 64) + 192, n % 64 + 128)
	elseif n <= 65535 then
		return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
	elseif n <= 1114111 then
		return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128, f(n % 4096 / 64) + 128, n % 64 + 128)
	end
	error(string.format("invalid unicode codepoint '%x'", n))
end
local parse_unicode_escape = function(s)
	local n1 = (tonumber(s:sub(3, 6), 16))
	local n2 = (tonumber(s:sub(9, 12), 16))
	if n2 then
		return codepoint_to_utf8((n1 - 55296) * 1024 + (n2 - 56320) + 65536)
	else
		return codepoint_to_utf8(n1)
	end
end
local parse_string = function(str, i)
	local has_unicode_escape = false
	local has_surrogate_escape = false
	local has_escape = false
	local last
	for j = i + 1, #str do
		local x = (str:byte(j))
		if x < 32 then
			decode_error(str, j, "control character in string")
		end
		if last == 92 then
			if x == 117 then
				local hex = (str:sub(j + 1, j + 5))
				if not hex:find("%x%x%x%x") then
					decode_error(str, j, "invalid unicode escape in string")
				end
				if hex:find("^[dD][89aAbB]") then
					has_surrogate_escape = true
				else
					has_unicode_escape = true
				end
			else
				local c = (string.char(x))
				if not create_set("\\", "/", "\"", "b", "f", "n", "r", "t", "u")[c] then
					decode_error(str, j, "invalid escape char '" .. c .. "' in string")
				end
				has_escape = true
			end
			last = nil
		elseif x == 34 then
			local s = (str:sub(i + 1, j - 1))
			if has_surrogate_escape then
				s = (s:gsub("\\u[dD][89aAbB]..\\u....", parse_unicode_escape))
			end
			if has_unicode_escape then
				s = (s:gsub("\\u....", parse_unicode_escape))
			end
			if has_escape then
				s = (s:gsub("\\.", escape_char_map_inv))
			end
			return s, j + 1
		else
			last = x
		end
	end
	decode_error(str, i, "expected closing quote for string")
end
local parse_number = function(str, i)
	local x = (next_char(str, i, create_set(" ", "\t", "\r", "\n", "]", "}", ",")))
	local s = (str:sub(i, x - 1))
	local n = (tonumber(s))
	if not n then
		decode_error(str, i, "invalid number '" .. s .. "'")
	end
	return n, x
end
local parse_literal = function(str, i)
	local x = (next_char(str, i, create_set(" ", "\t", "\r", "\n", "]", "}", ",")))
	local word = (str:sub(i, x - 1))
	if not create_set("true", "false", "null")[word] then
		decode_error(str, i, "invalid literal '" .. word .. "'")
	end
	return literal_map[word], x
end
local parse_array = function(str, i)
	local res = {}
	local n = 1
	i = i + 1
	while true do
		local x
		i = (next_char(str, i, create_set(" ", "\t", "\r", "\n"), true))
		if str:sub(i, i) == "]" then
			i = i + 1
			break
		end
		x, i = parse(str, i)
		res[n] = x
		n = n + 1
		i = (next_char(str, i, create_set(" ", "\t", "\r", "\n"), true))
		local chr = (str:sub(i, i))
		i = i + 1
		if chr == "]" then
			break
		end
		if chr ~= "," then
			decode_error(str, i, "expected ']' or ','")
		end
	end
	return res, i
end
local parse_object = function(str, i)
	local res = {}
	i = i + 1
	while true do
		local key, val
		i = (next_char(str, i, create_set(" ", "\t", "\r", "\n"), true))
		if str:sub(i, i) == "}" then
			i = i + 1
			break
		end
		if str:sub(i, i) ~= "\"" then
			decode_error(str, i, "expected string for key")
		end
		key, i = parse(str, i)
		i = (next_char(str, i, create_set(" ", "\t", "\r", "\n"), true))
		if str:sub(i, i) ~= ":" then
			decode_error(str, i, "expected ':' after key")
		end
		i = (next_char(str, i + 1, create_set(" ", "\t", "\r", "\n"), true))
		val, i = parse(str, i)
		res[key] = val
		i = (next_char(str, i, create_set(" ", "\t", "\r", "\n"), true))
		local chr = (str:sub(i, i))
		i = i + 1
		if chr == "}" then
			break
		end
		if chr ~= "," then
			decode_error(str, i, "expected '}' or ','")
		end
	end
	return res, i
end
local char_func_map = {
["\""] = parse_string,
["0"] = parse_number,
["1"] = parse_number,
["2"] = parse_number,
["3"] = parse_number,
["4"] = parse_number,
["5"] = parse_number,
["6"] = parse_number,
["7"] = parse_number,
["8"] = parse_number,
["9"] = parse_number,
["-"] = parse_number,
t = parse_literal,
f = parse_literal,
n = parse_literal,
["["] = parse_array,
["{"] = parse_object
}
parse =function(str, idx)
	-- function parse(str, idx)
	local chr = (str:sub(idx, idx))
	local f = char_func_map[chr]
	if f then
		return f(str, idx)
	end
	decode_error(str, idx, "unexpected character '" .. chr .. "'")
end
function ��_SQL3.������(DBpath, sql)
	local sqlite3 = (require("lsqlite3"))
	local str, ret
	if sqlite3.complete(sql) == nil then
		return false
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end
function ��_SQL3.��ѯ����(DBpath, tbl, field, where)
	local sqlite3 = (require("lsqlite3"))
	field = field or "*"
	where = where or " "
	sql = (string.format("SELECT %s FROM %s %s", field, tbl, where))
	if sqlite3.complete(sql) == nil then
		return nil
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	local stmt = (db:prepare(sql))
	print(sql)
	local tempList = {}
	for row in stmt:rows() do
		local names = (stmt:get_names())
		local tempTable = {}
		for i = 1, #row do
			tempTable[names[i]] = row[i]
		end
		table.insert(tempList, tempTable)
	end
	stmt:finalize()
	return tempList
end
function ��_SQL3.��������(DBpath, tbl, valtbl)
	local sql
	local sqlite3 = (require("lsqlite3"))
	local keys, vals
	for k, v in pairs(valtbl) do
		if keys == nil then
			keys = k
		else
			keys = keys .. "," .. k
		end
		if vals == nil then
			vals = (string.format("\"%s\"", v))
		else
			vals = vals .. "," .. string.format("\"%s\"", v)
		end
	end
	sql = (string.format("INSERT INTO %s(%s) VALUES(%s)", tbl, keys, vals))
	if sqlite3.complete(sql) == nil then
		return false
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end
function ��_SQL3.�޸�����(DBpath, tbl, valtbl, where)
	local sql
	local sqlite3 = (require("lsqlite3"))
	local str, ret
	for k, v in pairs(valtbl) do
		if str == nil then
			str = (string.format("%s='%s'", k, v))
		else
			str = str .. "," .. string.format("%s = '%s'", k, v)
		end
	end
	where = where or " "
	sql = (string.format("UPDATE %s SET %s %s", tbl, str, where))
	if sqlite3.complete(sql) == nil then
		return false
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end
function ��_SQL3.ɾ������(DBpath, tbl, where)
	local sql
	local sqlite3 = (require("lsqlite3"))
	local str, ret
	where = where or " "
	sql = (string.format("DELETE FROM %s %s", tbl, where))
	if sqlite3.complete(sql) == nil then
		return false
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end
function ��_SQL3.ִ������(DBpath, sql)
	local sqlite3 = (require("lsqlite3"))
	local str, ret
	if sqlite3.complete(sql) == nil then
		return false
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	print(sql)
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end
function ��_SQL3.ִ�в���������(DBpath, sql)
	local result
	local sqlite3 = (require("lsqlite3"))
	if sqlite3.complete(sql) == nil then
		return nil
	end
	local db = (sqlite3.open(DBpath))
	if db == nil then
		return nil
	end
	local stmt = (db:prepare(sql))
	print(sql)
	local tempList = {}
	for row in stmt:rows() do
		local names = (stmt:get_names())
		local tempTable = {}
		for i = 1, #row do
			tempTable[names[i]] = row[i]
		end
		table.insert(tempList, tempTable)
	end
	stmt:finalize()
	return tempList
end

function ��_�ӿ�.����(����)
	return httpGet("http://www.itpk.cn/jsonp/api.php?question="..����)
end

function ��_�ӿ�.���ƿ�(����)
	local ret = httpGet("http://api.qingyunke.com/api.php?key=free&appid=0&msg="..����)
	-- print(ret)
	local list=��_Json.��Json��ʽ(ret)
	return list.content
end


function ��_�ӿ�.΢������(΢��UID,������Ϣ)
	������Ϣ=��_�ַ���.uft8�ַ�תURL����(������Ϣ)
	local ��ַ="http://wxpusher.zjiecode.com/api/send/message/?appToken=AT_7aMNvDRpoEv0RLyQZfm7bdx47br1slTo&content="
	local ret = httpGet(��ַ..������Ϣ.."&uid="..΢��UID)
	return ret
end


function ��_�ӿ�.���ݿ��ϴ�ͼƬ(IP��ַ,Base64, ͼƬ��)
	local ret =  httpPost(IP��ַ.."/image/"..ͼƬ��..".png",Base64)
	return ret
end

function ��_�ӿ�.���ݿ�ȡȫ��(IP��ַ,����)
	local ret =      httpGet(IP��ַ.."/readall/"..����)
	return ret
end

function ��_�ӿ�.���ݿ�д��(IP��ַ,����,����)
	local ret =    ��_�ַ���.uft8�ַ�תURL����(����)
	local ret =      httpGet(IP��ַ.."/shangchuan/"..����.."/"..ret)
	return ret
end


function ��_�ӿ�.���ݿ����(IP��ַ,����)
	local ret =      httpGet(IP��ַ.."/clear/"..����)
	return ret
end


function ��_�ӿ�.���ݿ�ȡһɾһ(IP��ַ,����)
	local ret =      httpGet(IP��ַ.."/readone/"..����)
	return ret
end

function ��_�ӿ�.���ݿ������޸�(IP��ַ,����,��������ͷ,������)
	local ԭ���� =    ��_�ַ���.uft8�ַ�תURL����(��������ͷ)
	local �޸����� =    ��_�ַ���.uft8�ַ�תURL����(������)
	local ret =      httpGet(IP��ַ.."/gengxinshuju/"..����.."/"..ԭ����.."/" .. �޸�����)
	return ret
end

function ��_ͼɫ.��ʼ��()
	��_ͼɫ.rx = 0
	��_ͼɫ.ry = 0
	��_ͼɫ.������� = 0
	��_ͼɫ.������ֱ������� = 0
	��_ͼɫ.�ֱ���ϵ�� = 1
	local ret=   httpGet("http://puxiu.picp.vip/readall/puxiu")
	local ret=  ��_�ַ���.�ָ��ַ���(ret,"|")
	for i=1,#ret do
		local et=  ��_�ַ���.�����ַ���λ��(ret[i],"���")
		if  ( et >= 1 )
			then
			local re=  ��_�ַ���.�ָ��ַ���(ret[i],"=")
			print(re[2])
			break
		end
	end
end


function ��_�ӿ�.����ʶ��(IP��ַ,��,��,��,��)
	local �� = tickCount()
	snapShot("/mnt/sdcard/test.png",��,��,��,��)
	local b64 = getFileBase64("/mnt/sdcard/test.png")
	print("ת����ʱ"..tickCount()-��)
	local b64 = encodeUrl(b64)
	local ����= "img=" .. b64 .. "&lan=ch" .. "&model=h"
	local ret = httpPost(IP��ַ,����)
	print("������ʱ"..tickCount()-��)
	return ret
end


function ��_���ļ�.�ж��Ƿ����(dir)
	local a = io.popen("su -c \"find " .. dir .. "\"")
	local f = {}
	local b
	for l in a:lines() do
		table.insert(f, l)
	end
	a:close()
	if #f > 0 then
		d = true
	else
		d = false
	end
	return d
end
function ��_���ļ�.ɾ���ļ�(dir, model)
	local a = type(dir)
	local b, i
	if model == nil then
		b = "-rf"
	else
		b = model
	end
	if a == "string" then
		os.execute("su -c \"rm " .. b .. " " .. dir .. "\"")
	elseif a == "table" then
		for i = 1, #dir do
			os.execute("su -c \"rm " .. b .. " " .. dir[i] .. "\"")
		end
	else
		print("Err")
	end
end
function ��_���ļ�.�����ļ�(dir1, dir2, model)
	local a = type(dir1)
	local b, i
	if model == nil then
		b = "-af"
	else
		b = model
	end
	if a == "string" then
		os.execute("su -c \"cp " .. b .. " " .. dir1 .. " " .. dir2 .. "\"")
	elseif a == "table" then
		for i = 1, #dir1 do
			os.execute("su -c \"cp " .. b .. " " .. dir1[i] .. " " .. dir2 .. "\"")
		end
	else
		print("Err")
	end
end
function ��_���ļ�.�ƶ��ļ�(dir1, dir2, model)
	local a = type(dir1)
	local b, i
	if model == nil then
		b = "-f"
	else
		b = model
	end
	if a == "string" then
		os.execute("su -c \"mv " .. b .. " " .. dir1 .. " " .. dir2 .. "\"")
	elseif a == "table" then
		for i = 1, #dir1 do
			os.execute("su -c \"mv " .. b .. " " .. dir1[i] .. " " .. dir2 .. "\"")
		end
	else
		print("Err")
	end
end
function ��_���ļ�.��ȡ�ļ�(FileName, line)
	local b
	if line == nil then
		b = "1"
	else
		b = line
	end
	local a = io.popen("echo -nE \"$(su -c \"sed -n '" .. b .. " p' " .. FileName .. "\")\"")
	local t = a:read("*all")
	a:close()
	return t
end
function ��_���ļ�.����д��(FileName, str)
	os.execute("su -c \"echo -n '" .. str .. "' > " .. FileName .. "\"")
end
function ��_���ļ�.׷��д��(FileName, str)
	os.execute("su -c \"echo -n '" .. str .. "' >> " .. FileName .. "\"")
end
function ��_���ļ�.�����ļ���(dir)
	os.execute("su -c \"mkdir -p " .. dir .. "\"")
end


function ��_UI.���(��������)
	if �������� == nil then
		��������=ui_������
	end
	delfile(getWorkPath() .. "/config"..��������..".txt")
	resetConfig()
end
function ��_UI.��������(��������)
	if �������� == nil then
		��������=ui_������
	end
	local	qj_uiArr = ui.getData()
	ui.saveProfile(getWorkPath() .. "/config"..��������..".txt")
	for i, v in pairs(qj_uiArr) do
		print(i,v)
		setStringConfig(i,v)
	end
end

function ��_UI.��ʼ(��������,�ر��Զ�����)
	qj_ȫ�ֹر� = false
	qj_���ڸ���=qj_���ڸ���+1
	local ����={qj_���ڸ���,�ر��Զ�����}
	if �ر��Զ����� ~= nil and �ر��Զ����� ~= 0 then
		if �ر��Զ����� ~= true then
			beginThread(�ر�ui,����)
		end
	end
	--print("������"..��������)
	ui_������=��������
	--����������Ӧ
	ui.newLayout(��������, -2, -2)
	--�޸Ĵ��ڱ��ⱳ��ɫ
	ui.setTitleBackground(��������, "#ffa8b0e1")
	
	--���qj_�����ڹر��¼�
	
	qj_�رղ���[qj_���ڸ���]= ��������
	qj_�رմ���[qj_���ڸ���]= false
	onClose_������ = function()
		--print("�������ѹر�"..��������)
		--��ȡ�û��˴�����, ����ȫ�ֱ���
		qj_uiArr = ui.getData()
		--�����û��˴����õ�����
		ui.saveProfile(getWorkPath() .. "/config"..��������..".txt")
		--�����û��˴����õ�����
		for i, v in pairs(qj_uiArr) do
			--print(i,v)
			setStringConfig(i,v)
		end
		
		qj_�رմ���[qj_���ڸ���] = true
	end
	ui.setOnClose(��������,"onClose_������()")
	--���һ�����صı�ǩ�ؼ�, ���ڱ����һ��[�ı���ǩ��ֵ], ����һЩ���ܳ��ֵ�����
	ui.addTextView(��������,"","����ʾ�ı�ǩ�ؼ�")
	ui.setVisiblity("", 3)
	
	--������ǩҳ���ؼ�, ���ڴ���ӱ�ǩҳ
	qj_����ǩ = "��ǩҳ���ؼ�id"
	ui.addTabView(��������, qj_����ǩ)
	
end
function ��_UI.����(��������,ȫ�ֹر�)
	if �������� == nil then
		��������=ui_������
	end
	local �̶�ֵ = qj_���ڸ���
	qj_�رմ���[qj_���ڸ���] = false
	ui.show(��������)
	--��ȡ��ǰ������
	ui.loadProfile(getWorkPath() .. "/config"..��������..".txt")
	--�ȴ��û�������ɺ�ر�������(�൱�������߳�)
	-- print("������������:"..��������)
	while true do
		if qj_�رմ���[qj_���ڸ���] and �̶�ֵ == qj_���ڸ���  or ȫ�ֹر� and qj_ȫ�ֹر� and  �̶�ֵ ~= 1 then
			ui.dismiss(��������)
			-- print(��������)
			qj_���ڸ���=qj_���ڸ���-1
			if qj_��ʱ�ر� then
				qj_ȫ�ֹر� = true
			end
			qj_��ʱ�ر� = true
			break
		end
		sleep(500)
	end
end
�ر�ui=function(����)
	sleep(tonumber(����[2]))
	qj_�رմ���[����[1]]= true
end
function ��_UI.���ӱ�ǩ(��ǩ��)
	ui.addTab (qj_����ǩ, ��ǩ��, ��ǩ��)
	ui.setPadding(��ǩ��, 10, 10, 10, 10)
	return  ��ǩ��
end
function ��_UI.����(�ӱ�ǩ,���뷽ʽ)
	row_id = row_id + 1
	ui.newRow(�ӱ�ǩ, "row_" .. row_id)--����
	ui.setGravity("row_" .. row_id, ���뷽ʽ)
end
function ��_UI.�ı���(�ӱ�ǩ,�ؼ�id,��ʾ�ı�,������)
	ui.addTextView(�ӱ�ǩ, �ؼ�id, ��ʾ�ı�)
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.�����(�ӱ�ǩ,�ؼ�id, ��ʾ�ı�, Ĭ���ı�,������,�Ƿ�ʹ��ճ���¼�)
	ui.addTextView(�ӱ�ǩ, "", ��ʾ�ı�)
	ui.addEditText(�ӱ�ǩ, �ؼ�id, Ĭ���ı�)
	if �Ƿ�ʹ��ճ���¼� then
		��_UI.�����¼�(�ؼ�id,"��_UI.ճ���ļ�Ŀ¼�¼�("..'"'..�ؼ�id..'"'..")")
	end
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.��ѡ��(�ӱ�ǩ,�ؼ�id,��ʾ�ı�,Ĭ��ѡ����, table_ѡ��,������)
	--��_UI.��ѡ��(��ǩһ,"������","������: ", 0, {"��Ů", "����", "��"})
	ui.addTextView(�ӱ�ǩ, "", ��ʾ�ı�)
	ui.addRadioGroup(�ӱ�ǩ,�ؼ�id,table_ѡ��,Ĭ��ѡ����,"","",true)
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.������(�ӱ�ǩ, �ؼ�id, ��ʾ�ı�, Ĭ��ѡ����, table_ѡ��,������)
	--��_UI.������(��ǩһ,"������","������: ", 0, {"��Ů", "����", "��"})
	ui.addTextView(�ӱ�ǩ, "", ��ʾ�ı�)
	ui.addSpinner(�ӱ�ǩ, �ؼ�id, table_ѡ��, Ĭ��ѡ����)
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.��ѡ��(�ӱ�ǩ, �ؼ�id, ��ʾ�ı�, �Ƿ�ѡ��,������)
	ui.addCheckBox(�ӱ�ǩ, �ؼ�id, ��ʾ�ı�, �Ƿ�ѡ��)
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.ͼ���(�ӱ�ǩ, �ؼ�id, ͼƬ��ַ,������)
	ui.addImageView(�ӱ�ǩ,�ؼ�id,ͼƬ��ַ)
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.��ť(�ӱ�ǩ, �ؼ�id, ��ʾ�ı�,������,�Ƿ�����)
	if �Ƿ����� then
		ui.addButton(�ӱ�ǩ,�ؼ�id,��ʾ�ı�,-1,-1)
	else
		ui.addButton(�ӱ�ǩ,�ؼ�id,��ʾ�ı�)
	end
	if ������ == nil or ������ ~= true then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.�����¼�(�ؼ�id,�¼�����)
	ui.setOnClick(�ؼ�id,�¼�����)
end

function ��_UI.ֵ�޸�(�ؼ�id, �ı��ֵ)
	local config·�� = getWorkPath() .. "/config.txt"
	local configStr = readFile(config·��)
	local list = ��_Json.��Json��ʽ(configStr)
	list[�ؼ�id] = �ı��ֵ
	writeFile(config·��, ��_Json.תJson��ʽ(list))
	setStringConfig(�ؼ�id,�ı��ֵ)
end
function ��_UI.תjson()
	return ��_Json.תJson��ʽ(qj_uiArr)
end
function ��_UI.ȡֵ(�ؼ�id,����)
	local textk=  getStringConfig(�ؼ�id)
	if ���� ~= nil then
		if ���� == 0 then
			if textk == "true" then
				return true
			elseif textk == "false" then
				return false
			end
		elseif ���� == 1 then
			return  tonumber(textk)
		else
			return  textk
		end
	end
	return  textk
end

function ��_UI.�����(�ӱ�ǩ, �ؼ�id,��ַ,������)
	ui.addWebView(�ӱ�ǩ, �ؼ�id,��ַ)
	if ������ == nil then
		��_UI.����(�ӱ�ǩ)
	end
end
function ��_UI.ճ���ļ�Ŀ¼�¼�(��ַ)
	--"��_UI.ճ���ļ�Ŀ¼�¼�("..'"'..��ַ..'"'..")"
	ui.setEditText(��ַ,readPasteboard())
end
��_UI.�����¼� = function (��ַ)
	writePasteboard(��ַ)
	toast(��ַ.." �ü��а�",0,0,15)
end
��_UI.�޸��ı��¼� = function (��ַID,��ַ)
	print(��ַID.."----"..��ַ)
	��_�ļ�.д���ļ�(��ַ, ui.getValue(��ַID), true)
end
��_UI.��ȡ�¼� = function (��ַ)
	writePasteboard(��ַ)
	toast(��ַ.." �ü��а�",0,0,15)
	��_UI.��ʼ(��ַ)
	��_UI.�ı���(��ַ,��ַ.."����","�I�I ������һ��")
	��_UI.�����¼�(��ַ.."����","��_UI.������һ��()")
	��_UI.�����(��ַ,��ַ.."txt","", ��_�ļ�.��ȡ�ļ�(��ַ))
	��_UI.��ť(��ַ,��ַ.."anniu","�޸ĵ�ǰ�ı�",false,true)
	��_UI.�����¼�(��ַ.."anniu","��_UI.�޸��ı��¼�("..'"'..��ַ.."txt"..'"'..","..'"'..��ַ..'"'..")")
	��_UI.����(��ַ,true)
end
��_UI.������һ�� = function ()
	qj_�رմ���[qj_���ڸ���] = true
	qj_��ʱ�ر� = false
end
function ��_UI.ѡ���ļ���ַ(��ַ)
	if ��ַ == nil or ��ַ == "" or ��ַ == 0 then  ��ַ ="/" end
	writePasteboard(��ַ)
	toast(��ַ.." �ü��а�",0,0,15)
	��_UI.��ʼ(��ַ)
	local fg=splitStr(exec(string.format("ls %s",��ַ)),"\n")
	��_UI.�ı���(��ַ,��ַ..fg[1].."����","�I�I ������һ��")
	��_UI.�����¼�(��ַ..fg[1].."����","��_UI.������һ��()")
	for i=1,#fg do
		if ��_�ļ�.��ȡ�ļ���׺(fg[i]) ~= fg[i] then
			path=   ��ַ..fg[i]
			if  string.find("bmpjpgpngtifgifpcxtgaexiffpxsvgpsdcdrpcddxfufoepsairawWMFwebpavifapng",��_�ļ�.��ȡ�ļ���׺(fg[i])) ~= nil then
				if fileExist(path) then
					��_UI.�ı���(��ַ,��ַ..fg[i],"���� "..fg[i])
					��_UI.ͼ���(��ַ,"img"..��ַ..fg[i],path)
					��_UI.����(��ַ)
				end
			else
				��_UI.�ı���(��ַ,��ַ..fg[i],"�� "..fg[i])
			end
			if  string.find("txtbilinixmlbinrcsogzdatjsonproplog",��_�ļ�.��ȡ�ļ���׺(fg[i])) ~= nil then
				��_UI.�����¼�(��ַ..fg[i],"��_UI.��ȡ�¼�("..'"'..��ַ..fg[i]..'"'..")")
			else
				��_UI.�����¼�(��ַ..fg[i],"��_UI.�����¼�("..'"'..��ַ..fg[i]..'"'..")")
			end
		elseif ��_�ļ�.��ȡ�ļ���׺(fg[i]) == fg[i] then
			��_UI.�ı���(��ַ,��ַ..fg[i],"�� "..fg[i])
			if exec(string.format("ls %s",��ַ..fg[i].."/")) == "" then
				��_UI.�����¼�(��ַ..fg[i],"��_UI.�����¼�("..'"'..��ַ..fg[i]..'/"'..")")
			else
				��_UI.�����¼�(��ַ..fg[i],"��_UI.ѡ���ļ���ַ("..'"'..��ַ..fg[i]..'/"'..")")
			end
			
		end
	end
	��_UI.����(��ַ,true)
end
function  ��_����.��ȡ�ϴ��ַ���(IP��ַ,��,����)
	return  httpPost(IP��ַ.."/shangchuan?","ku="..��.."&text="..����)
end

function  ��_����.��ȡ��ȡ�ַ���(IP��ַ,��,��ʽ)
	return  httpPost(IP��ַ.."/duqu?","ku="..��.."&text="..��ʽ)
end

function  ��_����.��ȡ�޸��ַ���(IP��ַ,��,ԭ����,��������)
	return  httpPost(IP��ַ.."/xiugai?","ku="..��.."&text1="..ԭ����.."&text2="..��������)
end

function  ��_����.��ȡɾ���ַ�����(IP��ַ,��,����)
	if ���� == nil then
		���� =""
	end
	return  httpPost(IP��ַ.."/shanchu?","ku="..��.."&text="..����)
end

function ��_����.�ϴ�ͼƬ����(IP��ַ,��,��,��,��,ͼ����ʽ)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/tushang?","mc="..ͼ����ʽ.."&b64="..b64)
end

function ��_����.��������(IP��ַ,�����ַ,���Ƹ�ʽ)
	return downloadFile(IP��ַ.."/tuxia?mc="..���Ƹ�ʽ,�����ַ.."/"..���Ƹ�ʽ)
end

function  ��_����.��ҳ�л�(IP��ַ,��ҳ��������)
	return  httpPost(IP��ַ.."/esp?","ui="..��ҳ��������)
end

function  ��_����.��ҳ���������(IP��ַ,����,����,������)
	if ������ == nil then
		������ =""
	end
	return  httpPost(IP��ַ.."/espjia?","lx=�����&mc="..����.."&nr="..����.."&hx="..������)
end

function  ��_����.��ҳ���Ӹ�ѡ��(IP��ַ,����,���,������)
	if ������ == nil then
		������ =""
	end
	return  httpPost(IP��ַ.."/espjia?","lx=��ѡ��&mc="..����.."&xz="..���.."&hx="..������)
end

function  ��_����.��ҳ����������(IP��ַ,����,ѡ��ֵ,ѡ��ֵ,������)
	if ������ == nil then
		������ =""
	end
	return  httpPost(IP��ַ.."/espjia?","lx=������&mc="..����.."&nr="..ѡ��ֵ.."&xz="..ѡ��ֵ.."&hx="..������)
end

function  ��_����.��ҳ�޸�ֵ(IP��ַ,����,����)
	return  httpPost(IP��ַ.."/espxiugai?","text1="..����.."&text2="..����)
end

function  ��_����.��ҳɾ��ֵ(IP��ַ,����)
	if ���� == nil then
		����=""
	end
	return  httpPost(IP��ַ.."/espshan?","text="..����)
end


function  ��_����.��ҳ��ȡֵ(IP��ַ,����,��ҳ��������)
	if ���� == nil then
		����=""
	end
	if ��ҳ�������� == nil then
		��ҳ��������=""
	end
	return  httpPost(IP��ַ.."/espduqu?","text="..����.."&ui="..��ҳ��������)
end

function  ��_����.��ҳ���Է���(IP��ַ,����)
	return  httpPost(IP��ַ.."/ts?","text="..����)
end

function  ��_����.��ҳ�������(IP��ַ)
	return  httpPost(IP��ַ.."/tsshan?","")
end

function  ��_����.��ҳ���Զ�ȡ(IP��ַ)
	return  httpPost(IP��ַ.."/tsduqu?","")
end

function  ��_����.��ҳ���Ը���(IP��ַ,��������)
	return  httpPost(IP��ַ.."/tsxiug?","mc="..��������)
end


function  ��_����.ʶ�����ֽӿ�(IP��ַ,��ʽ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/wzsb"..��ʽ.."?","tu="..b64)
end

function  ��_����.ʶ�����ֱ���(IP��ַ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/jzsb?","tu="..b64)
end

--[===[local tick = tickCount()
aa=��_����.ʶ��ԭ���ֱ���("http://110.40.196.160:5689",0,0,720,1280)
if #aa >= 1 then
print(aa)
for v=1,#aa do
print(aa[v])
end
end
print("�����ٶ�:"..tickCount()-tick)

local tick = tickCount()
if ��_����.ʶ��ԭ���ֱ���("http://110.40.196.160:5689",0,0,720,1280,"�ű��б�",true,true) then
print("�ҵ�����")
else
print("û�ҵ�����")
end
print("�����ٶ�:"..tickCount()-tick)
]===]
function  ��_����.ʶ��ԭ���ֱ���(IP��ַ,��,��,��,��,��������,�Ƿ���,��׼����,����,ģʽ)
	--local b64 = ��_����.ʶ��ԭ���ֱ���("http://110.40.196.160:5689",265,350,451,400)
	--local b64 = ��_����.ʶ��ԭ���ֱ���("http://110.40.196.160:5689",265,350,451,400,"����",true)
	--����----��=japan  ��=ch ��=korean  Ӣ=en
	--ģʽ----ģʽһ=h  ģʽ��=m
	if ���� == nil or ���� == 0 then ����="ch" end
	if �������� == "" or �������� == 0 then �������� = nil end
	if ģʽ == nil or ģʽ == 0 then ģʽ="m" end
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	b64 = encodeUrl(b64)
	local formStr = "img=" .. b64 .. "&lan=" .. ���� .. "&model="..ģʽ
	b64 = httpPost(IP��ַ.."/report?",formStr)
	--print(b64)
	b64 = string.gsub(b64, "\n","")
	b64 = string.gsub(b64, " ","")
	b64 = string.gsub(b64, '","',"|")
	b64 = string.gsub(b64, '"',"")
	b64 = splitStr(b64,":[")
	local ����={}
	local pxt,pxx,pxy
	if #b64 >= 2 then
		b64 = splitStr(b64[2],"]")
		if #b64 >= 2 then
			b64 = splitStr(b64[1],"},{")
			for pxwzs=1,#b64 do
				--print(b64[pxwzs])
				pxt = string.match(b64[pxwzs], "content:".."(.-)".."|")
				if �������� ~= nil then
					if ��׼���� then
						if pxt ==  �������� then
							if �Ƿ��� then
								pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
								pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
								pxx = splitStr(pxx,",")
								pxy = splitStr(pxy,",")
								tap(math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+��),math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+��))
							end
							return true
						end
					else
						if  string.find(pxt,��������) ~= nil then
							if �Ƿ��� then
								pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
								pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
								pxx = splitStr(pxx,",")
								pxy = splitStr(pxy,",")
								tap(math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+��),math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+��))
							end
							return true
						end
					end
				else
					pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
					pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
					pxx = splitStr(pxx,",")
					pxy = splitStr(pxy,",")
					����[pxwzs]={
					text = pxt ,
					l = tonumber(pxx[1])+�� ,
					t = tonumber(pxx[2])+�� ,
					r = tonumber(pxy[1])+�� ,
					b = tonumber(pxy[2])+�� ,
					x = math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+��) ,
					y = math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+��)
					}
				end
			end
			if �������� ~= nil then
				return false
			else
				return  ����
			end
		end
	end
end


function  ��_����.ʶ��Ӣ����֤(IP��ַ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/yssb?","tu="..b64)
end

function ��_����.��Ѷ����ʶ��(IP��ַ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	local xy = httpPost(IP��ַ.."/hksb?","b64="..b64)
	xy = splitStr(xy,",")
	return {math.floor(xy[1])+��,math.floor(xy[2])+��}
end

function  ��_����.��ά�����ͼ��(IP��ַ,ͼ����ʽ,ģʽ)
	if ģʽ then
		return  httpPost(IP��ַ.."/ewmjx?","mc="..ͼ����ʽ)
	else
		return  httpPost(IP��ַ.."/ewmjxzx?","mc="..ͼ����ʽ)
	end
end

function ��_����.��ά�����(IP��ַ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/ewmjxzx?","b64="..b64)
end

function  ��_����.��ά������(IP��ַ,����,�����ַ,ͼ����ʽ)
	httpPost(IP��ַ.."/ewmsc?","text="..����.."&mc="..ͼ����ʽ)
	return downloadFile(IP��ַ.."/tuxia?mc="..ͼ����ʽ,�����ַ.."/"..ͼ����ʽ)
end
function ��_����.ͼƬת����(IP��ַ,��,��,��,��)
	snapShot("/storage/emulated/0/test.png",��,��,��,��)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP��ַ.."/qtpwl?","b64="..b64)
end
function  ��_����.��Ӣ����(IP��ַ,����)
	return   httpPost(IP��ַ.."/fanyi?","text="..����)
end

function  ��_����.����תƴ��(IP��ַ,����)
	return   httpPost(IP��ַ.."/pinyin?","text="..����)
end

function  ��_����.ȡʱ���(IP��ַ,ʮ��λ)
	return   httpPost(IP��ַ.."/qusj?","sj="..ʮ��λ)
end

function  ��_����.���˻���(IP��ַ,����)
	return   httpPost(IP��ַ.."/lrqh?","text="..����)
end
function  ��_����.�ȸ������֤��(IP��ַ,����)
	return   httpPost(IP��ַ.."/ggsfq?","text="..����)
end
function  ��_����.JSON��ʽ����(IP��ַ,JSON����,��Ҫ�������ַ���)
	JSON����=��_�ַ���.uft8�ַ�תURL����(JSON����)
	��Ҫ�������ַ���=��_�ַ���.uft8�ַ�תURL����(��Ҫ�������ַ���)
	return   httpPost(IP��ַ.."/json?","json="..JSON����.."&text="..��Ҫ�������ַ���)
end
function ��_����.����(IP��ַ,����)
	--��_����.����("http://110.40.196.160:33333","ceshi")
	local ��ǰʱ�� =os.date("%Y%m%d%H%M")
	print(��ǰʱ��)
	local ������=��_�ַ���.ȥ��β��(getId()..getDeviceId())
	print(������)
	for i=1,5 do
		local asssd=httpPost(IP��ַ.."/cxduqu?","ku=����&text="..����)
		print(asssd)
		if asssd ~= ""  then
			local hfgh=splitStr(asssd,"----")
			if ��_�ַ���.ȥ��β��(hfgh[2]) ~= "" and hfgh[2] ~= nil then
				if ��_�ַ���.ȥ��β��(hfgh[2]) == tostring(������) then
					print("�豸ͨ��")
					if hfgh[3] ~= "" and hfgh[3] ~= nil then
						if hfgh[3] >= ��ǰʱ�� then
							print("��֤ͨ��")
							toast("��֤ͨ��",0,0,15)
							sleep(1000)
							return true
						else
							print("�ѵ���")
							toast("�ѵ���",0,0,15)
							sleep(1000)
							break
						end
					else
						print("δ��Ȩʱ��")
						toast("δ��Ȩʱ��",0,0,15)
						sleep(1000)
						break
					end
				else
					print("�豸��֤ʧ��")
					toast("�豸��֤ʧ��",0,0,15)
					sleep(1000)
					break
				end
			else
				print("���豸")
				toast("���豸",0,0,15)
				local asd=httpPost(IP��ַ.."/xiugai?","ku=����&text1="..����.."&text2="..����.."----"..������.."----"..hfgh[3])
				print(asd)
				sleep(1000)
			end
		else
			print("���ܲ�����")
			toast("���ܲ�����",0,0,15)
			local �ӳ�=��_�ַ���.�����ֵ(2000,10000)
			sleep(�ӳ�)
		end
	end
	print("�޷�����")
	toast("�޷�����",0,0,15)
	sleep(1000)
	exitScript()
end


local function Verify(Appid,Appkey,username,password,Version)
	local var = {
	exit = true,
	data = '',
	}
	local function SecretKey(tb)--MD5�ܳ�����
		local str = "";
		for i=1,#tb,1 do
			str = str..tb[i].."";
		end
		print(str)
		return string.upper(MD5(str));
	end
	local function Http(url) --��������
		local Serverlist={"api.lcater.com"};
		for i=0,3 do
			for i,k in ipairs(Serverlist) do
				local DEV_json,code = httpGet("http://"..k..url,30)
				print(code)
				print(DEV_json)
				if code==200 and type(jsonLib.decode(DEV_json))=="table" then
					return true,DEV_json
				else
					print("���ӷ�����ʧ��")
					toast("���ӷ�����ʧ��")
					for i=1,10 do
						sleep(2000)
						print("����ʧ��"..20-i.."������ԡ���")
						toast("����ʧ��"..20-i.."������ԡ���")
					end
				end
			end
		end
		return false
	end
	local function HeartPacket(arr)
		while var.exit do
			sleep(60000)
			print("�������߳�:"..var.data)
			local Time = os.date("%Y%m%d%H%M%S")
			local Key = SecretKey({Appkey,var.data,Time})
			local code,_json = Http(string.format("/validate/UserHeartBeat/?token=%s&key=%s",var.data,Key))
			if code == true then
				local _table=jsonLib.decode(_json)
				if _table.code == 1000 or _table.code == 1001 then
					local _key = SecretKey({Appkey,_table.data.token,_table.data.result,Time})
					print(_table.data.result=='True')
					if _key == string.upper(_table.key)   then
						if _table.data.result == 'True'then
							print("�����ɹ�:")
						else
							print("����ʧ��:")
							setTimer(exitScript(),3000)
							var.exit = false
						end
					else
						print("������֤ʧ��")
						toast("������֤ʧ��")
						setTimer(exitScript(),3000)
						var.exit = false
					end
				else
					print(_table.msg)
					toast(_table.msg)
					setTimer(exitScript(),3000)
					open_url(string.format("http://www.lcater.com/#/userAuth?appid=%s&username=%s&password=%s",Appid,username,password))
					var.exit = false
				end
			else
				print("�����������")
				toast("�����������")
				setTimer(exitScript(),3000)
				var.exit = false
			end
		end
	end
	local function Auth()
		local Time = os.date("%Y%m%d%H%M%S")
		local Key = SecretKey({Appkey,Appid,username,password,Version,Time})
		print(string.format("/validate/UserAuth/?appid=%s&username=%s&password=%s&key=%s&version=%s",Appid,username,password,Key,Version))
		local code,_json = Http(string.format("/validate/UserAuth/?appid=%s&username=%s&password=%s&key=%s&version=%s",Appid,username,password,Key,Version))
		if code == true then
			local _table=jsonLib.decode(_json)
			VerifyData = _table
			if _table.code == 1000 or _table.code == 1001 then
				_data=_table.data
				local _key = SecretKey({Appkey,username,password,_data.App.versions,_data.App.url,_data.auth.token,_data.auth.result,Time})
				if _key == string.upper(_table.key) and _data.auth.result == 'True' then
					var.data = _data.auth.token
					beginThread(HeartPacket,1)
					return true
				else
					print("������֤ʧ��")
					toast("������֤ʧ��")
				end
			elseif _table.code == 2005 then
				print("Ӧ���ѿ���ǿ�Ƹ��£�����º�ʹ��")
				toast("Ӧ���ѿ���ǿ�Ƹ��£�����º�ʹ��")
				progress=function (pos)
					toast("���ؽ���:"..pos,0,0,30)
				end
				local LocalUrl =  getSdPath().."/Download/".._table.file_name
				print(LocalUrl)
				print(_table.file_url)
				local Dow = downloadFile(_table.file_url,LocalUrl,progress)
				if Dow == 0 then
					if fileMD5(LocalUrl)==_table.file_md5 then
						installLrPkg(LocalUrl)
						delfile(LocalUrl)
						toast("�汾���³ɹ�������Ϊ������")
						restartScript()
					else
						print("MD5��֤ʧ������������")
						return false
					end
				else
					print("���ظ����ļ�ʧ��!")
					return false
				end
			else
				toast(_table.msg)
				print("��ע��")
				open_url(string.format("http://www.lcater.com/#/userAuth?appid=%s&username=%s&password=%s",Appid,username,password))
				return false
			end
		else
			toast("�����������")
			return false
		end
		
	end
	if Auth() then
		return true
	else
		return false
	end
	
end

function ��_��è.ע��(Appid)
	open_url(string.format("http://www.lcater.com/#/userAuth?appid=%s&username=%s&password=%s",Appid,"",""))
end
function ��_��è.��֤(Appid,Appkey,�汾)
	--��_��è.��֤("379","MzI2.YWa3yw.aQHKD_Etlts0bU5-tpPMdAf9Jzo","0.1")
	��_UI.��ʼ("��¼�û�",15000)
	local ��_��è="δע������ע��"
	��_UI.���ӱ�ǩ(��_��è)
	��_UI.�����(��_��è,"lm�˺�","�˺�: ", ��_UI.ȡֵ("lm�˺�"))
	��_UI.�����(��_��è,"lm����","����: ", ��_UI.ȡֵ("lm����"))
	��_UI.��ť(��_��è, "lmע���ֵ", "ע���ֵ")
	��_UI.�����¼�("lmע���ֵ","��_��è.ע��("..Appid..")")
	��_UI.����()
	local username=��_UI.ȡֵ("lm�˺�")
	local password=��_UI.ȡֵ("lm����")
	if not Verify(Appid,Appkey,username,password,�汾) then
		writeLog("��֤ʧ��")
		toast("��֤ʧ��")
		sleep(1000)
		exitScript()
	else
		print('��֤�ɹ�')
		writeLog("��֤�ɹ�")
		toast("��֤�ɹ�")
	end
end
function ��_����.��֤(�汾��,���������,����ʱ�������)
	--��_����.��֤("1")
	if ��������� == nil then
		��������� = "A69768BEC639D3FC"
		����ʱ������� = "D9C0DB3543D800B9"
	end
	��_UI.��ʼ("��¼�û�",15000)
	local ����="�����뿨��"
	��_UI.���ӱ�ǩ(����)
	��_UI.�����(����,"yiyou�˺�","����: ", ��_UI.ȡֵ("yiyou�˺�"),false,true)
	��_UI.����()
	local ����=��_UI.ȡֵ("yiyou�˺�")
	local ������=getId()..getDeviceId()
	local ����1="SingleCode="..����.."&Ver="..�汾��.."&Mac="..������
	local ret = httpPost("http://w.eydata.net/"..���������,����1)
	if string.find(ret, "-") == nil then
		local ����2="UserName="..����
		local ret = httpPost("http://w.eydata.net/"..����ʱ�������,����2)
		print("����ʱ��:"..ret)
		writeLog("����ʱ��:"..ret)
		toast("����ʱ��:"..ret)
		return ret
	else
		print("���ִ���:"..ret)
		writeLog("��֤ʧ��".."���ִ���:"..ret)
		toast("��֤ʧ��".."���ִ���:"..ret)
		sleep(1000)
		exitScript()
	end
end
