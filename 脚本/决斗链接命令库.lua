require("ϵͳ�����")
require("������")
��� = {}
�ж� ={}
���㴦�� = {}
��ȷ = {}
Ч�� ={}
���� ={}
�������={}
���ڲ���={}
���ڼ��={}
������={}

���� = {
	ͨ�ٵ� = false,
	��ʿ�� = 0,
	��ʯ�� = 0,
	��ʯ���� = {-1, -1},
	��ʿ���� = {-1, -1},
	��Ů���� = {-1, -1},
	����Ƿ� = true,
	����ͨ�� = �ַ���ת����(��������arr["��ѡ-����-ͨ��"]),
	�������� = false,
	���������� = false
}

���� = {
	���� = false,
	ͨ�ٵ� = false,
	���ܿ��� = false,
	ħ����ʿ���� = 0,
	�������� = 0,
	ʿ������ = 0,
	�������� = 0,
	�������� = 0,
	��Դ���� = 0,
	������ = 0,
	��֮������ = 0,
	ħ����ʿ���� = false,
	�������� = false,
	ʿ������ = false,
	��Դ���� = false,
	���翪�� = false,
	ħ����ʿ���� = {-1, -1},
	����֮��Ч�� = false,
	��Чǿ�ƿ��� = false,
	ʿ��Ч�� = false
}

function ���ڼ��.�з�����ֵ()
	TURING.��Դ_��ȡ��Ļ����(45,86,216,198)
	TURING.�˾�_��ɫ_��ֵ��("0-205")
	TURING.�и�_��ͨ�����и�(true)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/����ֵ.lib")
	local ʶ���� = TURING.ʶ��(85)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		return  math.tointeger(ʶ����)
	end
	return -1
end

function ���ڼ��.�з�����()
	local ��ɫ_t = {"AA9999","0|3|AA9999|0|9|AA9999|0|15|A89998|4|15|AC9B9B|10|15|AA9999|14|15|AA9999|18|15|AA9999|23|15|AA9999|27|15|AA9999|32|15|AA9999"}
	return ʶ��.�����ɫ(581,517,583,519,��ɫ_t,0,0.9) == false
end

function ʶ������(...) -- ��,�±�,��ɫ����,���ƶ�
	local t = {...}
	local temp ={}
	if t[1] ==  7 then
		temp = ��Χ.����ʶ��_7
	elseif t[1] == 6 then
		temp = ��Χ.����ʶ��_6
	elseif t[1] == 5 then
		temp = ��Χ.����ʶ��_5
	elseif t[1] == 4 then
		temp = ��Χ.����ʶ��_4
	elseif t[1] == 3 then
		temp = ��Χ.����ʶ��_3
	elseif t[1] == 2 then
		temp = ��Χ.����ʶ��_2
	elseif t[1] == 1 then
		temp = ��Χ.����ʶ��_1
	end
	
	if #t == 4 then
		for i=t[2],t[1] do
			for j, v in ipairs(t[3]) do
				if ʶ��.�����ɫ(temp[i],v,0,t[4]) then
					����X,����Y = ʶ��X,ʶ��Y
					return i
				end
			end
		end
	elseif #t == 5 then
		for i=t[2],t[1] do
			for j=1,7 do
				if ʶ��.�����ɫ(temp[i],t[3][j],0,t[5]) or ʶ��.�����ɫ(temp[i],t[4][j],0,t[5]) then
					����X,����Y = ʶ��X,ʶ��Y
					return i
				end
			end
		end
	end
	return -1
end

function ���ڼ��.��������()
	local time = tickCount()
	while(true) do
		for j=7,1,-1 do
			if ʶ��.�����ɫ(��Χ.��������_1[j],��ɫ.��������_1[j],0,0.9) or ʶ��.�����ɫ(��Χ.��������_2[j],��ɫ.��������_2[j],0,0.9) then
				return j
			end
		end
		if tickCount() - time > 500 then
			print("������")
			break
		end
	end
	return 0
end

function �������.ʹ�þ�����()
	�������.����������()
	sleep(1000)
	HUD.��ʾ��Ϣ("ʹ�þ�����")
	local time = tickCount()
	while(true) do -- ������Ʒ����
		if ʶ��.ʶͼ(338,69,370,100,"��Ʒ����",0.8,0) then
			sleep(500)
			break
		else
			tap(38,79)
			sleep(1000)
		end
		if tickCount() - time > 30000 then
			print("����-ʹ�þ�����-���泬ʱ...")
			�������.����������()
			�������.ʹ�þ�����()
			return
		end
		
	end
	if ʶ��.ʶͼ(366,350,506,397,"������-ʹ��",0.8,1) and UI_in.��������� > 0 then
		sleep(2000)
		local time = tickCount()
		while(true) do
			if ʶ��.ʶͼ(485,691,519,724,"������-ȷ��",0.8,1) then
				UI_in.��������� = UI_in.��������� - 1
				print("������ ʣ�����:" , UI_in.��������� )
				local time_2 = tickCount()
				while (true) do
					if ʶ��.ʶͼ(342,704,377,738,"������-��",0.8,1) then
						sleep(2000)
						break
					end
					if tickCount() - time_2 > 20000 then
						�������.����������()
						break
					end
				end
				·��ǿ�ƿ��� = true
				·��()
			end
			if tickCount() -  time > 20000 then
				print("ʹ�þ�����-��ʱ...")
				�������.����������()
				�������.ʹ�þ�����()
				return
			end
		end
	else
		·��ǿ�ƿ���  = false
	end
	print("ʹ�þ��������")
end

function ������.������ȼ�()
	if UI_in.�л���ɫ����  == false and ������.������()== false then
		return
	end
	local �ȼ� =0
	if ʶ��.ʶͼ(661,1161,693,1192,"����-2",0.8,0) then
		print("����")
		�л���ɫ({50,300,90,520})
		return
	end
	
	TURING.��Դ_��ȡ��Ļ����(625,1109,705,1176)
	TURING.�˾�_��ɫ_��ֵ��("0-240")
	TURING.�и�_��ͨ�����и�(true)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/������_����_�ȼ�.lib")
	local ʶ���� = TURING.ʶ��(80,1)
	if ʶ���� ~= nil and ʶ���� ~= "" then    -- ע�⣺��ֵ�ж�
		local temp = splitStr(ʶ����,"|")
		print("������.������ȼ�")
		print(temp)
		if temp and next(temp) ~= nil then
			�ȼ� = math.tointeger(temp[1])
		else
			�ȼ� = 0
		end
	else
		�ȼ� = 0
	end

	if UI_in.�ȼ� < �ȼ�  then
		print("�л���ɫ")
		�л���ɫ({50,300,90,520})
	end
end

function ������.����ȼ�()
	if UI_in.�л���ɫ����  == false then
		return
	end
	local �ȼ� = 0
	if ʶ��.ʶͼ(581,496,616,536,"����",0.8,0) then
		print("����")
		�л���ɫ({50,300,90,520})
		return
	end
	if ʶ��.����(��Χ.����_��������,"���㴦��",�ֿ�.����_��������,0.9,0) == false  then
		for i=1,5 do
			�������.����հ�(200)
		end
	end
	TURING.��Դ_��ȡ��Ļ����(432,493,657,629)
	TURING.�˾�_��ɫ_��ֵ��("0-240")
	TURING.�и�_��ͨ�����и�(true)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/������_����_�ȼ�.lib")
	local ʶ���� = TURING.ʶ��(80,1)
	if ʶ���� ~= nil and ʶ���� ~= "" then    -- ע�⣺��ֵ�ж�
		local temp = splitStr(ʶ����,"|")
		if temp and next(temp) ~= nil then
			�ȼ� = math.tointeger(temp[1])
		else
			�ȼ� =  0
		end
	else
		�ȼ� =  0
	end
	if UI_in.�ȼ� < �ȼ�  then
		print("�л���ɫ")
		�л���ɫ({50,300,90,520})
	end
end

function �������.�л���ɫ(x,y)
	sleep(1000)
	tap(x,y)
	sleep(1000)
	local time = tickCount()
	while (true) do
		if ʶ��.ʶͼ(415,590,448,623,"�Ƿ���Ľ�ɫ",0.8,0) then
			tap (515,700)
			sleep(2000)
			�������.����������()
			return
		end
		
		ʶ��.ʶͼ(340,1214,379,1251,"�л���ɫ-��",0.8,1)
		
		ʶ��.ʶͼ(328,1216,361,1251,"�л���ɫ-����",0.8,1)
		
		if tickCount() - time > 2*60000 then
			print("�л���ɫ-����-ʧ��")
			�������.����������()
			�л���ɫ({50,300,90,520})
			return
		end
	end
end

function ������.����_�ȼ�(...)
	local t = ...
	TURING.��Դ_��ȡ��Ļ����(t[1],t[2],t[3],t[4])
	TURING.�˾�_��ɫ_��ֵ��("0-175")
	TURING.�и�_��ͨ�����и�(true)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/�ȼ�_175.lib")
	local ʶ���� = TURING.ʶ��(80,1)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		local temp =splitStr(ʶ����,"|")
		if temp and next(temp) ~= nil then
			print("�ȼ�: ",temp[1])
			return math.tointeger(temp[1])
		end
	end
	print("�ȼ�: ",45)
	return 45
end

function ������.���ƿ������()
	return ʶ��.ʶͼ(412,127,440,158,"ѡ��Ŀ�꿨��",0.8,0)
end

function �������.���븴�ƿ������()
	�������.����������()
	HUD.��ʾ��Ϣ("�����л���ɫ����")
	local time = tickCount()
	while ( true) do
		if ������.���ƿ������() then
			break
		end
		
		if ������.������() then
			tap (467,1119)
			sleep(1000)
			tap (390,1021)
			sleep(500)
		end
		
		ʶ��.ʶͼ(422,1216,449,1249,"���ƿ��鰴ť",0.8,1)
		
		if ʶ��.ʶͼ(52,480,83,520,"���ƿ��鷽ʽ",0.8,0) then
			tap(508,792)
			sleep(200)
		end
		
		if tickCount() - time > 60000  then
			�������.���븴�ƿ������()
		end
	end
	sleep(2000)
end

function ������.�ȼ�_��(...)
	t = ...
	return ʶ��.ͼ��ʶ��(t,"�ȼ�����_2_175","��","0-150",0.8)
end

function ������.�������()
	-- local ��ɫ_t = {"1B5E33","13|0|125921|37|0|0C722E|50|0|00CCFF|85|0|00CCFF|143|5|00CCFF|193|5|00CCFF|243|5|00CCFF|243|41|05A408|194|42|05A408|136|63|05A408"}
	local ��ɫ_t = {"1A652E", "14|-8|29672D|28|96|13AE17|-8|99|40CE44|8|43|003012|29|13|002309|3|82|0AA70D"}
	return ʶ��.�����ɫ(5, 300, 53, 1200, ��ɫ_t, 0, 0.9)
end

function ������.�������()
	-- local ��ɫ_t = {"241604","23|0|D4FF27|52|0|D4FF27|79|-1|C9EF24|129|16|D4FF27|207|16|D4FF27|296|16|D4FF27|289|73|FE0000|153|82|000000|115|83|FF0000|25|93|FF0000"}
	local ��ɫ_t = {"FF0000","-12|-82|291C02|9|-83|432E07|-15|25|FF4100|3|21|FF0000|7|-33|5E4D1D|-9|-66|281A01"}
	return ʶ��.�����ɫ(5, 100, 50, 1200, ��ɫ_t, 0, 0.9)
end

function ���ڼ��.�з���������()
	return ʶ��.ʶͼ(475,66,501,92,"�з������׶�",0.8,0)
end

function ���ڼ��.�з��غ�()
	return ʶ��.ʶͼ(391,65,415,90,"�Է��غ�",0.8,0)
end

function ���ڼ��.ħ��()
	local count = 0
	for i,var in ipairs(��Χ.�ڳ�ħ��) do
		if ʶ��.�����ɫ(var[1],��ɫ.�ڳ�ħ��[i*2-1],0,0.9) and ʶ��.�����ɫ(var[2],��ɫ.�ڳ�ħ��[i*2],0,0.9) then
			count=count+1
		end
	end
	return count
end

function ���ڼ��.�з�ħ��()
	local count = 0
	local ��Χ_t = {
	{190,266,192,268},
	{322,266,324,268},
	{451,310,453,312}
	}
	local ��ɫ_t = {
	{"9E9D9D","-3|0|A69F9F|-3|3|A39999|-3|7|A29796|-4|10|A59D9D|-4|14|A69E9E|-4|18|A79E9E|-4|22|A69C9C|-4|26|A39998|-4|30|A19796|-5|37|A69E9E"},
	{"9E9D9C","-3|0|A79F9E|-4|4|A59D9D|-4|10|A69D9D|-4|16|A69D9D|-4|21|A69E9E|-4|28|A69E9E|-4|38|A79E9E|-4|45|A79E9E|-4|53|A69D9C|-4|81|A39898"},
	{"A69E9E","-1|-44|A69E9E|-1|-40|A69E9E|-1|-35|A69D9D|-1|-30|A59D9D|-1|-25|A89D9B|0|-19|A49A98|0|-12|A69C9B|0|-6|A79E9E|0|0|A69E9E|0|9|A69D9D"},
	}
	for i=1,3 do
		if ʶ��.�����ɫ(��Χ_t[i],��ɫ_t[i],0,0.9) == false then
			count = count + 1
		end
	end
	return count
end

function ���ڼ��.�з�����()
	local count = 0
	for i=1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��")  then
			count  = count  + 1
		end
	end
	return count
end

function ���ڼ��.�ҷ�����()
	local count = 0
	for i = 1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��") then
			count = count + 1
		end
	end
	print("���ڼ��.�ҷ�����: ", count)
	return count
end

function ���ڼ��.�ҷ�������()
	local count=0
	for i=1,3  do
		if ���ڼ��.����ʶ��("����",i,"��") then
			count = count +1
		end
	end
	return count
end

function ���ڼ��.����ʶ��(��ʾ,��Χ���,����) -- ��׼: ��ʾ: ���� ��Χ��� ����
	local ��Χ_�й�  = {{180,409,182,411},{317,419,319,421},{454,416,456,418}}
	local ��ɫ_�й� = {
		{"A79F9D","0|5|A69D9D|0|9|A69E9E|0|14|A69D9D|0|18|A49B9A|-1|36|A79E9E|83|36|A8A097|83|39|A8A097|83|43|A8A097|83|47|A8A097|83|52|A9A097"},
		{"A69D9C","0|6|A69D9C|0|14|A59B9B|0|20|A59B9A|0|25|A39A99|0|33|A29998|84|33|A9A097|84|28|A9A198|84|23|AAA198|84|17|AAA198|84|10|ABA198"},
		{"A39999","0|6|A49B9B|0|13|A69D9C|0|21|A79E9E|0|28|A69D9D|0|37|A59D9D|85|37|A9A197|85|42|A8A097|85|47|A8A097|85|51|A8A097|86|56|AAA096"},
	}
	local ��Χ_�ҹ� = {{168,679,170,681},{314,678,316,680},{459,678,461,680}}
	local ��ɫ_�ҹ� = {
		{"ABA197","0|6|A8A097|0|12|A8A097|0|19|AA9F93|0|23|AD9D8D|-1|29|A8A097|89|29|A59D9D|89|36|A79C9B|89|42|AD9795|88|48|A69C9C|88|56|A79E9E"},
		{"A8A097","0|7|A8A097|0|15|A8A097|0|23|A8A097|0|31|A79C93|0|39|A79890|89|39|A69C9C|89|46|A59B9B|89|52|A49A9A|89|61|A39899|90|73|A59D9D"},
		{"A99F96","0|7|ABA095|0|15|ADA094|1|21|A8A097|1|28|A8A097|1|35|A8A097|91|35|A69E9E|91|42|A69D9C|92|52|A59D9D|92|60|A79E9E|92|69|A49B9A"},
	}
	if ���� == "��" then
		if ʶ��.�����ɫ(��Χ_�ҹ�[��Χ���],��ɫ_�ҹ�[��Χ���],0,0.9) == false then
			if ��ʾ == "����" then
				if ʶ��.ͼ��ʶ��(��Χ.�ҷ���������[��Χ���],"����ʶ��","����",��ɫ.����ʶ��,0.8) then
					return true
				end
			elseif ��ʾ == "����" then
				if ʶ��.ͼ��ʶ��(��Χ.�ҷ���������[��Χ���],"����ʶ��","�ع�",��ɫ.����ʶ��,0.8) then
					return true
				end
			elseif ��ʾ == nil  then
				return true
			end
		end
	elseif ���� == "��" then
		if ʶ��.�����ɫ(��Χ_�й�[��Χ���],��ɫ_�й�[��Χ���],0,0.9) == false then
			if ��ʾ == "����" then
				if ʶ��.ͼ��ʶ��(��Χ.�з���������[��Χ���],"����ʶ��","����",��ɫ.����ʶ��,0.8) then
					return true
				end
			elseif ��ʾ == "����" then
				if ʶ��.ͼ��ʶ��(��Χ.�з���������[��Χ���],"����ʶ��","�ع�",��ɫ.����ʶ��,0.8) then
					return true
				end
			elseif ��ʾ == nil  then
				return true
			end
		end
	end
	return false
end

function ������.������()
	return ʶ��.ʶͼ(��Χ.������,"��������",0.8,0)
end

function ������.��������()
	return ʶ��.ʶͼ(26,57,61,106,"��-������",0.9,0)
end

function ������.����(���)
	if ��� == nil then
		for i, var in ipairs(��Χ.����) do
			if ʶ��.ͼ��ʶ��(var,"����_150",nil,150,0.8) then
				HUD.��ʾ��Ϣ("����--"..����.����[i])
				return i
			end
		end
		return 0
	else
		if ʶ��.ͼ��ʶ��(��Χ.����[���],"����_150",����.����[���],150,0.8) then
			HUD.��ʾ��Ϣ("����--"..����.����[���])
			return true
		end
	end
	
	return false
end

function ������.·��()
	HUD.��ʾ��Ϣ("ʶ��·��")
	local t = {}
	if ������.������() then
		t = ��Χ.·��ʶ��[������.����(nil)]
	else
		�������.����������()
		t = ��Χ.·��ʶ��[������.����(nil)]
	end

	if t ~= nil then
		for i, var in ipairs(��ɫ.������) do
			-- print("������.·�� ��ɫ.������")
			if ʶ��.�����ɫ(t,var,0,0.9) then
				tap (ʶ��X,ʶ��Y+15)
				local time = tickCount()
				while(true)  do
					if ������.�Ի�() then return true end
					if tickCount() - time > 10000 then
						return false
					end
					sleep(1000)
				end
			end
		end
		
		for i,var in ipairs(��ɫ.С��ñ) do
			-- print("������.·�� ��ɫ.С��ñ")
			if ʶ��.�����ɫ(t,var,0,0.9) then
				tap (ʶ��X,ʶ��Y+15)
				local time = tickCount()
				while(true)  do
					if ������.�Ի�() then return true end
					if tickCount() - time > 10000 then
						return false
					end
					sleep(1000)
				end
			end
		end
		
		for i,var in ipairs(��ɫ.��ͨ·��) do
			-- print("������.·�� ��ɫ.��ͨ·��")
			if ʶ��.�����ɫ(t,var,0,0.9) then
				tap (ʶ��X,ʶ��Y+15)
				local time = tickCount()
				while(true)  do
					if ������.�Ի�() then return true end
					if tickCount() - time > 10000 then
						return false
					end
					sleep(1000)
				end
			end
		end
	else
		return false
	end
end

function ������.�Ի�()
	return ʶ��.ʶͼ(670,938,706,971,"�Ի�",0.9,0)
end

function ������.·�˿�ˢ()
	return ʶ��.ʶͼ(99,54,127,78,"·��ʣ����",0.9,0)
end

function ������.�Ծ�ʤ��()
	return ʶ��.ʶͼ(1,266,26,289,"ʤ���ж�",0.9,0)
end

function ���ڼ��.����()
	return ʶ��.ʶͼ(��Χ.���ڼ��,"���ڼ��1.png|���ڼ��2.png|���ڼ��3",���ƶ�.����,0)
end

function ���ڼ��.�����ж�()
	return ʶ��.ʶͼ(60,285,61,286,"�����ж�",���ƶ�.�����ж�,0) and ʶ��.ʶͼ(264,577,266,579,"�ڴ��ظ�",0.9,0) == false
end

function ���ڼ��.װ��ħ��()
	return ʶ��.ʶͼ(370,305,405,342,"װ��ħ����_װ",0.8,0)
end

function ���ڼ��.����ħ��()
	return ʶ��.ʶͼ(330,307,331,308,"����ħ����",0.8,0)
end

function ���ڼ��.�ٹ�ħ��()
	return ʶ��.ʶͼ(371,306,404,339,"�ٹ�",0.8,0)
end

function ���ڼ��.�����޿�()
	return ʶ��.�����ɫ(107,976,115,984,��ɫ.�����޿�,0,0.9)
end

function ���ڼ��.�ڳ�_����ħ��()
	local ��Χ_t = {123,765,126,767}
	return ʶ��.�����ɫ(��Χ_t,��ɫ.����ħ��,0,0.9) == false
end

function ���ڼ��.Ĺ��()
	return ʶ��.�����ɫ(586,634,594,642,��ɫ.Ĺ��,0,0.9) == false
end

function ������.·��_�Զ�����()
	return ʶ��.ʶͼ(464,1089,494,1136,"·��_�Զ�����",0.8,0)
end

function ���ڼ��.ʶ�𹥻���(��Χ)--��׼:��Χ����
	TURING.��Դ_��ȡ��Ļ����(��Χ[1],��Χ[2],��Χ[3],��Χ[4])
	TURING.�˾�_��ɫ_��ֵ��("FFFFFF|7272FF|FFBA57|C2C2C2")
	TURING.�и�_��ΧͶӰ�и�(2,1)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/�������ֿ�.lib")
	local ʶ���� = TURING.ʶ��(85)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		return ʶ����
	else
		return 0
	end
end

function ���ڼ��.��Ϣ_��ֵ(Ŀ��) --�ַ���: ���� or ����
	if Ŀ�� == "����" then
		TURING.��Դ_��ȡ��Ļ����(371,308,447,339)
	elseif Ŀ�� == "����" then
		TURING.��Դ_��ȡ��Ļ����(573,309,648,338)
	end
	TURING.�˾�_��ɫ_��ֵ��("FFFFFF|FEFEFE|FFBA57|FEB957|7272FF|7272FE")
	TURING.�и�_��ͨ�����и�(true)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/��Ϣ-������.lib")
	local ʶ���� = TURING.ʶ��(85)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		local temp = splitStr(ʶ����,"|")
		if temp and next(temp) ~= nil then
			return math.tointeger(temp[1])
		end
	end
	return 0
end

function ���ڼ��.���Ϲ��޹�����()
	ʵ��.������={{-1,-1,-1},{-1,-1,-1}}
	for i=1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��") then
			ʵ��.������[1][i]=math.tointeger(���ڼ��.ʶ�𹥻���(��Χ.�ҷ�������[i]))
		end
		if ���ڼ��.����ʶ��(nil,i,"��") then
			ʵ��.������[2][i]=math.tointeger(���ڼ��.ʶ�𹥻���(��Χ.�з�������[i]))
		end
	end
end

function ���ڼ��.�з�������()
	ʵ��.������[2] = {-1,-1,-1}
	for i=1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��") then
			ʵ��.������[2][i]=math.tointeger(���ڼ��.ʶ�𹥻���(��Χ.�з�������[i]))
		end
	end
	return ʵ��.������[2]
end

function ���ڼ��.��()
	local ��ɫ_�� = {"F0AE8D","33|2|7AE6F6|63|2|DF9574|62|-28|217FA8|62|-54|316B70|30|-54|4A989D|-2|-54|327E82|13|-36|40BFDD|47|-36|1C819E|32|-47|194B66|33|-23|73BFE3"}
	return ʶ��.�����ɫ(590,502,592,504,��ɫ_��,0,0.9)
end

function ���ڼ��.�Կ�()
	local ��ɫ_t = {"F6F6F6","4|61|FFFFFF|4|74|F9F9F9|4|93|FFFFFF|-50|76|FFFFFF|4|113|FFFFFF|-55|51|FFFFFF|60|44|FFFFFF|61|55|FFFFFF|61|64|FFFFFF|57|77|FFFFFF"}
	return ʶ��.�����ɫ(0,826,720,828,��ɫ_t,0,0.9)
end

function ���ڼ��.�ж�����()
	return ʶ��.ʶͼ(473,64,500,91,"�ж�����_��",���ƶ�.�ж�����,0)
end

function ���ڼ��.ս������()
	return ʶ��.ʶͼ(474,63,500,91,"ս���׶�_ս",���ƶ�.ս������,0)
end

function ���ڼ��.��������()
	return ʶ��.ʶͼ(508,354,548,393,"��������",0.8,1)
end

function ���ڼ��.ս�����費�ɽ���()
	return ʶ��.ʶͼ(612,778,697,855,"ս�����ɽ���",0.8,0)
end

function ������.�����Ž���()
	return ʶ��.ʶͼ(8,56,39,89,"�����Ž���",0.8,0)
end

function ������.�����ű���()
	local ��Χ = {552,1218,579,1249}
	if ʶ��.ʶͼ(��Χ,"������1��",0.8,0) then
		return 1
	elseif ʶ��.ʶͼ(��Χ,"������2��",0.8,0) then
		return 2
	elseif ʶ��.ʶͼ(��Χ,"������3��",0.8,0) then
		return 3
	end
	return 0
end

function ������.�����ž���_1()
	return ʶ��.ʶͼ(317,1086,364,1134,"�����ž���-1",0.8,0)
end

function ������.���о���()
	return ʶ��.ʶͼ(317,382,367,430,"���о���_��",0.7,0)
end

function ������.��������()
	return ʶ��.ʶͼ(315,541,366,587,"��������_��",0.7,0)
end

function ���ڼ��.���ڵ���_1()
	local ��ɫ_����_1 = {
		{"BBAA53","5|0|B5A14F|10|0|AE9D4C|13|0|6D5113|17|0|AF9D4C|21|0|8E7D33|26|0|BBAA51|23|5|BBAA55|13|5|BB9B53|5|5|B5A14F|0|5|BBAA55"},
		{"BBAA52","5|0|B5A150|10|0|AE9D4B|17|0|AF9D4C|21|0|8E7D30|27|0|C0AA52|33|0|BBA346|33|5|A29043|26|5|A29040|15|5|A69541|4|5|A18F42"},
		{"9B8A3C","6|0|B5A14F|11|0|AE9D4C|18|0|AF9D4C|23|0|B5A450|29|0|A3903C|29|5|A19039|23|5|B5A350|14|5|AE904B|4|5|BBAA54|0|5|9B8A41"},
		{"BBAA55","2|0|BBAA55|5|0|B5A14F|10|0|AE9D4C|14|0|685520|17|0|AE9D4C|21|0|8E7D37|16|6|907F33|13|6|907833|5|6|856B28|-1|6|786426"},
		{"9B8A3E","6|0|B5A14F|11|0|AE9D4C|18|0|AF9D4C|22|0|8F7E32|29|0|A5903E|29|5|998732|17|5|B1A04D|6|5|A99445|3|5|AF9C4B|0|5|93813B"},
	}
	local ��Χ_t = {{517,323,519,325},{517,526,519,528},{516,296,518,298},{517,528,519,530},{516,403,518,405},{517,512,519,514},}
	for i,v in ipairs(��Χ_t) do
		for j,v_1 in ipairs(��ɫ_����_1) do
			if ʶ��.�����ɫ(v,v_1,0,0.9) then
				print("Ч��-����-1")
				return true
			end
		end
	end
	return false
end


function �ж�.·������() -- ������ ���� true
	if UI_in.·�˿��� and tickCount() - UI_in.��·ʱ�� >= ʵ��.��ʼ��·ʱ�� then
		ʵ��.��ʼ��·ʱ�� = tickCount()
		return true
	else
		HUD.��ʾ��Ϣ("·�˵���ʱ: "..����.����ת����(UI_in.��·ʱ�� + ʵ��.��ʼ��·ʱ�� - tickCount()).." ����")
	end
	return false
end

function ���㴦��.���˫��()
	if ʶ��.ʶͼ(267,407,294,432,"���-˫��",0.8,0) then
		if UI_in.���˫�� then
			tap (509,914)
		else
			tap(209,920)
		end
	end
end

function ���㴦��.����()
	HUD.��ʾ��Ϣ("����������..")
	local ��ɫ_��һ�� = {"6E2B07","5|0|FFFFFF|30|0|FFFFFF|32|11|7F3208|42|11|FFFFFF|62|11|FFFFFF|65|11|522006|76|10|FFFFFF|95|10|FFFFFF|100|10|7D3108|82|21|FFFFFF"}
	if ������.������() then
		������.������ȼ�()
		�������.��������()
		return
	end
	if ������.��������()== false and ������.�������() then
		sleep(500)
		tap(ʶ��X,ʶ��Y)
		sleep(500)
	end
	
	�������.����_��()
	
	if ���ڼ��.����() then
		�Ծ�.����(1)
	end
	
	if �������.����_��������() == false and �������.����_��������() == false then
		�������.����_��һ��()
	end
	ʶ��.ʶͼ(205, 1178, 517, 1256,"ͨ��_��һ��",0.9,1)
	if ʶ��.�����ɫ(309,128,311,1210,��ɫ_��һ��,0,0.9) then
		tap(ʶ��X,ʶ��Y)
		sleep(100)
	end
	if ������.��������() then
		�������.����������()
		�������.��������()
		return
	end
	�������.����հ�(300)
end

function ���㴦��.����()
	HUD.��ʾ��Ϣ("���н�����..")
	if ������.���о���() == false and ������.�������()  then
		tap(ʶ��X,ʶ��Y)
		sleep(1000)
	end
	
	�������.����_��()
	
	if ���ڼ��.����() then
		�Ծ�.����(1)
	end
	
	if �������.����_��������() == false and �������.����_��������() == false then
		���㴦��.���˫��()
		�������.����_��һ��()
	end
	
	if ������.������() then
		������.������ȼ�()
		�������.��������()
		return
	end
	
	if ������.��������() then
		�������.����������()
		�������.��������()
		return
	end
	
	�������.����հ�(300)
end

function ���㴦��.·��()
	local ��ʱ���� = false
	local ��ʼʱ�� =0
	while(������.������()== false) do
		if ��ʱ���� == false and ���ڼ��.����() then
			��ʱ���� = true
			HUD.��ʾ��Ϣ("·�� - �Ծ���")
		end
		if ��ʱ���� and ���ڼ��.����() == false then
			��ʼʱ�� = tickCount()
			��ʱ���� = false
			HUD.��ʾ��Ϣ("·�� - ������")
		end
		�������.����_��()
		if �������.����_��������() == false and �������.����_��������() == false then
			���㴦��.���˫��()
			�������.����_��һ��()
		end
		���ڲ���.����հ�(500)
		--ʶ��.ʶͼ(310,1210,407,1257,"·��_ȡ��",0.8,1)
		if ��ʼʱ�� ~= 0 and tickCount() - ��ʼʱ�� > 30000 then
			�������.����������()
			sleep(1000)
			return
		end
	end
	sleep(1000)
end

function ���㴦��.������()
	local ��ʼʱ��  = tickCount()
	HUD.��ʾ��Ϣ("�����Ž�����..")
	while (true) do
		
		if ������.������() then
			break
		end
		
		if tickCount() -��ʼʱ�� >  60000 then
			writeLog("�����Ž��㳬ʱ -- ����������")
			�������.����������()
			return
		end
		
		�������.����_��()
		
		if ������.�Ի�() then
			���ڲ���.����հ�(200)
		end
		
		if �������.����_��������() == false and �������.����_��������() == false then
			���㴦��.���˫��()
			�������.����_��һ��()
		end
		
		�������.����_��һ��()
		
		if ������.��������() then
			�������.����������()
			return
		end
		
		�������.����հ�(200)
	end
	sleep(500)
end

function �������.��������()
	�������.����������()
	HUD.��ʾ��Ϣ("��������...")
	local time = tickCount()
	while(������.��������() == false) do
		if ������.������() and ������.����(2) then
			tap (275,1238)
			sleep(500)
		elseif ������.������() and ������.����(2) == false then
			tap (275,1238)
			sleep(500)
			tap (275,1238)
			sleep(500)
		end
		if ������.�������() then
			sleep(500)
			tap(ʶ��X,ʶ��Y)
			for i=1,10 do
				sleep(500)
				if ������.��������() then
					return
				end
			end
		end
		if (tickCount() - time > 40000 or ������.��������() ) and ������.��������()==false then
			�������.����������()
			�������.��������()
			return
		end
	end
end

function �������.��������()
	�������.����������()
	HUD.��ʾ��Ϣ("��������...")
	local time =tickCount()
	while(������.���о���() == false) do
		if ������.������() and ������.����(2) then
			tap (275,1238)
			sleep(500)
		elseif ������.������() and ������.����(2) == false then
			tap (275,1238)
			sleep(500)
			tap (275,1238)
			sleep(500)
		end
		if ������.�������() then
			sleep(500)
			tap(ʶ��X,ʶ��Y)
			sleep(500)
		end
		if (tickCount() - time > 40000 or ������.��������() )  and ������.���о���() == false then
			�������.����������()
			�������.��������()
			return
		end
	end
end

function �������.������׼��()
	local ��ʼʱ�� = tickCount()
	while (true) do
		if ������.�����Ž���() then
			�������.ѡ�����ŵȼ�()
			if �������.������ѡ����() == false and �������.�����ŷ�ҳ()then
				print("ûԿ����")
				�������.����������()
				ģʽ���� = 0
				return false
			else
				tap (356,1113 )-- ����Ծ�
				sleep(1000)
				for i=1,20 do
					if ʶ��.ʶͼ(613, 956, 667, 1000, "������_��Ʒ",0.8,0) then
						sleep(500)
						tap (362,1107) -- �������
						break
					end
					�������.�Ի����()
					ʶ��.ʶͼ(473, 693, 522, 747, "������_����_ȷ��",0.8,1)
					���ڲ���.����հ�(500)
				end
				return true
			end
		else
			if tickCount() - ��ʼʱ�� >  10000 then
				�������.���봫����()
			end
		end
	end
end
function �������.������ѡ����()
	if ʶ��.ʶͼ(671,1198,707,1226,"�����ж�",0.9,0) == false then
		return false
	end
	if UI_in.�����ű��� ~= ������.�����ű���() then
		tap (600,1233) -- �л�����
		sleep(1000)
		if UI_in.�����ű��� == 1 then
			tap(172,817)
		elseif UI_in.�����ű��� == 2 then
			tap(156,922)
		elseif UI_in.�����ű��� == 3 then
			tap(209,1027)
		end
		sleep(1000)
		
		if ������.�����ž���_1() == false then
			tap (49,1233)
			sleep(1000)
			return false
		end
	end
	return true
end

function �������.�����ŷ�ҳ()
	if UI_in.���ͷ�ҳ then
		for i=1,8 do
			tap (701,615)
			sleep(1500)
			�������.ѡ�����ŵȼ�()
			if UI_in.�����ű��� == ������.�����ű���() then
				return false
			else
				if �������.������ѡ����() then
					return false
				end
			end
		end
	end
	return true
end

function ���ڲ���.���ܹ���()
	HUD.��ʾ��Ϣ("����-���ܹ���")
	
	if ���ڼ��.�з�����() == 0 then
		���ڲ���.����Ĭ�Ϲ���()
		return
	end
	
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	���ڼ��.���Ϲ��޹�����()
	
	if ʵ��.������[1][2] >= ʵ��.������[1][1] and ʵ��.������[1][2] >= ʵ��.������[1][3] and ʵ��.������[1][2] > 0 then
		���ڲ���.���ܹ���_2()
		
		if ʵ��.������[1][1] > 0 or ʵ��.������[1][3] > 0 then
			if ʵ��.������[1][1] >= ʵ��.������[1][3] then
				���ڲ���.���ܹ���_1()
				���ڲ���.���ܹ���_3()
			else
				���ڲ���.���ܹ���_3()
				���ڲ���.���ܹ���_1()
			end
		end
	elseif ʵ��.������[1][1] >= ʵ��.������[1][2] and ʵ��.������[1][1] >= ʵ��.������[1][3] and ʵ��.������[1][1] > 0 then
		���ڲ���.���ܹ���_1()
		
		if ʵ��.������[1][2] > 0 or ʵ��.������[1][3] > 0 then
			if ʵ��.������[1][2] >= ʵ��.������[1][3] then
				���ڲ���.���ܹ���_2()
				���ڲ���.���ܹ���_3()
			else
				���ڲ���.���ܹ���_3()
				���ڲ���.���ܹ���_1()
			end
		end
	elseif ʵ��.������[1][3] >= ʵ��.������[1][2] and ʵ��.������[1][3] >= ʵ��.������[1][1] and ʵ��.������[1][3] > 0 then
		���ڲ���.���ܹ���_3()
		
		if ʵ��.������[1][2] > 0 or ʵ��.������[1][1] then
			if ʵ��.������[1][2] >= ʵ��.������[1][1] then
				���ڲ���.���ܹ���_2()
				���ڲ���.���ܹ���_1()
			else
				���ڲ���.���ܹ���_1()
				���ڲ���.���ܹ���_2()
			end
		end
	end
end

function ���ڲ���.���ܹ���_1()
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while (ʵ��.��������[1] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][1] > ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����2")
			���ڲ���.����_���ܹ���(1,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][1] > ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����1")
			���ڲ���.����_���ܹ���(1,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][1] > ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����3")
			���ڲ���.����_���ܹ���(1,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
end

function ���ڲ���.���ܹ���_2()
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while (ʵ��.��������[2] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][2] > ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����2")
			���ڲ���.����_���ܹ���(2,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][2] > ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����1")
			���ڲ���.����_���ܹ���(2,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][2] > ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����3")
			���ڲ���.����_���ܹ���(2,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
end

function ���ڲ���.���ܹ���_3()
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while (ʵ��.��������[3] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][3] > ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����2")
			���ڲ���.����_���ܹ���(3,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][3] > ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����1")
			���ڲ���.����_���ܹ���(3,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][3] > ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����3")
			���ڲ���.����_���ܹ���(3,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
end

function ���ڲ���.����Ĭ�Ϲ���()
	HUD.��ʾ��Ϣ("����-Ĭ�Ϲ���")

	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while(ʵ��.��������[2] > 0 ) do
		if ���ڼ��.����ʶ��("����",2,"��") then
			���ڲ���.����_Ĭ�Ϲ���(����.�ҷ�����[2])
			ʵ��.��������[2] = ʵ��.��������[2]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			ʵ��.��������[2] = 0
			break
		end
	end
	
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while (ʵ��.��������[3] > 0 ) do
		if ���ڼ��.����ʶ��("����",3,"��") then
			���ڲ���.����_Ĭ�Ϲ���(����.�ҷ�����[3])
			ʵ��.��������[3] = ʵ��.��������[3]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while(ʵ��.��������[1] > 0 ) do
		if  ���ڼ��.����ʶ��("����",1,"��")  then
			���ڲ���.����_Ĭ�Ϲ���(����.�ҷ�����[1])
			ʵ��.��������[1] = ʵ��.��������[1]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
end

function ���ڲ���.����ֱ�ӹ���()
	HUD.��ʾ��Ϣ("����-ֱ�ӹ���")

	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while(ʵ��.��������[2] > 0 ) do
		print("���2��λ����")
		if ���ڼ��.����ʶ��("����",2,"��") then
			print("2��λ���� ������")
			���ڲ���.����_ֱ�ӹ���(����.�ҷ�����[2])
			ʵ��.��������[2] = ʵ��.��������[2]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while (ʵ��.��������[3] > 0 ) do
		print("���3��λ����")
		if ���ڼ��.����ʶ��("����",3,"��") then
			print("3��λ���� ������")
			���ڲ���.����_ֱ�ӹ���(����.�ҷ�����[3])
			ʵ��.��������[3] = ʵ��.��������[3]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		���ڲ���.����հ�(200)
	end
	while(ʵ��.��������[1] > 0 ) do
		print("���1��λ����")
		if ���ڼ��.����ʶ��("����",1,"��") then
			print("1��λ���� ������")
			���ڲ���.����_ֱ�ӹ���(����.�ҷ�����[1])
			ʵ��.��������[1] = ʵ��.��������[1]-1
			if ���ڵȴ�() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
end

function ���ڲ���.����_ֱ�ӹ���(����)
	swipe(����[1],����[2],����[1],����[2]-500,80)
	sleep(�ӳ�.�����ӳ�)
end

function ���ڲ���.����_Ĭ�Ϲ���(����)
	swipe(����[1],����[2],����[1],����[2]-150,50)
	sleep(�ӳ�.�����ӳ�)
end

function ���ڲ���.����_���ܹ���(a,b)
	local x1,y1 = ����.�ҷ�����[a][1],����.�ҷ�����[a][2]
	local x2,y2 = ����.�з�����[b][1],����.�з�����[b][2]
	ʵ��.��������[a]=ʵ��.��������[a] -1
	swipe(x1,y1,x2,y2,50)
	sleep(�ӳ�.�����ӳ�)
end

function �������.����������()
	local ������_��һ�� = function()
		local t = {{308,1200,350,1243}}
		for i,v in ipairs(t) do
			if ʶ��.ʶͼ(v,"������-��һ��",0.8,1) then
				sleep(200)
				return true
			end
		end
		return false
	end
	HUD.��ʾ��Ϣ("����������")
	local time = tickCount()
	while (������.������() == false) do
		if ʶ��.ʶͼ(615,1200,707,1268,"���������水ť",0.9,1) then
			
		end
		
		if ʶ��.ʶͼ(��Χ.������رհ�ť,"������ر�.png|������ر�2",0.7,1) then
			
		end
		
		if ʶ��.ʶͼ(��Χ.������ð�ť,"������_��",0.7,1) then
			
		end
		
		������_��һ��()
		
		ʶ��.ʶͼ(324,1214,365,1258,"·��ȡ���Ƽ�",0.8,1)
		�������.�Ի����()
		
		if ʶ��.ʶͼ(258,1097,301,1145,"������_��ת��Ƭ",0.95,0) then
			local ����={{360,229},{549,359},{594,621},{465,836},{256,836},{126,618},{172,348}}
			for i,var in ipairs(����) do
				tap(var[1],var[2])
				sleep(1000)
			end
		end
		
		if ʶ��.ʶͼ(297,244,330,1163,"ѡ������",0.85,0) then
			if UI_in.ѡ������ == 0 then
				tap(ʶ��X-130,ʶ��Y+100)
			elseif UI_in.ѡ������ == 1 then
				tap(ʶ��X+60,ʶ��Y+100)
			elseif UI_in.ѡ������ == 2 then
				tap(ʶ��X+260,ʶ��Y+100)
			end
			sleep(1500)
			tap (516,789)
			sleep(500)
		end
		if ���ڼ��.����() then
			�Ծ�.Ĭ��()
		end
		-- ������Ҫ���һ�����ڼ�� �����Զ��Ծֺ���
		if ���������ж� and ������.������() == false and ʶ��.ʶͼ(256, 774, 309, 825,"��ʼ��Ϸ_��",0.9,1) == false then
			keyPress("back")
			sleep(1500)
		end
		
		if ʶ��.ʶͼ(440,589,486,624,"������_�˳�Ӧ�ó���",0.8,0) then
			tap(206,698)
			sleep(1500)
		end
		
		�������.����հ�(200)
	end
end

function �������.����_��������()
	if ʶ��.����(��Χ.����_��������,"���㴦��",�ֿ�.����_��������,0.9,0) then
		�������.��һ��()
		return true
	end
	return false
end

function �������.����_��������()
	if ʶ��.����(��Χ.����_��������,"���㴦��",�ֿ�.����_��������,0.9,0) then
		������.����ȼ�()
		�������.��һ��()
		return true
	end
	return false
end

function �������.����_��һ��()
	local t = {{312,1198,344,1231}}
	for i,v in ipairs(t) do
		if ʶ��.ʶͼ(v,"����-��һ��",0.9,1) then
			sleep(500)
			return true
		end
	end
	return false
end

function �������.��һ��()
	tap(356,1246)
	sleep(�ӳ�.�����ӳ�)
end

function �������.�Ի���� ()
	return ʶ��.ʶͼ(641,862,689,897,"�Ի����",0.9,1)
end

function �������.�����淭ҳ()
	swipe(718,823,384,771,1)
	sleep(3000)
end

function �������.����հ�(�ӳ�)
	if ���������ж� == false then return end
	tap (719,70)
	sleep(�ӳ�)
end

function ���ڲ���.����հ�(�ӳ�)
	if ���������ж� == false then return end
	tap(719,192)
	sleep(�ӳ�)
end

function �������.����_��()
	if ʶ��.����(��Χ.����_��,"���㴦��",�ֿ�.����_��,0.9,0) then
		��������()
		ʵ��.���� = ʵ��.���� +1
		local x,y = ʶ��X,ʶ��Y
		if ������.�Ծ�ʤ��() then
			ʵ��.ʤ�� = ʵ��.ʤ�� + 1
		end
		print("�ܾ���:",ʵ��.����,"ʤ��:",ʵ��.ʤ��,"��ǰģʽʣ�����: ",ģʽ����)
		tap(x,y)
		sleep(�ӳ�.�����ӳ�)
		return true
	end
	return false
end

function ���ڲ���.�϶�����(X,Y)
	swipe(X+30,Y,X+30,Y-200,50)
	if �������� then
		�ȴ���Ϣ��({nil})
		sleep(100)
		return
	end
	�ȴ���Ϣ��({X+30,Y,X+30,Y-200,50,200})
end

function ���ڲ���.�������(X,Y)
	tap(X+30,Y)
	if �������� then
		sleep(500)
		return
	end
	�ȴ���Ϣ��({X+30,Y,200})
end

function ���ڲ���.�����ٻ�()
	for i,var in ipairs(��Χ.�����ٻ�) do
		if ʶ��.ʶͼ(var,"�����ٻ�_��",0.7,1) then
			HUD.��ʾ��Ϣ("�����ٻ�")
			sleep(�ӳ�.�����ӳ�)
			return true
		end
	end
	return false
end

function ���ڲ���.ͨ���ٻ�()
	for i,var in ipairs(��Χ.ͨ���ٻ�) do
		if ʶ��.ʶͼ(var,"ͨ���ٻ�",0.8,1) then
			if �������� then
				����.ͨ�ٵ� = true
			elseif ����.���� then
				����.ͨ�ٵ� = true
			end
			HUD.��ʾ��Ϣ("ͨ���ٻ�")
			sleep(�ӳ�.�����ӳ�)
			return true
		end
	end
	return false
end

function ���ڼ��.����ħ��()
	return  ʶ��.ʶͼ(212,970,244,1005,"����Ч��-��",0.8,0)
end

function ���ڲ���.����ħ��()
	for i,var in ipairs(��Χ.����ħ����) do
		if ʶ��.ʶͼ(var,"�ٹ�_����",0.7,1) then
			return true
		end
	end
	return false
end

function ���ڲ���.���ǹ���()
	if �������� then ����.ͨ�ٵ� = true end
	return ʶ��.ʶͼ(413,970,445,1004,"����-����",0.8,1)
end

function ���ڲ���.��������()
	if �������� then
		if ����.����()  then
			����.����Ƿ� = false
		end
	end
	return ʶ��.ʶͼ(328,974,360,1005,"����-����",0.65,1)
end

function ���ڲ���.�������ƹ�Ч()
	for i,var in ipairs(��Χ.�ַ���Ч) do
		if ʶ��.ʶͼ(var,"����Ч��_��",0.7,1) then
			sleep(�ӳ�.�����ӳ�)
			return true
		end
	end
	return false
end

function ���ڲ���.�ڳ�ħ��Ч��()
	return ʶ��.ʶͼ(384,967,430,1011,"����Ч��_��",0.7,1)
end

function ���ڲ���.ת������ת()
	local ��Χ = {
	{299,977,334,1011},
	{284,973,422,1018},
	{469,973,509,1015}
	}
	if ʶ��.ʶͼ(294,966,333,1007,"��ת�ٻ�",0.7,1) then return true end
	
	for i,var in ipairs(��Χ) do
		if ʶ��.ʶͼ(var,"��Ϊ����״̬",0.7,1) then return true end
	end
	return false
end

function ���ڲ���.ת��()
	local ��Χ = {
	{299,977,334,1011},
	{284,973,422,1018},
	{469,973,509,1015}
	}
	for i,v in ipairs(��Χ) do
		if ʶ��.ʶͼ(v,"���ر�״̬",0.8,1) then return true end
	end
	return false
end

function ���ڲ���.�ڳ���Ч()
	local ��Χ = {
	{351,966,396,1009},
	{433,962,485,1010},
	{265,967,310,1007}
	}
	for i,var in ipairs(��Χ) do
		if ʶ��.ʶͼ(var,"��������Ч��_Ч",0.7,1) then
			sleep(500)
			return true
		end
	end
	return false
end

function ���ڲ���.����ħ������()
	return ʶ��.ʶͼ(384,967,430,1001,"����Ч��_��",0.7,1)
end

function ���ڲ���.����ĹЧ()
	return ʶ��.ʶͼ(470,962,513,1009,"����Ч��_��",0.7,1)
end

function �������.·���л�����()
	if ʶ��.ʶͼ(406,1222,423,1247,"·��-����-��3",0.9,0)==false and ʶ��.ʶͼ(675,1207,703,1218,"·��-�л��ȼ��ж�",0.9,1) then
		sleep(2000)
		if ʶ��.ʶͼ(241,1015,262,1047,"·��-����-��3",0.9,1) then
			sleep(2000)
		else
			tap (54,1244)
			sleep(2000)
		end
	end
end

function ���ڲ���.�����ж�����(ѡ��)-- 0��ʾֱ�ӽ����غ� 1��ʾ����ս���׶�
	while (���ڼ��.�ж�����()) do
		if ���ڼ��.�����ж�() then
			if UI_in.�㹥����  then
				����.�㹥Ϊ��()
			end
			if UI_in.ʶ�𾵹� and ����.���� == false then
				if ���ڼ��.��() then
					ѡ�� = 0
				end
			end
			tap (671,804)  -- �л���ť
			sleep(300)
			
			if ѡ�� == 0 then
				tap (719,579) --ֱ�ӽ����غ�
				sleep(300)
				if ���ڼ��.�ж�����() then --û�н���֤���˻غϲ���ֱ�ӽ��������ǵ�һ�غ�
					tap (671,804)
					sleep(300)
					tap (716,797)
				end
				print("ֱ�ӽ����غ�")
			elseif ѡ�� == 1 then --����ս���׶�
				print("����ս���׶�")
				tap (716,797)
				sleep(300)
			end
		else
			���ڵȴ�()
		end
	end
	ս������_��ʼ��()
end

function ս������_��ʼ��()
	ʵ��.�������� = {1,1,1}
end

function ���ڲ���.����ս������()
	while (���ڼ��.ս������()) do
		if ���ڼ��.�����ж�() then
			if ���ڼ��.ս�����費�ɽ���() then
				HUD.��ʾ��Ϣ("ս�����費�ɽ�������Ĭ�Ϲ���")
				���ڲ���.����Ĭ�Ϲ���()
			else
				tap (671,804)  -- �л���ť
				sleep(300)
				tap (671,804)
				return
			end
		else
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		end
	end
end

function ���ڲ���.�ж�����(ѡ��)
	if ѡ�� == 1 then
		��ȷ.���޿�()
	elseif ѡ�� == 2 then
		��ȷ.�����ֹ�()
	elseif ѡ�� == 3 then
		��ȷ.���ǹ���()
	elseif ѡ�� == 4 then
		��ȷ.���ֹ�Ч��()
	elseif ѡ�� == 5 then
		��ȷ.ħ����()
	elseif ѡ�� == 6 then
		��ȷ.װ��ħ��()
	elseif ѡ�� == 7 then
		��ȷ.����ħ��()
	elseif ѡ�� == 8 then
		��ȷ.���忨()
	elseif ѡ�� == 9 then
		����.��������()
	elseif ѡ�� == 10 then
		����.����Ϊ��()
	elseif ѡ�� == 11 then
		����.����ħ��()
	elseif ѡ�� == 12 then
		����.�����ڳ���Ч()
	elseif ѡ�� == 13 then
		����.��������()
	elseif ѡ�� == 14 then
		����.����ĹЧ()
	elseif ѡ�� == 15 then
		����.��������()
	end
end

function ���ڲ���.ս������(ѡ��)
	if ѡ�� == 1 then
		���ڲ���.����Ĭ�Ϲ���()
	elseif ѡ�� == 2 then
		���ڲ���.����ֱ�ӹ���()
	elseif ѡ�� == 3 then
		���ڲ���.���ܹ���()
	elseif ѡ�� == 4 then
		����.����ħ��()
	elseif ѡ�� == 5 then
		����.�����ڳ���Ч()
	elseif ѡ�� == 6 then
		����.����ĹЧ()
	elseif ѡ��== 7 then
		����.��������()
	end
end

function �������.���봫����()
	HUD.��ʾ��Ϣ("���봫����...")
	local time = tickCount()
	while(true) do
		if ������.�����Ž���() then
			print("ʶ�𵽽���")
			return
		else
			if ������.������() and ������.����(1)  then
				tap (130,1263) -- ���������
				while (������.�����Ž���() == false) do
					if tickCount() - time > 10000 then
						�������.���봫����()
						return
					end
				end
			elseif ������.������() then
				tap (130,1263)
				sleep(1000)
			else
				if ������.�����Ž���() == false then
					�������.����������()
				end
				
			end
		end
	end
end

function �������.ѡ�����ŵȼ�()
	if UI_in.�����ŵȼ� == 0 then
		tap (119,882)
	elseif UI_in.�����ŵȼ� == 1 then
		tap (280,882)
	elseif UI_in.�����ŵȼ� == 2 then
		tap (442,880)
	elseif UI_in.�����ŵȼ� == 3 then
		tap (588,871)
	end
	sleep(500)
end

function ������.�����(���)
	return ʶ��.ʶͼ(1,52,45,93,���,0.9,0)
end

function �������.����(���)
	while (������.�����(���) == false) do
		if ������.������() then
			tap (292,1133)
			local time = tickCount()
			while ( true) do
				if tickCount()  - time >= 5000 then
					�������.����(���)
				end
				if ������.�����(���) then
					break
				end
			end
			return
		else
			�������.����������()
		end
	end
end

function ��ȷ.���޿�()
	if ���ڼ��.�ҷ�����() == 3 then
		HUD.��ʾ��Ϣ("�ڳ���������")
		return
	end
	local �� = ���ڼ��.��������()
	print("����������", ��)
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("ʹ�ù���")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,��ɫ.ͨ������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڲ���.�����ٻ�()then
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.���޿�()
			return
		end
		
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		else
			���ڲ���.����հ�(500)
			�±� = �����±� + 1
			goto one
		end
	else
		HUD.��ʾ��Ϣ("δʶ������޿�")
	end
end

function ��ȷ.���ֹ�Ч��()
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("�������ƹ���")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڲ���.�������ƹ�Ч() then
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.���ֹ�Ч��()
		else
			���ڲ���.����հ�(500)
			�±� = �����±� + 1
			goto one
		end
	else
		HUD.��ʾ��Ϣ("δʶ������޿�")
	end
end

function ��ȷ.�����ֹ�()
	if ���ڼ��.�ҷ�����() == 3 then
		HUD.��ʾ��Ϣ("�ڳ���������")
		return
	end
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("�������ƹ���")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�϶�����(����X,����Y)
		
		if ���ڲ���.�����ٻ�() then
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.�����ֹ�()
			return
		else
			���ڲ���.����հ�(500)
			�±� = �����±� + 1
			goto one
		end
	else
		HUD.��ʾ��Ϣ("δʶ������޿�")
	end
end

function ��ȷ.���ǹ���()
	if ���ڼ��.�ҷ�����() == 3 then
		HUD.��ʾ��Ϣ("�ڳ���������")
		return
	end
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("���ǹ���")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,��ɫ.ͨ������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڲ���.���ǹ���() then
			sleep(�ӳ�.�ٻ�)
		else
			���ڲ���.����հ�(500)
			�±� = �����±� + 1
			goto one
		end
	else
		HUD.��ʾ��Ϣ("δʶ������޿�")
	end
end

function ��ȷ.ħ����()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ��ħ����")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~=  -1 then
		local �ҷ����� = 0
		local �з����� = 0
		if UI_in.װ������  then �ҷ����� = ���ڼ��.�ҷ�������() end
		if UI_in.�ٹ�����1 then �з����� = ���ڼ��.�з�����() end
		
		���ڲ���.�϶�����(����X,����Y)
		if ���ڼ��.����ħ��() then
			
			if UI_in.װ������ and �ҷ����� == 0 and ���ڼ��.װ��ħ��() then
				HUD.��ʾ��Ϣ("�޹�����޲�����װ��ħ��")
				���ڲ���.����հ�(500)
				�±� = �����±� +1
				goto one
				return
			end
			
			if ���ڼ��.�ٹ�ħ��() then
				if UI_in.�ٹ����� then   -- �ٹ�ħ���ܷ����жϸ��ǻ���ֱ��
					if UI_in.�ٹ�����1 and �з����� > 0 then
						print("�����ٹ�ֱ������")
						tap(278,941)
						sleep(�ӳ�.ħ�����ӳ�)
						if ���ڵȴ�() == 2 then return end
						sleep(500)
						��ȷ.ħ����()
						return
					else
						if ���ڲ���.����ħ��() then
							if ���ڵȴ�() == 2 then return end
							sleep(500)
							��ȷ.ħ����()
							return
						end
					end
				end
			end
			
			tap(278,941)
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.ħ����()
			return
		else
			
			if UI_in.�ٹ����� and ���ڼ��.�ٹ�ħ��() then -- �ٹ�ħ�����������ж��Ƿ���Ҫ����
				if ���ڲ���.����ħ��() then
					sleep(500)
					if ���ڵȴ�() == 2 then return end
					sleep(500)
					��ȷ.ħ����()
					return
				end
			end
			
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		HUD.��ʾ��Ϣ("������ħ����")
	end
end

function ��ȷ.ħ����_��ɱ()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ��ħ����")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڼ��.����ħ��() then
			tap(278,941)
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.ħ����_��ɱ()
		else
			if ���ڲ���.����ħ��() then
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				��ȷ.ħ����_��ɱ()
				return
			end
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		HUD.��ʾ��Ϣ("δʶ���ħ����")
	end
end


function ��ȷ.װ��ħ��()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ��װ��ħ����")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		local count  = 0
		if UI_in.װ������ then count = ���ڼ��.�ҷ�������() end
		���ڲ���.�϶�����(����X,����Y)
		if ���ڼ��.����ħ��() and ���ڼ��.װ��ħ��()   then
			if UI_in.װ������ and count == 0  then
				HUD.��ʾ��Ϣ("�޹�����޲�����װ��ħ��")
				���ڲ���.����հ�(500)
				return
			end
			tap(278,941)
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.װ��ħ��()
			return
		else
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		HUD.��ʾ��Ϣ("δʶ���װ��ħ����")
	end
end

function ��ȷ.����ħ��()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ�ó���ħ����")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڼ��.����ħ��() and ���ڼ��.����ħ��() then
			tap(278,941)
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.����ħ��()
			return
		else
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		HUD.��ʾ��Ϣ("δʶ�������ħ����")
	end
end

function ��ȷ.���忨()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ�����忨")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.���忨,���ƶ�.���忨)
	if �����±� ~= -1 then
		���ڲ���.�϶�����(����X,����Y)
		if ���ڲ���.��������() then
			print("�������忨")
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			��ȷ.���忨()
			return
		else
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		HUD.��ʾ��Ϣ("δʶ������忨")
	end
end

function ����.��������()
	if  ���ڼ��.�ҷ�����() < 2 then
		print("��������2ֻ")
		return
	end
	HUD.��ʾ��Ϣ("��������")
	if ���ڵȴ�() == 1 and ���ڼ��.�����޿�() then
		return
	else
		sleep(100)
		tap (65,904)
		sleep(500)
		if ʶ��.ʶͼ(329,968,359,1004,"����-�б�ť",0.8,0) then
			HUD.��ʾ��Ϣ("�޷�����")
			���ڲ���.����հ�(500)
			return
		elseif ʶ��.ʶͼ(416,970,445,1005,"����-����-��",0.8,1) then
			sleep(500)
			if ���ڵȴ�() == 2 then
				local time = tickCount()
				while(true) do
					if ���ڼ��.����() then
						sleep(1500)
						break
					else
						���ڲ���.����հ�(200)
					end
					if tickCount() - time > 10000 then
						return
					end
				end
			end
			���ڲ���.����հ�(500)
		end
	end
end

function ����.����Ϊ��()
	HUD.��ʾ��Ϣ("����Ϊ��")
	for i=1,3 do
		if ���ڼ��.����ʶ��("����",i,"��") then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�����[i][1],����.�ҷ�����[i][2],200})
			if UI_in.�㹥���� and ���ڼ��.��Ϣ_��ֵ("����") > 0 then
				if ���ڲ���.ת������ת() then
					sleep(�ӳ�.�����ӳ�)
					if ���ڵȴ�() == 2 then return end
					sleep(500)
				else
					���ڲ���.����հ�(500)
				end
			elseif UI_in.�㹥���� == false then
				if ���ڲ���.ת������ת() then
					sleep(�ӳ�.�����ӳ�)
					if ���ڵȴ�() == 2 then return end
					sleep(100)
				else
					���ڲ���.����հ�(500)
				end
			end
		end
	end
end

function ����.�㹥Ϊ��()
	local ������ = {-1,-1,-1}
	for i=1,3 do
		if ���ڼ��.����ʶ��("����",i,"��") then
			������[i]=math.tointeger(���ڼ��.ʶ�𹥻���(��Χ.�ҷ�������[i]))
		end
	end
	for i=1,3 do
		if ������[i] == 0 then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�����[i][1],����.�ҷ�����[i][2],200})
			if ���ڲ���.ת��() then
				sleep(�ӳ�.�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
			else
				���ڲ���.����հ�(500)
			end
		end
	end
	
end

function ����.����ħ��()
	HUD.��ʾ��Ϣ("������Ч��")
	for i,var in ipairs(��Χ.�ڳ�ħ��) do
		if UI_in.ħ��Ч����1 and ���ڼ��.�з�����() == 0 then
			print("������ħ������1")
			return
		end
		if ʶ��.�����ɫ(var[1],��ɫ.�ڳ�ħ��[i*2-1],0,0.9) == false and ʶ��.�����ɫ(var[2],��ɫ.�ڳ�ħ��[i*2],0,0.9) == false then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�ħ��[i][1],����.�ҷ�ħ��[i][2],200})
			if ���ڲ���.�ڳ�ħ��Ч��() then sleep(�ӳ�.�����ӳ�)
			else
				���ڲ���.����հ�(500)
			end
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		end
	end
	
end

function ����.�����ڳ���Ч()
	HUD.��ʾ��Ϣ("�����ڳ���Ч��")
	for i=1,3 do
		if UI_in.��Ч����1 then
			���ڵȴ�()
			if ���ڼ��.�з�����() == 0 then
				print("�������Ч����1")
			end
		end
		if ���ڼ��.����ʶ��("����",i,"��") or ���ڼ��.����ʶ��("����",i,"��") then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�����[i][1],����.�ҷ�����[i][2],200})
			if �������� then
				if ����.������() or ����.����() then
					���ڲ���.����հ�(500)
					i = i + 1
					goto one
					return
				end
			end
			if ���ڲ���.�ڳ���Ч() then
				sleep(500)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
			else
				���ڲ���.����հ�(500)
			end
			::one::
		end
	end
end

function ����.��������()
	if ���ڼ��.�ڳ�_����ħ��() then
		sleep(100)
		�ȴ���Ϣ��({83,691,200})
		if ���ڲ���.����ħ������() then
			print("��������Ч��")
			sleep(500)
			if ���ڵȴ�() == 2 then return end
			return true
		else
			���ڲ���.����հ�(500)
		end
	end
	return false
end

function ����.����ĹЧ()
	if ���ڼ��.Ĺ��() then
		sleep(100)
		�ȴ���Ϣ��({597,655,200})
		if ���ڲ���.����ĹЧ() then
			sleep(500)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return true
		else
			���ڲ���.����հ�(500)
		end
	end
	return false
end

function ����.��������()
	if ���ڼ��.��������() then
		sleep(500)
		if ʶ��.ʶͼ(447,520,450,1266,"�������ܰ�ť.png|�������ܰ�ť-2",0.9,1) then
			for i=1,6 do
				���ڲ���.����հ�(500)
			end
			���ڵȴ�()
			sleep(500)
			return true
		end
	end
	return false
end

function ����.���з���()
	if UI_in.ʶ�𾵹� and ʶ��.ʶͼ(608,480,641,514,"��-2",0.8,0) then
		return true
	end
	return false
end

function ���ڵȴ�()
	while (true) do
		if ���ڼ��.�����ж�() then
			if ����.���� then
				print("���� - ����")
				����.ħ����ʿ���� = false
				����.�������� = false
				����.ʿ������ = false
				����.��Դ���� = false
			end
			return 1
		elseif ���ڼ��.����() == false then
			return 2
		else
			Ч��.����()
		end
	end
end

function Ч��.����Ŀ�����()
	local t = {{127,754,129,756},{381,754,383,756},{634,754,636,756}}
	local t_2 = {{53,792,55,794},{307,791,309,793},{538,793,540,795}}
	local count = 0
	for i=1,3 do
		if ʶ��.�����ɫ(t[i],��ɫ.Ч��_�ҷ���Ƭ,0,0.9) or ʶ��.�����ɫ(t[i],��ɫ.Ч��_�з���Ƭ,0,0.9) then
			count = count + 1
		elseif ʶ��.�����ɫ(t_2[i],��ɫ.Ч��_�ҷ���Ƭ_2,0,0.9) or ʶ��.�����ɫ(t_2[i],��ɫ.Ч��_�з���Ƭ_2,0,0.9) then
			count = count + 1
		end
	end
	return count
end

function Ч��.����Ч������()
	local ��ɫ_t={ -- 1.��Ѩ,2.����ʿ,3.ʿ��
	{"1F3748","0|4|1D353E|0|22|152E3E|0|38|375861|0|48|9CACB5|0|63|A9B9C2|0|74|B0C0C8|0|85|6D8596|0|94|A1B1BD|0|101|B1C1CB|0|116|5D798A"},
	{"010821","0|4|333399|0|11|4949D1|0|19|51ACBD|0|35|197C94|0|46|2892A2|0|98|041D4E|0|108|01113B|0|112|011338|0|115|000C4E|0|118|4046BD"},
	{"663F49","0|7|6D4555|0|15|6C4B61|0|22|6C4B55|0|30|65455E|0|38|BDA3C6|0|45|885581|0|54|5B4157|0|61|85598F|0|67|A45FA9|0|80|D38CDA"}
	}
	local result = {{0,-1,-1},{0,-1,-1},{0,-1,-1}}
	for j=1,3 do
		local ��Χ_t={0,809,720,811}
		for i=1,3 do
			if ʶ��.�����ɫ(��Χ_t,��ɫ_t[j],0,0.85) then
				result[j] = {result[j][1]+1,ʶ��X,ʶ��Y}
				��Χ_t[1] = ʶ��X + 100
			else
				break
			end
		end
	end
	return result
end

function Ч��.����()
	--local time = tickCount()
	HUD.��ʾ��Ϣ("�ȴ���Ч������...")
	if ���ڼ��.���ڵ���_1() then
		if Ч��.��() then goto End end
		if Ч��.�׼���ȷ��() then goto End end
		if Ч��.Ҫʹ���ĸ�Ч��() then goto End end
		if Ч��.���й���״̬() then goto End end
		if Ч��.ħ��������() then goto End end
	end
	if Ч��.���ڵ���_2() then goto End end
	if Ч��.���ٻ�����() then goto End end
	if Ч��.���ڵ���_3() then goto End end
	if Ч��.�鿴���ֿ�() then goto End end
	if Ч��.��һ�ſ�() then goto End end
	if Ч��.ѡ����������() then goto End end
	if Ч��.����û���ÿ�() then goto End end
	::End::
	
	if ���ڼ��.����() then ���ڲ���.����հ�(50) end
	--	print("Ч��.������ʱ: ".. tickCount()-time)
end

function Ч��.Ҫʹ���ĸ�Ч��()
	if ʶ��.ʶͼ(417, 386, 419, 388, "Ч��_Ҫʹ���ĸ�Ч��", 0.8, 0) then
		print("Ч��-Ҫʹ���ĸ�Ч��")
		if ����.���� and ʶ��.ʶͼ(338,544,369,573, "���ǳ���Ч��", 0.8, 0) then
			if ����.ħ����ʿ���� == 0 then
				print("���� - �ֿ�ûħ����ʿ����� tab2")
				tap(514,491)  -- ��� 2
				sleep(200)
				-- todo
				-- ������ô��ȷ�ϵ�
				if ʶ��.ʶͼ(327,888,329,890,"����_ȷ��",0.8,1) then
					sleep(100)
					����.ħ����ʿ���� = true
					return true
				else
					-- �������ûħ����ʿ
					-- ����Ҳû�������
					-- ���� tab1 ������
					tap(195,490) -- ��� 1
					sleep(200)
					����.���׿��� = true
					tap(361,904)
					sleep(100)
					return true
				end
			elseif ����.�������� == 0 then
				print("���� - �ֿ�û����֮��")
				-- ��� tab ȷ�ϰ�ť
				tap(355,903)
				sleep(100)
				����.���׿��� = true
				return true
			elseif ����.ʿ������ == 0 then
				print("���� - �ֿ���ħ����ʿ������֮������� tab2 ѡʿ��")
				tap (514,491)  -- ��� 2
				sleep(200)
				tap(349,904)
				sleep(100)
				����.ʿ������ =  true
				return true
			else
				print("���� - �ֿ���ħ����ʿ������֮����ʿ������� tab2")
				tap(514,491)  -- ��� 2
				sleep(200)
				if ʶ��.ʶͼ(327,888,329,890,"����_ȷ��",0.8,1) then
					sleep(100)
					����.ħ����ʿ���� =  true
					return true
				else
					tap(195,490) -- ��� 1
					sleep(200)
					����.���׿��� = true
					tap(361,904)
					sleep(100)
					return true
				end
			end
		end

		-- ���� tab ȷ���߼�����ֹû��ȷ��
		::one::
		if ʶ��.ʶͼ(327,888,329,890,"����_ȷ��",0.8,1) then
			print("һֱ�ڵ�ȷ��")
			sleep(100)
		else
			tap(379,488)
			sleep(300)
			goto one
		end
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	else
		return false
	end
end

function Ч��.���ٻ�����()
	if Ч��.ʶ��({19,693,69,719},"����") then
		print("Ч��-���ٻ�����")
		tap (136,867)
		sleep(�ӳ�.�����ӳ�)
		tap(361,1081)
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.��()
	local ��Χ={339,681,378,721}
	if ʶ��.ʶͼ(��Χ,"����_��",0.8,1) then
		print("Ч��-�����")
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.ѡ����������()
	if ʶ��.ʶͼ(329,1217,331,1219,"ѡ����������_ȷ��",0.9,1) then
		print("Ч��-ѡ����������")
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.ħ��������()
	if ʶ��.ʶͼ(373,590,374,591,"Ч������_ħ�����ƻ��ֿ�_��",���ƶ�.Ч������,0) then
		print("Ч��-����ħ�����ƻ��ֿ�")
		tap(511,695)
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.���й���״̬()
	if ʶ��.ʶͼ(295,405,329,438,"����_ս��״̬_ս",0.9,0) then
		print("Ч��-���й���")
		if ʵ��.����״̬ then
			tap (211,584)
		else
			tap(503,591)
		end
		sleep(100)
		tap(355,816)
		sleep(100)
		����״̬ = true
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.����û���ÿ�()
	if ʶ��.ʶͼ(385,587,422,631,"Ч������_����û�����ÿ�_��",���ƶ�.Ч������,0) then
		print("Ч��-����û�����ÿ�")
		tap(357,698)
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.�׼���ȷ��()
	local ��Χ = {
	{479,683,515,715},
	{473,674,521,730},
	{476,694,517,734}
	}
	for i,var in ipairs(��Χ) do
		if ʶ��.ʶͼ(var,"�׼�_֧������_ȷ��_ȷ",���ƶ�.Ч������,0) then
			local x,y = ʶ��X,ʶ��Y
			if ����.���� then
				if ����.����֮��Ч�� == false then
					if ʶ��.ʶͼ(131,589,132,590,"����-����֮��Ч��",0.9,0) then
						print("����-�Է��޳��ز���������֮��Ч��")
						tap (215,696) -- ȡ��Ч��
						sleep(100)
						return true
					end
				end
				
				if ����.ʿ��Ч��==false   then
					if ʶ��.ʶͼ(121,594,123,596,"����-ʿ��Ч��",0.9,0) then
						print(1)
						print("����-�Է��޹��޲�����ʿ��Ч��")
						tap (215,696) -- ȡ��Ч��
						sleep(100)
						return true
					end
				end
				
			end
			print("Ч��-ȷ��")
			tap(x,y)
			sleep(100)
			return true
		elseif ���ڼ��.�����ж�() then
			return true
		end
	end
	return false
end

function Ч��.���ڵ���_3()
	local ��ɫ_ȷ�� = {"F4F4F4","13|0|E5E5E5|18|-2|FBFBFB|29|1|E4E4E4|69|31|FFFFFF|52|32|F8F8F8|44|29|E6E6E6|29|31|FFFFFF|22|31|FFFFFF|12|32|DDDDDD|2|30|D9D9D9"}
	if ʶ��.�����ɫ(323,1070,325,1072,��ɫ_ȷ��,0,0.9) then
		print("Ч��-����-3")
		if �������� then
			if ����.����ʯ() then return true end
			if ����.�ӿ����ð�ʯ()  then  return true end
			if Ч��.���ֿ�����() then return true end
			if Ч��.ѡ���ں�����() then return true end
			if Ч��.�ӿ�������() then return true end
			if Ч��.ѡ���������() then return true end
		end

		if ����.���� then
			if Ч��.ѡ�񿨴ӿ�������ֿ�() then return true end
			if ����.ѡ��һ�ſ�() then return true end
			if Ч��.ѡ���������() then return true end
			if Ч��.ѡ����ȥĹ��() then return true end
			if Ч��.ѡ���ں�����() then return true end
		end

		if Ч��.ѡһ�����޳���() then return true end
		if Ч��.ѡ���ƻ�() then return true end
		if Ч��.ѡ����޳���() then return true end
		if Ч��.ѡ��һ������() then return true end
		if Ч��.ѡ��2�ſ���Ϊ����() then return true end
		tap (182,871)
		sleep(200)
		
		if ʶ��.ʶͼ(202,753,233,792,"Ч������ѡ��_1",0.9,0) then
			tap(389,878)
			sleep(�ӳ�.�����ӳ�)
		end
		
		if ʶ��.ʶͼ(456,752,486,791,"Ч������ѡ��_2",0.9,0) then
			tap (640,859)
			sleep(�ӳ�.�����ӳ�)
		end
		
		tap (351,1083)
		sleep(100)
		return true
	elseif ʶ��.ʶͼ(312,1061,367,1115,"Ч������_��ȷ��_ȷ",���ƶ�.Ч������,1) then
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.�ӿ�������()
	if Ч��.ʶ��({200,694,227,720},"��") and Ч��.ʶ��({252,693,280,719},"��") then
		if ��������  then
			if ����.Ч��ѡ������() then
				tap(360,1084)
				sleep(200)
				return true
			end
		end
		return false
	end
end

function Ч��.ѡ����޳���()
	if ʶ��.ʶͼ(200,685,256,730,"Ч��-ѡ������泯��",0.8,0) then
		if ���ڲ���.ѡ��з��ڳ���Ϊ����() then
			tap(354,1087)
			sleep(100)
		else
			tap(78,861)
			sleep(100)
			tap(354,1087)
			sleep(100)
		end
		return true
	end
	return false
end

function Ч��.ѡ��2�ſ���Ϊ����()
	if ʶ��.ʶͼ(69,694,71,696,"ѡ��2�ſ���Ϊ����-2",0.9,0) and Ч��.ʶ��({214,693,250,722},"��.") then
		if ���ڲ���.ѡ��з��ڳ���Ϊ����() then
			tap(354,1087)
			sleep(100)
		else
			tap(78,861)
			sleep(100)
			tap(354,1087)
			sleep(100)
		end
		return true
	end
	return false
end

function Ч��.ѡһ�����޳���()
	if ʶ��.ʶͼ(214,692,268,719,"Ч��-ѡ��һ�ſ�����",���ƶ�.Ч������,0) then
		print("Ч��-ѡ��һ�ſ�����")
		if ���ڲ���.ѡ��з��ڳ���Ϊ����() then
			tap(354,1087)
			sleep(100)
		else
			tap(354,1087)
			sleep(100)
		end
		return true
	end
	return false
end

function ���ڲ���.ȡ��Ч��()
	sleep(100)
	tap(50,1235)
	sleep(100)
end

function Ч��.���ڵ���_2()
	if ʶ��.�����ɫ(286,1069,288,1071,��ɫ.����Ч��_����Ч��,0,0.9) then
		sleep(200)
		if �������� then
			if ���ڼ��.�з���������() then
				print("���� -- �з������׶β�����Ч��")
				���ڲ���.ȡ��Ч��()
				return true
			end
			
			if ����.Ч������������() or ����.Ч��������Ů() or ����.Ч������������() then
				local x,y = ʶ��X+40,ʶ��Y
				if ����.�Կ��ж�() then
					tap(x,y)
					print("������ ��Ů �Կ� ��������ֱ��Ч��")
					goto two
					return true
				else
					if Ч��.����Ŀ�����() > 1 then
						tap (368,863)
						goto one
						return true
					else
						���ڲ���.ȡ��Ч��()
						return true
					end
				end
			end
		elseif ����.���� then
			-- 1.��Ѩ,2.����ʿ,3.ʿ��
			local Ч���� = Ч��.����Ŀ�����()
			local �й� = ���ڼ��.�з�����()
			local arr = Ч��.����Ч������()
			local count = arr[1][1] + arr[2][1] + arr[3][1]
			print(�й�,arr[1][1],arr[2][1],arr[3][1])
			-- todo ��ʱ������ħ����Ч��
			-- if arr[2][1]>0 then
			-- 	if ���ڼ��.�Կ�() then
			-- 		tap (arr[2][2],arr[2][3])
			-- 		print("���� - �Կӷ�����ħ��Ч��")
			-- 		goto two
			-- 		return true
			-- 	end
			-- end
			if arr[1][1] > 0 then
				if �й� > 1 then
					tap(arr[1][2],arr[1][3])
					print("���� -- ������ѨЧ��")
					goto two
					return true
				end
			end
			if Ч��.���ж��׶ν���ǰ����() then
				print('Ч��.���ж��׶ν���ǰ����()')
				return true
			end
			if count == Ч���� then
				print("����-ȡ��Ч������")
				���ڲ���.ȡ��Ч��()
				return true
			elseif Ч���� > count then
				local Ч������ ={false,false,false}
				print("����-����������ƬЧ��")
				for i=1,3 do
					if arr[i][2] < 200 and arr[i][2] ~= -1 then
						Ч������[i] = true
					elseif arr[i][2] > 200 and arr[i][2] < 500 then
						Ч������[i] = true
					elseif arr[i][2] > 500 and arr[i][2] < 700 then
						Ч������[i] = true
					end
				end
				if Ч������[1] then
					tap(128,862)
					goto two
				elseif Ч������[2] then
					tap(385,867)
					goto two
				elseif Ч������[3] then
					tap(649,862)
					goto two
				end
			end
		end
		::one::
		if UI_in.��Ч����1 and ���ڼ��.�з��غ�() == false then
			print("�������Ч-1")
			���ڲ���.ȡ��Ч��()
			return true
		end
		if UI_in.��Ч����2 and ���ڼ��.�з�����() == 0 then
			print("�������Ч-2")
			���ڲ���.ȡ��Ч��()
			return true
		end
		print("����-����Ч��")
		tap(144,848)
		::two::
		sleep(200)
		tap(358,1077)
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.��һ�ſ�()
	if ʶ��.ʶͼ(183,583,227,629,"Ч������_��һ�ſ�_��",���ƶ�.Ч������,0) then
		print("test-1")
		tap(514,599)
		sleep(100)
		return true
	elseif ���ڼ��.�����ж�() then
		return true
	end
	return false
end

function Ч��.ѡ��һ������()
	if Ч��.ʶ��({138,692,173,722},"��.") then
		print("ѡ��һ������")
		if ���ڲ���.ѡ��з��ڳ���Ϊ����() then
			tap(354,1087)
			sleep(100)
		else
			tap(78,861)
			sleep(100)
			tap(354,1087)
			sleep(100)
		end
		return true
	end
	return false
end

function Ч��.ѡ���ƻ�()
	if Ч��.ʶ��({199,694,238,720},"��.") then
		sleep(200)
		print("ѡ��һ�ſ��ƻ�")
		if ���ڲ���.ѡ��з��ڳ���Ϊ����() then
			tap(354,1087)
			sleep(100)
		else
			tap(78,861)
			sleep(100)
			tap(354,1087)
			sleep(100)
		end
		return true
	end
	return false
end

function Ч��.���ֿ�����()
	if Ч��.ʶ��({45,691,70,722},"��") and Ч��.ʶ��({200,693,227,721},"��") then
		if �������� and ����.Ч��ѡ������() then
			tap(360,1084)
			sleep(200)
			return true
		end
	end
	return false
end

function Ч��.ѡ���ں�����()
	if Ч��.ʶ��({120,692,151,721},"��") and Ч��.ʶ��({227,692,256,721},"��") then
		print("ѡ���ںϹ�������")
		local time = tickCount()
		if �������� and ����.Ч��ѡ�о�����() then
			tap(360,1084)
			sleep(200)
		elseif ����.����  then
			���ڼ��.�з�������()
			local �����ж� = false
			for i=1,3 do
				if ʵ��.������[2][i] > 2600 then
					�����ж� = true
					break
				end
			end
			if �����ж� then
				if ����.Ч��ѡ��������ʿ() then
				end
			else
				if ����.Ч��ѡ����ħ����ʿ() then
				end
			end
			tap(360,1084)
			sleep(200)
		end
		local count = 0
		while (true) do
			if ���ڵȴ�() == 2 then
				for i=1,10 do
					���ڲ���.����հ�(100)
				end
				count = count + 1
			elseif ���ڵȴ�() == 1 then
				return true
			end
			if count > 5 and ���ڵȴ�() == 2 then
				break
			end
		end
		return true
	end
	return false
end

function Ч��.ѡ���������()
	if Ч��.ʶ��({17,692,44,719},"ѡ") and Ч��.ʶ��({122,691,151,721},"��") then
		print("ѡ���������")
		local �з����� = ���ڼ��.�з�����()
		if �������� then
			if ����.���������� then
				if ����.Ч��ѡ�б�����() == false then
					tap (126,857)
					sleep(100)
				end
			elseif �з����� > 0 then
				if ����.Ч��ѡ�л���() == false then
					tap (126,857)
					sleep(100)
				end
			elseif �з�����== 0 then
				if ����.Ч��ѡ�о�����() == false then
					tap (126,857)
					sleep(100)
				end
				
			else
				tap (126,857)
				sleep(100)
			end
		elseif ����.���� then
			if ���ڼ��.�з�����() then
				����.����֮��Ч�� = true
			end

			if ����.Ч��ѡ������() then
			else
				print("���� - δѡ������֮����ѡ���һ��")
				tap(126,857)
				sleep(100)
			end
		end
		tap(360,1084)
		sleep(200)
		return true
	end
	return false
end

function Ч��.�鿴���ֿ�()
	if Ч��.ʶ��({124,694,149,719},"��") and Ч��.ʶ��({227,694,261,720},"��.") then
		tap(56,1235)
		sleep(100)
		return true
	end
	return false
end

function Ч��.ѡ����Ϊ����()
	if Ч��.ʶ��({176,694,212,721},"��.") and Ч��.ʶ��({69,691,95,719},"��") then
		if ��������  then
			
		end
	end
end

function Ч��.ѡ�񿨴ӿ�������ֿ�()
	if Ч��.ʶ��({200,693,228,720},"��") and Ч��.ʶ��({305,693,340,720},"��.") then
		print("Ч��-ѡ�񿨴ӿ�������ֿ�")
		if ����.���� then
			sleep(200)
			if ����.���翪�� then
				if ����.ħ����ʿ���� == 0 and ����.Ч��ѡ��ħ����ʿ����() then
					
				elseif ����.ʿ������ == 0 and ����.Ч��ѡ��ʿ��() then
					
				else
					����.Ч��ѡ��ħ����ʿ����()
				end
			else
				if ����.ħ����ʿ���� then
					if ����.Ч��ѡ��ħ����ʿ����() == false then
						tap(60,857)
						sleep(100)
					end
				elseif ����.���׿��� then
					if ����.Ч��ѡ������() == false then
						tap(60,857)
						sleep(100)
					end
				elseif ����.ʿ������ then
					if ����.Ч��ѡ��ʿ��() == false then
						tap(60,857)
						sleep(100)
					end
				end
			end
			tap(360,1084)
			sleep(200)
			return true
		end
	end
	return false
end

function Ч��.ѡ����ȥĹ��()
	if Ч��.ʶ��({149,693,211,719},"Ĺ��.") then
		print("Ч��-ѡ����ȥĹ��")
		sleep(200)
		if ����.���� then
			if ����.Ч��ѡ�п�ȥĹ��() then
			else
				tap(126,864)
				sleep(100)
			end
			tap(365,1081)
			sleep(200)
		end
		
		return true
	end
	return false
end

function Ч��.���ж��׶ν���ǰ����()
	if Ч��.ʶ��({94,678,124,707},"��") and Ч��.ʶ��({229,708,250,735},"?") then
		print("Ч�� - �Է��ж��׶ν���")
		if ����.���� then
			-- todo ��ʱ����
			-- ���ڼ��.�з�������()
			-- if ����.Ч��������ħ����ʿ() then
			-- 	if ����.Ч��ѡ����ħ����ʿ() then
			-- 		local atk = ���ڼ��.��Ϣ_��ֵ("����")
			-- 		for i=1,3 do
			-- 			if ʵ��.������[2][i] > atk then
			-- 				tap(359,1087)
			-- 				sleep(200)
			-- 				return true
			-- 			end
			-- 		end
			-- 		���ڲ���.ȡ��Ч��()
			-- 	end
			-- else
			-- if ����.Ч������ʿ��() then
			-- 	tap(663,1219)
			-- 	sleep(500)
			-- 	local ���� = ����.ս��ʶ���ҹ���Ϣ()
			-- 	for i=1,3 do
			-- 		if ( ����[i][1] ==1 or ����[i][1] == 2 ) and ����[i][2] < 2600 then
			-- 			tap(663,1219)
			-- 			sleep(500)
			-- 			for i=1,3 do
			-- 				if ʵ��.������[2][i] >= 2600 then
			-- 					����.ʿ��Ч�� = true
			-- 					break
			-- 				end
			-- 			end
			-- 			if ����.Ч��ѡ��ʿ��() then
			-- 				tap(359,1087)
			-- 				sleep(200)
			-- 				return true
			-- 			end
			-- 		end
			-- 	end
			-- end
		end
		return true
	end
	return false
end

function Ч��.ʶ��(��Χ,����)
	TURING.��Դ_��ȡ��Ļ����(��Χ[1],��Χ[2],��Χ[3],��Χ[4])
	TURING.�˾�_��ɫ_��ֵ��("0-200")
	TURING.�и�_��ΧͶӰ�и�(3,2)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/Ч��.lib",����)
	local ʶ���� = TURING.ʶ��(95)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		local t = splitStr(ʶ����,"|")
		if t and next(t) ~= nil then
			if t[1] == ���� then
				return true
			end
		end
	end
	return false
end

function ���ڲ���.ѡ��з��ڳ���Ϊ����()
	local t = {{127,754,129,756},{381,754,383,756},{634,754,636,756}}
	local t_2 = {{53,792,55,794},{307,791,309,793},{538,793,540,795}}
	for i=1,2 do
		for j=1,3 do
			if ʶ��.�����ɫ(t[j],��ɫ.Ч��_�з���Ƭ,0,0.9)  or ʶ��.�����ɫ(t_2[j],��ɫ.Ч��_�з���Ƭ_2,0,0.9) then
				tap (ʶ��X,ʶ��Y+40)
				sleep(100)
				return true
			end
		end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ���ڲ���.Ч����һҳ()
	swipe(696,900,1,900,300)
	sleep(150)
	tap(56,863)
	sleep(200)
end

function ���ڼ��.��Ϣ��()
	return ʶ��.�����ɫ(689,562,697,584,��ɫ.��Ϣ��,0,0.9)
end

function �ȴ���Ϣ��(...) -- �淶: {x,y,�ӳ�},{x1,y1,x2,y2,����,�ӳ�}
	t = ...
	local count= 0
	while(true) do
		sleep(200)
		if ���ڼ��.��Ϣ��() then
			break
		else
			if #t == 3 then  -- �����ж�
				tap(t[1],t[2])
				sleep(t[3])
				
			elseif #t == 6 then
				swipe(t[1],t[2],t[3],t[4],t[5])
				sleep(t[6])
			end
			count = count + 1
		end
		if  count > 2 then
			print("�ȴ���Ϣ��ʱ - ��������")
			return
		end
	end
end

function ����.�ӿ����ð�ʯ()
	if Ч��.ʶ��({304,692,340,724},"��.") then
		sleep(200)
		print("�ӿ����ʯ")
		if ����.Ч��ѡ�а�ʯ() then
			tap (349,1084)
			sleep(200)
			return true
		end
	end
	return false
end

function ����.����ʯ()
	if ʶ��.ʶͼ(384,655,412,685,"Ч��-������һ�ſ�",0.8,0) or ʶ��.ʶͼ(461,654,490,685,"Ч��-������һ�ſ�",0.8,0) then
		sleep(200)
		print("��һ���ֿ�")
		if ����.Ч��ѡ�а�ʯ() then
			tap (349,1084)
			sleep(100)
			return true
		end
	end
	return false
end

function ����.Ч��ѡ�о�����()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,3 do
		if ����.Ч������������() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ�л���()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,3 do
		if ����.Ч����������() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end


function ����.Ч��ѡ�о�����()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,3 do
		if ����.Ч������������() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
	
end

function ����.Ч��ѡ�а�ʯ()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,2 do
		if ����.Ч��������ʯ() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ������()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,3 do
		if ����.Ч������������() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ�б�����()
	local ���� = true
	if Ч��.����Ŀ�����() < 3 then ����= false end
	for i=1,3 do
		if ����.Ч������������() then
			
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.����(...)
	t = ...
	TURING.��Դ_��ȡ��Ļ����(t[1],t[2],t[3],t[4])
	TURING.�˾�_��ɫ_��ֵ��("0-140")
	TURING.�и�_��ΧͶӰ�и�(2,1)
	TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/����.lib")
	local ʶ���� = TURING.ʶ��(80)
	if ʶ���� ~= nil and ʶ���� ~= "" then
		local temp = splitStr(ʶ����,"|")
		if temp and next(temp) ~= nil then
			return temp[1]
		end
	else
		return ""
	end
end

function ����.������()
	if "����" == ����.����({108,251,174,290}) then
		print("������")
		return true
	end
	return false
end

function ����.�ں�()
	if "��" == ����.����({41,253,84,294}) then
		print("�ں�")
		return true
	end
	return false
end

function ����.����()
	if "����" == ����.����({144,253,206,290}) then
		print("����")
		return true
	end
	return false
end

function ����.��Ů()
	if "��Ů" == ����.����({144,256,206,290}) then
		print("��Ů")
		return true
	end
	return false
end

function ����.��ʿ()
	if "��ʿ" == ����.����({144,255,205,287}) then
		print("��ʿ")
		return true
	end
	return false
end

function ����.��ʯ()
	if "��ʯ" == ����.����({144,255,205,287}) then
		print("��ʯ")
		return true
	end
	return false
end

function ����.�ǰ�()
	if "�ǰ�" == ����.����({109,252,172,289}) then
		print("�ǰ�")
		return true
	end
	return false
end

function ����.����()
	if "����" == ����.����({144,256,207,287}) then
		print("����")
		return true
	end
	return false
end

function ����.����()
	if "��" == ����.����({143,256,176,288}) then
		print("����")
		return true
	end
	return false
end

function ����.����()
	if "����" == ����.����({80,256,143,287}) then
		print("����")
		return true
	end
	return false
end

function ����.������()
	if "����" == ����.����({44,253,111,290}) then
		print("������")
		return true
	end
	return false
end

function ����.������()
	if "����" == ����.����({140,254,208,289}) then
		print("����")
		return true
	end
	return false
end

function ����.�Ծֳ�ʼ��()
	����.ͨ�ٵ� = false
	����.��ʿ����,����.��ʯ����,����.��Ů����={-1,-1},{-1,-1},{-1,-1}
	����.��ʿ��,����.��ʯ�� =0,0
end

function ����.����1_9�ǹ���(����)
	local t
	local t_��ɫ
	if ���� == "8" or ����== "9" then
		t_��ɫ = "FFFFFF"
		t =  {{261,736,282,762},{407,736,428,763},{556,737,575,762}}
	elseif ���� == "1" then
		t_��ɫ = "73F17C"
		t = {{266,737,280,765},{412,736,425,763},{559,738,574,763}}
	end
	
	local count = 0
	if ʶ��.����(t[1],"�����ȼ�",{����,t_��ɫ},0.9,0) then count = count +1 end
	if ʶ��.����(t[2],"�����ȼ�",{����,t_��ɫ},0.9,0) then count = count +1 end
	if ʶ��.����(t[3],"�����ȼ�",{����,t_��ɫ},0.9,0) then count = count +1 end
	return count
end

function ����.��������()
	����.����Ƿ� = true
	HUD.��ʾ��Ϣ("���������Ƿ��������")
	for i,var in ipairs(��Χ.�ڳ�ħ��) do
		if ʶ��.�����ɫ(var[1],��ɫ.�ڳ�ħ��[i*2-1],0,0.9) == false and ʶ��.�����ɫ(var[2],��ɫ.�ڳ�ħ��[i*2],0,0.9) == false then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�ħ��[i][1],����.�ҷ�ħ��[i][2],200})
			if ����.����() then
				print("��������")
				����.����Ƿ� = false
				���ڲ���.����հ�(500)
				return
			else
				���ڲ���.����հ�(500)
			end
		end
	end
end

function ����.���忨()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ�����忨")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.���忨,���ƶ�.���忨)
	if �����±� ~= -1 then
		
		���ڲ���.�������(����X,����Y)
		if ����.����Ƿ� == false and ����.����() then
			print("����������")
			�±� = �����±� +1
			goto one
			return
		end
		
		���ڲ���.�϶�����(����X,����Y)
		
		if ���ڲ���.��������() then
			print("�������忨")
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			����.���忨()
		else
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ������忨")
	end
end

function ����.�����ǰ���()
	if ���ڼ��.�ҷ�����() == 3 then
		HUD.��ʾ��Ϣ("�ڳ���������")
		return
	end
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("�����ǰ���")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		
		���ڲ���.�������(����X,����Y)
		if ����.�ǰ�() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return
		end
		
		if ���ڲ���.�����ٻ�()then
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			����.�����ڳ���Ч()
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ���ǰ���")
	end
end

function ����.ͨ�ٰ�ʯ(ѡ��) -- 1 ͨ�� 0 ����
	if ����.ͨ�ٵ� then
		return
	end
	if ����.��ʯ����[1] > -1 then  -- ���������������ٻ�
		���ڲ���.�϶�����(����.��ʯ����[1],����.��ʯ����[2])
		if ѡ�� == 1 then
			if ���ڲ���.ͨ���ٻ�() then
				sleep(�ӳ�.�ٻ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				return
			end
		elseif ѡ�� == 0 then
			if ���ڲ���.���ǹ���() then
				sleep(�ӳ�.�ٻ�)
				if ���ڵȴ�() == 2 then return end
			end
		end
	end
	
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("ͨ�ٰ�ʯ")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.��ʯ() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return
		end
		
		if ѡ�� == 1 then
			if ���ڲ���.ͨ���ٻ�() then
				sleep(�ӳ�.�ٻ�)
				if ���ڵȴ�() == 2 then return end
			end
		elseif ѡ�� == 0 then
			if ���ڲ���.���ǹ���() then
				sleep(�ӳ�.�ٻ�)
				if ���ڵȴ�() == 2 then return end
			end
		end
		sleep(500)
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ�𵽰�ʯ")
	end
end

function ����.ͨ����ʿ()
	if ����.ͨ�ٵ� then
		return
	end
	if ����.��ʿ����[1] > -1 then  -- ���������������ٻ�
		���ڲ���.�϶�����(����.��ʿ����[1],����.��ʿ����[2])
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return
		end
	end
	
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("ͨ����ʿ")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		
		���ڲ���.�������(����X,����Y)
		if ����.��ʿ() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return
		end
		
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ����ʿ")
	end
end

function ����.������ʿЧ��()
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return false
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("������ʿЧ��")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.��ʿ() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return false
		end
		if ���ڲ���.�������ƹ�Ч() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return true
		else
			���ڲ���.����հ�(500)
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ����ʿ")
	end
end

function ����.ʹ�ñ���()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ�ñ���")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.����() then
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				����.ʹ�ñ���()
				
			elseif ���ڼ��.����ħ��()== false and ����.ͨ�ٵ� then
				���ڲ���.����հ�(500)
				return
			else
				���ڲ���.����հ�(500)
				����.ͨ����ʿ()
				if ����.ͨ�ٵ� then
					����.ʹ�ñ���()
				end
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ�������")
	end
end

function ����.��ʯ��ʿ����()
	����.��ʿ����,����.��ʯ����,����.��Ů����={-1,-1},{-1,-1},{-1,-1}
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		����.ͨ�ٵ� = true
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("������ʿ�Ͱ�ʯ����")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.��ʿ() then
			����.��ʿ��  = ����.��ʿ�� +  1
			����.��ʿ����[1],����.��ʿ����[2] = ����X,����Y
			�±� = �����±� + 1
			goto one
			return
		elseif ����.��ʯ()  then
			����.��ʯ��  = ����.��ʯ��  + 1
			����.��ʯ����[1],����.��ʯ����[2] = ����X,����Y
			�±� = �����±� + 1
			goto one
			return
		elseif ����.��Ů() then
			����.��Ů����[1],����.��Ů����[2] = ����X,����Y
			�±� = �����±� + 1
			goto one
			return
		else
			�±� = �����±� + 1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
	end
end

function ����.ͨ����Ů()
	if ����.ͨ�ٵ� then
		return
	end
	
	if ����.��Ů����[1] > -1 then  -- ���������������ٻ�
		���ڲ���.�϶�����(����.��Ů����[1],����.��Ů����[2])
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return
		end
	end
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	HUD.��ʾ��Ϣ("ͨ����Ů")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.��Ů() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return
		end
		
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ����Ů")
	end
end

function ����.ʹ���ں�()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ���ں�")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.�ں�() then
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				for i=1,10 do
					���ڲ���.����հ�(300)
				end
			else
				���ڲ���.����հ�(500)
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("δʶ�������")
	end
end

function ����.�Կ��ж�()
	return ʶ��.�����ɫ(131,824,133,826,��ɫ.�Կ�,0,0.9)
end

function ����.ս�׼�������()
	for i=1,3 do
		if ���ڼ��.����ʶ��("����",i,"��") then
			�ȴ���Ϣ��({����.�ҷ�����[i][1],����.�ҷ�����[i][2],200})
			if ����.������() then
				print(i,"��λ ������")
				ʵ��.��������[i] = ʵ��.��������[i] + 1
				���ڲ���.����հ�(200)
			else
				���ڲ���.����հ�(200)
			end
		end
	end
end

function ����.Ч��������Ů()
	return ʶ��.�����ɫ(2,818,720,820,��ɫ.Ч��_��Ů,0,0.9)
end

function ����.Ч��������ʯ()
	return ʶ��.�����ɫ(2,816,718,818,��ɫ.Ч��_��ʯ,0,0.9)
end

function ����.Ч������������()
	return ʶ��.�����ɫ(6,822,720,824,��ɫ.Ч��_������_2,0,0.9) or ʶ��.�����ɫ(6,810,720,811,��ɫ.Ч��_������_1,0,0.9)
end

function ����.Ч������������()
	return ʶ��.�����ɫ(0,823,720,825,��ɫ.Ч��_������,0,0.9)
end

function ����.Ч����������()
	return ʶ��.�����ɫ(2,815,718,817,��ɫ.Ч��_����,0,0.9)
end

function ����.Ч������������()
	local ��ɫ_t = {"C2C9C8","0|3|CDCBC1|0|10|D8D0BF|0|17|F1E9E0|0|25|CDC5B4|0|33|E1D9CE|0|96|B2D2D2|0|100|78BAC2|0|106|91D3DB|0|111|95D7DF|0|115|B4E7E7"}
	return ʶ��.�����ɫ(0,812,720,814,��ɫ_t,0,0.9)
end

function ����.Ч������������()
	return ʶ��.�����ɫ(0,823,720,825,��ɫ.Ч��_������,0,0.9)
end

function ����.���ܹ���()
	print("����-���ܹ���")
	
	if ���ڼ��.�з�����() == 0 then
		���ڲ���.����Ĭ�Ϲ���()
		return
	end
	
	���ڼ��.���Ϲ��޹�����()
	
	if ʵ��.������[1][2] >= ʵ��.������[1][1] and ʵ��.������[1][2] >= ʵ��.������[1][3] and ʵ��.������[1][2] > 0 then
		����.���ܹ���_2()
		
		if ʵ��.������[1][1] > 0 or ʵ��.������[1][3] > 0 then
			if ʵ��.������[1][1] >= ʵ��.������[1][3] then
				����.���ܹ���_1()
				����.���ܹ���_3()
			else
				����.���ܹ���_3()
				����.���ܹ���_1()
			end
		end
	elseif ʵ��.������[1][1] >= ʵ��.������[1][2] and ʵ��.������[1][1] >= ʵ��.������[1][3] and ʵ��.������[1][1] > 0 then
		����.���ܹ���_1()
		
		if ʵ��.������[1][2] > 0 or ʵ��.������[1][3] > 0 then
			if ʵ��.������[1][2] >= ʵ��.������[1][3] then
				����.���ܹ���_2()
				����.���ܹ���_3()
			else
				����.���ܹ���_3()
				����.���ܹ���_1()
			end
		end
	elseif ʵ��.������[1][3] >= ʵ��.������[1][2] and ʵ��.������[1][3] >= ʵ��.������[1][1] and ʵ��.������[1][3] > 0 then
		����.���ܹ���_3()
		
		if ʵ��.������[1][2] > 0 or ʵ��.������[1][1] then
			if ʵ��.������[1][2] >= ʵ��.������[1][1] then
				����.���ܹ���_2()
				����.���ܹ���_1()
			else
				����.���ܹ���_1()
				����.���ܹ���_2()
			end
		end
	end
end

function ����.���ܹ���_1()
	while (ʵ��.��������[1] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][1] >= ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����2")
			���ڲ���.����_���ܹ���(1,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][1] >= ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����1")
			���ڲ���.����_���ܹ���(1,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][1] >= ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:1����3")
			���ڲ���.����_���ܹ���(1,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
end

function ����.���ܹ���_2()
	while (ʵ��.��������[2] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][2] >= ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����2")
			���ڲ���.����_���ܹ���(2,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][2] >= ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����1")
			���ڲ���.����_���ܹ���(2,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][2] >= ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:2����3")
			���ڲ���.����_���ܹ���(2,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
	
end

function ����.���ܹ���_3()
	while (ʵ��.��������[3] > 0) do
		if ���ڼ��.�з�����() ==  0 then
			���ڲ���.����Ĭ�Ϲ���()
			return
		end
		
		if ʵ��.������[1][3] >= ʵ��.������[2][2] and ʵ��.������[2][2] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����2")
			���ڲ���.����_���ܹ���(3,2)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][3] >= ʵ��.������[2][1] and ʵ��.������[2][1] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����1")
			���ڲ���.����_���ܹ���(3,1)
			if ���ڵȴ�() == 2 then return end
		elseif ʵ��.������[1][3] >= ʵ��.������[2][3] and ʵ��.������[2][3] > -1 then
			HUD.��ʾ��Ϣ("����-���ܹ���-��:3����3")
			���ڲ���.����_���ܹ���(3,3)
			if ���ڵȴ�() == 2 then return end
		else
			break
		end
		sleep(500)
		if ���ڼ��.�з�����() > 0 then
			���ڼ��.���Ϲ��޹�����()
		end
	end
end

function ����.ʶ��(...) -- ��׼:{��Χ},"����"
	t = {...}
	local result = false
	local times = 0
	while (true) do
		-- ���ܻ�ʶ��ʧ�ܣ����ʶ����
		if times >= 12 then
			break
		end

		TURING.��Դ_��ȡ��Ļ����(t[1][1],t[1][2],t[1][3],t[1][4])
		TURING.�˾�_��ɫ_��ֵ��("0-100")
		TURING.�и�_��ΧͶӰ�и�(4,2)
		TURING.�ֿ�_����ʶ���ֿ�(getSdPath() .. "/����1.lib")
		local ʶ���� = TURING.ʶ��(80)
		if ʶ���� ~= nil and ʶ���� ~= "" then
			if ʶ���� == t[2] then
				result = true
				break
			else
				times = times + 1
			end
		else
			times = times + 1
		end
	end
	return result
end

function ����.ҫ����()
	return ����.ʶ��({141,256,208,289}, "ҫ��")
end

function ����.����()
	return ����.ʶ��({45,253,112,289}, "����")
end

function ����.ʿ��()
	return ����.ʶ��({237,250,303,290}, "ʿ��")
end

function ����.����֮��()
	return ����.ʶ��({45,253,112,289}, "����")
end

function ����.ħ����ʿ����()
	return ����.ʶ��({38,249,113,294}, "ħ��")
end

function ����.����֮��()
	return ����.ʶ��({110,250,178,295}, "֮��")
end

function ����.��֮��()
	return ����.ʶ��({79,255,144,288}, "֮��")
end

function ����.��Դ()
	return ����.ʶ��({239,256,303,288}, "��Դ")
end

function ����.������ʿ()
	return ����.ʶ��({46,255,110,287}, "����")
end

function ����.ǹɱ()
	return ����.ʶ��({110,255,174,288}, "ǹɱ")
end

function ����.��ħ��()
	return ����.ʶ��({38,249,145,289}, "��ħ��")
end

function ����.Ч��������Դ()
	local ��ɫ_t  = {"414951","0|2|464E56|0|5|4D525A|0|9|625962|0|12|6B626B|0|15|705F5F|0|18|846161|0|21|836B6B|0|24|796161|0|27|6F5D5D|0|29|525252"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,810,720,812,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч��������Ѩ()
	local ��ɫ_t = {"38434D","0|9|393F48|0|20|2D3942|0|30|4B5760|0|42|4F6164|0|51|ACB1B5|0|57|9DA2A6|0|63|A5AAAE|0|68|ACB1B5|0|75|9DA2A5|0|93|A9AEB2"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,809,720,812,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч������ʿ��()
	local ��ɫ_t = {"603847","0|12|6F3E55|1|35|D4A3D6|1|42|4D2B5E|1|49|5E355E|1|61|6B3E81|1|69|E0B6E4|1|79|BA83D9|1|95|7D399F|1|103|D984EA|1|111|B593B5"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,809,720,811,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч������ħ����ʿ()
	local ��ɫ_t = {"935030","0|12|452404|0|27|924E1E|0|41|652110|0|60|DEBC89|0|81|8E5C43|0|89|DCA574|0|96|402F2F|0|106|513838|0|112|D9B774|0|116|756442"}
	for i=1,5 do
		if ʶ��.�����ɫ(0,810,720,812,��ɫ_t,0,0.8) then
			print("ʶ��ħ����ʿ��λ��")
			return true
		else
			sleep(100)
		end
	end
	print("δʶ��ħ����ʿ��λ��")
	return false
end

function ����.Ч����������()
	local ��ɫ_t = {"443344","0|5|54333B|0|11|874D45|0|22|714048|0|29|604F4F|0|37|7C4949|0|47|327CF0|0|57|43A0D3|0|67|6C4A4A|0|77|8B5149|0|92|4D342C"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,813,720,815,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч����������()
	local ��ɫ_t = {"2F89F4","0|14|1119CF|0|23|060DCC|0|31|060EB3|0|46|235689|0|55|051F96|0|64|4173F1|0|72|0028D5|0|80|0048F2|0|87|55BBEE|0|99|1346DF"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,810,720,812,��ɫ_t,0,0.8) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч������������ʿ()
	local ��ɫ_t = {"1469CF","0|8|2C5EC7|0|15|23B7F8|0|22|44DDFC|0|29|A0F2FA|0|36|A8F4FC|0|42|0645CD|0|48|1B499E|0|58|0B2037|0|68|3B4C6E|0|92|1E4CB7"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,810,720,812,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч��������ħ����ʿ()
	local ��ɫ_t={"020A3C","0|7|010B4F|0|13|04368B|0|18|34ABBC|0|29|52C9DA|0|102|01184A|0|98|012264|0|109|011136|0|112|00134B|0|114|040972|0|117|20289B"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,811,720,813,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч������ҫ����()
	local ��ɫ_t={"925F63","0|6|443E3B|0|22|794D50|0|28|784C4F|0|33|815350|0|40|815452|0|47|B48787|0|53|467FD7|0|59|57AAD5|0|64|35A5D2|0|91|915E61"}
	for i=1,2 do
		if ʶ��.�����ɫ(0,809,720,811,��ɫ_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function ����.Ч��ѡ��������ʿ()
	print("����-ѡ��������ʿ")
	local ���� = true
	local ����= Ч��.����Ŀ�����()
	if ���� < 3 then ����= false end
	for i=1,2 do
		if ����.Ч������������ʿ() then
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ����ħ����ʿ()
	print("����-ѡ����ħ����ʿ")
	local ���� = true
	local ����= Ч��.����Ŀ�����()
	if ���� < 3 then ����= false end
	for i=1,2 do
		if ����.Ч��������ħ����ʿ() then
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ��ʿ��()
	print("����-ѡ��ʿ��")
	local ���� = true
	local ����= Ч��.����Ŀ�����()
	if ���� < 3 then ����= false end
	for i=1,2 do
		if ����.Ч������ʿ��() then
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ������()
	local ���� = true
	local ����= Ч��.����Ŀ�����()
	if ���� < 3 then ����= false end
	for i=1,2 do
		if ����.Ч����������() then
			print("���� - ѡ������֮��")
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ�п�ȥĹ��()
	print("����-ѡ�п�Ƭ��Ĺ")
	local ���� = true
	local ����= Ч��.����Ŀ�����()
	if ���� < 3 then ����= false end
	for i=1,2 do
		if ����.Ч������ҫ����() or ����.Ч����������()  then
			tap(ʶ��X,ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then return false end
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.Ч��ѡ��ħ����ʿ����()
	print("����-ѡ��ħ����ʿ")
	local ���� = true
	local ���� = Ч��.����Ŀ�����()
	if ���� < 3 then
		���� = false
	end

	for i=1,3 do
		if ����.Ч������ħ����ʿ() then
			tap(ʶ��X, ʶ��Y+50)
			sleep(100)
			return true
		end
		if ���� == false then
			return false
		end
		print("��ǰҳδ�ҵ�ħ����ʿ��׼����ҳ")
		���ڲ���.Ч����һҳ()
	end
	return false
end

function ����.������ԴЧ��()
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return false
	end
	local �±� = 1
	print("����-������ԴЧ��")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.��Դ() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return false
		end
		if ���ڲ���.�������ƹ�Ч() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return true
		else
			���ڲ���.����հ�(500)
		end
	else
		���ڲ���.����հ�(500)
		print("����-������ԴЧ��")
	end
end

function ����.����ʿ��Ч��()
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return false
	end
	local �±� = 1
	print("����-����ʿ��Ч��")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڼ��.�з�������()
		for i=1,3 do
			if ʵ��.������[2][i] > 2600 then
				����.ʿ��Ч�� = true
				break
			end
		end
		���ڲ���.�������(����X,����Y)
		if ����.ʿ��() then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return false
		end
		if ���ڲ���.�������ƹ�Ч() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return true
		else
			���ڲ���.����հ�(500)
		end
	else
		���ڲ���.����հ�(500)
		print("����-����ʿ��Ч��")
	end
end

function ����.ʹ�û���֮��()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ�û���֮��")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.����֮��() then
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				����.���翪�� = true
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				����.���翪�� = false
				return
			else
				���ڲ���.����հ�(500)
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		print("����-δʶ�����֮��")
	end
end

function ����.ʹ������()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	HUD.��ʾ��Ϣ("ʹ������")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.����() then
			print("��⵽�������أ���ʼʹ��")
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				return
			else
				���ڲ���.����հ�(500)
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		print("���� - δʶ������")
	end
end

function ����.ʹ����֮��()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	print("ʹ����֮��")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.��֮��() then
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				return
			else
				���ڲ���.����հ�(500)
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		print("����-δʶ����֮��")
	end
end

function ����.ʹ��ǹɱ()
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	print("ʹ��ǹɱ")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		if ����.ǹɱ() then
			���ڲ���.�϶�����(����X,����Y)
			if ���ڼ��.����ħ��() then
				tap(278,941)
				sleep(�ӳ�.ħ�����ӳ�)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
				return
			else
				���ڲ���.����հ�(500)
				return
			end
		else
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		print("����-δʶ��ǹɱ")
	end
end

function ����.�������()
	����.ħ����ʿ���� = 0
	����.�������� = 0
	����.ʿ������ = 0
	����.�������� = 0
	����.�������� = 0
	����.��Դ���� = 0
	����.������ = 0
	����.��֮������ = 0
	����.ħ����ʿ���� = {-1, -1}

	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		����.ͨ�ٵ� = true
		return
	end

	local �±� = 1
	print("���� - ���������ϸ����")
	-- ����˼·
	-- �����޿���ħ���������жϺ�ѭ��������ѭ������
	-- ���޿�ֻҪ�жϵ�ħ����ʿ/����֮�����������޿�ֱ������
	::one::
	local �����±� = ʶ������(��, �±�, ��ɫ.Ч������, ���ƶ�.���޿�)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		local x,y = ����X,����Y
		if ����.ħ����ʿ����() then
			����.������ = ����.������ + 1
			����.ħ����ʿ���� = ����.ħ����ʿ���� + 1
			����.ħ����ʿ���� = {x,y}
			�±� = �����±� + 1
			goto one
			return
		elseif ����.����֮��() then
			����.������ = ����.������ + 1
			����.�������� = ����.�������� + 1
			�±� = �����±� + 1
			goto one
			return
		elseif ����.ҫ����() then
			����.������ = ����.������ + 1
			�±� = �����±� + 1
			goto one
			return
		elseif ����.ʿ��() then
			����.������ = ����.������ + 1
			����.ʿ������ = ����.ʿ������  +  1
			�±� = �����±� + 1
			goto one
			return
		elseif ����.��Դ() then
			����.������ = ����.������ + 1
			����.��Դ���� = ����.��Դ����  + 1
			�±� = �����±� + 1
			goto one
			return
		else
			�±� = �����±� + 1
			goto one
			return
		end
	else
		print("���� - ���޿�ʶ�����")
	end

	local �±� = 1
	::two::
	local �����±� = ʶ������(��, �±�, ��ɫ.ħ����, ���ƶ�.ħ����)
	if �����±� ~= -1 then
		���ڲ���.�������(����X,����Y)
		local x,y = ����X,����Y
		if ����.����() then
			����.�������� = ����.�������� + 1
			�±� = �����±� + 1
			goto two
			return
		elseif ����.����֮��() then
			����.�������� = ����.�������� + 1
			�±� = �����±� + 1
			goto two
			return
		elseif ����.��֮��() then
			����.��֮������ = ����.��֮������ + 1
			�±� = �����±� + 1
			goto two
			return
		else
			�±� = �����±� + 1
			goto two
			return
		end
	else
		print("���� - ħ����ʶ�����")
	end

	print("������: ", ����.������)
	print("ħ����ʿ: ", ����.ħ����ʿ����)
	print("����֮��: ", ����.��������)
	print("ʿ��: ", ����.ʿ������)
	print("��Դ: ", ����.��Դ����)
	print("����: ", ����.��������)
	print("���糡: ", ����.��������)
	print("��֮��: ", ����.��֮������)
	���ڲ���.����հ�(500)
end

function ����.�ٻ�ħ����ʿ()
	-- ͨ��ħ����ʿǰ�������Ƽ��
	-- ���� 0 ������ͨ��
	if ����.ͨ�ٵ� then
		return
	end
	
	-- ���������������ٻ�
	if ����.ħ����ʿ����[1] > -1 then
		���ڲ���.�϶�����(����.ħ����ʿ����[1],����.ħ����ʿ����[2])
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			return
		end
	end

	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	print("����-�ٻ�ħ����ʿ")
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.Ч������,���ƶ�.���޿�)
	if �����±� ~= -1  then
		���ڲ���.�������(����X,����Y)
		if ����.ħ����ʿ���� then
			���ڲ���.�϶�����(����X,����Y)
		else
			�±� = �����±� + 1
			goto one
			return
		end
		
		if ���ڲ���.ͨ���ٻ�() then
			sleep(�ӳ�.�ٻ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
		end
	else
		���ڲ���.����հ�(500)
		HUD.��ʾ��Ϣ("����-�ٻ�ħ����ʿ")
	end
end

function ����.ʹ��ħ����()
	
	if ���ڼ��.ħ��() == 0 then
		HUD.��ʾ��Ϣ("ħ��������")
		return
	end
	print("����-ʹ��ħ����")
	local �� = ���ڼ��.��������()
	if �� == 0 then
		HUD.��ʾ��Ϣ("û��������")
		return
	end
	local �±� = 1
	::one::
	local �����±� = ʶ������(��,�±�,��ɫ.ħ����,���ƶ�.ħ����)
	if �����±� ~= -1 then
		local ����ħ�������� = ���ڼ��.�ڳ�_����ħ��()
		���ڲ���.�������(����X,����Y)
		
		if ���ڼ��.����ħ��() then
			if ����ħ�������� then
				print("����-�Ѵ��ڳ���ħ����")
				�±� = �����±� +1
				goto one
				return
			end
		end
		
		���ڲ���.�϶�����(����X,����Y)
		
		if ���ڼ��.����ħ��() then
			tap(278,941)
			sleep(�ӳ�.ħ�����ӳ�)
			if ���ڵȴ�() == 2 then return end
			sleep(500)
			����.ʹ��ħ����()
			return
		else
			���ڲ���.����հ�(500)
			�±� = �����±� +1
			goto one
			return
		end
	else
		���ڲ���.����հ�(500)
		return
	end
	
end

function ����.�����ڳ�������Ч��()
	HUD.��ʾ��Ϣ("�����ڳ���Ч��")
	for i=1,3 do
		if ���ڼ��.����ʶ��("����",i,"��") or ���ڼ��.����ʶ��("����",i,"��") then
			sleep(100)
			�ȴ���Ϣ��({����.�ҷ�����[i][1],����.�ҷ�����[i][2],200})
			if ����.����֮��() == false then
				���ڲ���.����հ�(500)
				i = i + 1
				goto one
				return
			end
			if ���ڲ���.�ڳ���Ч() then
				sleep(500)
				if ���ڵȴ�() == 2 then return end
				sleep(500)
			else
				���ڲ���.����հ�(500)
			end
			::one::
		end
	end
end

function ����.����ڳ�����()
	local ��ɫ_t = {"1738B4","-33|0|061699|-40|-12|0B8AFA|-40|-35|1EA6C8|-40|-49|067798|-16|-47|2B5F89|1|-47|4BB1E4|1|-38|6A97CD|1|-24|3580A9|1|-13|5497C6|-15|-16|01022C"}
	return ʶ��.�����ɫ(101,720,101,720,��ɫ_t,0,0.9)
end

function ����.ѡ��һ�ſ�()
	if Ч��.ʶ��({17,692,46,719},"ѡ") and Ч��.ʶ��({124,693,158,722},"��.") then
		print("����-ѡ��һ�ſ��ؿ���")
		if ����.���� then
			local ���� = true
			local ����= Ч��.����Ŀ�����()
			if ���� < 3 then ����= false end
			for i=1,2 do
				if ����.Ч����������() or ����.Ч������ʿ��() or ����.Ч��������Դ() then
					tap(ʶ��X,ʶ��Y+50)
					sleep(100)
					tap(357,1078)
					sleep(100)
					return true
				end
				if ���� == false then return false end
				���ڲ���.Ч����һҳ()
			end
		end
		return false
	end
end

function ����.��Ϣ_��ħ����ʿ()
	return ʶ��.ʶͼ(246,394,248,396,"��ħ����ʿ",0.9,0)
end

function ����.��Ϣ_��������ʿ()
	return ʶ��.ʶͼ(246,394,248,396,"����-����ʿ",0.9,0)
end
function ����.ս��ʶ��й���Ϣ()
	local ���� = {{-1,-1},{-1,-1},{-1,-1}}
	local ���� = {{220,436},{362,443},{497,463}}
	for i=1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��")  then
			sleep(100)
			tap(����[i][1],����[i][2])
			sleep(400)
			����[i][1],����[i][2] = ���ڼ��.��Ϣ_��ֵ("����"),���ڼ��.��Ϣ_��ֵ("����")
			���ڲ���.����հ�(500)
		end
	end
	return ����
end

function ����.ս��ʶ���ҹ���Ϣ()
	local ���� = {{0,-1,-1},{0,-1,-1},{0,-1,-1}}
	local ���� = {{214,686},{362,707},{510,718}}
	for i=1,3 do
		if ���ڼ��.����ʶ��(nil,i,"��")  then
			sleep(100)
			tap(����[i][1],����[i][2])
			sleep(400)
			����[i][2],����[i][3]= ���ڼ��.��Ϣ_��ֵ("����"),���ڼ��.��Ϣ_��ֵ("����")
			if ����.��Ϣ_��������ʿ() then ����[i][1] = 1 end
			if ����.��Ϣ_��ħ����ʿ() then ����[i][1] = 2 end
			���ڲ���.����հ�(500)
		end
	end
	return ����
end

function ����.���ܹ���()
	local �й�����,�ҹ����� = ����.ս��ʶ��й���Ϣ(),����.ս��ʶ���ҹ���Ϣ()
	if �ҹ�����[1][1] == 1 then
		if �ҹ�����[1][2] < �й�����[1][1] and �ҹ�����[1][2] > �й�����[1][2] and �й�����[1][1] ~= -1  then
			print("����-ս��-������ʿ-1��1")
			���ڲ���.����_���ܹ���(1,1)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[1][2] < �й�����[2][1] and �ҹ�����[1][2] > �й�����[2][2] and �й�����[2][1] ~= -1  then
			print("����-ս��-������ʿ-1��2")
			���ڲ���.����_���ܹ���(1,2)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[1][2] < �й�����[3][1] and �ҹ�����[1][2] > �й�����[3][2] and �й�����[3][1] ~= -1 then
			print("����-ս��-������ʿ-1��3")
			���ڲ���.����_���ܹ���(1,3)
			if ���ڵȴ�() == 2  then return end
		end
		
	end
	
	if ���ڼ��.�з�����() == 0 then
		���ڲ���.����Ĭ�Ϲ���()
		return
	end
	
	if �ҹ�����[2][1] == 1 then
		if �ҹ�����[2][2] < �й�����[1][1] and �ҹ�����[2][2] > �й�����[1][2] and �й�����[1][1] ~= -1  then
			print("����-ս��-������ʿ-2��1")
			���ڲ���.����_���ܹ���(2,1)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[2][2] < �й�����[2][1] and �ҹ�����[2][2] > �й�����[2][2] and �й�����[2][1] ~= -1  then
			print("����-ս��-������ʿ-2��2")
			���ڲ���.����_���ܹ���(2,2)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[2][2] < �й�����[3][1] and �ҹ�����[2][2] > �й�����[3][2] and �й�����[3][1] ~= -1 then
			print("����-ս��-������ʿ-2��3")
			���ڲ���.����_���ܹ���(2,3)
			if ���ڵȴ�() == 2  then return end
		end
	end
	
	if ���ڼ��.�з�����() == 0 then
		���ڲ���.����Ĭ�Ϲ���()
		return
	end
	
	if �ҹ�����[3][1] == 1 then
		if �ҹ�����[3][2] < �й�����[1][1] and �ҹ�����[2][2] > �й�����[1][2] and �й�����[1][1] ~= -1  then
			print("����-ս��-������ʿ-3��1")
			���ڲ���.����_���ܹ���(3,1)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[3][2] < �й�����[2][1] and �ҹ�����[3][2] > �й�����[2][2] and �й�����[2][1] ~= -1  then
			print("����-ս��-������ʿ-3��2")
			���ڲ���.����_���ܹ���(3,2)
			if ���ڵȴ�() == 2  then return end
		elseif �ҹ�����[3][2] < �й�����[3][1] and �ҹ�����[3][2] > �й�����[3][2] and �й�����[3][1] ~= -1 then
			print("����-ս��-������ʿ-3��3")
			���ڲ���.����_���ܹ���(3,3)
			if ���ڵȴ�() == 2  then return end
		end
	end
	
	if ���ڼ��.�з�����() == 0 then
		���ڲ���.����Ĭ�Ϲ���()
		return
	end
	
	���ڲ���.���ܹ���()
end

writeLog("��������ʶ��������سɹ�......")

