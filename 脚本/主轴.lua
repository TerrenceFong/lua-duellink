require("�������������")
require("�Խ��ݽ���")
require("puxiu(1)")
local DDMControl = require("DDMControlV2")
while true do
	local ��ʼ����� = DDMControl.��ʼ��(
		"api.privateapi.xyz",
		"9000",
		"de6d43dbbdf84b74a981bb560b3b94e0",
		"038277bf-9513-4727-bc9d-2a7bfa60e035",
		""
	)
	print(��ʼ�����)
	if ��ʼ����� == true then
		break
	end
end

setStopCallBack(function(error)
	if error then
		writeLog("�ű��쳣������!!!")
		writeLog(error)
		print(error)
	end

	writeLog("�����˳��ű�-�ű����н��: ��ʱ��:", math.floor(tickCount()/60000) ," ���� " ," �ܾ���: " , ʵ��.���� , " Ч��: " , string.format("%.2f",tickCount()/60000/ʵ��.����) ," ��/�� ", "ʤ��: " , ʵ��.ʤ��/ʵ��.����*100 ,"%")
	snapShot("sdcard/��ʯ/�����˳���ͼ.png",0,0,720,1280)
	if �쳣ID ~= nil then
		stopThread(�쳣ID)
	end
	if ����ID ~= nil then
		stopThread(����ID)
	end
	
	if ������ID ~= nil then
		stopThread(������ID)
	end
--[===[	if ��¼���["code"] == 0 then
		��������(����)
	end]===]
end)
�����ſ��� = true
�״��л���ɫ = true
·��ǿ�ƿ��� = false
�������� = false

�Ծ� = {}
function  ·��()
	local ��ҳ����=0
	if ʵ��.�״�·�˿��� and UI_in.·�˿��� then
		print("·�� - �״�����")
		ʵ��.�״�·�˿��� = false
	elseif UI_in.·�˿��� and ·��ǿ�ƿ���  then
		print("·�� - ������ģʽ")
	elseif UI_in.·�˿��� and �ж�.·������()==false then
		print("·�� - ʱ��δ��")
		return
	elseif UI_in.·�˿��� == false  then
		print("·�� - �ر�״̬")
		return
	end
	�������.����������()
	
	while(��ҳ���� < 8 ) do
		if ������.������() and ������.·�˿�ˢ() == false and (UI_in.�����鿪�� == false or UI_in.��������� < 1) then
			print("·�� - ���.")
			return
		elseif ������.������() and ������.·�˿�ˢ() == false and UI_in.�����鿪�� and UI_in.��������� > 0 then
			print(" ·�� - ʹ�þ�����")
			�������.ʹ�þ�����()
			return
		end

		if ������.������() and ������.·��() then
			if ������.�Ի�() then
				local time = tickCount()
				while(true) do
					HUD.��ʾ��Ϣ("·�� - �Ի���")
					if tickCount() - time > 5000 then
						print("'������ - ·�� - �Ի��У�������ֵ��ֱ���˳�ѭ��")
						break
					end
					if ������.·��_�Զ�����() then
						local x,y = ʶ��X,ʶ��Y
						�������.·���л�����()
						tap (x,y)
						HUD.��ʾ��Ϣ("·�� - �Ծ�")
						print('������ - ·�� - �Ի��� - �Ծ�')
						���㴦��.·��()
						break
					end
					�������.����հ�(100)
					�������.�Ի����()
					if ʶ��.ʶͼ(299,419,342,456,"·��-ѡ����",0.8,0) then
						tap(199,805)
						sleep(200)
					end
					if ʶ��.ʶͼ(303,444,339,479,"·��-�Ѷ�ѡ��",0.8,0) then
						tap(480,632)
						sleep(200)
					end
				end
			else
				HUD.��ʾ��Ϣ("��·�˶Ի�����-����������")
				�������.����������()
				�������.�����淭ҳ()
				��ҳ���� = ��ҳ���� + 1
			end
		else
			if ������.������() == false then
				�������.����������()
			end
			�������.�����淭ҳ()
			��ҳ���� = ��ҳ���� + 1
		end

		-- ���״���
		if ������.·��_�Զ�����() then
			local x,y = ʶ��X,ʶ��Y
			�������.·���л�����()
			tap (x,y)
			HUD.��ʾ��Ϣ("·�� - �Ծ�")
			print('·��_�Զ����� - �Ծ�')
			���㴦��.·��()
		end
	end
end

function ��ȡ�ű�����()
	local arr ={}
	local temp = splitStr(��������arr["����-����"],",")
	for i,v in ipairs(temp) do
		arr[i]= splitStr(v,"-")
	end
	local result= {}
	for i=1,#arr do
		result[i*2-1] = math.tointeger(arr[i][1])
		result[i*2] = math.tointeger(arr[i][2])
		if arr[i][2] == nil then
			return {}
		end
	end
	return result
end

function �Ծ�.����()
	print("���� -- ����")
	�������� = true
	while (true) do
		�Ծ�.�����ж�����()
		�Ծ�.����ս������()
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then
				print("�Ծֽ���")
				�������� = false
				return
			end
		end
	end
end

function �Ծ�.Ĭ��()
	while (true) do
		�Ծ�.Ĭ��_�ж�����()
		�Ծ�.Ĭ��_ս������()
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then
				print("�Ծֽ���")
				return
			end
		end
	end
end

function �Ծ�.Ĭ��_�ж�����()
	if ���ڼ��.�ж�����() then
		print("Ĭ��_�ж����� ����")
		��ȷ.���޿�()
		
		if UI_in.��������  then
			����.��������()
		end
		
		if UI_in.���ܿ��� then
			����.��������()
		end
		
		if UI_in.��Ч���� then
			����.�����ڳ���Ч()
		end
		
		if UI_in.ħ�ݿ���  then
			����.����ħ��()
		end
		
		��ȷ.ħ����()
		
		if UI_in.���ؿ��� then
			����.��������()
		end
		
		��ȷ.���忨()
		
		if UI_in.����Ϊ�� then
			����.����Ϊ��()
		end
		
		if UI_in.Ĺ�ؿ��� then
			
			����.����ĹЧ()
		end
		
		if ���ڼ��.�ҷ�����() ~= 0 and ����.���з���() == false then
			print("����ս���׶�")
			���ڲ���.�����ж�����(1)
		else
			print("ֱ�ӽ����غ�")
			���ڲ���.�����ж�����(0)
		end
	end
end

function �Ծ�.Ĭ��_ս������()
	if ���ڼ��.ս������() then
		print("Ĭ��_ս������ ѡ��")
		if UI_in.������ʽ == 0 then
			print("Ĭ�Ϲ���")
			���ڲ���.����Ĭ�Ϲ���()
		elseif UI_in.������ʽ == 1 then
			print("ֱ�ӹ���")
			���ڲ���.����ֱ�ӹ���()
		elseif UI_in.������ʽ == 2 then
			print("���ܹ���")
			���ڲ���.���ܹ���()
		end
		���ڲ���.����ս������()
	end
end

function �Ծ�.�׸�()
	while(true) do
		if ���ڼ��.�ж�����() then
			����.����ħ��()
			��ȷ.ħ����_��ɱ()
			��ȷ.���忨()
			���ڲ���.�����ж�����(0)
		end
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then  return end
		end
	end
end

function �Ծ�.PVP�Զ���()
	while (true) do
		if ���ڼ��.�ж�����() then
			for i=1,8 do
				if ���ڵȴ�() == 2 then return end
				���ڲ���.�ж�����(math.tointeger(PVParr["�ж�"..i]))
			end
			if ���ڼ��.�ҷ�����() ~= 0 and ����.���з���() == false then
				���ڲ���.�����ж�����(1)
			else
				���ڲ���.�����ж�����(0)
			end
		end
		
		if ���ڼ��.ս������() then
			for i=1,4 do
				if ���ڵȴ�() == 2 then return end
				���ڲ���.ս������(math.tointeger(PVParr["ս��"..i]))
			end
			���ڲ���.����ս������()
		end
		
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then  return end
		end
	end
end

function �Ծ�.PVE�Զ���()
	while (true) do
		if ���ڼ��.�ж�����() then
			for i=1,8 do
				if ���ڵȴ�() == 2 then return end
				���ڲ���.�ж�����(math.tointeger(PVEarr["�ж�"..i]))
			end
			if ���ڼ��.�ҷ�����() ~= 0 then
				���ڲ���.�����ж�����(1)
			else
				���ڲ���.�����ж�����(0)
			end
		end
		
		if ���ڼ��.ս������() then
			for i=1,4 do
				if ���ڵȴ�() == 2 then return end
				���ڲ���.ս������(math.tointeger(PVEarr["ս��"..i]))
			end
			���ڲ���.����ս������()
		end
		
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then  return end
		end
	end
end

function �Ծ�.PVP����()
	local ���� =  math.tointeger(��������arr["����-PVP����"])
	if ���� == 0 then
		�Ծ�.Ĭ��()
	elseif ���� == 1 then
		�Ծ�.�׸�()
	elseif ���� == 2 then
		--�����
	elseif ���� == 3 then
		�Ծ�.����()
	elseif ���� == 4 then
		--����
	elseif ���� == 5 then
		�Ծ�.����()
		--����
	elseif ���� == 6 then
		�Ծ�.PVP�Զ���()
	end
end

function �Ծ�.PVE����()
	local ���� =  math.tointeger(��������arr["����-PVE����"])
	if ���� == 0 then
		�Ծ�.Ĭ��()
	elseif ���� == 1 then
		--�����
	elseif ���� == 2 then
		�Ծ�.����()
	elseif ���� == 3 then
		--����
	elseif ���� == 4 then
		�Ծ�.����()
		--����
	elseif ���� == 5 then
		�Ծ�.PVE�Զ���()
	end
end

function �Ծ�.����(ѡ��) -- 0 PVE 1 PVP
	local ��ʼʱ�� = tickCount()
	HUD.��ʾ��Ϣ("�ȴ�ƥ����...")
	while (true) do
		if ���ڼ��.����() then
			print("��ʼ�Ծ�...")
			break
		end
		if ������.���о���()  then
			tap(ʶ��X,ʶ��Y)
			sleep(100)
		end
		if ������.��������() then
			tap(ʶ��X,ʶ��Y)
			sleep(100)
		end
		if tickCount() - ��ʼʱ�� >  60000  then
			print("���س�ʱ�������ζԾ�")
			�������.����������()
			return
		end
		�������.����հ�(100)
	end
	if ѡ�� == 0 then
		�Ծ�.PVE����()
	elseif ѡ�� == 1 then
		�Ծ�.PVP����()
	end
end

function ��������()
	--[===[	
		writeLog("��¼��ʽ: ",UI_in.��¼��ʽ,"����:",��¼��ʵ��arr["����-����"])
		if UI_in.��¼��ʽ==1 then
			���� = ��¼��ʵ��arr["����-����"]
			if ���ܵ�¼(����) then
				����ID = beginThread(��������,����,1)
				if ����ID == nil then
					toast("��������ʧ��",0,0,15)
					exitScript()
				else
					toast(��¼���["result"]["card_type"],"ʣ��ʱ��:",��¼���["result"]["expires"],0,0,15)
					writeLog(��¼���["result"]["card_type"] .. " ʣ��ʱ��:",��¼���["result"]["expires"])
					sleep(2000)
				end
			else
				toast("����:",��¼���["message"],0,0,15)
				sleep(2000)
			end
		else
			if ���õ�¼() then
				����ID = beginThread(��������,1)
				if ����ID == nil then
					toast("��������ʧ��",0,0,12)
					exitScript()
				else
					toast("ʣ��ʱ��:",��¼���["result"]["expires"],0,0,15)
					writeLog("ʣ��ʱ��: ".. ��¼���["result"]["expires"])
					sleep(2000)
				end
			else
				toast("����:",��¼���["message"],0,0,15)
				sleep(2000)
			end
		end
	]===]
	
	DDMControl.�ƿ�_�����ƿ�ϵͳ()
	local ��ȡ�豸���ֽ��=DDMControl.�ƿ�_��ȡ�豸����()
	print(��ȡ�豸���ֽ��)
	DDMControl.�ƿ�_�ϴ�������־(��ȡ�豸���ֽ��)

	�ֱ��ʵ���()
	������.������ȼ�()
	
	�쳣ID = beginThread(�쳣�����߳�)
	if UI_in.����������  then
		������ID = beginThread(�������߳�)
	end
	
	if UI_in.·�˿��� then
		·��()
	end
	::one::
	local ���� = ��ȡ�ű�����()
	for i=1,#����/2 do
		ģʽ����  = ����[2*i]
		��ǰģʽ = ����[i*2-1]
		while (ģʽ����>0) do
			if ��ǰģʽ == 1 then
				HUD.����("������ ʣ��/"..ģʽ����)
				������()
			elseif ��ǰģʽ == 2 then
				HUD.����("� ʣ��/"..ģʽ����)
				�()
			elseif ��ǰģʽ == 3 then
				HUD.����("���� ʣ��/"..ģʽ����)
				����()
			elseif ��ǰģʽ == 4 then
				HUD.����("���� ʣ��/"..ģʽ����)
				����()
			end
			ģʽ���� = ģʽ���� - 1
		end
	end
	if UI_in.�������ѡ�� == 0 then
		writeLog("���һ���������¿�ʼ")
		goto one
	elseif UI_in.�������ѡ�� == 1 then
		HUD.��ʾ��Ϣ("��ѭ��·����")
		writeLog("��ѭ��·��")
		UI_in.·�˿��� = true
		while(true) do
			·��()
		end
	else
		writeLog("�ر���Ϸ���ű�")
		stopApp(��Ϸ����)
		exitScript()
	end
end

function ������()
	if �����ſ��� == false then
		return
	end
	if ������.������() then
		·��()
	end
	�������.���봫����()
	if �������.������׼��() == false then
		return
	else
		�Ծ�.����(0)
	end
	���㴦��.������()
end

function ����()
	if ������.���о���() == false then
		�������.��������()
	end
	
	if ������.���о���() then
		·��()
		if ������.���о���() then
			tap (ʶ��X,ʶ��Y)
			�Ծ�.����(1)
		else
			�������.��������()
		end
		local time  = tickCount()
		while (������.���о���() == false) do
			���㴦��.����()
			if tickCount() - time > 50000 then
				�������.����������()
				return
			end
		end
	end
end

function ����()
	if ������.��������() == false then
		�������.��������()
	end
	if ������.��������() then
		·��()
		if ������.��������() then
			tap(ʶ��X,ʶ��Y)
			�Ծ�.����(1)
		else
			�������.��������()
		end
		local time  = tickCount()
		while (������.��������() == false) do
			���㴦��.����()
			if tickCount() - time > 50000 then
				�������.����������()
				return
			end
		end
	end
end

function �()
	if UI_in.� == 1 then
		���ӻ()
	elseif UI_in.�==2 then
		��ӽ�����()
	elseif UI_in.�==3 then
		RAIDULE�()
	end
end

function RAIDULE�()
	�������.����("RAIDDUEL")
	local ��Ԯ���ɫ = {"D5FFB8","13|0|D5FFB8|30|0|D5FFB8|59|0|D5FFB8|91|0|D7FFBC|91|13|87FF36|69|13|88FD3B|40|14|84FF31|28|14|84FF31|19|14|84FF31|5|14|84FF31"}
	local �Զ�������ɫ = {"FFE993","-11|0|FDE792|13|0|F5E08D|27|0|FFEB96|38|0|FFEB96|48|0|FFEB96|67|0|FFEC97|84|0|FFEC97|114|0|FFEB96|127|0|FFEB96|127|29|FFA827"}
	local ��һ����ɫ = {"FFFFFF","0|4|662807|25|0|FFFFFF|25|4|662807|47|5|612607|47|9|F0EEED|61|1|712C07|69|2|FFFFFF|77|2|FFFFFF|91|2|6D2C07|77|19|FFFFFF"}
	while (true) do
		if ������.�����("RAIDDUEL") then
			HUD.��ʾ��Ϣ("RAIDDUEL �� ... ")
			if ʶ��.�����ɫ(310,400,312,1120,��Ԯ���ɫ,0,0.9) then
				tap(ʶ��X,ʶ��Y)
				sleep(200)
			else
				swipe(609,1180,609,800,100)
				sleep(2000)
			end
		end
		if ʶ��.�����ɫ(465,1086,494,1110,�Զ�������ɫ,0,0.9) then
			tap(ʶ��X,ʶ��Y)
			sleep(200)
		end
		
		if ʶ��.�����ɫ(314,1202,316,1204,��һ����ɫ,0,0.9) or ʶ��.�����ɫ(313,1208,315,1210,��һ����ɫ,0,0.9) then
			tap(ʶ��X,ʶ��Y)
			sleep(200)
		end
		�������.����_��()
		�������.����_��������()
		�������.����_��������()
		�������.�Ի����()
		�������.����հ�(200)
		if ������.������()then
			RAIDULE�()
		end
		if ������.��������()  then
			�������.����������()
		end
	end
end

function ���ӻ()
	UI_in.ʹ����Ʒ = true
	local  ʹ����Ʒ= function()
		if UI_in.����_ʹ����Ʒ  then
			while(������.�����("���ӻ")) do
				tap(532,1104)
				sleep(2000)
			end
			local ��Χ = {{375,406,409,444},{375,562,410,595},{374,715,410,751},{380,863,420,909}}
			for i=1,4 do
				::one::if ʶ��.ʶͼ(��Χ[i],"���ӻ-ʹ��-2",0.7,1) then
					tap (ʶ��X,ʶ��Y)
					sleep(500)
					if ʶ��.ʶͼ(251,239,297,279,"���ӻ-ʹ����Ʒ����",0.8,0) then
						if i< 4 then
							i=i+1
							goto one
						else
							break
						end
						break
					end
					sleep(1000)
					while(������.�����("���ӻ")) do
						HUD.��ʾ��Ϣ("�ȴ�...")
						sleep(500)
					end
					return true
				end
			end
			return false
		end
	end
	�������.����("���ӻ")
	while (true) do
		HUD.��ʾ��Ϣ("���ӻ")
		::one::
		if ������.�����("���ӻ")  and ʶ��.ʶͼ(484,911,548,972,"���ӻ-�޵���",0.8,0) == false then
			tap (524,938) -- ���������
			sleep(500)
		end
		
		if ʶ��.ʶͼ(300,442,340,482,"�Ѷ�ѡ��",0.8,0) then
			tap(647,612)
			sleep(100)
		end
		
		if ʶ��.ʶͼ(464,1091,496,1133,"���ӻ-�Զ�����",0.8,1) then
			sleep(100)
			tap(ʶ��X,ʶ��Y)
			sleep(2000)
			local time = tickCount()
			while(ʶ��.ʶͼ(464,1091,496,1133,"���ӻ-�Զ�����",0.8,1)) do
				sleep(2000)
				if tickCount() - time > 20000 then
					break
				end
			end
			
			local time = tickCount()
			while(���ڼ��.����() == false) do
				sleep(500)
				if tickCount() -time > 20000 then
					break
				end
			end
			local time = tickCount()
			while (true) do
				if ������.�����("���ӻ") then
					snapShot("sdcard/��ʯ/test.png",0,0,720,1280)
					break
				end
				if ���ڼ��.����() == false and ������.�����("���ӻ")==false then
					�������.����_��()
					�������.����_��������()
					�������.����_��������()
					�������.�Ի����()
					ʶ��.ʶͼ(481,727,522,768,"���ӻ-ȷ��",0.8,1)
				end
				���ڲ���.����հ�(200)
				
				if tickCount() - time > 5*60000 then
					print("���ӻ-�Ծֳ�ʱ")
					�������.����������()
					�������.����("���ӻ")
					goto one
					return
				end
			end
			if UI_in.ʹ����Ʒ and ʶ��.ʶͼ(484,911,548,972,"���ӻ-�޵���",0.8,0)then
				print("ʹ����Ʒ")
				if ʹ����Ʒ() == false then
					print("�޵����� �����")
					�������.����������()
					return
				end
			else
				return
			end
		end
		
		if UI_in.ʹ����Ʒ and ʶ��.ʶͼ(484,911,548,972,"���ӻ-�޵���",0.8,0) then
			print("ʹ����Ʒ")
			if ʹ����Ʒ() == false then
				print("�޵����� �����")
				�������.����������()
				return
			end
		end
		
		if ������.������() then
			print("��⵽���������½���")
			�������.����("���ӻ")
		end
		
		if ������.��������() then
			print("��⵽��������")
			�������.����������()
			�������.����("���ӻ")
		end
		
		ʶ��.ʶͼ(477,707,518,743,"���ӻ-ȷ��-2",0.8,1)
		
		ʶ��.ʶͼ(479,844,516,883,"���ӻ-ȷ��-2",0.8,1)
		
		�������.�Ի����()
		
		�������.����հ�(100)
	end
end

function ��ӽ�����()
	
	local ��ɫ_��Ӿ��� = {"60C1FF","0|7|2CADFF|9|9|1DA7FF|24|9|1DA7FF|33|9|1DA7FF|57|9|1DA7FF|73|9|1DA7FF|92|9|1DA7FF|102|2|4CB9FF|119|5|35B0FF|119|10|0E99F2"}
	local ��ɫ_��һ�� = {"712C07","11|-1|FFFFFF|32|-1|FFFFFF|75|0|FFFFFF|84|0|FFFFFF|94|0|FFFFFF|103|0|712C07|84|18|FFFFFF|52|9|FFFFFF|20|22|FFFFFF|43|26|923909"}
	local ��ɫ_����� = {"FFFFFF","19|0|E2DBD7|37|0|D6CECA|74|1|D4CFCD|108|5|FFFFFF|108|11|FFFFFF|108|16|FFFFFF|108|21|FFFFFF|71|21|FFFFFF|40|21|FFFFFF|8|21|FFFFFF"}
	local ��ɫ_��Ʒ���� = {"FFFFFF","245|0|E7E7E7|279|0|E4E4E4|299|-18|ECECEC|217|-26|808080|191|-26|808080|156|-26|808080|119|-26|808080|92|-26|808080|67|-26|808080|36|-64|868686"}
	local ��ɫ_�������� = {"141AA3","39|1|FFFFFF|66|1|FFFFFF|92|1|FFFFFF|115|1|FFFFFF|150|1|1A1A8F|150|33|8F8F8F|88|33|EEEEEE|68|33|D4CFD4|42|33|A0A1A1|20|33|8F8F8F"}
	local ��ɫ_ARC�� = {"B4BBBB","70|-1|B0B0B0|50|-1|BAB0B0|98|-1|9F9F9F|128|-1|999292|109|41|22222F|86|24|383445|60|24|383440|32|24|222633|1|24|69616F|22|40|222232"}
	local ��ɫ_zexal�� = {"DBDBD5","22|0|CCCCCC|71|0|B4B4B4|104|0|9A9A9A|104|50|222233|85|36|222233|65|37|2C2233|30|37|3E3B4C|9|37|151525|10|57|20202D|101|57|1D2122"}
	local ��ɫ_5DS�� = {"494453","23|0|67676A|48|0|514754|66|2|2D2738|66|28|B3B3B5|59|33|5C5C5D|57|40|272737|36|40|161626|13|40|333338|-2|40|594E5E|-11|40|6A6A7A"}
	local ��ɫ_GX�� = {"1A1822","-18|0|848489|-17|14|5A5A64|-17|19|B4B8B8|-17|24|625462|-17|43|2B2B2C|7|43|1C1C26|22|24|322735|14|3|22222F|39|3|22222D|35|46|222230"}
	local ��ɫ_DM�� = {"322C33","16|0|181219|28|4|302B39|47|4|3A3F45|77|4|2D2D35|75|51|A8A8A8|46|51|BBBAB9|24|51|D6D5D1|8|51|D9CDCD|-5|51|DDDDD9|-20|51|DDDDDD"}
	local ��ɫ_��Ӿ���2 = {"E6F5FF","13|0|DEECF5|36|0|E4F3FD|80|0|E6F5FF|116|0|E6F5FF|117|24|2CADFF|89|24|32B0FF|54|24|32B0FF|21|24|32B0FF|10|24|32B0FF|-4|25|2BADFF"}
	local ���� = ��������arr["����-����"] + 1
	
	local ѡ������ =  function ()
		if ʶ��.�����ɫ(305,1221,307,1223,��ɫ_�����,0,0.9) then
			if ���� == 1 then
				swipe(460,300,460,900,100) -- �ϻ�
				sleep(1000)
				if ʶ��.�����ɫ(264,377,266,379,��ɫ_ARC��,0,0.9)  then
					tap(ʶ��X,ʶ��Y)
				elseif ʶ��.�����ɫ(269,619,271,621,��ɫ_zexal��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				elseif ʶ��.�����ɫ(272,874,274,876,��ɫ_5DS��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				else
					swipe(460,900,460,300,100)  -- �»�
					sleep(2000)
					if ʶ��.�����ɫ(320,614,322,616,��ɫ_GX��,0,0.9) then
						tap(ʶ��X,ʶ��Y)
					elseif ʶ��.�����ɫ(279,855,281,857,��ɫ_DM��,0,0.9) then
						tap(ʶ��X,ʶ��Y)
					end
				end
			elseif ���� <= 3 then
				swipe(460,900,460,300,100)  -- �»�
				sleep(1000)
				if ���� == 2 and  ʶ��.�����ɫ(279,855,281,857,��ɫ_DM��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				elseif ���� == 3 and ʶ��.�����ɫ(320,614,322,616,��ɫ_GX��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				end
			elseif ���� > 3 then
				swipe(460,300,460,900,100) -- �ϻ�
				sleep(1000)
				if ���� == 4 and ʶ��.�����ɫ(272,874,274,876,��ɫ_5DS��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				elseif ���� == 5 and ʶ��.�����ɫ(269,619,271,621,��ɫ_zexal��,0,0.9)  then
					tap(ʶ��X,ʶ��Y)
				elseif ���� == 6 and ʶ��.�����ɫ(264,377,266,379,��ɫ_ARC��,0,0.9) then
					tap(ʶ��X,ʶ��Y)
				end
			end
			sleep(2000)
		end
	end
	
	if ������.�����("��ӽ�����") == false then
		�������.����("��ӽ�����")
	end
	
	if ʶ��.�����ɫ(36,297,38,299,��ɫ_��������,0,0.9) then
		tap (ʶ��X,ʶ��Y)
		sleep(2000)
		local time = tickCount()
		while (true) do
			if ʶ��.�����ɫ(305,1221,307,1223,��ɫ_�����,0,0.9)  then
				break
			end
			if tickCount() - time > 5000 then
				�������.����("��ӽ�����")
			end
		end
		ѡ������()
	end
	
	while (true) do
		HUD.��ʾ��Ϣ("��ӽ������� ... ")
		if ������.�����("��ӽ�����") then
			if ʶ��.�����ɫ(296,878,298,880,��ɫ_��Ӿ���,0,0.9) or ʶ��.�����ɫ(298,891,300,893,��ɫ_��Ӿ���2,0,0.9)  then
				tap (ʶ��X,ʶ��Y)
				sleep(200)
			end
		end
		
		if ʶ��.ʶͼ(302,410,343,443,"�Ѷ�ѡ��",0.8,0) then
			tap (652,591)
			sleep(200)
		end
		ѡ������()
		�������.����_��()
		�������.����_��������()
		�������.����_��������()
		�������.�Ի����()
		if ʶ��.�����ɫ(307,1203,309,1205,��ɫ_��һ��,0,0.9) then
			tap(ʶ��X,ʶ��Y)
			sleep(200)
		end
		
		if ʶ��.�����ɫ(219,907,221,909,��ɫ_��Ʒ����,0,0.9) then
			print("��Ʒ�����˳��")
			�������.����������()
			return
		end
		
		ʶ��.ʶͼ(463,1089,499,1136,"���ӻ-�Զ�����",0.8,1)
		
		�������.����հ�(200)
	end
	
end

function �쳣�����߳�()
	print("�쳣�����߳�����")
	local �쳣X,�쳣Y = -1,-1
	function �쳣ʶͼ(...) -- ��׼: ���鷶Χ,ͼƬ��,���ƶ�,����ж�0/1
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
		keepCapture()
		local ret,x,y = findPic(��Χ[1],��Χ[2],��Χ[3],��Χ[4],ͼ��..".png","101010",0,���ƶ�)
		if x > -1 then
			�쳣X = x
			�쳣Y = y
			if ��� ==  1 then
				tap (x,y)
				sleep(200)
			end
			����ֵ = true
		end
		releaseCapture()
		return  ����ֵ
	end
	while(true) do
		if �쳣ʶͼ(��Χ.������,"��������",0.8,0) == false and �쳣ʶͼ(��Χ.���ڼ��,"���ڼ��1.png|���ڼ��2.png|���ڼ��3",0.8,0) == false then
			if �쳣ʶͼ(477,746,511,785,"����",0.8,0) then
				���������ж� = false
				sleep(100)
				if UI_in.����ѡ�� == 0 then
					tap(502,771)
					print("�쳣-����-����")
				else
					tap(202,762)
					print("�쳣-����-����")
				end
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(324,783,365,822,"����-2",0.8,0) then
				���������ж� =false
				sleep(100)
				tap(357,797)
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(471,693,515,737,"����-2",0.8,0) then
				���������ж� = false
				sleep(100)
				if UI_in.����ѡ�� == 0 then
					tap(503,715)
					print("�쳣-û��������-����")
				else
					tap(212,711)
					print("�쳣-û��������-����")
				end
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(168,678,214,723,"δ��ɶԾ�_����",0.8,0)then
				���������ж� = false
				sleep(100)
				tap(�쳣X,�쳣Y)
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(296, 705, 420, 794,"����",0.98,0) then
				���������ж� = false
				sleep(100)
				print("�쳣-������������")
				tap(204,701)
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(256, 774, 309, 825,"��ʼ��Ϸ_��",0.9,0)then
				���������ж� = false
				sleep(100)
				print("�쳣-��ʼ��Ϸ")
				tap(�쳣X,�쳣Y)
				sleep(500)
				���������ж� = true
			end
			
			if �쳣ʶͼ(281, 587, 323, 628,"ͨѶ�쳣_ͨ",0.9,0) then
				���������ж� = false
				sleep(100)
				tap(357, 704)
				sleep(500)
				print("�쳣_ͨѶ�쳣")
				���������ж� = true
			end
			
			if �쳣ʶͼ(4,54,45,92,"֪ͨ",0.95,0) then
				���������ж� = false
				sleep(100)
				tap(57,1234)
				sleep(500)
				print("�쳣_֪ͨ����")
				���������ж� = true
			end
			
			if �쳣ʶͼ(205,762,236,798,"�ݲ���װ",0.9,0) then
				���������ж� = false
				sleep(100)
				tap (272,778)
				sleep(500)
				print("ģ����-ȡ����װ")
				���������ж� = true
			end
			
			if �쳣ʶͼ(532,1065,610,1135,"�Ծֿ����ж�",0.9,0) then
				���������ж� = false
				sleep(100)
				stopApp(��Ϸ����)
				sleep(1000)
				runApp(��Ϸ����)
				���������ж� = true
			end
            
			if �쳣ʶͼ(286,575,288,579,"���Ӵ���",0.8,0) then
				���������ж� = false
				sleep(100)
				tap (360,713)
				sleep(500)
				print("�쳣-���Ӵ���")
				���������ж� = true
			end
            
		elseif �쳣ʶͼ(��Χ.���ڼ��,"���ڼ��2.png|���ڼ��3",0.8,0) then
			if �쳣ʶͼ(286,575,288,579,"���Ӵ���",0.8,0) then
				���������ж� = false
				sleep(100)
				tap (360,713)
				sleep(500)
				print("�쳣-���Ӵ���")
				���������ж� = true
			end
		end
		sleep(5000)
	end
end

function �������߳�()
	print("�����������߳�")
	while(true) do
		local count = ʵ��.����
		local i =1
		for i=1,UI_in.������ʱ�� do
			sleep(60000)
		end
		if count == ʵ��.���� and i == UI_in.������ʱ�� then
			snapShot("sdcard/��ʯ/�쳣������ͼ.png",0,0,720,1280)
			sleep(500)
			writeLog("��������")
			���������ж� = false
			stopApp(��Ϸ����)
			sleep(1000)
			runApp(��Ϸ����)
			���������ж� = true
		end
	end
end

function �л���ɫ(...)
	-- 50,300,90,520
	-- 50,520,90,700
	-- 50,700,90,880
	-- 50,880,90,1060
	local ���� = function()
		swipe(5,1054,5,440,1000)
		sleep(3000)
	end
	t = ...
	if UI_in.�л���ɫ���� == false then
		return
	end
	
	if ������.���ƿ������() == false then
		�������.���븴�ƿ������()
	end
	
	local ��������ҳ = function ()
		if �״��л���ɫ then
			HUD.��ʾ��Ϣ("�״��л���ɫ,��������ҳ..")
			local time = tickCount()
			while(true) do
				snapShot(�ļ�·��.."test.png",23,318,112,343)
				swipe(5,440,5,1054,100)
				sleep(3000)
				if ʶ��.ʶͼ(23,318,112,343,�ļ�·��.."test",0.95,0) then
					if ������.���ƿ������() then
						�״��л���ɫ = false
						�л���ɫ({50,300,90,520})
						return true
					else
						�������.����������()
						�л���ɫ({50,300,90,520})
						return true
					end
				end
				
				if tickCount() - time > 3* 60000 then
					print("��������ҳ��ʱ")
					�������.����������()
					�л���ɫ({50,300,90,520})
					return true
				end
			end
		else
			return false
		end
	end
	HUD.��ʾ��Ϣ("Ѱ�Һ��ʵȼ���ɫ...")
	if ������.�ȼ�_��(t) then
		local x,y = ʶ��X,ʶ��Y
		tap(0,ʶ��Y)
		sleep(200)
		if UI_in.�ȼ� < ������.����_�ȼ�({ʶ��X,ʶ��Y,ʶ��X+80,ʶ��Y+30}) then
			local y1,y2 = t[4],t[4]+180
			if y1 < 881 and y2 < 1061 then
				print("��һ��")
				�л���ɫ({t[1],y1,t[3],y2})
			else
				if ��������ҳ() == false then
					print("���¿�ʼ")
					����()
					�л���ɫ({50,300,90,520})
				end
			end
		else
			HUD.��ʾ��Ϣ("�ҵ���..��ʼ�л���ɫ..")
			�������.�л���ɫ(230,y+60)
		end
	else
		if t[4] + 180 < 1061 then
			print("��һ��")
			�л���ɫ({t[1],t[4],t[3],t[4]+180})
			return
		else
			if ��������ҳ() == false then
				print("���¿�ʼ")
				����()
				�л���ɫ({50,300,90,520})
			end
		end
		
		if ������.���ƿ������() then
			snapShot(�ļ�·��.."test.png",16,326,119,362)
			����()
			if ʶ��.ʶͼ(16,326,119,362,�ļ�·��.."test",0.95,0) then
				print("û������ȼ���ɫ�������� ����������")
				if UI_in.�ȼ�flag  then
					�����ſ��� = false
				end
				����.����������()
				return
			else
				�л���ɫ({50,300,90,520})
			end
		else
			print(1)
		end
	end
end

function �Ծ�.�����ж�����()
	if ���ڼ��.�ж�����() and ���ڵȴ�() == 1 then
		
		sleep(200)
		
		����.�Ծֳ�ʼ��()
		
		if UI_in.Ĺ�ؿ��� then
			����.����ĹЧ()
		end
		
		print("ʹ�ñ���")
		����.ʹ�ñ���()
		
		print("�����ǰ���")
		����.�����ǰ���()
		
		print("ʹ��ħ����")
		��ȷ.ħ����()
		
		if UI_in.����Ϊ�� then
			����.����Ϊ��()
		end
		
		local �ҷ����� = ���ڼ��.�ҷ�����()
		if ����.����1_9�ǹ���("8") > 0  and �ҷ�����< 3 then   -- ���ϴ���8�ǹ���
			print("����8�ǹ���ͨ�� ��ʿ �� ��ʯ")
			����.ͨ����ʿ()
			����.ͨ�ٰ�ʯ(1)
			����.ͨ����Ů()
			
			if ����.����ͨ�� and ����.ͨ�ٵ� == false  then
				print("����-ͨ���ٻ�����")
				��ȷ.���޿�()
			end
			
		elseif ����.����1_9�ǹ���("1")> 0 and �ҷ�����< 3 then -- ���ϴ���1�ǹ���
			print("���� 1�� ���� ������ʿЧ�� ͨ�ٰ�ʯ �� ��ʿ")
			if ����.������ʿЧ��() then
				print("��ʿЧ�������ɹ�")
				����.ͨ�ٰ�ʯ(1)
				����.ͨ����Ů()
				����.ͨ����ʿ()
			else
				print("��ʿЧ������ʧ��")
				����.ͨ����Ů()
				����.ͨ�ٰ�ʯ(1)
				����.ͨ����ʿ()
			end
			if ����.����ͨ�� and ����.ͨ�ٵ� == false  then
				print("����-ͨ���ٻ�����")
				��ȷ.���޿�()
			end
		else
			if ����.ͨ�ٵ� == false and �ҷ�����< 2 then
				print("δͨ�� ������ʯ ��ʿ ����")
				����.��ʯ��ʿ����()
				print("��ʿ: ",����.��ʿ��,"��ʯ: " ,����.��ʯ��)
				if ����.��ʯ�� > 0 and ����.��ʿ�� > 0 then
					print("�а�ʯ����ʿ ͨ�ٰ�ʯ����ʿ")
					����.ͨ�ٰ�ʯ(1)
					����.������ʿЧ��()
					
				elseif ����.��ʿ�� > 1 then
					print("������ʿ ͨ����ʿ����ʿЧ��")
					����.ͨ����ʿ()
					����.������ʿЧ��()
					
				elseif ����.��ʿ�� == 1 then
					print("ֻ��һ����ʿ �����ٻ���Ů")
					����.ͨ����Ů()
					����.ͨ����ʿ()
				elseif ����.��ʿ�� == 0  and ����.��ʯ�� > 0 then
					print("ֻ�а�ʯ �����ٻ���Ů")
					����.ͨ����Ů()
					����.ͨ�ٰ�ʯ(0)
					if ����.����ͨ�� and ����.ͨ�ٵ� == false then
						��ȷ.���޿�()
					end
				elseif ����.��ʿ�� == 0 and ����.��ʯ�� == 0 then
					print("��ʯ ��ʿ ȫ�� �ٻ���Ů")
					����.ͨ����Ů()
					if ����.����ͨ�� and  ����.ͨ�ٵ� == false then
						print("����-ͨ���ٻ�����")
						��ȷ.���޿�()
					end
				end
			else
				print("�������ٻ�")
			end
		end
		����.��������()
		����.���忨()
		
		if UI_in.Ĺ�ؿ��� then
			if ����.����ĹЧ() then
				print("����ĹЧ�ɹ�����һ���ǰ���")
				����.�����ǰ���()
			end
		end
		
		if ����.����1_9�ǹ���("8") > 0 and ����.����1_9�ǹ���("1") > 0 then
			print("1+8ͬ��")
			����.��������()
		end
		
		if ����.����1_9�ǹ���("8") > 1 then
			print("8+8�ں�")
			����.���������� =true
			����.��������()
			����.���������� = false
			if ����.ͨ�ٵ� == false and ����.����1_9�ǹ���("8") > 0 then
				print("���� 8�ǹ��޿�ͬ��")
				����.ͨ�ٰ�ʯ(1)
				����.ͨ����Ů()
				����.ͨ����ʿ()
				����.��������()
			end
		end
		
		if UI_in.���ܿ��� then
			if ����.��������() then
				print("��������")
				����.ʹ���ں�()
			end
		end
		
		if ����.����1_9�ǹ���("9") > 0 then
			����.�����ڳ���Ч()
		end
		
		if UI_in.����Ϊ�� then
			����.����Ϊ��()
		end
		
		if ���ڼ��.�ҷ�������() ~= 0 and ����.���з���() == false then
			���ڲ���.�����ж�����(1)
		else
			���ڲ���.�����ж�����(0)
		end
	end
end

function  �Ծ�.����ս������()
	if ���ڼ��.ս������() and ���ڵȴ�() == 1 then
		if ���ڼ��.�з�����() > 0 then
			����.ս�׼�������()
			����.���ܹ���()
		else
			���ڲ���.����Ĭ�Ϲ���()
		end
		
		
		���ڲ���.����ս������()
	end
end

function �Ծ�.����()
	print("���� -- ����")
	����.���� = true
	while (true) do
		�Ծ�.������Ҫ����()
		�Ծ�.����ս������()
		if ���ڵȴ�() == 2 then
			for i=1,10 do
				���ڲ���.����հ�(200)
			end
			if ���ڼ��.����() == false  then
				����.���� = false
				print("�Ծֽ���")
				return
			end
		end
	end
end

function �Ծ�.������Ҫ����()
	if ���ڼ��.�ж�����() and ���ڵȴ�()==1 then
		local ����Ч������ =  true
		����.ͨ�ٵ�,����.���ܿ���,����.����֮��Ч��,����.��Чǿ�ƿ���,����.ʿ��Ч�� = false,false,false,false,false
		����.�������()
		local ����flag = ����.����ڳ�����()
		if ���ڼ��.�ڳ�_����ħ��() == false then
			print("����-���ϲ����ڳ���ħ����")
			if ����.�������� >  0 then
				print("����-ʹ�û���֮��")
				����.ʹ�û���֮��()
				
				����.�������()
				if ����.�������� > 0 then
					����.ʹ������()
					����.�������()
					if ����.��������() then ����Ч������ = false end
				else
					if ����.��������() then
						����.�������()
						if ����.��������() then ����Ч������ = false end
					end
				end
				
			elseif ����.�������� > 0  then
				print("����-ʹ������")
				����.ʹ������()
				����.�������()
				if ����.��������() then ����Ч������ = false end
			elseif ����.�������� == 0 and ����.������ > 1 then
				print("����-��������")
				if ����.��������() then
					����.�������()
					if ����.��������() then ����Ч������ = false end
				end
			end
			
		else
			if ����flag == false and ����.�������� > 0 then
				����.ʹ������()
				����.�������()
				if ����.��������() then ����Ч������ = false end
			elseif ����flag == false then
				if ����.��������() then
					����.�������()
					if ����.��������() then ����Ч������ = false end
				end
			end
		end
		����.�������()
		local flag =  false
		���ڼ��.�з�������()
		for i=1,3 do
			if ʵ��.������[2][i] > 2300 then
				flag = true
				break
			end
		end
		
		if ����Ч������ then ����.��������() end
		
		if ����.ħ����ʿ���� > 0 and (���ڼ��.�ҷ�����() == 0 or flag) then
			print("����-���ƴ���ħ����ʿ")
			����.�ٻ�ħ����ʿ()
			if ����.ͨ�ٵ� then
				����.�����ڳ�������Ч��()
			end
		else
			if ����.��Դ���� > 0 then
				print("����-������ ħ����ʿ ������ԴЧ��")
				����.������ԴЧ��()
			else
				
				if ���ڼ��.�ҷ�����() == 0 then
					��ȷ.���޿�()
				end
			end
		end
		
		����.ʹ��ħ����()
		��ȷ.���忨()
		
		if ����.ʿ������ > 0 then
			local ���� = ����.ս��ʶ���ҹ���Ϣ()
			for i=1,3 do
				if ( ����[i][1] ==1 or ����[i][1] == 2 ) and ����[i][2] < 2600 then
					����.����ʿ��Ч��()
					break
				end
			end
		end
		
		if ���ڼ��.�ҷ�������() ~= 0 then
			���ڲ���.�����ж�����(1)
		else
			���ڲ���.�����ж�����(0)
		end
	end
end

function  �Ծ�.����ս������()
	if ���ڼ��.ս������() and ���ڵȴ�() == 1 then
		if ���ڼ��.�з�����() > 0 then
			����.���ܹ���()
		else
			���ڲ���.����Ĭ�Ϲ���()
		end
		
		
		if ����.ʿ������ >0 then
			if ���ڵȴ�() == 1 then
				sleep(1000)
			end
			if ���ڼ��.�з�����() == 0 and ���ڼ��.�з�����ֵ() <= 2600  then
				print("����-����ʿ��Ч��նɱ")
				����.����ʿ��Ч��()
				ս������_��ʼ��()
				���ڲ���.����Ĭ�Ϲ���()
			end
		end
		���ڲ���.����ս������()
	end
end

--sleep(3000)
local time = tickCount()
-- ��_����(��������,{nil})
DDMControl.�ű�_�쳣��������(��������, 3)
print("��ʱ:",tickCount() - time)

