TURING = require("TURING")
extractAssets("�߲���ʯ.rc", getSdPath(), "����_150.lib")
extractAssets("�߲���ʯ.rc", getSdPath(), "����_185_125_149.lib")
extractAssets("�߲���ʯ.rc",getSdPath(), "�������ֿ�.lib")
extractAssets("�߲���ʯ.rc",getSdPath(), "�ȼ�����_2_175.lib")
extractAssets("�߲���ʯ.rc",getSdPath(), "�ȼ�_175.lib")
extractAssets("�߲���ʯ.rc",getSdPath(), "������_����_�ȼ�.lib")
extractAssets("�߲���ʯ.rc",getSdPath(), "����.lib")
extractAssets("�߲���ʯ.rc",getSdPath(),"��Ϣ-������.lib")
extractAssets("�߲���ʯ.rc",getSdPath(),"����ʶ��.lib")
extractAssets("�߲���ʯ.rc",getSdPath(),"Ч��.lib")
extractAssets("�߲���ʯ.rc",getSdPath(),"����.lib")
extractAssets("�߲���ʯ.rc",getSdPath(),"����ֵ.lib")
ʶ��X,ʶ��Y,����X,����Y,����X_2,����Y_2 = -1,-1,-1,-1,-1,-1
ʶ��={}
���� = {}
HUD = {��ʾID = createHUD(),ģʽID=createHUD()}
ͼ������ = ""
function HUD.�������(����,x,y)
	showHUD(createHUD(),����..x..","..y,8,"FFFF0000","",0,x,y,0,0,0,0,0,0)
end

function HUD.����(����)
	showHUD(HUD.ģʽID,����,10,"0xffff0000","0x99ffffff",0,0,0,0,0)
end

function HUD.��ʾ��Ϣ(����)
	showHUD(HUD.��ʾID,"״̬:"..����,11,"0xFFFF80C0","0x5581FED2",2,0,0,0,0)
end

function �쳣��ʾ(����)
	while (true) do
		HUD.��ʾ��Ϣ(����)
	end
end

function ��ͼ���ڴ�(��Χ)
	if (��Χ[3]-��Χ[1]) * (��Χ[4]-��Χ[2]) > 2500 then
		releaseCapture()
		keepCapture()
		return true
	end
	return false
end
function ʶ��.��ɫ(...) -- ��׼: ��Χ����,��ɫ,���ƶ�
	local t = ...
	local ��Χ = {}
	local ��ɫ,���ƶ�
	if #t == 3 and type(t[1]) == "table" then
		��Χ = {t[1][1],t[1][2],t[1][3],t[1][4]}
		��ɫ,���ƶ� = t[2],t[3]
	elseif #t == 6 and type(t[1]) == "number" then
		��Χ,��ɫ,���ƶ� = {t[1],t[2],t[3],t[4]},t[5],t[6]
	else
		print("��Χ��ɫ�����쳣 - 1")
		print(t)
		�쳣��ʾ("�쳣-��Χ��ɫ�����쳣-��ϵ����")
	end
	local ��ͼ = ��ͼ���ڴ�(��Χ)
	local ret,x,y
	ret,x,y = findColor(��Χ[1],��Χ[2],��Χ[3],��Χ[4],��ɫ,0,���ƶ�)
	if ��ͼ then  releaseCapture()end
	if x ~= 0 then
		ʶ��X,ʶ��Y = x,y
		return true
	end
	ʶ��X,ʶ��Y = -1,-1
	return false
end

function ʶ��.ͼ��ʶ��(...)	 -- ��׼ :��Χ����,�ֿ���,����������,��ֵ������,���ƶ�,���,�߶�
	local temp ={...}
	local ��Χ={}
	local ��ֵ����,�ֿ�,����,���ƶ�,��,��
	local ��һ = false
	if type(temp[1]) == "table" and #temp == 5 then
		��Χ = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		�ֿ� = temp[2]
		���� = temp[3]
		��ֵ���� = temp[4]
		���ƶ� = temp[5]
	elseif type(temp[1])  == "number" and #temp == 8 then
		��Χ = {temp[1],temp[2],temp[3],temp[4]}
		�ֿ� = temp[5]
		���� = temp[6]
		��ֵ���� = temp[7]
		���ƶ� = temp[8]
	elseif type(temp[1]) == "table" and #temp == 7 then
		��Χ = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		�ֿ� = temp[2]
		���� = temp[3]
		��ֵ���� = temp[4]
		���ƶ� = temp[5]
		��,��=temp[6],temp[7]
		��һ = true
	elseif type(temp[1])  == "number" and #temp == 9 then
		��Χ = {temp[1],temp[2],temp[3],temp[4]}
		�ֿ� = temp[5]
		���� = temp[6]
		��ֵ���� = temp[7]
		���ƶ� = temp[8]
		��,��=temp[9],temp[10]
		��һ = true
	else
		print("ͼ��ʶ�ֺ����쳣-1")
		print(temp)
		�쳣��ʾ("�쳣-ͼ��ʶ�ֺ���-��ϵ����")
	end
	
	TURING.��Դ_��ȡ��Ļ����(��Χ[1],��Χ[2],��Χ[3],��Χ[4])
	TURING.�˾�_��ɫ_��ֵ��(��ֵ����)
	TURING.�и�_��ͨ�����и�(true)
	if ��һ  then
		TURING.�˾�_ͨ��_���Ź�һ��(��,��)
	end
	if ���� == nil then
		if TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .."/" ..�ֿ� ..".lib") == 0 then
			print("�쳣1-�ֿ�ʧЧ-��ϵ����")
			print(temp)
			�쳣��ʾ("�쳣1-�ֿ�ʧЧ-��ϵ����")
			return false
		end
	else
		if TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .."/" ..�ֿ� ..".lib",����) ==0  then
			print("�쳣2-�ֿ�ʧЧ-��ϵ����")
			print(temp)
			�쳣��ʾ("�쳣2-�ֿ�ʧЧ-��ϵ����")
			return false
		end
	end
	local ʶ���� = TURING.ʶ��(���ƶ� * 100,1)
	local ���,���2
	if ʶ���� ~= nil and ʶ���� ~= "" then
		��� = splitStr(ʶ����,"|")
		if ��� and next(���) ~= nil then
			for i=1,#���,2 do
				���2 = splitStr(���[i+1],",")
				--[===[for j=1,#���2,2 do
				print("����: "..���[i].." ����: " .. ���2[j]+��Χ[1]..","..���2[j+1]+��Χ[2])
				end]===]
			end
			if ���2 and next(���2) ~= nil then
				ʶ��X = ���2[1]+��Χ[1]
				ʶ��Y = ���2[2]+��Χ[2]
				ͼ������ = ���[1]
				return true
			end
		end
	end
	ͼ������=""
	return false
end

function ʶ��.����(...)  -- ��׼:��Χ,�ֿ���,���ּ���ɫ����,���ƶ�,����ж�0/1
	local temp ={...}
	local ��Χ ={}
	local �ֿ���,����,��ɫ,���ƶ�,�Ƿ���
	local ����ֵ = false
	if type(temp[1]=="table") and #temp == 5 then
		��Χ = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		�ֿ���,����,��ɫ,���ƶ�,����ж� = temp[2]..".txt",temp[3][1],temp[3][2],temp[4],temp[5]
	elseif type(temp[1]=="number") and #temp == 8 then
		��Χ={temp[1],temp[2],temp[3],temp[4]}
		�ֿ���,����,��ɫ,���ƶ�,����ж� = temp[5]..".txt",temp[6][1],temp[6][2],temp[7],temp[8]
	else
		print("�쳣-���ֺ���-��ϵ����")
		print(temp)
		�쳣��ʾ("�쳣-���ֺ���-��ϵ����")
	end
	if 0 == setDict(0,�ֿ���) then print("�쳣 - �ֿ�����ʧ��") end
	if 0 == useDict(0) then print("�쳣 - �ֿ����ʧ��") end
	local ��ͼ = ��ͼ���ڴ�(��Χ)
	local ret,x,y = findStr(��Χ[1],��Χ[2],��Χ[3],��Χ[4],����,��ɫ,���ƶ�)
	if ��ͼ then  releaseCapture()end
	if x >= 0 then
		ʶ��X = x
		ʶ��Y = y
		if �Ƿ��� == 1 then
			tap(x,y)
			sleep(200)
		end
		����ֵ = true
	end
	return ����ֵ
end

function ʶ��.ʶͼ(...) -- ��׼: ���鷶Χ,ͼƬ��,���ƶ�,����ж�0/1
	local ����ֵ  = false
	local temp = {...}
	local ��Χ = {}
	local ͼ��,���ƶ�,���
	if type(temp[1]) == "table" and #temp == 4 then
		��Χ={temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		ͼ��=temp[2]
		���ƶ� = temp[3]
		��� = temp[4]
	elseif type(temp[1]) == "number" and #temp == 7 then
		��Χ={temp[1],temp[2],temp[3],temp[4]}
		ͼ�� = temp[5]
		���ƶ� = temp[6]
		��� = temp[7]
	else
		print("�쳣- �β�����"..type(temp[1]).." ����: "..#temp)
		print("�쳣-ʶͼ����-��ϵ����")
		print(temp)
		�쳣��ʾ("�쳣-ʶͼ����-��ϵ����")
	end
	local ��ͼ = ��ͼ���ڴ�(��Χ)
	local ret,x,y = findPic(��Χ[1],��Χ[2],��Χ[3],��Χ[4],ͼ��..".png","101010",0,���ƶ�)
	if ��ͼ then  releaseCapture()end
	if x > -1 then
		ʶ��X = x
		ʶ��Y = y
		if ��� ==  1 then
			tap (x,y)
			sleep(200)
		end
		����ֵ = true
	end
	return  ����ֵ
end

-- ʶ�𳡵��ϵĿ��
-- ���ʶ�𲻵��򣬹��޿򱻿�Ƭ�ڵ�ס�ˣ���ô�����λ�þʹ��ڹ���
-- false - ����
-- true - ������
function ʶ��.�����ɫ(...) -- ��׼ ��Χ,��ɫ����,����,���ƶ�
	local ����ֵ = false
	local temp= {...}
	local ��Χ = {}
	local ��ɫ����={}
	local ����,���ƶ�
	if type(temp[1]) == "table" and #temp == 4 then
		��Χ = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		��ɫ���� ={temp[2][1],temp[2][2]}
		���� = temp[3]
		���ƶ� = temp[4]
	elseif type(temp[1]) == "number" and #temp == 7 then
		��Χ = {temp[1],temp[2],temp[3],temp[4]}
		��ɫ���� = {temp[5][1],temp[5][2]}
		���� = temp[6]
		���ƶ� = temp[7]
	else
    print("�쳣-���������ɫ-��ϵ����")
    print(temp)
		�쳣��ʾ("�쳣-���������ɫ-��ϵ����")
	end
	local ��ͼ = ��ͼ���ڴ�(��Χ)
	local x,y = findMultiColor(��Χ[1],��Χ[2],��Χ[3],��Χ[4],��ɫ����[1],��ɫ����[2],����,���ƶ�)
  if ��ͼ then 
		releaseCapture()
	end
	if x > -1 then
		ʶ��X = x
		ʶ��Y = y
		����ֵ = true
	end
	return ����ֵ
end

function ����.��ɫ���ƶ�(��ɫ1,��ɫ2)
	local r1,g1,b1 = colorToRGB(��ɫ1)
	local r2,g2,b2 = colorToRGB(��ɫ2)
	local r3 = r1-r2
	local g3 = g1-g2
	local b3 = b1 - b2
	local ���ƶ� = 1-math.sqrt(r3*r3+g3*g3+b3*b3)/math.sqrt(255*255+255*255+255*255)
	print("��׼�����ƶ� : "..���ƶ�)
	local �ݲ�ֵ = math.floor(255 * (1-���ƶ�) * 3)
	print("�ݲ�ֵ: "..�ݲ�ֵ)
end

function ����.����ת����(hm)
	return math.floor(hm/60000)
end

function ��������()
	local ռ�� = collectgarbage("count")/1024
	collectgarbage("collect")
	print("��������: ",ռ��-collectgarbage("count")/1024,"M")
end

function jsonתtable(json)
	return jsonLib.decode(json)
end

function tableתjson(table)
	return jsonLib.encode(table)
end

function �ֱ��ʵ���()
	local w,h = getDisplaySize()
	local dpi =getDisplaySize()
	if w ~= 720 and h ~= 1280 and dpi_1 ~= 320 then
		local str = "�밴ָʾ�����ֱ���: "
		if w > 720 then
			str = str .."��Ļ��ȼ�: ".. 720-w .."\r"
		elseif w < 720 then
			str = str .."��Ļ��ȼ�: ".. w-720 .."\r"
		end
		
		if h > 1280 then
			str = str .."��Ļ�߶ȼ�: ".. 1280-h .."\r"
		elseif h < 1280 then
			str = str .."��Ļ�߶ȼ�: ".. h-1280 .."\r"
		end
		
		if dpi > 320 then
			str = str .."DIP ��: ".. 320-dpi
		elseif dpi < 320 then
			str = str .."DIP ��: ".. dpi-320
		end
		while(true) do
			toast(str,0,0,12)
			sleep(1000)
		end
	end
	print("�ֱ���ͨ��")
end

writeLog("ϵͳ�����������...")
