require("系统命令库")
require("参数库")
检测 = {}
判断 ={}
结算处理 = {}
精确 = {}
效果 ={}
基本 ={}
局外操作={}
局内操作={}
局内检测={}
局外检测={}

白龙 = {
	通召点 = false,
	贤士数 = 0,
	白石数 = 0,
	白石坐标 = {-1, -1},
	贤士坐标 = {-1, -1},
	少女坐标 = {-1, -1},
	摄理盖放 = true,
	其他通召 = 字符串转布尔(功能设置arr["多选-白龙-通召"]),
	机龙开关 = false,
	爆裂龙开关 = false
}

盖亚 = {
	开关 = false,
	通召点 = false,
	技能开关 = false,
	魔道骑士数量 = 0,
	狱炎数量 = 0,
	士兵数量 = 0,
	征服数量 = 0,
	混沌数量 = 0,
	本源数量 = 0,
	怪数量 = 0,
	龙之镜数量 = 0,
	魔道骑士开关 = false,
	炼狱开关 = false,
	士兵开关 = false,
	本源开关 = false,
	混沌开关 = false,
	魔道骑士坐标 = {-1, -1},
	诅咒之龙效果 = false,
	怪效强制开关 = false,
	士兵效果 = false
}

function 局内检测.敌方生命值()
	TURING.来源_获取屏幕像素(45,86,216,198)
	TURING.滤镜_彩色_二值化("0-205")
	TURING.切割_连通区域切割(true)
	TURING.字库_加载识别字库(getSdPath() .. "/生命值.lib")
	local 识别结果 = TURING.识别(85)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		return  math.tointeger(识别结果)
	end
	return -1
end

function 局内检测.敌方场地()
	local 颜色_t = {"AA9999","0|3|AA9999|0|9|AA9999|0|15|A89998|4|15|AC9B9B|10|15|AA9999|14|15|AA9999|18|15|AA9999|23|15|AA9999|27|15|AA9999|32|15|AA9999"}
	return 识别.多点找色(581,517,583,519,颜色_t,0,0.9) == false
end

function 识别手牌(...) -- 量,下标,颜色数组,相似度
	local t = {...}
	local temp ={}
	if t[1] ==  7 then
		temp = 范围.手牌识别_7
	elseif t[1] == 6 then
		temp = 范围.手牌识别_6
	elseif t[1] == 5 then
		temp = 范围.手牌识别_5
	elseif t[1] == 4 then
		temp = 范围.手牌识别_4
	elseif t[1] == 3 then
		temp = 范围.手牌识别_3
	elseif t[1] == 2 then
		temp = 范围.手牌识别_2
	elseif t[1] == 1 then
		temp = 范围.手牌识别_1
	end
	
	if #t == 4 then
		for i=t[2],t[1] do
			for j, v in ipairs(t[3]) do
				if 识别.多点找色(temp[i],v,0,t[4]) then
					手牌X,手牌Y = 识别X,识别Y
					return i
				end
			end
		end
	elseif #t == 5 then
		for i=t[2],t[1] do
			for j=1,7 do
				if 识别.多点找色(temp[i],t[3][j],0,t[5]) or 识别.多点找色(temp[i],t[4][j],0,t[5]) then
					手牌X,手牌Y = 识别X,识别Y
					return i
				end
			end
		end
	end
	return -1
end

function 局内检测.手牌数量()
	local time = tickCount()
	while(true) do
		for j=7,1,-1 do
			if 识别.多点找色(范围.手牌数量_1[j],颜色.手牌数量_1[j],0,0.9) or 识别.多点找色(范围.手牌数量_2[j],颜色.手牌数量_2[j],0,0.9) then
				return j
			end
		end
		if tickCount() - time > 500 then
			print("无手牌")
			break
		end
	end
	return 0
end

function 局外操作.使用决斗珠()
	局外操作.返回主界面()
	sleep(1000)
	HUD.提示信息("使用决斗珠")
	local time = tickCount()
	while(true) do -- 进入物品界面
		if 识别.识图(338,69,370,100,"物品界面",0.8,0) then
			sleep(500)
			break
		else
			tap(38,79)
			sleep(1000)
		end
		if tickCount() - time > 30000 then
			print("进入-使用决斗珠-界面超时...")
			局外操作.返回主界面()
			局外操作.使用决斗珠()
			return
		end
		
	end
	if 识别.识图(366,350,506,397,"决斗珠-使用",0.8,1) and UI_in.决斗珠次数 > 0 then
		sleep(2000)
		local time = tickCount()
		while(true) do
			if 识别.识图(485,691,519,724,"决斗珠-确认",0.8,1) then
				UI_in.决斗珠次数 = UI_in.决斗珠次数 - 1
				print("决斗珠 剩余次数:" , UI_in.决斗珠次数 )
				local time_2 = tickCount()
				while (true) do
					if 识别.识图(342,704,377,738,"决斗珠-好",0.8,1) then
						sleep(2000)
						break
					end
					if tickCount() - time_2 > 20000 then
						局外操作.返回主界面()
						break
					end
				end
				路人强制开关 = true
				路人()
			end
			if tickCount() -  time > 20000 then
				print("使用决斗珠-超时...")
				局外操作.返回主界面()
				局外操作.使用决斗珠()
				return
			end
		end
	else
		路人强制开关  = false
	end
	print("使用决斗珠完毕")
end

function 局外检测.主界面等级()
	if UI_in.切换角色开关  == false and 局外检测.主界面()== false then
		return
	end
	local 等级 =0
	if 识别.识图(661,1161,693,1192,"满级-2",0.8,0) then
		print("满级")
		切换角色({50,300,90,520})
		return
	end
	
	TURING.来源_获取屏幕像素(625,1109,705,1176)
	TURING.滤镜_彩色_二值化("0-240")
	TURING.切割_连通区域切割(true)
	TURING.字库_加载识别字库(getSdPath() .. "/主界面_结算_等级.lib")
	local 识别结果 = TURING.识别(80,1)
	if 识别结果 ~= nil and 识别结果 ~= "" then    -- 注意：空值判断
		local temp = splitStr(识别结果,"|")
		print("局外检测.主界面等级")
		print(temp)
		if temp and next(temp) ~= nil then
			等级 = math.tointeger(temp[1])
		else
			等级 = 0
		end
	else
		等级 = 0
	end

	if UI_in.等级 < 等级  then
		print("切换角色")
		切换角色({50,300,90,520})
	end
end

function 局外检测.结算等级()
	if UI_in.切换角色开关  == false then
		return
	end
	local 等级 = 0
	if 识别.识图(581,496,616,536,"满级",0.8,0) then
		print("满级")
		切换角色({50,300,90,520})
		return
	end
	if 识别.找字(范围.结算_升级奖励,"结算处理",字库.结算_升级奖励,0.9,0) == false  then
		for i=1,5 do
			局外操作.点击空白(200)
		end
	end
	TURING.来源_获取屏幕像素(432,493,657,629)
	TURING.滤镜_彩色_二值化("0-240")
	TURING.切割_连通区域切割(true)
	TURING.字库_加载识别字库(getSdPath() .. "/主界面_结算_等级.lib")
	local 识别结果 = TURING.识别(80,1)
	if 识别结果 ~= nil and 识别结果 ~= "" then    -- 注意：空值判断
		local temp = splitStr(识别结果,"|")
		if temp and next(temp) ~= nil then
			等级 = math.tointeger(temp[1])
		else
			等级 =  0
		end
	else
		等级 =  0
	end
	if UI_in.等级 < 等级  then
		print("切换角色")
		切换角色({50,300,90,520})
	end
end

function 局外操作.切换角色(x,y)
	sleep(1000)
	tap(x,y)
	sleep(1000)
	local time = tickCount()
	while (true) do
		if 识别.识图(415,590,448,623,"是否更改角色",0.8,0) then
			tap (515,700)
			sleep(2000)
			局外操作.返回主界面()
			return
		end
		
		识别.识图(340,1214,379,1251,"切换角色-好",0.8,1)
		
		识别.识图(328,1216,361,1251,"切换角色-保存",0.8,1)
		
		if tickCount() - time > 2*60000 then
			print("切换角色-操作-失败")
			局外操作.返回主界面()
			切换角色({50,300,90,520})
			return
		end
	end
end

function 局外检测.卡组_等级(...)
	local t = ...
	TURING.来源_获取屏幕像素(t[1],t[2],t[3],t[4])
	TURING.滤镜_彩色_二值化("0-175")
	TURING.切割_连通区域切割(true)
	TURING.字库_加载识别字库(getSdPath() .. "/等级_175.lib")
	local 识别结果 = TURING.识别(80,1)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		local temp =splitStr(识别结果,"|")
		if temp and next(temp) ~= nil then
			print("等级: ",temp[1])
			return math.tointeger(temp[1])
		end
	end
	print("等级: ",45)
	return 45
end

function 局外检测.复制卡组界面()
	return 识别.识图(412,127,440,158,"选择目标卡组",0.8,0)
end

function 局外操作.进入复制卡组界面()
	局外操作.返回主界面()
	HUD.提示信息("进入切换角色界面")
	local time = tickCount()
	while ( true) do
		if 局外检测.复制卡组界面() then
			break
		end
		
		if 局外检测.主界面() then
			tap (467,1119)
			sleep(1000)
			tap (390,1021)
			sleep(500)
		end
		
		识别.识图(422,1216,449,1249,"复制卡组按钮",0.8,1)
		
		if 识别.识图(52,480,83,520,"复制卡组方式",0.8,0) then
			tap(508,792)
			sleep(200)
		end
		
		if tickCount() - time > 60000  then
			局外操作.进入复制卡组界面()
		end
	end
	sleep(2000)
end

function 局外检测.等级_等(...)
	t = ...
	return 识别.图灵识字(t,"等级数字_2_175","等","0-150",0.8)
end

function 局外检测.休闲入口()
	-- local 颜色_t = {"1B5E33","13|0|125921|37|0|0C722E|50|0|00CCFF|85|0|00CCFF|143|5|00CCFF|193|5|00CCFF|243|5|00CCFF|243|41|05A408|194|42|05A408|136|63|05A408"}
	local 颜色_t = {"1A652E", "14|-8|29672D|28|96|13AE17|-8|99|40CE44|8|43|003012|29|13|002309|3|82|0AA70D"}
	return 识别.多点找色(5, 300, 53, 1200, 颜色_t, 0, 0.9)
end

function 局外检测.排名入口()
	-- local 颜色_t = {"241604","23|0|D4FF27|52|0|D4FF27|79|-1|C9EF24|129|16|D4FF27|207|16|D4FF27|296|16|D4FF27|289|73|FE0000|153|82|000000|115|83|FF0000|25|93|FF0000"}
	local 颜色_t = {"FF0000","-12|-82|291C02|9|-83|432E07|-15|25|FF4100|3|21|FF0000|7|-33|5E4D1D|-9|-66|281A01"}
	return 识别.多点找色(5, 100, 50, 1200, 颜色_t, 0, 0.9)
end

function 局内检测.敌方结束步骤()
	return 识别.识图(475,66,501,92,"敌方结束阶段",0.8,0)
end

function 局内检测.敌方回合()
	return 识别.识图(391,65,415,90,"对方回合",0.8,0)
end

function 局内检测.魔陷()
	local count = 0
	for i,var in ipairs(范围.在场魔陷) do
		if 识别.多点找色(var[1],颜色.在场魔陷[i*2-1],0,0.9) and 识别.多点找色(var[2],颜色.在场魔陷[i*2],0,0.9) then
			count=count+1
		end
	end
	return count
end

function 局内检测.敌方魔陷()
	local count = 0
	local 范围_t = {
	{190,266,192,268},
	{322,266,324,268},
	{451,310,453,312}
	}
	local 颜色_t = {
	{"9E9D9D","-3|0|A69F9F|-3|3|A39999|-3|7|A29796|-4|10|A59D9D|-4|14|A69E9E|-4|18|A79E9E|-4|22|A69C9C|-4|26|A39998|-4|30|A19796|-5|37|A69E9E"},
	{"9E9D9C","-3|0|A79F9E|-4|4|A59D9D|-4|10|A69D9D|-4|16|A69D9D|-4|21|A69E9E|-4|28|A69E9E|-4|38|A79E9E|-4|45|A79E9E|-4|53|A69D9C|-4|81|A39898"},
	{"A69E9E","-1|-44|A69E9E|-1|-40|A69E9E|-1|-35|A69D9D|-1|-30|A59D9D|-1|-25|A89D9B|0|-19|A49A98|0|-12|A69C9B|0|-6|A79E9E|0|0|A69E9E|0|9|A69D9D"},
	}
	for i=1,3 do
		if 识别.多点找色(范围_t[i],颜色_t[i],0,0.9) == false then
			count = count + 1
		end
	end
	return count
end

function 局内检测.敌方怪兽()
	local count = 0
	for i=1,3 do
		if 局内检测.怪兽识别(nil,i,"敌")  then
			count  = count  + 1
		end
	end
	return count
end

function 局内检测.我方怪兽()
	local count = 0
	for i = 1,3 do
		if 局内检测.怪兽识别(nil,i,"我") then
			count = count + 1
		end
	end
	print("局内检测.我方怪兽: ", count)
	return count
end

function 局内检测.我方攻怪兽()
	local count=0
	for i=1,3  do
		if 局内检测.怪兽识别("攻击",i,"我") then
			count = count +1
		end
	end
	return count
end

function 局内检测.怪兽识别(表示,范围序号,敌我) -- 标准: 表示: 攻守 范围序号 敌我
	local 范围_敌怪  = {{180,409,182,411},{317,419,319,421},{454,416,456,418}}
	local 颜色_敌怪 = {
		{"A79F9D","0|5|A69D9D|0|9|A69E9E|0|14|A69D9D|0|18|A49B9A|-1|36|A79E9E|83|36|A8A097|83|39|A8A097|83|43|A8A097|83|47|A8A097|83|52|A9A097"},
		{"A69D9C","0|6|A69D9C|0|14|A59B9B|0|20|A59B9A|0|25|A39A99|0|33|A29998|84|33|A9A097|84|28|A9A198|84|23|AAA198|84|17|AAA198|84|10|ABA198"},
		{"A39999","0|6|A49B9B|0|13|A69D9C|0|21|A79E9E|0|28|A69D9D|0|37|A59D9D|85|37|A9A197|85|42|A8A097|85|47|A8A097|85|51|A8A097|86|56|AAA096"},
	}
	local 范围_我怪 = {{168,679,170,681},{314,678,316,680},{459,678,461,680}}
	local 颜色_我怪 = {
		{"ABA197","0|6|A8A097|0|12|A8A097|0|19|AA9F93|0|23|AD9D8D|-1|29|A8A097|89|29|A59D9D|89|36|A79C9B|89|42|AD9795|88|48|A69C9C|88|56|A79E9E"},
		{"A8A097","0|7|A8A097|0|15|A8A097|0|23|A8A097|0|31|A79C93|0|39|A79890|89|39|A69C9C|89|46|A59B9B|89|52|A49A9A|89|61|A39899|90|73|A59D9D"},
		{"A99F96","0|7|ABA095|0|15|ADA094|1|21|A8A097|1|28|A8A097|1|35|A8A097|91|35|A69E9E|91|42|A69D9C|92|52|A59D9D|92|60|A79E9E|92|69|A49B9A"},
	}
	if 敌我 == "我" then
		if 识别.多点找色(范围_我怪[范围序号],颜色_我怪[范围序号],0,0.9) == false then
			if 表示 == "攻击" then
				if 识别.图灵识字(范围.我方攻击怪兽[范围序号],"怪兽识别","攻怪",颜色.怪兽识别,0.8) then
					return true
				end
			elseif 表示 == "防御" then
				if 识别.图灵识字(范围.我方防御怪兽[范围序号],"怪兽识别","守怪",颜色.怪兽识别,0.8) then
					return true
				end
			elseif 表示 == nil  then
				return true
			end
		end
	elseif 敌我 == "敌" then
		if 识别.多点找色(范围_敌怪[范围序号],颜色_敌怪[范围序号],0,0.9) == false then
			if 表示 == "攻击" then
				if 识别.图灵识字(范围.敌方攻击怪兽[范围序号],"怪兽识别","攻怪",颜色.怪兽识别,0.8) then
					return true
				end
			elseif 表示 == "防御" then
				if 识别.图灵识字(范围.敌方防御怪兽[范围序号],"怪兽识别","守怪",颜色.怪兽识别,0.8) then
					return true
				end
			elseif 表示 == nil  then
				return true
			end
		end
	end
	return false
end

function 局外检测.主界面()
	return 识别.识图(范围.主界面,"主界面检测",0.8,0)
end

function 局外检测.灰主界面()
	return 识别.识图(26,57,61,106,"灰-主界面",0.9,0)
end

function 局外检测.场景(序号)
	if 序号 == nil then
		for i, var in ipairs(范围.场景) do
			if 识别.图灵识字(var,"场景_150",nil,150,0.8) then
				HUD.提示信息("场景--"..文字.场景[i])
				return i
			end
		end
		return 0
	else
		if 识别.图灵识字(范围.场景[序号],"场景_150",文字.场景[序号],150,0.8) then
			HUD.提示信息("场景--"..文字.场景[序号])
			return true
		end
	end
	
	return false
end

function 局外检测.路人()
	HUD.提示信息("识别路人")
	local t = {}
	if 局外检测.主界面() then
		t = 范围.路人识别[局外检测.场景(nil)]
	else
		局外操作.返回主界面()
		t = 范围.路人识别[局外检测.场景(nil)]
	end

	if t ~= nil then
		for i, var in ipairs(颜色.决斗者) do
			-- print("局外检测.路人 颜色.决斗者")
			if 识别.多点找色(t,var,0,0.9) then
				tap (识别X,识别Y+15)
				local time = tickCount()
				while(true)  do
					if 局外检测.对话() then return true end
					if tickCount() - time > 10000 then
						return false
					end
					sleep(1000)
				end
			end
		end
		
		for i,var in ipairs(颜色.小红帽) do
			-- print("局外检测.路人 颜色.小红帽")
			if 识别.多点找色(t,var,0,0.9) then
				tap (识别X,识别Y+15)
				local time = tickCount()
				while(true)  do
					if 局外检测.对话() then return true end
					if tickCount() - time > 10000 then
						return false
					end
					sleep(1000)
				end
			end
		end
		
		for i,var in ipairs(颜色.普通路人) do
			-- print("局外检测.路人 颜色.普通路人")
			if 识别.多点找色(t,var,0,0.9) then
				tap (识别X,识别Y+15)
				local time = tickCount()
				while(true)  do
					if 局外检测.对话() then return true end
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

function 局外检测.对话()
	return 识别.识图(670,938,706,971,"对话",0.9,0)
end

function 局外检测.路人可刷()
	return 识别.识图(99,54,127,78,"路人剩余检测",0.9,0)
end

function 局外检测.对局胜利()
	return 识别.识图(1,266,26,289,"胜利判定",0.9,0)
end

function 局内检测.局内()
	return 识别.识图(范围.局内检测,"局内检测1.png|局内检测2.png|局内检测3",相似度.局内,0)
end

function 局内检测.操作判断()
	return 识别.识图(60,285,61,286,"操作判断",相似度.操作判断,0) and 识别.识图(264,577,266,579,"期待回复",0.9,0) == false
end

function 局内检测.装备魔法()
	return 识别.识图(370,305,405,342,"装备魔法卡_装",0.8,0)
end

function 局内检测.场地魔法()
	return 识别.识图(330,307,331,308,"场地魔法卡",0.8,0)
end

function 局内检测.速攻魔法()
	return 识别.识图(371,306,404,339,"速攻",0.8,0)
end

function 局内检测.额外无卡()
	return 识别.多点找色(107,976,115,984,颜色.额外无卡,0,0.9)
end

function 局内检测.在场_场地魔法()
	local 范围_t = {123,765,126,767}
	return 识别.多点找色(范围_t,颜色.场地魔法,0,0.9) == false
end

function 局内检测.墓地()
	return 识别.多点找色(586,634,594,642,颜色.墓地,0,0.9) == false
end

function 局外检测.路人_自动决斗()
	return 识别.识图(464,1089,494,1136,"路人_自动决斗",0.8,0)
end

function 局内检测.识别攻击力(范围)--标准:范围数组
	TURING.来源_获取屏幕像素(范围[1],范围[2],范围[3],范围[4])
	TURING.滤镜_彩色_二值化("FFFFFF|7272FF|FFBA57|C2C2C2")
	TURING.切割_范围投影切割(2,1)
	TURING.字库_加载识别字库(getSdPath() .. "/攻击力字库.lib")
	local 识别结果 = TURING.识别(85)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		return 识别结果
	else
		return 0
	end
end

function 局内检测.信息_数值(目标) --字符串: 攻击 or 防御
	if 目标 == "攻击" then
		TURING.来源_获取屏幕像素(371,308,447,339)
	elseif 目标 == "防御" then
		TURING.来源_获取屏幕像素(573,309,648,338)
	end
	TURING.滤镜_彩色_二值化("FFFFFF|FEFEFE|FFBA57|FEB957|7272FF|7272FE")
	TURING.切割_连通区域切割(true)
	TURING.字库_加载识别字库(getSdPath() .. "/信息-攻击力.lib")
	local 识别结果 = TURING.识别(85)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		local temp = splitStr(识别结果,"|")
		if temp and next(temp) ~= nil then
			return math.tointeger(temp[1])
		end
	end
	return 0
end

function 局内检测.场上怪兽攻击力()
	实况.攻击力={{-1,-1,-1},{-1,-1,-1}}
	for i=1,3 do
		if 局内检测.怪兽识别(nil,i,"我") then
			实况.攻击力[1][i]=math.tointeger(局内检测.识别攻击力(范围.我方攻击力[i]))
		end
		if 局内检测.怪兽识别(nil,i,"敌") then
			实况.攻击力[2][i]=math.tointeger(局内检测.识别攻击力(范围.敌方攻击力[i]))
		end
	end
end

function 局内检测.敌方攻击力()
	实况.攻击力[2] = {-1,-1,-1}
	for i=1,3 do
		if 局内检测.怪兽识别(nil,i,"敌") then
			实况.攻击力[2][i]=math.tointeger(局内检测.识别攻击力(范围.敌方攻击力[i]))
		end
	end
	return 实况.攻击力[2]
end

function 局内检测.金宫()
	local 颜色_金宫 = {"F0AE8D","33|2|7AE6F6|63|2|DF9574|62|-28|217FA8|62|-54|316B70|30|-54|4A989D|-2|-54|327E82|13|-36|40BFDD|47|-36|1C819E|32|-47|194B66|33|-23|73BFE3"}
	return 识别.多点找色(590,502,592,504,颜色_金宫,0,0.9)
end

function 局内检测.吃坑()
	local 颜色_t = {"F6F6F6","4|61|FFFFFF|4|74|F9F9F9|4|93|FFFFFF|-50|76|FFFFFF|4|113|FFFFFF|-55|51|FFFFFF|60|44|FFFFFF|61|55|FFFFFF|61|64|FFFFFF|57|77|FFFFFF"}
	return 识别.多点找色(0,826,720,828,颜色_t,0,0.9)
end

function 局内检测.行动步骤()
	return 识别.识图(473,64,500,91,"行动步骤_行",相似度.行动步骤,0)
end

function 局内检测.战斗步骤()
	return 识别.识图(474,63,500,91,"战斗阶段_战",相似度.战斗步骤,0)
end

function 局内检测.发动技能()
	return 识别.识图(508,354,548,393,"发动技能",0.8,1)
end

function 局内检测.战斗步骤不可结束()
	return 识别.识图(612,778,697,855,"战斗不可结束",0.8,0)
end

function 局外检测.传送门界面()
	return 识别.识图(8,56,39,89,"传送门界面",0.8,0)
end

function 局外检测.传送门倍率()
	local 范围 = {552,1218,579,1249}
	if 识别.识图(范围,"传送门1倍",0.8,0) then
		return 1
	elseif 识别.识图(范围,"传送门2倍",0.8,0) then
		return 2
	elseif 识别.识图(范围,"传送门3倍",0.8,0) then
		return 3
	end
	return 0
end

function 局外检测.传送门决斗_1()
	return 识别.识图(317,1086,364,1134,"传送门决斗-1",0.8,0)
end

function 局外检测.休闲决斗()
	return 识别.识图(317,382,367,430,"休闲决斗_决",0.7,0)
end

function 局外检测.排名决斗()
	return 识别.识图(315,541,366,587,"排名决斗_决",0.7,0)
end

function 局内检测.局内弹窗_1()
	local 颜色_弹窗_1 = {
		{"BBAA53","5|0|B5A14F|10|0|AE9D4C|13|0|6D5113|17|0|AF9D4C|21|0|8E7D33|26|0|BBAA51|23|5|BBAA55|13|5|BB9B53|5|5|B5A14F|0|5|BBAA55"},
		{"BBAA52","5|0|B5A150|10|0|AE9D4B|17|0|AF9D4C|21|0|8E7D30|27|0|C0AA52|33|0|BBA346|33|5|A29043|26|5|A29040|15|5|A69541|4|5|A18F42"},
		{"9B8A3C","6|0|B5A14F|11|0|AE9D4C|18|0|AF9D4C|23|0|B5A450|29|0|A3903C|29|5|A19039|23|5|B5A350|14|5|AE904B|4|5|BBAA54|0|5|9B8A41"},
		{"BBAA55","2|0|BBAA55|5|0|B5A14F|10|0|AE9D4C|14|0|685520|17|0|AE9D4C|21|0|8E7D37|16|6|907F33|13|6|907833|5|6|856B28|-1|6|786426"},
		{"9B8A3E","6|0|B5A14F|11|0|AE9D4C|18|0|AF9D4C|22|0|8F7E32|29|0|A5903E|29|5|998732|17|5|B1A04D|6|5|A99445|3|5|AF9C4B|0|5|93813B"},
	}
	local 范围_t = {{517,323,519,325},{517,526,519,528},{516,296,518,298},{517,528,519,530},{516,403,518,405},{517,512,519,514},}
	for i,v in ipairs(范围_t) do
		for j,v_1 in ipairs(颜色_弹窗_1) do
			if 识别.多点找色(v,v_1,0,0.9) then
				print("效果-弹窗-1")
				return true
			end
		end
	end
	return false
end


function 判断.路人闹钟() -- 到点了 返回 true
	if UI_in.路人开关 and tickCount() - UI_in.清路时间 >= 实况.初始清路时间 then
		实况.初始清路时间 = tickCount()
		return true
	else
		HUD.提示信息("路人倒计时: "..运算.毫秒转分钟(UI_in.清路时间 + 实况.初始清路时间 - tickCount()).." 分钟")
	end
	return false
end

function 结算处理.礼盒双升()
	if 识别.识图(267,407,294,432,"礼盒-双升",0.8,0) then
		if UI_in.礼盒双升 then
			tap (509,914)
		else
			tap(209,920)
		end
	end
end

function 结算处理.排名()
	HUD.提示信息("排名结算中..")
	local 颜色_下一步 = {"6E2B07","5|0|FFFFFF|30|0|FFFFFF|32|11|7F3208|42|11|FFFFFF|62|11|FFFFFF|65|11|522006|76|10|FFFFFF|95|10|FFFFFF|100|10|7D3108|82|21|FFFFFF"}
	if 局外检测.主界面() then
		局外检测.主界面等级()
		局外操作.进入排名()
		return
	end
	if 局外检测.排名决斗()== false and 局外检测.排名入口() then
		sleep(500)
		tap(识别X,识别Y)
		sleep(500)
	end
	
	局外操作.结算_好()
	
	if 局内检测.局内() then
		对局.启动(1)
	end
	
	if 局外操作.结算_升级奖励() == false and 局外操作.结算_决斗评价() == false then
		局外操作.结算_下一步()
	end
	识别.识图(205, 1178, 517, 1256,"通用_下一步",0.9,1)
	if 识别.多点找色(309,128,311,1210,颜色_下一步,0,0.9) then
		tap(识别X,识别Y)
		sleep(100)
	end
	if 局外检测.灰主界面() then
		局外操作.返回主界面()
		局外操作.进入排名()
		return
	end
	局外操作.点击空白(300)
end

function 结算处理.休闲()
	HUD.提示信息("休闲结算中..")
	if 局外检测.休闲决斗() == false and 局外检测.休闲入口()  then
		tap(识别X,识别Y)
		sleep(1000)
	end
	
	局外操作.结算_好()
	
	if 局内检测.局内() then
		对局.启动(1)
	end
	
	if 局外操作.结算_升级奖励() == false and 局外操作.结算_决斗评价() == false then
		结算处理.礼盒双升()
		局外操作.结算_下一步()
	end
	
	if 局外检测.主界面() then
		局外检测.主界面等级()
		局外操作.进入休闲()
		return
	end
	
	if 局外检测.灰主界面() then
		局外操作.返回主界面()
		局外操作.进入休闲()
		return
	end
	
	局外操作.点击空白(300)
end

function 结算处理.路人()
	local 计时开关 = false
	local 初始时间 =0
	while(局外检测.主界面()== false) do
		if 计时开关 == false and 局内检测.局内() then
			计时开关 = true
			HUD.提示信息("路人 - 对局中")
		end
		if 计时开关 and 局内检测.局内() == false then
			初始时间 = tickCount()
			计时开关 = false
			HUD.提示信息("路人 - 结算中")
		end
		局外操作.结算_好()
		if 局外操作.结算_升级奖励() == false and 局外操作.结算_决斗评价() == false then
			结算处理.礼盒双升()
			局外操作.结算_下一步()
		end
		局内操作.点击空白(500)
		--识别.识图(310,1210,407,1257,"路人_取消",0.8,1)
		if 初始时间 ~= 0 and tickCount() - 初始时间 > 30000 then
			局外操作.返回主界面()
			sleep(1000)
			return
		end
	end
	sleep(1000)
end

function 结算处理.传送门()
	local 初始时间  = tickCount()
	HUD.提示信息("传送门结算中..")
	while (true) do
		
		if 局外检测.主界面() then
			break
		end
		
		if tickCount() -初始时间 >  60000 then
			writeLog("传送门结算超时 -- 返回主界面")
			局外操作.返回主界面()
			return
		end
		
		局外操作.结算_好()
		
		if 局外检测.对话() then
			局内操作.点击空白(200)
		end
		
		if 局外操作.结算_升级奖励() == false and 局外操作.结算_决斗评价() == false then
			结算处理.礼盒双升()
			局外操作.结算_下一步()
		end
		
		局外操作.结算_下一步()
		
		if 局外检测.灰主界面() then
			局外操作.返回主界面()
			return
		end
		
		局外操作.点击空白(200)
	end
	sleep(500)
end

function 局外操作.进入排名()
	局外操作.返回主界面()
	HUD.提示信息("进入排名...")
	local time = tickCount()
	while(局外检测.排名决斗() == false) do
		if 局外检测.主界面() and 局外检测.场景(2) then
			tap (275,1238)
			sleep(500)
		elseif 局外检测.主界面() and 局外检测.场景(2) == false then
			tap (275,1238)
			sleep(500)
			tap (275,1238)
			sleep(500)
		end
		if 局外检测.排名入口() then
			sleep(500)
			tap(识别X,识别Y)
			for i=1,10 do
				sleep(500)
				if 局外检测.排名决斗() then
					return
				end
			end
		end
		if (tickCount() - time > 40000 or 局外检测.灰主界面() ) and 局外检测.排名决斗()==false then
			局外操作.返回主界面()
			局外操作.进入排名()
			return
		end
	end
end

function 局外操作.进入休闲()
	局外操作.返回主界面()
	HUD.提示信息("进入休闲...")
	local time =tickCount()
	while(局外检测.休闲决斗() == false) do
		if 局外检测.主界面() and 局外检测.场景(2) then
			tap (275,1238)
			sleep(500)
		elseif 局外检测.主界面() and 局外检测.场景(2) == false then
			tap (275,1238)
			sleep(500)
			tap (275,1238)
			sleep(500)
		end
		if 局外检测.休闲入口() then
			sleep(500)
			tap(识别X,识别Y)
			sleep(500)
		end
		if (tickCount() - time > 40000 or 局外检测.灰主界面() )  and 局外检测.休闲决斗() == false then
			局外操作.返回主界面()
			局外操作.进入休闲()
			return
		end
	end
end

function 局外操作.传送门准备()
	local 初始时间 = tickCount()
	while (true) do
		if 局外检测.传送门界面() then
			局外操作.选择传送门等级()
			if 局外操作.传送门选择倍率() == false and 局外操作.传送门翻页()then
				print("没钥匙了")
				局外操作.返回主界面()
				模式局数 = 0
				return false
			else
				tap (356,1113 )-- 点击对决
				sleep(1000)
				for i=1,20 do
					if 识别.识图(613, 956, 667, 1000, "传送门_物品",0.8,0) then
						sleep(500)
						tap (362,1107) -- 点击决斗
						break
					end
					局外操作.对话快进()
					识别.识图(473, 693, 522, 747, "传送门_弹窗_确认",0.8,1)
					局内操作.点击空白(500)
				end
				return true
			end
		else
			if tickCount() - 初始时间 >  10000 then
				局外操作.进入传送门()
			end
		end
	end
end
function 局外操作.传送门选择倍率()
	if 识别.识图(671,1198,707,1226,"倍率判定",0.9,0) == false then
		return false
	end
	if UI_in.传送门倍率 ~= 局外检测.传送门倍率() then
		tap (600,1233) -- 切换倍数
		sleep(1000)
		if UI_in.传送门倍率 == 1 then
			tap(172,817)
		elseif UI_in.传送门倍率 == 2 then
			tap(156,922)
		elseif UI_in.传送门倍率 == 3 then
			tap(209,1027)
		end
		sleep(1000)
		
		if 局外检测.传送门决斗_1() == false then
			tap (49,1233)
			sleep(1000)
			return false
		end
	end
	return true
end

function 局外操作.传送门翻页()
	if UI_in.传送翻页 then
		for i=1,8 do
			tap (701,615)
			sleep(1500)
			局外操作.选择传送门等级()
			if UI_in.传送门倍率 == 局外检测.传送门倍率() then
				return false
			else
				if 局外操作.传送门选择倍率() then
					return false
				end
			end
		end
	end
	return true
end

function 局内操作.智能攻击()
	HUD.提示信息("局内-智能攻击")
	
	if 局内检测.敌方怪兽() == 0 then
		局内操作.怪兽默认攻击()
		return
	end
	
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	局内检测.场上怪兽攻击力()
	
	if 实况.攻击力[1][2] >= 实况.攻击力[1][1] and 实况.攻击力[1][2] >= 实况.攻击力[1][3] and 实况.攻击力[1][2] > 0 then
		局内操作.智能攻击_2()
		
		if 实况.攻击力[1][1] > 0 or 实况.攻击力[1][3] > 0 then
			if 实况.攻击力[1][1] >= 实况.攻击力[1][3] then
				局内操作.智能攻击_1()
				局内操作.智能攻击_3()
			else
				局内操作.智能攻击_3()
				局内操作.智能攻击_1()
			end
		end
	elseif 实况.攻击力[1][1] >= 实况.攻击力[1][2] and 实况.攻击力[1][1] >= 实况.攻击力[1][3] and 实况.攻击力[1][1] > 0 then
		局内操作.智能攻击_1()
		
		if 实况.攻击力[1][2] > 0 or 实况.攻击力[1][3] > 0 then
			if 实况.攻击力[1][2] >= 实况.攻击力[1][3] then
				局内操作.智能攻击_2()
				局内操作.智能攻击_3()
			else
				局内操作.智能攻击_3()
				局内操作.智能攻击_1()
			end
		end
	elseif 实况.攻击力[1][3] >= 实况.攻击力[1][2] and 实况.攻击力[1][3] >= 实况.攻击力[1][1] and 实况.攻击力[1][3] > 0 then
		局内操作.智能攻击_3()
		
		if 实况.攻击力[1][2] > 0 or 实况.攻击力[1][1] then
			if 实况.攻击力[1][2] >= 实况.攻击力[1][1] then
				局内操作.智能攻击_2()
				局内操作.智能攻击_1()
			else
				局内操作.智能攻击_1()
				局内操作.智能攻击_2()
			end
		end
	end
end

function 局内操作.智能攻击_1()
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while (实况.攻击次数[1] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][1] > 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌2")
			局内操作.划动_智能攻击(1,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][1] > 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌1")
			局内操作.划动_智能攻击(1,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][1] > 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌3")
			局内操作.划动_智能攻击(1,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
end

function 局内操作.智能攻击_2()
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while (实况.攻击次数[2] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][2] > 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌2")
			局内操作.划动_智能攻击(2,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][2] > 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌1")
			局内操作.划动_智能攻击(2,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][2] > 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌3")
			局内操作.划动_智能攻击(2,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
end

function 局内操作.智能攻击_3()
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while (实况.攻击次数[3] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][3] > 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌2")
			局内操作.划动_智能攻击(3,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][3] > 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌1")
			局内操作.划动_智能攻击(3,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][3] > 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌3")
			局内操作.划动_智能攻击(3,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
end

function 局内操作.怪兽默认攻击()
	HUD.提示信息("局内-默认攻击")

	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while(实况.攻击次数[2] > 0 ) do
		if 局内检测.怪兽识别("攻击",2,"我") then
			局内操作.划动_默认攻击(坐标.我方怪兽[2])
			实况.攻击次数[2] = 实况.攻击次数[2]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			实况.攻击次数[2] = 0
			break
		end
	end
	
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while (实况.攻击次数[3] > 0 ) do
		if 局内检测.怪兽识别("攻击",3,"我") then
			局内操作.划动_默认攻击(坐标.我方怪兽[3])
			实况.攻击次数[3] = 实况.攻击次数[3]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while(实况.攻击次数[1] > 0 ) do
		if  局内检测.怪兽识别("攻击",1,"我")  then
			局内操作.划动_默认攻击(坐标.我方怪兽[1])
			实况.攻击次数[1] = 实况.攻击次数[1]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
end

function 局内操作.怪兽直接攻击()
	HUD.提示信息("局内-直接攻击")

	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while(实况.攻击次数[2] > 0 ) do
		print("检测2号位怪兽")
		if 局内检测.怪兽识别("攻击",2,"我") then
			print("2号位怪兽 攻击！")
			局内操作.划动_直接攻击(坐标.我方怪兽[2])
			实况.攻击次数[2] = 实况.攻击次数[2]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while (实况.攻击次数[3] > 0 ) do
		print("检测3号位怪兽")
		if 局内检测.怪兽识别("攻击",3,"我") then
			print("3号位怪兽 攻击！")
			局内操作.划动_直接攻击(坐标.我方怪兽[3])
			实况.攻击次数[3] = 实况.攻击次数[3]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
	
	for i = 1, 8 do
		局内操作.点击空白(200)
	end
	while(实况.攻击次数[1] > 0 ) do
		print("检测1号位怪兽")
		if 局内检测.怪兽识别("攻击",1,"我") then
			print("1号位怪兽 攻击！")
			局内操作.划动_直接攻击(坐标.我方怪兽[1])
			实况.攻击次数[1] = 实况.攻击次数[1]-1
			if 局内等待() == 2 then
				return
			end
			sleep(500)
		else
			break
		end
	end
end

function 局内操作.划动_直接攻击(坐标)
	swipe(坐标[1],坐标[2],坐标[1],坐标[2]-500,80)
	sleep(延迟.攻击延迟)
end

function 局内操作.划动_默认攻击(坐标)
	swipe(坐标[1],坐标[2],坐标[1],坐标[2]-150,50)
	sleep(延迟.攻击延迟)
end

function 局内操作.划动_智能攻击(a,b)
	local x1,y1 = 坐标.我方怪兽[a][1],坐标.我方怪兽[a][2]
	local x2,y2 = 坐标.敌方怪兽[b][1],坐标.敌方怪兽[b][2]
	实况.攻击次数[a]=实况.攻击次数[a] -1
	swipe(x1,y1,x2,y2,50)
	sleep(延迟.攻击延迟)
end

function 局外操作.返回主界面()
	local 主界面_下一步 = function()
		local t = {{308,1200,350,1243}}
		for i,v in ipairs(t) do
			if 识别.识图(v,"主界面-下一步",0.8,1) then
				sleep(200)
				return true
			end
		end
		return false
	end
	HUD.提示信息("返回主界面")
	local time = tickCount()
	while (局外检测.主界面() == false) do
		if 识别.识图(615,1200,707,1268,"返回主界面按钮",0.9,1) then
			
		end
		
		if 识别.识图(范围.主界面关闭按钮,"主界面关闭.png|主界面关闭2",0.7,1) then
			
		end
		
		if 识别.识图(范围.主界面好按钮,"主界面_好",0.7,1) then
			
		end
		
		主界面_下一步()
		
		识别.识图(324,1214,365,1258,"路人取消推荐",0.8,1)
		局外操作.对话快进()
		
		if 识别.识图(258,1097,301,1145,"主界面_翻转卡片",0.95,0) then
			local 坐标={{360,229},{549,359},{594,621},{465,836},{256,836},{126,618},{172,348}}
			for i,var in ipairs(坐标) do
				tap(var[1],var[2])
				sleep(1000)
			end
		end
		
		if 识别.识图(297,244,330,1163,"选择礼物",0.85,0) then
			if UI_in.选择礼物 == 0 then
				tap(识别X-130,识别Y+100)
			elseif UI_in.选择礼物 == 1 then
				tap(识别X+60,识别Y+100)
			elseif UI_in.选择礼物 == 2 then
				tap(识别X+260,识别Y+100)
			end
			sleep(1500)
			tap (516,789)
			sleep(500)
		end
		if 局内检测.局内() then
			对局.默认()
		end
		-- 这里需要添加一个局内检测 调用自动对局函数
		if 运行正常判定 and 局外检测.主界面() == false and 识别.识图(256, 774, 309, 825,"开始游戏_开",0.9,1) == false then
			keyPress("back")
			sleep(1500)
		end
		
		if 识别.识图(440,589,486,624,"主界面_退出应用程序",0.8,0) then
			tap(206,698)
			sleep(1500)
		end
		
		局外操作.点击空白(200)
	end
end

function 局外操作.结算_决斗评价()
	if 识别.找字(范围.结算_决斗评价,"结算处理",字库.结算_决斗评价,0.9,0) then
		局外操作.下一步()
		return true
	end
	return false
end

function 局外操作.结算_升级奖励()
	if 识别.找字(范围.结算_升级奖励,"结算处理",字库.结算_升级奖励,0.9,0) then
		局外检测.结算等级()
		局外操作.下一步()
		return true
	end
	return false
end

function 局外操作.结算_下一步()
	local t = {{312,1198,344,1231}}
	for i,v in ipairs(t) do
		if 识别.识图(v,"结算-下一步",0.9,1) then
			sleep(500)
			return true
		end
	end
	return false
end

function 局外操作.下一步()
	tap(356,1246)
	sleep(延迟.局外延迟)
end

function 局外操作.对话快进 ()
	return 识别.识图(641,862,689,897,"对话快进",0.9,1)
end

function 局外操作.主界面翻页()
	swipe(718,823,384,771,1)
	sleep(3000)
end

function 局外操作.点击空白(延迟)
	if 运行正常判定 == false then return end
	tap (719,70)
	sleep(延迟)
end

function 局内操作.点击空白(延迟)
	if 运行正常判定 == false then return end
	tap(719,192)
	sleep(延迟)
end

function 局外操作.结算_好()
	if 识别.找字(范围.结算_好,"结算处理",字库.结算_好,0.9,0) then
		垃圾回收()
		实况.局数 = 实况.局数 +1
		local x,y = 识别X,识别Y
		if 局外检测.对局胜利() then
			实况.胜场 = 实况.胜场 + 1
		end
		print("总局数:",实况.局数,"胜场:",实况.胜场,"当前模式剩余局数: ",模式局数)
		tap(x,y)
		sleep(延迟.局外延迟)
		return true
	end
	return false
end

function 局内操作.拖动手牌(X,Y)
	swipe(X+30,Y,X+30,Y-200,50)
	if 白龙开关 then
		等待信息框({nil})
		sleep(100)
		return
	end
	等待信息框({X+30,Y,X+30,Y-200,50,200})
end

function 局内操作.点击手牌(X,Y)
	tap(X+30,Y)
	if 白龙开关 then
		sleep(500)
		return
	end
	等待信息框({X+30,Y,200})
end

function 局内操作.特殊召唤()
	for i,var in ipairs(范围.特殊召唤) do
		if 识别.识图(var,"特殊召唤_殊",0.7,1) then
			HUD.提示信息("特殊召唤")
			sleep(延迟.局内延迟)
			return true
		end
	end
	return false
end

function 局内操作.通常召唤()
	for i,var in ipairs(范围.通常召唤) do
		if 识别.识图(var,"通常召唤",0.8,1) then
			if 白龙开关 then
				白龙.通召点 = true
			elseif 盖亚.开关 then
				盖亚.通召点 = true
			end
			HUD.提示信息("通常召唤")
			sleep(延迟.局内延迟)
			return true
		end
	end
	return false
end

function 局内检测.发动魔法()
	return  识别.识图(212,970,244,1005,"发动效果-发",0.8,0)
end

function 局内操作.覆盖魔法()
	for i,var in ipairs(范围.覆盖魔法卡) do
		if 识别.识图(var,"速攻_放置",0.7,1) then
			return true
		end
	end
	return false
end

function 局内操作.覆盖怪兽()
	if 白龙开关 then 白龙.通召点 = true end
	return 识别.识图(413,970,445,1004,"怪兽-放置",0.8,1)
end

function 局内操作.覆盖陷阱()
	if 白龙开关 then
		if 白龙.摄理()  then
			白龙.摄理盖放 = false
		end
	end
	return 识别.识图(328,974,360,1005,"陷阱-放置",0.65,1)
end

function 局内操作.发动手牌怪效()
	for i,var in ipairs(范围.手发怪效) do
		if 识别.识图(var,"发动效果_果",0.7,1) then
			sleep(延迟.局内延迟)
			return true
		end
	end
	return false
end

function 局内操作.在场魔陷效果()
	return 识别.识图(384,967,430,1011,"发动效果_果",0.7,1)
end

function 局内操作.转攻及翻转()
	local 范围 = {
	{299,977,334,1011},
	{284,973,422,1018},
	{469,973,509,1015}
	}
	if 识别.识图(294,966,333,1007,"翻转召唤",0.7,1) then return true end
	
	for i,var in ipairs(范围) do
		if 识别.识图(var,"改为攻击状态",0.7,1) then return true end
	end
	return false
end

function 局内操作.转守()
	local 范围 = {
	{299,977,334,1011},
	{284,973,422,1018},
	{469,973,509,1015}
	}
	for i,v in ipairs(范围) do
		if 识别.识图(v,"改守备状态",0.8,1) then return true end
	end
	return false
end

function 局内操作.在场怪效()
	local 范围 = {
	{351,966,396,1009},
	{433,962,485,1010},
	{265,967,310,1007}
	}
	for i,var in ipairs(范围) do
		if 识别.识图(var,"发动怪兽效果_效",0.7,1) then
			sleep(500)
			return true
		end
	end
	return false
end

function 局内操作.场地魔法发动()
	return 识别.识图(384,967,430,1001,"发动效果_果",0.7,1)
end

function 局内操作.发动墓效()
	return 识别.识图(470,962,513,1009,"发动效果_果",0.7,1)
end

function 局外操作.路人切换奖励()
	if 识别.识图(406,1222,423,1247,"路人-倍数-黑3",0.9,0)==false and 识别.识图(675,1207,703,1218,"路人-切换等级判定",0.9,1) then
		sleep(2000)
		if 识别.识图(241,1015,262,1047,"路人-倍数-白3",0.9,1) then
			sleep(2000)
		else
			tap (54,1244)
			sleep(2000)
		end
	end
end

function 局内操作.结束行动步骤(选择)-- 0表示直接结束回合 1表示进入战斗阶段
	while (局内检测.行动步骤()) do
		if 局内检测.操作判断() then
			if UI_in.零攻改守  then
				基本.零攻为守()
			end
			if UI_in.识别镜宫 and 盖亚.开关 == false then
				if 局内检测.金宫() then
					选择 = 0
				end
			end
			tap (671,804)  -- 切换按钮
			sleep(300)
			
			if 选择 == 0 then
				tap (719,579) --直接结束回合
				sleep(300)
				if 局内检测.行动步骤() then --没有结束证明此回合不能直接结束或者是第一回合
					tap (671,804)
					sleep(300)
					tap (716,797)
				end
				print("直接结束回合")
			elseif 选择 == 1 then --进入战斗阶段
				print("进入战斗阶段")
				tap (716,797)
				sleep(300)
			end
		else
			局内等待()
		end
	end
	战斗步骤_初始化()
end

function 战斗步骤_初始化()
	实况.攻击次数 = {1,1,1}
end

function 局内操作.结束战斗步骤()
	while (局内检测.战斗步骤()) do
		if 局内检测.操作判断() then
			if 局内检测.战斗步骤不可结束() then
				HUD.提示信息("战斗步骤不可结束调用默认攻击")
				局内操作.怪兽默认攻击()
			else
				tap (671,804)  -- 切换按钮
				sleep(300)
				tap (671,804)
				return
			end
		else
			if 局内等待() == 2 then return end
			sleep(500)
		end
	end
end

function 局内操作.行动步骤(选择)
	if 选择 == 1 then
		精确.怪兽卡()
	elseif 选择 == 2 then
		精确.特招手怪()
	elseif 选择 == 3 then
		精确.覆盖怪兽()
	elseif 选择 == 4 then
		精确.发手怪效果()
	elseif 选择 == 5 then
		精确.魔法卡()
	elseif 选择 == 6 then
		精确.装备魔法()
	elseif 选择 == 7 then
		精确.场地魔法()
	elseif 选择 == 8 then
		精确.陷阱卡()
	elseif 选择 == 9 then
		基本.额外特招()
	elseif 选择 == 10 then
		基本.改守为攻()
	elseif 选择 == 11 then
		基本.发动魔陷()
	elseif 选择 == 12 then
		基本.发动在场怪效()
	elseif 选择 == 13 then
		基本.发动场地()
	elseif 选择 == 14 then
		基本.发动墓效()
	elseif 选择 == 15 then
		基本.发动技能()
	end
end

function 局内操作.战斗步骤(选择)
	if 选择 == 1 then
		局内操作.怪兽默认攻击()
	elseif 选择 == 2 then
		局内操作.怪兽直接攻击()
	elseif 选择 == 3 then
		局内操作.智能攻击()
	elseif 选择 == 4 then
		基本.发动魔陷()
	elseif 选择 == 5 then
		基本.发动在场怪效()
	elseif 选择 == 6 then
		基本.发动墓效()
	elseif 选择== 7 then
		基本.发动场地()
	end
end

function 局外操作.进入传送门()
	HUD.提示信息("进入传送门...")
	local time = tickCount()
	while(true) do
		if 局外检测.传送门界面() then
			print("识别到界面")
			return
		else
			if 局外检测.主界面() and 局外检测.场景(1)  then
				tap (130,1263) -- 点击传送门
				while (局外检测.传送门界面() == false) do
					if tickCount() - time > 10000 then
						局外操作.进入传送门()
						return
					end
				end
			elseif 局外检测.主界面() then
				tap (130,1263)
				sleep(1000)
			else
				if 局外检测.传送门界面() == false then
					局外操作.返回主界面()
				end
				
			end
		end
	end
end

function 局外操作.选择传送门等级()
	if UI_in.传送门等级 == 0 then
		tap (119,882)
	elseif UI_in.传送门等级 == 1 then
		tap (280,882)
	elseif UI_in.传送门等级 == 2 then
		tap (442,880)
	elseif UI_in.传送门等级 == 3 then
		tap (588,871)
	end
	sleep(500)
end

function 局外检测.活动界面(活动名)
	return 识别.识图(1,52,45,93,活动名,0.9,0)
end

function 局外操作.进入活动(活动名)
	while (局外检测.活动界面(活动名) == false) do
		if 局外检测.主界面() then
			tap (292,1133)
			local time = tickCount()
			while ( true) do
				if tickCount()  - time >= 5000 then
					局外操作.进入活动(活动名)
				end
				if 局外检测.活动界面(活动名) then
					break
				end
			end
			return
		else
			局外操作.返回主界面()
		end
	end
end

function 精确.怪兽卡()
	if 局内检测.我方怪兽() == 3 then
		HUD.提示信息("在场怪兽已满")
		return
	end
	local 量 = 局内检测.手牌数量()
	print("手牌数量：", 量)
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("使用怪兽")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,颜色.通常怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内操作.特殊召唤()then
			if 局内等待() == 2 then return end
			sleep(500)
			精确.怪兽卡()
			return
		end
		
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
		else
			局内操作.点击空白(500)
			下标 = 返回下标 + 1
			goto one
		end
	else
		HUD.提示信息("未识别出怪兽卡")
	end
end

function 精确.发手怪效果()
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("特招手牌怪兽")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内操作.发动手牌怪效() then
			if 局内等待() == 2 then return end
			sleep(500)
			精确.发手怪效果()
		else
			局内操作.点击空白(500)
			下标 = 返回下标 + 1
			goto one
		end
	else
		HUD.提示信息("未识别出怪兽卡")
	end
end

function 精确.特招手怪()
	if 局内检测.我方怪兽() == 3 then
		HUD.提示信息("在场怪兽已满")
		return
	end
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("特招手牌怪兽")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.拖动手牌(手牌X,手牌Y)
		
		if 局内操作.特殊召唤() then
			if 局内等待() == 2 then return end
			sleep(500)
			精确.特招手怪()
			return
		else
			局内操作.点击空白(500)
			下标 = 返回下标 + 1
			goto one
		end
	else
		HUD.提示信息("未识别出怪兽卡")
	end
end

function 精确.覆盖怪兽()
	if 局内检测.我方怪兽() == 3 then
		HUD.提示信息("在场怪兽已满")
		return
	end
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("覆盖怪兽")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,颜色.通常怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内操作.覆盖怪兽() then
			sleep(延迟.召唤)
		else
			局内操作.点击空白(500)
			下标 = 返回下标 + 1
			goto one
		end
	else
		HUD.提示信息("未识别出怪兽卡")
	end
end

function 精确.魔法卡()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用魔法卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~=  -1 then
		local 我方攻怪 = 0
		local 敌方怪兽 = 0
		if UI_in.装备条件  then 我方攻怪 = 局内检测.我方攻怪兽() end
		if UI_in.速攻条件1 then 敌方怪兽 = 局内检测.敌方怪兽() end
		
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内检测.发动魔法() then
			
			if UI_in.装备条件 and 我方攻怪 == 0 and 局内检测.装备魔法() then
				HUD.提示信息("无攻表怪兽不发动装备魔法")
				局内操作.点击空白(500)
				下标 = 返回下标 +1
				goto one
				return
			end
			
			if 局内检测.速攻魔法() then
				if UI_in.速攻覆盖 then   -- 速攻魔法能发动判断覆盖还是直发
					if UI_in.速攻条件1 and 敌方怪兽 > 0 then
						print("满足速攻直发条件")
						tap(278,941)
						sleep(延迟.魔法卡延迟)
						if 局内等待() == 2 then return end
						sleep(500)
						精确.魔法卡()
						return
					else
						if 局内操作.覆盖魔法() then
							if 局内等待() == 2 then return end
							sleep(500)
							精确.魔法卡()
							return
						end
					end
				end
			end
			
			tap(278,941)
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			精确.魔法卡()
			return
		else
			
			if UI_in.速攻覆盖 and 局内检测.速攻魔法() then -- 速攻魔法发动不了判断是否需要覆盖
				if 局内操作.覆盖魔法() then
					sleep(500)
					if 局内等待() == 2 then return end
					sleep(500)
					精确.魔法卡()
					return
				end
			end
			
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		HUD.提示信息("手牌无魔法卡")
	end
end

function 精确.魔法卡_自杀()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用魔法卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内检测.发动魔法() then
			tap(278,941)
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			精确.魔法卡_自杀()
		else
			if 局内操作.覆盖魔法() then
				if 局内等待() == 2 then return end
				sleep(500)
				精确.魔法卡_自杀()
				return
			end
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		HUD.提示信息("未识别出魔法卡")
	end
end


function 精确.装备魔法()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用装备魔法卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		local count  = 0
		if UI_in.装备条件 then count = 局内检测.我方攻怪兽() end
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内检测.发动魔法() and 局内检测.装备魔法()   then
			if UI_in.装备条件 and count == 0  then
				HUD.提示信息("无攻表怪兽不发动装备魔法")
				局内操作.点击空白(500)
				return
			end
			tap(278,941)
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			精确.装备魔法()
			return
		else
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		HUD.提示信息("未识别出装备魔法卡")
	end
end

function 精确.场地魔法()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用场地魔法卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内检测.场地魔法() and 局内检测.发动魔法() then
			tap(278,941)
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			精确.场地魔法()
			return
		else
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		HUD.提示信息("未识别出场地魔法卡")
	end
end

function 精确.陷阱卡()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用陷阱卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.陷阱卡,相似度.陷阱卡)
	if 返回下标 ~= -1 then
		局内操作.拖动手牌(手牌X,手牌Y)
		if 局内操作.覆盖陷阱() then
			print("覆盖陷阱卡")
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			精确.陷阱卡()
			return
		else
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		HUD.提示信息("未识别出陷阱卡")
	end
end

function 基本.额外特招()
	if  局内检测.我方怪兽() < 2 then
		print("怪兽少于2只")
		return
	end
	HUD.提示信息("额外特招")
	if 局内等待() == 1 and 局内检测.额外无卡() then
		return
	else
		sleep(100)
		tap (65,904)
		sleep(500)
		if 识别.识图(329,968,359,1004,"额外-列表按钮",0.8,0) then
			HUD.提示信息("无法特招")
			局内操作.点击空白(500)
			return
		elseif 识别.识图(416,970,445,1005,"额外-特招-殊",0.8,1) then
			sleep(500)
			if 局内等待() == 2 then
				local time = tickCount()
				while(true) do
					if 局内检测.局内() then
						sleep(1500)
						break
					else
						局内操作.点击空白(200)
					end
					if tickCount() - time > 10000 then
						return
					end
				end
			end
			局内操作.点击空白(500)
		end
	end
end

function 基本.改守为攻()
	HUD.提示信息("改守为攻")
	for i=1,3 do
		if 局内检测.怪兽识别("防御",i,"我") then
			sleep(100)
			等待信息框({坐标.我方怪兽[i][1],坐标.我方怪兽[i][2],200})
			if UI_in.零攻改守 and 局内检测.信息_数值("攻击") > 0 then
				if 局内操作.转攻及翻转() then
					sleep(延迟.局内延迟)
					if 局内等待() == 2 then return end
					sleep(500)
				else
					局内操作.点击空白(500)
				end
			elseif UI_in.零攻改守 == false then
				if 局内操作.转攻及翻转() then
					sleep(延迟.局内延迟)
					if 局内等待() == 2 then return end
					sleep(100)
				else
					局内操作.点击空白(500)
				end
			end
		end
	end
end

function 基本.零攻为守()
	local 攻击力 = {-1,-1,-1}
	for i=1,3 do
		if 局内检测.怪兽识别("攻击",i,"我") then
			攻击力[i]=math.tointeger(局内检测.识别攻击力(范围.我方攻击力[i]))
		end
	end
	for i=1,3 do
		if 攻击力[i] == 0 then
			sleep(100)
			等待信息框({坐标.我方怪兽[i][1],坐标.我方怪兽[i][2],200})
			if 局内操作.转守() then
				sleep(延迟.局内延迟)
				if 局内等待() == 2 then return end
				sleep(500)
			else
				局内操作.点击空白(500)
			end
		end
	end
	
end

function 基本.发动魔陷()
	HUD.提示信息("发动后场效果")
	for i,var in ipairs(范围.在场魔陷) do
		if UI_in.魔陷效条件1 and 局内检测.敌方怪兽() == 0 then
			print("不满足魔陷条件1")
			return
		end
		if 识别.多点找色(var[1],颜色.在场魔陷[i*2-1],0,0.9) == false and 识别.多点找色(var[2],颜色.在场魔陷[i*2],0,0.9) == false then
			sleep(100)
			等待信息框({坐标.我方魔陷[i][1],坐标.我方魔陷[i][2],200})
			if 局内操作.在场魔陷效果() then sleep(延迟.局内延迟)
			else
				局内操作.点击空白(500)
			end
			if 局内等待() == 2 then return end
			sleep(500)
		end
	end
	
end

function 基本.发动在场怪效()
	HUD.提示信息("发动在场怪效果")
	for i=1,3 do
		if UI_in.怪效条件1 then
			局内等待()
			if 局内检测.敌方怪兽() == 0 then
				print("不满足怪效条件1")
			end
		end
		if 局内检测.怪兽识别("攻击",i,"我") or 局内检测.怪兽识别("防御",i,"我") then
			sleep(100)
			等待信息框({坐标.我方怪兽[i][1],坐标.我方怪兽[i][2],200})
			if 白龙开关 then
				if 白龙.精灵龙() or 白龙.灵龙() then
					局内操作.点击空白(500)
					i = i + 1
					goto one
					return
				end
			end
			if 局内操作.在场怪效() then
				sleep(500)
				if 局内等待() == 2 then return end
				sleep(500)
			else
				局内操作.点击空白(500)
			end
			::one::
		end
	end
end

function 基本.发动场地()
	if 局内检测.在场_场地魔法() then
		sleep(100)
		等待信息框({83,691,200})
		if 局内操作.场地魔法发动() then
			print("发动场地效果")
			sleep(500)
			if 局内等待() == 2 then return end
			return true
		else
			局内操作.点击空白(500)
		end
	end
	return false
end

function 基本.发动墓效()
	if 局内检测.墓地() then
		sleep(100)
		等待信息框({597,655,200})
		if 局内操作.发动墓效() then
			sleep(500)
			if 局内等待() == 2 then return end
			sleep(500)
			return true
		else
			局内操作.点击空白(500)
		end
	end
	return false
end

function 基本.发动技能()
	if 局内检测.发动技能() then
		sleep(500)
		if 识别.识图(447,520,450,1266,"发动技能按钮.png|发动技能按钮-2",0.9,1) then
			for i=1,6 do
				局内操作.点击空白(500)
			end
			局内等待()
			sleep(500)
			return true
		end
	end
	return false
end

function 基本.检测敌方金宫()
	if UI_in.识别镜宫 and 识别.识图(608,480,641,514,"金宫-2",0.8,0) then
		return true
	end
	return false
end

function 局内等待()
	while (true) do
		if 局内检测.操作判断() then
			if 盖亚.开关 then
				print("盖亚 - 局内")
				盖亚.魔道骑士开关 = false
				盖亚.炼狱开关 = false
				盖亚.士兵开关 = false
				盖亚.本源开关 = false
			end
			return 1
		elseif 局内检测.局内() == false then
			return 2
		else
			效果.处理()
		end
	end
end

function 效果.检索目标个数()
	local t = {{127,754,129,756},{381,754,383,756},{634,754,636,756}}
	local t_2 = {{53,792,55,794},{307,791,309,793},{538,793,540,795}}
	local count = 0
	for i=1,3 do
		if 识别.多点找色(t[i],颜色.效果_我方卡片,0,0.9) or 识别.多点找色(t[i],颜色.效果_敌方卡片,0,0.9) then
			count = count + 1
		elseif 识别.多点找色(t_2[i],颜色.效果_我方卡片_2,0,0.9) or 识别.多点找色(t_2[i],颜色.效果_敌方卡片_2,0,0.9) then
			count = count + 1
		end
	end
	return count
end

function 效果.检索效果卡名()
	local 颜色_t={ -- 1.落穴,2.龙骑士,3.士兵
	{"1F3748","0|4|1D353E|0|22|152E3E|0|38|375861|0|48|9CACB5|0|63|A9B9C2|0|74|B0C0C8|0|85|6D8596|0|94|A1B1BD|0|101|B1C1CB|0|116|5D798A"},
	{"010821","0|4|333399|0|11|4949D1|0|19|51ACBD|0|35|197C94|0|46|2892A2|0|98|041D4E|0|108|01113B|0|112|011338|0|115|000C4E|0|118|4046BD"},
	{"663F49","0|7|6D4555|0|15|6C4B61|0|22|6C4B55|0|30|65455E|0|38|BDA3C6|0|45|885581|0|54|5B4157|0|61|85598F|0|67|A45FA9|0|80|D38CDA"}
	}
	local result = {{0,-1,-1},{0,-1,-1},{0,-1,-1}}
	for j=1,3 do
		local 范围_t={0,809,720,811}
		for i=1,3 do
			if 识别.多点找色(范围_t,颜色_t[j],0,0.85) then
				result[j] = {result[j][1]+1,识别X,识别Y}
				范围_t[1] = 识别X + 100
			else
				break
			end
		end
	end
	return result
end

function 效果.处理()
	--local time = tickCount()
	HUD.提示信息("等待及效果处理...")
	if 局内检测.局内弹窗_1() then
		if 效果.好() then goto End end
		if 效果.献祭及确定() then goto End end
		if 效果.要使用哪个效果() then goto End end
		if 效果.特招怪兽状态() then goto End end
		if 效果.魔法回手牌() then goto End end
	end
	if 效果.局内弹窗_2() then goto End end
	if 效果.请召唤怪兽() then goto End end
	if 效果.局内弹窗_3() then goto End end
	if 效果.查看对手卡() then goto End end
	if 效果.弃一张卡() then goto End end
	if 效果.选择种族属性() then goto End end
	if 效果.手牌没适用卡() then goto End end
	::End::
	
	if 局内检测.局内() then 局内操作.点击空白(50) end
	--	print("效果.处理用时: ".. tickCount()-time)
end

function 效果.要使用哪个效果()
	if 识别.识图(417, 386, 419, 388, "效果_要使用哪个效果", 0.8, 0) then
		print("效果-要使用哪个效果")
		if 盖亚.开关 and 识别.识图(338,544,369,573, "盖亚场地效果", 0.8, 0) then
			if 盖亚.魔道骑士数量 == 0 then
				print("盖亚 - 手卡没魔道骑士，点击 tab2")
				tap(514,491)  -- 点击 2
				sleep(200)
				-- todo
				-- 这里怎么点确认的
				if 识别.识图(327,888,329,890,"局内_确认",0.8,1) then
					sleep(100)
					盖亚.魔道骑士开关 = true
					return true
				else
					-- 如果手里没魔道骑士
					-- 并且也没龙族怪兽
					-- 则点击 tab1 拿龙怪
					tap(195,490) -- 点击 1
					sleep(200)
					盖亚.狱炎开关 = true
					tap(361,904)
					sleep(100)
					return true
				end
			elseif 盖亚.狱炎数量 == 0 then
				print("盖亚 - 手卡没诅咒之龙")
				-- 点击 tab 确认按钮
				tap(355,903)
				sleep(100)
				盖亚.狱炎开关 = true
				return true
			elseif 盖亚.士兵数量 == 0 then
				print("盖亚 - 手卡有魔道骑士和诅咒之龙，点击 tab2 选士兵")
				tap (514,491)  -- 点击 2
				sleep(200)
				tap(349,904)
				sleep(100)
				盖亚.士兵开关 =  true
				return true
			else
				print("盖亚 - 手卡有魔道骑士、诅咒之龙和士兵，点击 tab2")
				tap(514,491)  -- 点击 2
				sleep(200)
				if 识别.识图(327,888,329,890,"局内_确认",0.8,1) then
					sleep(100)
					盖亚.魔道骑士开关 =  true
					return true
				else
					tap(195,490) -- 点击 1
					sleep(200)
					盖亚.狱炎开关 = true
					tap(361,904)
					sleep(100)
					return true
				end
			end
		end

		-- 处理 tab 确认逻辑，防止没点确认
		::one::
		if 识别.识图(327,888,329,890,"局内_确认",0.8,1) then
			print("一直在点确认")
			sleep(100)
		else
			tap(379,488)
			sleep(300)
			goto one
		end
		return true
	elseif 局内检测.操作判断() then
		return true
	else
		return false
	end
end

function 效果.请召唤怪兽()
	if 效果.识别({19,693,69,719},"请召") then
		print("效果-请召唤怪兽")
		tap (136,867)
		sleep(延迟.局内延迟)
		tap(361,1081)
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.好()
	local 范围={339,681,378,721}
	if 识别.识图(范围,"局内_好",0.8,1) then
		print("效果-点击好")
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.选择种族属性()
	if 识别.识图(329,1217,331,1219,"选择属性种族_确认",0.9,1) then
		print("效果-选择种族属性")
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.魔法回手牌()
	if 识别.识图(373,590,374,591,"效果函数_魔法卡移回手卡_移",相似度.效果处理,0) then
		print("效果-场地魔法卡移回手卡")
		tap(511,695)
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.特招怪兽状态()
	if 识别.识图(295,405,329,438,"特招_战斗状态_战",0.9,0) then
		print("效果-特招怪兽")
		if 实况.特招状态 then
			tap (211,584)
		else
			tap(503,591)
		end
		sleep(100)
		tap(355,816)
		sleep(100)
		特招状态 = true
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.手牌没适用卡()
	if 识别.识图(385,587,422,631,"效果函数_手牌没有适用卡_适",相似度.效果处理,0) then
		print("效果-手牌没有适用卡")
		tap(357,698)
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.献祭及确定()
	local 范围 = {
	{479,683,515,715},
	{473,674,521,730},
	{476,694,517,734}
	}
	for i,var in ipairs(范围) do
		if 识别.识图(var,"献祭_支付生命_确定_确",相似度.效果处理,0) then
			local x,y = 识别X,识别Y
			if 盖亚.开关 then
				if 盖亚.诅咒之龙效果 == false then
					if 识别.识图(131,589,132,590,"盖亚-诅咒之龙效果",0.9,0) then
						print("盖亚-对方无场地不发动诅咒之龙效果")
						tap (215,696) -- 取消效果
						sleep(100)
						return true
					end
				end
				
				if 盖亚.士兵效果==false   then
					if 识别.识图(121,594,123,596,"盖亚-士兵效果",0.9,0) then
						print(1)
						print("盖亚-对方无怪兽不发动士兵效果")
						tap (215,696) -- 取消效果
						sleep(100)
						return true
					end
				end
				
			end
			print("效果-确认")
			tap(x,y)
			sleep(100)
			return true
		elseif 局内检测.操作判断() then
			return true
		end
	end
	return false
end

function 效果.局内弹窗_3()
	local 颜色_确认 = {"F4F4F4","13|0|E5E5E5|18|-2|FBFBFB|29|1|E4E4E4|69|31|FFFFFF|52|32|F8F8F8|44|29|E6E6E6|29|31|FFFFFF|22|31|FFFFFF|12|32|DDDDDD|2|30|D9D9D9"}
	if 识别.多点找色(323,1070,325,1072,颜色_确认,0,0.9) then
		print("效果-弹窗-3")
		if 白龙开关 then
			if 白龙.弃白石() then return true end
			if 白龙.从卡组拿白石()  then  return true end
			if 效果.从手卡特招() then return true end
			if 效果.选择融合特召() then return true end
			if 效果.从卡组特招() then return true end
			if 效果.选择怪兽特招() then return true end
		end

		if 盖亚.开关 then
			if 效果.选择卡从卡组加入手卡() then return true end
			if 盖亚.选择一张卡() then return true end
			if 效果.选择怪兽特招() then return true end
			if 效果.选择卡送去墓地() then return true end
			if 效果.选择融合特召() then return true end
		end

		if 效果.选一表侧怪兽除外() then return true end
		if 效果.选择卡破坏() then return true end
		if 效果.选择怪兽朝下() then return true end
		if 效果.选择一个怪兽() then return true end
		if 效果.选择2张卡作为对象() then return true end
		tap (182,871)
		sleep(200)
		
		if 识别.识图(202,753,233,792,"效果对象选择_1",0.9,0) then
			tap(389,878)
			sleep(延迟.局内延迟)
		end
		
		if 识别.识图(456,752,486,791,"效果对象选择_2",0.9,0) then
			tap (640,859)
			sleep(延迟.局内延迟)
		end
		
		tap (351,1083)
		sleep(100)
		return true
	elseif 识别.识图(312,1061,367,1115,"效果发动_亮确认_确",相似度.效果处理,1) then
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.从卡组特招()
	if 效果.识别({200,694,227,720},"卡") and 效果.识别({252,693,280,719},"特") then
		if 白龙开关  then
			if 白龙.效果选中灵龙() then
				tap(360,1084)
				sleep(200)
				return true
			end
		end
		return false
	end
end

function 效果.选择怪兽朝下()
	if 识别.识图(200,685,256,730,"效果-选择怪兽面朝下",0.8,0) then
		if 局内操作.选择敌方在场卡为对象() then
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

function 效果.选择2张卡作为对象()
	if 识别.识图(69,694,71,696,"选择2张卡作为对象-2",0.9,0) and 效果.识别({214,693,250,722},"象.") then
		if 局内操作.选择敌方在场卡为对象() then
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

function 效果.选一表侧怪兽除外()
	if 识别.识图(214,692,268,719,"效果-选择一张卡放逐",相似度.效果处理,0) then
		print("效果-选择一张卡放逐")
		if 局内操作.选择敌方在场卡为对象() then
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

function 局内操作.取消效果()
	sleep(100)
	tap(50,1235)
	sleep(100)
end

function 效果.局内弹窗_2()
	if 识别.多点找色(286,1069,288,1071,颜色.陷阱效果_发动效果,0,0.9) then
		sleep(200)
		if 白龙开关 then
			if 局内检测.敌方结束步骤() then
				print("白龙 -- 敌方结束阶段不发动效果")
				局内操作.取消效果()
				return true
			end
			
			if 白龙.效果检索精灵龙() or 白龙.效果检索少女() or 白龙.效果检索白灵龙() then
				local x,y = 识别X+40,识别Y
				if 白龙.吃坑判定() then
					tap(x,y)
					print("精灵龙 少女 吃坑 无视条件直发效果")
					goto two
					return true
				else
					if 效果.检索目标个数() > 1 then
						tap (368,863)
						goto one
						return true
					else
						局内操作.取消效果()
						return true
					end
				end
			end
		elseif 盖亚.开关 then
			-- 1.落穴,2.龙骑士,3.士兵
			local 效果数 = 效果.检索目标个数()
			local 敌怪 = 局内检测.敌方怪兽()
			local arr = 效果.检索效果卡名()
			local count = arr[1][1] + arr[2][1] + arr[3][1]
			print(敌怪,arr[1][1],arr[2][1],arr[3][1])
			-- todo 暂时屏蔽龙魔道的效果
			-- if arr[2][1]>0 then
			-- 	if 局内检测.吃坑() then
			-- 		tap (arr[2][2],arr[2][3])
			-- 		print("盖亚 - 吃坑发动龙魔道效果")
			-- 		goto two
			-- 		return true
			-- 	end
			-- end
			if arr[1][1] > 0 then
				if 敌怪 > 1 then
					tap(arr[1][2],arr[1][3])
					print("盖亚 -- 发动落穴效果")
					goto two
					return true
				end
			end
			if 效果.在行动阶段结束前发动() then
				print('效果.在行动阶段结束前发动()')
				return true
			end
			if count == 效果数 then
				print("盖亚-取消效果发动")
				局内操作.取消效果()
				return true
			elseif 效果数 > count then
				local 效果开关 ={false,false,false}
				print("盖亚-发动其他卡片效果")
				for i=1,3 do
					if arr[i][2] < 200 and arr[i][2] ~= -1 then
						效果开关[i] = true
					elseif arr[i][2] > 200 and arr[i][2] < 500 then
						效果开关[i] = true
					elseif arr[i][2] > 500 and arr[i][2] < 700 then
						效果开关[i] = true
					end
				end
				if 效果开关[1] then
					tap(128,862)
					goto two
				elseif 效果开关[2] then
					tap(385,867)
					goto two
				elseif 效果开关[3] then
					tap(649,862)
					goto two
				end
			end
		end
		::one::
		if UI_in.坑效条件1 and 局内检测.敌方回合() == false then
			print("不满足坑效-1")
			局内操作.取消效果()
			return true
		end
		if UI_in.坑效条件2 and 局内检测.敌方怪兽() == 0 then
			print("不满足坑效-2")
			局内操作.取消效果()
			return true
		end
		print("连锁-发动效果")
		tap(144,848)
		::two::
		sleep(200)
		tap(358,1077)
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.弃一张卡()
	if 识别.识图(183,583,227,629,"效果函数_弃一张卡_弃",相似度.效果处理,0) then
		print("test-1")
		tap(514,599)
		sleep(100)
		return true
	elseif 局内检测.操作判断() then
		return true
	end
	return false
end

function 效果.选择一个怪兽()
	if 效果.识别({138,692,173,722},"兽.") then
		print("选择一个怪兽")
		if 局内操作.选择敌方在场卡为对象() then
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

function 效果.选择卡破坏()
	if 效果.识别({199,694,238,720},"坏.") then
		sleep(200)
		print("选择一张卡破坏")
		if 局内操作.选择敌方在场卡为对象() then
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

function 效果.从手卡特招()
	if 效果.识别({45,691,70,722},"手") and 效果.识别({200,693,227,721},"特") then
		if 白龙开关 and 白龙.效果选中灵龙() then
			tap(360,1084)
			sleep(200)
			return true
		end
	end
	return false
end

function 效果.选择融合特召()
	if 效果.识别({120,692,151,721},"融") and 效果.识别({227,692,256,721},"特") then
		print("选择融合怪兽特招")
		local time = tickCount()
		if 白龙开关 and 白龙.效果选中究极龙() then
			tap(360,1084)
			sleep(200)
		elseif 盖亚.开关  then
			局内检测.敌方攻击力()
			local 融召判定 = false
			for i=1,3 do
				if 实况.攻击力[2][i] > 2600 then
					融召判定 = true
					break
				end
			end
			if 融召判定 then
				if 盖亚.效果选中天翔骑士() then
				end
			else
				if 盖亚.效果选中龙魔道骑士() then
				end
			end
			tap(360,1084)
			sleep(200)
		end
		local count = 0
		while (true) do
			if 局内等待() == 2 then
				for i=1,10 do
					局内操作.点击空白(100)
				end
				count = count + 1
			elseif 局内等待() == 1 then
				return true
			end
			if count > 5 and 局内等待() == 2 then
				break
			end
		end
		return true
	end
	return false
end

function 效果.选择怪兽特招()
	if 效果.识别({17,692,44,719},"选") and 效果.识别({122,691,151,721},"特") then
		print("选择怪兽特招")
		local 敌方怪兽 = 局内检测.敌方怪兽()
		if 白龙开关 then
			if 白龙.爆裂龙开关 then
				if 白龙.效果选中爆裂龙() == false then
					tap (126,857)
					sleep(100)
				end
			elseif 敌方怪兽 > 0 then
				if 白龙.效果选中机龙() == false then
					tap (126,857)
					sleep(100)
				end
			elseif 敌方怪兽== 0 then
				if 白龙.效果选中精灵龙() == false then
					tap (126,857)
					sleep(100)
				end
				
			else
				tap (126,857)
				sleep(100)
			end
		elseif 盖亚.开关 then
			if 局内检测.敌方场地() then
				盖亚.诅咒之龙效果 = true
			end

			if 盖亚.效果选中狱炎() then
			else
				print("盖亚 - 未选中诅咒之龙，选择第一个")
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

function 效果.查看对手卡()
	if 效果.识别({124,694,149,719},"看") and 效果.识别({227,694,261,720},"卡.") then
		tap(56,1235)
		sleep(100)
		return true
	end
	return false
end

function 效果.选择卡作为对象()
	if 效果.识别({176,694,212,721},"象.") and 效果.识别({69,691,95,719},"卡") then
		if 白龙开关  then
			
		end
	end
end

function 效果.选择卡从卡组加入手卡()
	if 效果.识别({200,693,228,720},"组") and 效果.识别({305,693,340,720},"卡.") then
		print("效果-选择卡从卡组加入手卡")
		if 盖亚.开关 then
			sleep(200)
			if 盖亚.混沌开关 then
				if 盖亚.魔道骑士数量 == 0 and 盖亚.效果选中魔道骑士盖亚() then
					
				elseif 盖亚.士兵数量 == 0 and 盖亚.效果选中士兵() then
					
				else
					盖亚.效果选中魔道骑士盖亚()
				end
			else
				if 盖亚.魔道骑士开关 then
					if 盖亚.效果选中魔道骑士盖亚() == false then
						tap(60,857)
						sleep(100)
					end
				elseif 盖亚.狱炎开关 then
					if 盖亚.效果选中狱炎() == false then
						tap(60,857)
						sleep(100)
					end
				elseif 盖亚.士兵开关 then
					if 盖亚.效果选中士兵() == false then
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

function 效果.选择卡送去墓地()
	if 效果.识别({149,693,211,719},"墓地.") then
		print("效果-选择卡送去墓地")
		sleep(200)
		if 盖亚.开关 then
			if 盖亚.效果选中卡去墓地() then
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

function 效果.在行动阶段结束前发动()
	if 效果.识别({94,678,124,707},"行") and 效果.识别({229,708,250,735},"?") then
		print("效果 - 对方行动阶段结束")
		if 盖亚.开关 then
			-- todo 暂时屏蔽
			-- 局内检测.敌方攻击力()
			-- if 盖亚.效果检索龙魔道骑士() then
			-- 	if 盖亚.效果选中龙魔道骑士() then
			-- 		local atk = 局内检测.信息_数值("攻击")
			-- 		for i=1,3 do
			-- 			if 实况.攻击力[2][i] > atk then
			-- 				tap(359,1087)
			-- 				sleep(200)
			-- 				return true
			-- 			end
			-- 		end
			-- 		局内操作.取消效果()
			-- 	end
			-- else
			-- if 盖亚.效果检索士兵() then
			-- 	tap(663,1219)
			-- 	sleep(500)
			-- 	local 属性 = 盖亚.战阶识别我怪信息()
			-- 	for i=1,3 do
			-- 		if ( 属性[i][1] ==1 or 属性[i][1] == 2 ) and 属性[i][2] < 2600 then
			-- 			tap(663,1219)
			-- 			sleep(500)
			-- 			for i=1,3 do
			-- 				if 实况.攻击力[2][i] >= 2600 then
			-- 					盖亚.士兵效果 = true
			-- 					break
			-- 				end
			-- 			end
			-- 			if 盖亚.效果选中士兵() then
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

function 效果.识别(范围,文字)
	TURING.来源_获取屏幕像素(范围[1],范围[2],范围[3],范围[4])
	TURING.滤镜_彩色_二值化("0-200")
	TURING.切割_范围投影切割(3,2)
	TURING.字库_加载识别字库(getSdPath() .. "/效果.lib",文字)
	local 识别结果 = TURING.识别(95)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		local t = splitStr(识别结果,"|")
		if t and next(t) ~= nil then
			if t[1] == 文字 then
				return true
			end
		end
	end
	return false
end

function 局内操作.选择敌方在场卡为对象()
	local t = {{127,754,129,756},{381,754,383,756},{634,754,636,756}}
	local t_2 = {{53,792,55,794},{307,791,309,793},{538,793,540,795}}
	for i=1,2 do
		for j=1,3 do
			if 识别.多点找色(t[j],颜色.效果_敌方卡片,0,0.9)  or 识别.多点找色(t_2[j],颜色.效果_敌方卡片_2,0,0.9) then
				tap (识别X,识别Y+40)
				sleep(100)
				return true
			end
		end
		局内操作.效果翻一页()
	end
	return false
end

function 局内操作.效果翻一页()
	swipe(696,900,1,900,300)
	sleep(150)
	tap(56,863)
	sleep(200)
end

function 局内检测.信息框()
	return 识别.多点找色(689,562,697,584,颜色.信息框,0,0.9)
end

function 等待信息框(...) -- 规范: {x,y,延迟},{x1,y1,x2,y2,步长,延迟}
	t = ...
	local count= 0
	while(true) do
		sleep(200)
		if 局内检测.信息框() then
			break
		else
			if #t == 3 then  -- 操作判断
				tap(t[1],t[2])
				sleep(t[3])
				
			elseif #t == 6 then
				swipe(t[1],t[2],t[3],t[4],t[5])
				sleep(t[6])
			end
			count = count + 1
		end
		if  count > 2 then
			print("等待信息框超时 - 操作过多")
			return
		end
	end
end

function 白龙.从卡组拿白石()
	if 效果.识别({304,692,340,724},"卡.") then
		sleep(200)
		print("从卡组白石")
		if 白龙.效果选中白石() then
			tap (349,1084)
			sleep(200)
			return true
		end
	end
	return false
end

function 白龙.弃白石()
	if 识别.识图(384,655,412,685,"效果-从手弃一张卡",0.8,0) or 识别.识图(461,654,490,685,"效果-从手弃一张卡",0.8,0) then
		sleep(200)
		print("齐一张手卡")
		if 白龙.效果选中白石() then
			tap (349,1084)
			sleep(100)
			return true
		end
	end
	return false
end

function 白龙.效果选中究极龙()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,3 do
		if 白龙.效果检索究极龙() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 白龙.效果选中机龙()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,3 do
		if 白龙.效果检索机龙() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end


function 白龙.效果选中精灵龙()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,3 do
		if 白龙.效果检索精灵龙() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
	
end

function 白龙.效果选中白石()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,2 do
		if 白龙.效果检索白石() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 白龙.效果选中灵龙()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,3 do
		if 白龙.效果检索白灵龙() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 白龙.效果选中爆裂龙()
	local 开关 = true
	if 效果.检索目标个数() < 3 then 开关= false end
	for i=1,3 do
		if 白龙.效果检索爆裂龙() then
			
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 白龙.卡名(...)
	t = ...
	TURING.来源_获取屏幕像素(t[1],t[2],t[3],t[4])
	TURING.滤镜_彩色_二值化("0-140")
	TURING.切割_范围投影切割(2,1)
	TURING.字库_加载识别字库(getSdPath() .. "/白龙.lib")
	local 识别结果 = TURING.识别(80)
	if 识别结果 ~= nil and 识别结果 ~= "" then
		local temp = splitStr(识别结果,"|")
		if temp and next(temp) ~= nil then
			return temp[1]
		end
	else
		return ""
	end
end

function 白龙.精灵龙()
	if "精灵" == 白龙.卡名({108,251,174,290}) then
		print("精灵龙")
		return true
	end
	return false
end

function 白龙.融合()
	if "融" == 白龙.卡名({41,253,84,294}) then
		print("融合")
		return true
	end
	return false
end

function 白龙.机龙()
	if "机龙" == 白龙.卡名({144,253,206,290}) then
		print("机龙")
		return true
	end
	return false
end

function 白龙.少女()
	if "少女" == 白龙.卡名({144,256,206,290}) then
		print("少女")
		return true
	end
	return false
end

function 白龙.贤士()
	if "贤士" == 白龙.卡名({144,255,205,287}) then
		print("贤士")
		return true
	end
	return false
end

function 白龙.白石()
	if "白石" == 白龙.卡名({144,255,205,287}) then
		print("白石")
		return true
	end
	return false
end

function 白龙.亚白()
	if "亚白" == 白龙.卡名({109,252,172,289}) then
		print("亚白")
		return true
	end
	return false
end

function 白龙.宝牌()
	if "宝牌" == 白龙.卡名({144,256,207,287}) then
		print("宝牌")
		return true
	end
	return false
end

function 白龙.摄理()
	if "理" == 白龙.卡名({143,256,176,288}) then
		print("摄理")
		return true
	end
	return false
end

function 白龙.灵龙()
	if "灵龙" == 白龙.卡名({80,256,143,287}) then
		print("灵龙")
		return true
	end
	return false
end

function 白龙.究极龙()
	if "真青" == 白龙.卡名({44,253,111,290}) then
		print("究极龙")
		return true
	end
	return false
end

function 白龙.爆裂龙()
	if "爆裂" == 白龙.卡名({140,254,208,289}) then
		print("爆裂")
		return true
	end
	return false
end

function 白龙.对局初始化()
	白龙.通召点 = false
	白龙.贤士坐标,白龙.白石坐标,白龙.少女坐标={-1,-1},{-1,-1},{-1,-1}
	白龙.贤士数,白龙.白石数 =0,0
end

function 白龙.检索1_9星怪兽(文字)
	local t
	local t_颜色
	if 文字 == "8" or 文字== "9" then
		t_颜色 = "FFFFFF"
		t =  {{261,736,282,762},{407,736,428,763},{556,737,575,762}}
	elseif 文字 == "1" then
		t_颜色 = "73F17C"
		t = {{266,737,280,765},{412,736,425,763},{559,738,574,763}}
	end
	
	local count = 0
	if 识别.找字(t[1],"白龙等级",{文字,t_颜色},0.9,0) then count = count +1 end
	if 识别.找字(t[2],"白龙等级",{文字,t_颜色},0.9,0) then count = count +1 end
	if 识别.找字(t[3],"白龙等级",{文字,t_颜色},0.9,0) then count = count +1 end
	return count
end

function 白龙.检索摄理()
	白龙.摄理盖放 = true
	HUD.提示信息("检索场上是否存在摄理")
	for i,var in ipairs(范围.在场魔陷) do
		if 识别.多点找色(var[1],颜色.在场魔陷[i*2-1],0,0.9) == false and 识别.多点找色(var[2],颜色.在场魔陷[i*2],0,0.9) == false then
			sleep(100)
			等待信息框({坐标.我方魔陷[i][1],坐标.我方魔陷[i][2],200})
			if 白龙.摄理() then
				print("存在摄理")
				白龙.摄理盖放 = false
				局内操作.点击空白(500)
				return
			else
				局内操作.点击空白(500)
			end
		end
	end
end

function 白龙.陷阱卡()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用陷阱卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.陷阱卡,相似度.陷阱卡)
	if 返回下标 ~= -1 then
		
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.摄理盖放 == false and 白龙.摄理() then
			print("不覆盖摄理")
			下标 = 返回下标 +1
			goto one
			return
		end
		
		局内操作.拖动手牌(手牌X,手牌Y)
		
		if 局内操作.覆盖陷阱() then
			print("覆盖陷阱卡")
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			白龙.陷阱卡()
		else
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别出陷阱卡")
	end
end

function 白龙.特招亚白龙()
	if 局内检测.我方怪兽() == 3 then
		HUD.提示信息("在场怪兽已满")
		return
	end
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("特招亚白龙")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.亚白() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
		
		if 局内操作.特殊召唤()then
			if 局内等待() == 2 then return end
			sleep(500)
			基本.发动在场怪效()
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别到亚白龙")
	end
end

function 白龙.通召白石(选择) -- 1 通召 0 覆盖
	if 白龙.通召点 then
		return
	end
	if 白龙.白石坐标[1] > -1 then  -- 检索过数量后快捷召唤
		局内操作.拖动手牌(白龙.白石坐标[1],白龙.白石坐标[2])
		if 选择 == 1 then
			if 局内操作.通常召唤() then
				sleep(延迟.召唤)
				if 局内等待() == 2 then return end
				sleep(500)
				return
			end
		elseif 选择 == 0 then
			if 局内操作.覆盖怪兽() then
				sleep(延迟.召唤)
				if 局内等待() == 2 then return end
			end
		end
	end
	
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("通召白石")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.白石() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
		
		if 选择 == 1 then
			if 局内操作.通常召唤() then
				sleep(延迟.召唤)
				if 局内等待() == 2 then return end
			end
		elseif 选择 == 0 then
			if 局内操作.覆盖怪兽() then
				sleep(延迟.召唤)
				if 局内等待() == 2 then return end
			end
		end
		sleep(500)
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别到白石")
	end
end

function 白龙.通召贤士()
	if 白龙.通召点 then
		return
	end
	if 白龙.贤士坐标[1] > -1 then  -- 检索过数量后快捷召唤
		局内操作.拖动手牌(白龙.贤士坐标[1],白龙.贤士坐标[2])
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return
		end
	end
	
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("通召贤士")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.贤士() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
		
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别到贤士")
	end
end

function 白龙.发动贤士效果()
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return false
	end
	local 下标 = 1
	HUD.提示信息("发动贤士效果")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.贤士() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return false
		end
		if 局内操作.发动手牌怪效() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return true
		else
			局内操作.点击空白(500)
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别到贤士")
	end
end

function 白龙.使用宝牌()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用宝牌")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.宝牌() then
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				if 局内等待() == 2 then return end
				sleep(500)
				白龙.使用宝牌()
				
			elseif 局内检测.发动魔法()== false and 白龙.通召点 then
				局内操作.点击空白(500)
				return
			else
				局内操作.点击空白(500)
				白龙.通召贤士()
				if 白龙.通召点 then
					白龙.使用宝牌()
				end
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别出宝牌")
	end
end

function 白龙.白石贤士数量()
	白龙.贤士坐标,白龙.白石坐标,白龙.少女坐标={-1,-1},{-1,-1},{-1,-1}
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		白龙.通召点 = true
		return
	end
	local 下标 = 1
	HUD.提示信息("检索贤士和白石数量")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.贤士() then
			白龙.贤士数  = 白龙.贤士数 +  1
			白龙.贤士坐标[1],白龙.贤士坐标[2] = 手牌X,手牌Y
			下标 = 返回下标 + 1
			goto one
			return
		elseif 白龙.白石()  then
			白龙.白石数  = 白龙.白石数  + 1
			白龙.白石坐标[1],白龙.白石坐标[2] = 手牌X,手牌Y
			下标 = 返回下标 + 1
			goto one
			return
		elseif 白龙.少女() then
			白龙.少女坐标[1],白龙.少女坐标[2] = 手牌X,手牌Y
			下标 = 返回下标 + 1
			goto one
			return
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
	end
end

function 白龙.通召少女()
	if 白龙.通召点 then
		return
	end
	
	if 白龙.少女坐标[1] > -1 then  -- 检索过数量后快捷召唤
		局内操作.拖动手牌(白龙.少女坐标[1],白龙.少女坐标[2])
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return
		end
	end
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	HUD.提示信息("通召少女")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.少女() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
		
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别到少女")
	end
end

function 白龙.使用融合()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用融合")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 白龙.融合() then
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				if 局内等待() == 2 then return end
				for i=1,10 do
					局内操作.点击空白(300)
				end
			else
				局内操作.点击空白(500)
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("未识别出宝牌")
	end
end

function 白龙.吃坑判定()
	return 识别.多点找色(131,824,133,826,颜色.吃坑,0,0.9)
end

function 白龙.战阶检索爆裂()
	for i=1,3 do
		if 局内检测.怪兽识别("攻击",i,"我") then
			等待信息框({坐标.我方怪兽[i][1],坐标.我方怪兽[i][2],200})
			if 白龙.爆裂龙() then
				print(i,"号位 爆裂龙")
				实况.攻击次数[i] = 实况.攻击次数[i] + 1
				局内操作.点击空白(200)
			else
				局内操作.点击空白(200)
			end
		end
	end
end

function 白龙.效果检索少女()
	return 识别.多点找色(2,818,720,820,颜色.效果_少女,0,0.9)
end

function 白龙.效果检索白石()
	return 识别.多点找色(2,816,718,818,颜色.效果_白石,0,0.9)
end

function 白龙.效果检索精灵龙()
	return 识别.多点找色(6,822,720,824,颜色.效果_精灵龙_2,0,0.9) or 识别.多点找色(6,810,720,811,颜色.效果_精灵龙_1,0,0.9)
end

function 白龙.效果检索爆裂龙()
	return 识别.多点找色(0,823,720,825,颜色.效果_爆裂龙,0,0.9)
end

function 白龙.效果检索机龙()
	return 识别.多点找色(2,815,718,817,颜色.效果_机龙,0,0.9)
end

function 白龙.效果检索白灵龙()
	local 颜色_t = {"C2C9C8","0|3|CDCBC1|0|10|D8D0BF|0|17|F1E9E0|0|25|CDC5B4|0|33|E1D9CE|0|96|B2D2D2|0|100|78BAC2|0|106|91D3DB|0|111|95D7DF|0|115|B4E7E7"}
	return 识别.多点找色(0,812,720,814,颜色_t,0,0.9)
end

function 白龙.效果检索究极龙()
	return 识别.多点找色(0,823,720,825,颜色.效果_究极龙,0,0.9)
end

function 白龙.智能攻击()
	print("白龙-智能攻击")
	
	if 局内检测.敌方怪兽() == 0 then
		局内操作.怪兽默认攻击()
		return
	end
	
	局内检测.场上怪兽攻击力()
	
	if 实况.攻击力[1][2] >= 实况.攻击力[1][1] and 实况.攻击力[1][2] >= 实况.攻击力[1][3] and 实况.攻击力[1][2] > 0 then
		白龙.智能攻击_2()
		
		if 实况.攻击力[1][1] > 0 or 实况.攻击力[1][3] > 0 then
			if 实况.攻击力[1][1] >= 实况.攻击力[1][3] then
				白龙.智能攻击_1()
				白龙.智能攻击_3()
			else
				白龙.智能攻击_3()
				白龙.智能攻击_1()
			end
		end
	elseif 实况.攻击力[1][1] >= 实况.攻击力[1][2] and 实况.攻击力[1][1] >= 实况.攻击力[1][3] and 实况.攻击力[1][1] > 0 then
		白龙.智能攻击_1()
		
		if 实况.攻击力[1][2] > 0 or 实况.攻击力[1][3] > 0 then
			if 实况.攻击力[1][2] >= 实况.攻击力[1][3] then
				白龙.智能攻击_2()
				白龙.智能攻击_3()
			else
				白龙.智能攻击_3()
				白龙.智能攻击_1()
			end
		end
	elseif 实况.攻击力[1][3] >= 实况.攻击力[1][2] and 实况.攻击力[1][3] >= 实况.攻击力[1][1] and 实况.攻击力[1][3] > 0 then
		白龙.智能攻击_3()
		
		if 实况.攻击力[1][2] > 0 or 实况.攻击力[1][1] then
			if 实况.攻击力[1][2] >= 实况.攻击力[1][1] then
				白龙.智能攻击_2()
				白龙.智能攻击_1()
			else
				白龙.智能攻击_1()
				白龙.智能攻击_2()
			end
		end
	end
end

function 白龙.智能攻击_1()
	while (实况.攻击次数[1] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][1] >= 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌2")
			局内操作.划动_智能攻击(1,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][1] >= 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌1")
			局内操作.划动_智能攻击(1,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][1] >= 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:1→敌3")
			局内操作.划动_智能攻击(1,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
end

function 白龙.智能攻击_2()
	while (实况.攻击次数[2] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][2] >= 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌2")
			局内操作.划动_智能攻击(2,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][2] >= 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌1")
			局内操作.划动_智能攻击(2,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][2] >= 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:2→敌3")
			局内操作.划动_智能攻击(2,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
	
end

function 白龙.智能攻击_3()
	while (实况.攻击次数[3] > 0) do
		if 局内检测.敌方怪兽() ==  0 then
			局内操作.怪兽默认攻击()
			return
		end
		
		if 实况.攻击力[1][3] >= 实况.攻击力[2][2] and 实况.攻击力[2][2] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌2")
			局内操作.划动_智能攻击(3,2)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][3] >= 实况.攻击力[2][1] and 实况.攻击力[2][1] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌1")
			局内操作.划动_智能攻击(3,1)
			if 局内等待() == 2 then return end
		elseif 实况.攻击力[1][3] >= 实况.攻击力[2][3] and 实况.攻击力[2][3] > -1 then
			HUD.提示信息("局内-智能攻击-我:3→敌3")
			局内操作.划动_智能攻击(3,3)
			if 局内等待() == 2 then return end
		else
			break
		end
		sleep(500)
		if 局内检测.敌方怪兽() > 0 then
			局内检测.场上怪兽攻击力()
		end
	end
end

function 盖亚.识别(...) -- 标准:{范围},"文字"
	t = {...}
	local result = false
	local times = 0
	while (true) do
		-- 可能会识别失败，多次识别检测
		if times >= 12 then
			break
		end

		TURING.来源_获取屏幕像素(t[1][1],t[1][2],t[1][3],t[1][4])
		TURING.滤镜_彩色_二值化("0-100")
		TURING.切割_范围投影切割(4,2)
		TURING.字库_加载识别字库(getSdPath() .. "/盖亚1.lib")
		local 识别结果 = TURING.识别(80)
		if 识别结果 ~= nil and 识别结果 ~= "" then
			if 识别结果 == t[2] then
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

function 盖亚.耀星龙()
	return 盖亚.识别({141,256,208,289}, "耀星")
end

function 盖亚.征服()
	return 盖亚.识别({45,253,112,289}, "奔驰")
end

function 盖亚.士兵()
	return 盖亚.识别({237,250,303,290}, "士兵")
end

function 盖亚.诅咒之龙()
	return 盖亚.识别({45,253,112,289}, "狱炎")
end

function 盖亚.魔道骑士盖亚()
	return 盖亚.识别({38,249,113,294}, "魔道")
end

function 盖亚.混沌之场()
	return 盖亚.识别({110,250,178,295}, "之场")
end

function 盖亚.龙之镜()
	return 盖亚.识别({79,255,144,288}, "之镜")
end

function 盖亚.本源()
	return 盖亚.识别({239,256,303,288}, "本源")
end

function 盖亚.天翔骑士()
	return 盖亚.识别({46,255,110,287}, "天翔")
end

function 盖亚.枪杀()
	return 盖亚.识别({110,255,174,288}, "枪杀")
end

function 盖亚.龙魔道()
	return 盖亚.识别({38,249,145,289}, "龙魔道")
end

function 盖亚.效果检索本源()
	local 颜色_t  = {"414951","0|2|464E56|0|5|4D525A|0|9|625962|0|12|6B626B|0|15|705F5F|0|18|846161|0|21|836B6B|0|24|796161|0|27|6F5D5D|0|29|525252"}
	for i=1,2 do
		if 识别.多点找色(0,810,720,812,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索落穴()
	local 颜色_t = {"38434D","0|9|393F48|0|20|2D3942|0|30|4B5760|0|42|4F6164|0|51|ACB1B5|0|57|9DA2A6|0|63|A5AAAE|0|68|ACB1B5|0|75|9DA2A5|0|93|A9AEB2"}
	for i=1,2 do
		if 识别.多点找色(0,809,720,812,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索士兵()
	local 颜色_t = {"603847","0|12|6F3E55|1|35|D4A3D6|1|42|4D2B5E|1|49|5E355E|1|61|6B3E81|1|69|E0B6E4|1|79|BA83D9|1|95|7D399F|1|103|D984EA|1|111|B593B5"}
	for i=1,2 do
		if 识别.多点找色(0,809,720,811,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索魔道骑士()
	local 颜色_t = {"935030","0|12|452404|0|27|924E1E|0|41|652110|0|60|DEBC89|0|81|8E5C43|0|89|DCA574|0|96|402F2F|0|106|513838|0|112|D9B774|0|116|756442"}
	for i=1,5 do
		if 识别.多点找色(0,810,720,812,颜色_t,0,0.8) then
			print("识别到魔道骑士的位置")
			return true
		else
			sleep(100)
		end
	end
	print("未识别到魔道骑士的位置")
	return false
end

function 盖亚.效果检索星龙()
	local 颜色_t = {"443344","0|5|54333B|0|11|874D45|0|22|714048|0|29|604F4F|0|37|7C4949|0|47|327CF0|0|57|43A0D3|0|67|6C4A4A|0|77|8B5149|0|92|4D342C"}
	for i=1,2 do
		if 识别.多点找色(0,813,720,815,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索狱炎()
	local 颜色_t = {"2F89F4","0|14|1119CF|0|23|060DCC|0|31|060EB3|0|46|235689|0|55|051F96|0|64|4173F1|0|72|0028D5|0|80|0048F2|0|87|55BBEE|0|99|1346DF"}
	for i=1,2 do
		if 识别.多点找色(0,810,720,812,颜色_t,0,0.8) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索天翔骑士()
	local 颜色_t = {"1469CF","0|8|2C5EC7|0|15|23B7F8|0|22|44DDFC|0|29|A0F2FA|0|36|A8F4FC|0|42|0645CD|0|48|1B499E|0|58|0B2037|0|68|3B4C6E|0|92|1E4CB7"}
	for i=1,2 do
		if 识别.多点找色(0,810,720,812,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索龙魔道骑士()
	local 颜色_t={"020A3C","0|7|010B4F|0|13|04368B|0|18|34ABBC|0|29|52C9DA|0|102|01184A|0|98|012264|0|109|011136|0|112|00134B|0|114|040972|0|117|20289B"}
	for i=1,2 do
		if 识别.多点找色(0,811,720,813,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果检索耀星龙()
	local 颜色_t={"925F63","0|6|443E3B|0|22|794D50|0|28|784C4F|0|33|815350|0|40|815452|0|47|B48787|0|53|467FD7|0|59|57AAD5|0|64|35A5D2|0|91|915E61"}
	for i=1,2 do
		if 识别.多点找色(0,809,720,811,颜色_t,0,0.9) then
			return true
		else
			sleep(100)
		end
	end
	return false
end

function 盖亚.效果选中天翔骑士()
	print("盖亚-选中天翔骑士")
	local 开关 = true
	local 数量= 效果.检索目标个数()
	if 数量 < 3 then 开关= false end
	for i=1,2 do
		if 盖亚.效果检索天翔骑士() then
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.效果选中龙魔道骑士()
	print("盖亚-选中龙魔道骑士")
	local 开关 = true
	local 数量= 效果.检索目标个数()
	if 数量 < 3 then 开关= false end
	for i=1,2 do
		if 盖亚.效果检索龙魔道骑士() then
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.效果选中士兵()
	print("盖亚-选中士兵")
	local 开关 = true
	local 数量= 效果.检索目标个数()
	if 数量 < 3 then 开关= false end
	for i=1,2 do
		if 盖亚.效果检索士兵() then
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.效果选中狱炎()
	local 开关 = true
	local 数量= 效果.检索目标个数()
	if 数量 < 3 then 开关= false end
	for i=1,2 do
		if 盖亚.效果检索狱炎() then
			print("盖亚 - 选中诅咒之龙")
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.效果选中卡去墓地()
	print("盖亚-选中卡片送墓")
	local 开关 = true
	local 数量= 效果.检索目标个数()
	if 数量 < 3 then 开关= false end
	for i=1,2 do
		if 盖亚.效果检索耀星龙() or 盖亚.效果检索狱炎()  then
			tap(识别X,识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then return false end
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.效果选中魔道骑士盖亚()
	print("盖亚-选中魔道骑士")
	local 开关 = true
	local 数量 = 效果.检索目标个数()
	if 数量 < 3 then
		开关 = false
	end

	for i=1,3 do
		if 盖亚.效果检索魔道骑士() then
			tap(识别X, 识别Y+50)
			sleep(100)
			return true
		end
		if 开关 == false then
			return false
		end
		print("当前页未找到魔道骑士，准备翻页")
		局内操作.效果翻一页()
	end
	return false
end

function 盖亚.发动本源效果()
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return false
	end
	local 下标 = 1
	print("盖亚-发动本源效果")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.本源() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return false
		end
		if 局内操作.发动手牌怪效() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return true
		else
			局内操作.点击空白(500)
		end
	else
		局内操作.点击空白(500)
		print("盖亚-发动本源效果")
	end
end

function 盖亚.发动士兵效果()
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return false
	end
	local 下标 = 1
	print("盖亚-发动士兵效果")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内检测.敌方攻击力()
		for i=1,3 do
			if 实况.攻击力[2][i] > 2600 then
				盖亚.士兵效果 = true
				break
			end
		end
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.士兵() then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return false
		end
		if 局内操作.发动手牌怪效() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return true
		else
			局内操作.点击空白(500)
		end
	else
		局内操作.点击空白(500)
		print("盖亚-发动士兵效果")
	end
end

function 盖亚.使用混沌之场()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用混沌之场")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.混沌之场() then
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				盖亚.混沌开关 = true
				if 局内等待() == 2 then return end
				sleep(500)
				盖亚.混沌开关 = false
				return
			else
				局内操作.点击空白(500)
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		print("盖亚-未识别混沌之场")
	end
end

function 盖亚.使用征服()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	HUD.提示信息("使用征服")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.征服() then
			print("检测到征服场地，开始使用")
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				if 局内等待() == 2 then return end
				sleep(500)
				return
			else
				局内操作.点击空白(500)
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		print("盖亚 - 未识别到征服")
	end
end

function 盖亚.使用龙之镜()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	print("使用龙之镜")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.龙之镜() then
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				if 局内等待() == 2 then return end
				sleep(500)
				return
			else
				局内操作.点击空白(500)
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		print("盖亚-未识别龙之镜")
	end
end

function 盖亚.使用枪杀()
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	print("使用枪杀")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.枪杀() then
			局内操作.拖动手牌(手牌X,手牌Y)
			if 局内检测.发动魔法() then
				tap(278,941)
				sleep(延迟.魔法卡延迟)
				if 局内等待() == 2 then return end
				sleep(500)
				return
			else
				局内操作.点击空白(500)
				return
			end
		else
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		print("盖亚-未识别枪杀")
	end
end

function 盖亚.检测手牌()
	盖亚.魔道骑士数量 = 0
	盖亚.狱炎数量 = 0
	盖亚.士兵数量 = 0
	盖亚.征服数量 = 0
	盖亚.混沌数量 = 0
	盖亚.本源数量 = 0
	盖亚.怪数量 = 0
	盖亚.龙之镜数量 = 0
	盖亚.魔道骑士坐标 = {-1, -1}

	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		盖亚.通召点 = true
		return
	end

	local 下标 = 1
	print("盖亚 - 检测手牌详细数量")
	-- 初步思路
	-- 将怪兽卡和魔法卡区分判断和循环，减少循环次数
	-- 怪兽卡只要判断到魔道骑士/诅咒之龙，后续怪兽卡直接跳过
	::one::
	local 返回下标 = 识别手牌(量, 下标, 颜色.效果怪兽, 相似度.怪兽卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		local x,y = 手牌X,手牌Y
		if 盖亚.魔道骑士盖亚() then
			盖亚.怪数量 = 盖亚.怪数量 + 1
			盖亚.魔道骑士数量 = 盖亚.魔道骑士数量 + 1
			盖亚.魔道骑士坐标 = {x,y}
			下标 = 返回下标 + 1
			goto one
			return
		elseif 盖亚.诅咒之龙() then
			盖亚.怪数量 = 盖亚.怪数量 + 1
			盖亚.狱炎数量 = 盖亚.狱炎数量 + 1
			下标 = 返回下标 + 1
			goto one
			return
		elseif 盖亚.耀星龙() then
			盖亚.怪数量 = 盖亚.怪数量 + 1
			下标 = 返回下标 + 1
			goto one
			return
		elseif 盖亚.士兵() then
			盖亚.怪数量 = 盖亚.怪数量 + 1
			盖亚.士兵数量 = 盖亚.士兵数量  +  1
			下标 = 返回下标 + 1
			goto one
			return
		elseif 盖亚.本源() then
			盖亚.怪数量 = 盖亚.怪数量 + 1
			盖亚.本源数量 = 盖亚.本源数量  + 1
			下标 = 返回下标 + 1
			goto one
			return
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
	else
		print("盖亚 - 怪兽卡识别完毕")
	end

	local 下标 = 1
	::two::
	local 返回下标 = 识别手牌(量, 下标, 颜色.魔法卡, 相似度.魔法卡)
	if 返回下标 ~= -1 then
		局内操作.点击手牌(手牌X,手牌Y)
		local x,y = 手牌X,手牌Y
		if 盖亚.征服() then
			盖亚.征服数量 = 盖亚.征服数量 + 1
			下标 = 返回下标 + 1
			goto two
			return
		elseif 盖亚.混沌之场() then
			盖亚.混沌数量 = 盖亚.混沌数量 + 1
			下标 = 返回下标 + 1
			goto two
			return
		elseif 盖亚.龙之镜() then
			盖亚.龙之镜数量 = 盖亚.龙之镜数量 + 1
			下标 = 返回下标 + 1
			goto two
			return
		else
			下标 = 返回下标 + 1
			goto two
			return
		end
	else
		print("盖亚 - 魔法卡识别完毕")
	end

	print("怪数量: ", 盖亚.怪数量)
	print("魔道骑士: ", 盖亚.魔道骑士数量)
	print("诅咒之龙: ", 盖亚.狱炎数量)
	print("士兵: ", 盖亚.士兵数量)
	print("本源: ", 盖亚.本源数量)
	print("征服: ", 盖亚.征服数量)
	print("混沌场: ", 盖亚.混沌数量)
	print("龙之镜: ", 盖亚.龙之镜数量)
	局内操作.点击空白(500)
end

function 盖亚.召唤魔道骑士()
	-- 通招魔道骑士前会做手牌检查
	-- 手牌 0 则跳过通招
	if 盖亚.通召点 then
		return
	end
	
	-- 检索过数量后快捷召唤
	if 盖亚.魔道骑士坐标[1] > -1 then
		局内操作.拖动手牌(盖亚.魔道骑士坐标[1],盖亚.魔道骑士坐标[2])
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
			return
		end
	end

	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	print("盖亚-召唤魔道骑士")
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.效果怪兽,相似度.怪兽卡)
	if 返回下标 ~= -1  then
		局内操作.点击手牌(手牌X,手牌Y)
		if 盖亚.魔道骑士开关 then
			局内操作.拖动手牌(手牌X,手牌Y)
		else
			下标 = 返回下标 + 1
			goto one
			return
		end
		
		if 局内操作.通常召唤() then
			sleep(延迟.召唤)
			if 局内等待() == 2 then return end
			sleep(500)
		end
	else
		局内操作.点击空白(500)
		HUD.提示信息("盖亚-召唤魔道骑士")
	end
end

function 盖亚.使用魔法卡()
	
	if 局内检测.魔陷() == 0 then
		HUD.提示信息("魔陷区已满")
		return
	end
	print("盖亚-使用魔法卡")
	local 量 = 局内检测.手牌数量()
	if 量 == 0 then
		HUD.提示信息("没有手牌了")
		return
	end
	local 下标 = 1
	::one::
	local 返回下标 = 识别手牌(量,下标,颜色.魔法卡,相似度.魔法卡)
	if 返回下标 ~= -1 then
		local 场地魔法卡开关 = 局内检测.在场_场地魔法()
		局内操作.点击手牌(手牌X,手牌Y)
		
		if 局内检测.场地魔法() then
			if 场地魔法卡开关 then
				print("盖亚-已存在场地魔法卡")
				下标 = 返回下标 +1
				goto one
				return
			end
		end
		
		局内操作.拖动手牌(手牌X,手牌Y)
		
		if 局内检测.发动魔法() then
			tap(278,941)
			sleep(延迟.魔法卡延迟)
			if 局内等待() == 2 then return end
			sleep(500)
			盖亚.使用魔法卡()
			return
		else
			局内操作.点击空白(500)
			下标 = 返回下标 +1
			goto one
			return
		end
	else
		局内操作.点击空白(500)
		return
	end
	
end

function 盖亚.发动在场诅咒龙效果()
	HUD.提示信息("发动在场怪效果")
	for i=1,3 do
		if 局内检测.怪兽识别("攻击",i,"我") or 局内检测.怪兽识别("防御",i,"我") then
			sleep(100)
			等待信息框({坐标.我方怪兽[i][1],坐标.我方怪兽[i][2],200})
			if 盖亚.诅咒之龙() == false then
				局内操作.点击空白(500)
				i = i + 1
				goto one
				return
			end
			if 局内操作.在场怪效() then
				sleep(500)
				if 局内等待() == 2 then return end
				sleep(500)
			else
				局内操作.点击空白(500)
			end
			::one::
		end
	end
end

function 盖亚.检测在场征服()
	local 颜色_t = {"1738B4","-33|0|061699|-40|-12|0B8AFA|-40|-35|1EA6C8|-40|-49|067798|-16|-47|2B5F89|1|-47|4BB1E4|1|-38|6A97CD|1|-24|3580A9|1|-13|5497C6|-15|-16|01022C"}
	return 识别.多点找色(101,720,101,720,颜色_t,0,0.9)
end

function 盖亚.选择一张卡()
	if 效果.识别({17,692,46,719},"选") and 效果.识别({124,693,158,722},"卡.") then
		print("盖亚-选择一张卡回卡组")
		if 盖亚.开关 then
			local 开关 = true
			local 数量= 效果.检索目标个数()
			if 数量 < 3 then 开关= false end
			for i=1,2 do
				if 盖亚.效果检索星龙() or 盖亚.效果检索士兵() or 盖亚.效果检索本源() then
					tap(识别X,识别Y+50)
					sleep(100)
					tap(357,1078)
					sleep(100)
					return true
				end
				if 开关 == false then return false end
				局内操作.效果翻一页()
			end
		end
		return false
	end
end

function 盖亚.信息_龙魔道骑士()
	return 识别.识图(246,394,248,396,"龙魔道骑士",0.9,0)
end

function 盖亚.信息_天翔龙骑士()
	return 识别.识图(246,394,248,396,"天翔-龙骑士",0.9,0)
end
function 盖亚.战阶识别敌怪信息()
	local 属性 = {{-1,-1},{-1,-1},{-1,-1}}
	local 坐标 = {{220,436},{362,443},{497,463}}
	for i=1,3 do
		if 局内检测.怪兽识别(nil,i,"敌")  then
			sleep(100)
			tap(坐标[i][1],坐标[i][2])
			sleep(400)
			属性[i][1],属性[i][2] = 局内检测.信息_数值("攻击"),局内检测.信息_数值("防御")
			局内操作.点击空白(500)
		end
	end
	return 属性
end

function 盖亚.战阶识别我怪信息()
	local 属性 = {{0,-1,-1},{0,-1,-1},{0,-1,-1}}
	local 坐标 = {{214,686},{362,707},{510,718}}
	for i=1,3 do
		if 局内检测.怪兽识别(nil,i,"我")  then
			sleep(100)
			tap(坐标[i][1],坐标[i][2])
			sleep(400)
			属性[i][2],属性[i][3]= 局内检测.信息_数值("攻击"),局内检测.信息_数值("防御")
			if 盖亚.信息_天翔龙骑士() then 属性[i][1] = 1 end
			if 盖亚.信息_龙魔道骑士() then 属性[i][1] = 2 end
			局内操作.点击空白(500)
		end
	end
	return 属性
end

function 盖亚.智能攻击()
	local 敌怪属性,我怪属性 = 盖亚.战阶识别敌怪信息(),盖亚.战阶识别我怪信息()
	if 我怪属性[1][1] == 1 then
		if 我怪属性[1][2] < 敌怪属性[1][1] and 我怪属性[1][2] > 敌怪属性[1][2] and 敌怪属性[1][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-1→1")
			局内操作.划动_智能攻击(1,1)
			if 局内等待() == 2  then return end
		elseif 我怪属性[1][2] < 敌怪属性[2][1] and 我怪属性[1][2] > 敌怪属性[2][2] and 敌怪属性[2][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-1→2")
			局内操作.划动_智能攻击(1,2)
			if 局内等待() == 2  then return end
		elseif 我怪属性[1][2] < 敌怪属性[3][1] and 我怪属性[1][2] > 敌怪属性[3][2] and 敌怪属性[3][1] ~= -1 then
			print("盖亚-战斗-天翔骑士-1→3")
			局内操作.划动_智能攻击(1,3)
			if 局内等待() == 2  then return end
		end
		
	end
	
	if 局内检测.敌方怪兽() == 0 then
		局内操作.怪兽默认攻击()
		return
	end
	
	if 我怪属性[2][1] == 1 then
		if 我怪属性[2][2] < 敌怪属性[1][1] and 我怪属性[2][2] > 敌怪属性[1][2] and 敌怪属性[1][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-2→1")
			局内操作.划动_智能攻击(2,1)
			if 局内等待() == 2  then return end
		elseif 我怪属性[2][2] < 敌怪属性[2][1] and 我怪属性[2][2] > 敌怪属性[2][2] and 敌怪属性[2][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-2→2")
			局内操作.划动_智能攻击(2,2)
			if 局内等待() == 2  then return end
		elseif 我怪属性[2][2] < 敌怪属性[3][1] and 我怪属性[2][2] > 敌怪属性[3][2] and 敌怪属性[3][1] ~= -1 then
			print("盖亚-战斗-天翔骑士-2→3")
			局内操作.划动_智能攻击(2,3)
			if 局内等待() == 2  then return end
		end
	end
	
	if 局内检测.敌方怪兽() == 0 then
		局内操作.怪兽默认攻击()
		return
	end
	
	if 我怪属性[3][1] == 1 then
		if 我怪属性[3][2] < 敌怪属性[1][1] and 我怪属性[2][2] > 敌怪属性[1][2] and 敌怪属性[1][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-3→1")
			局内操作.划动_智能攻击(3,1)
			if 局内等待() == 2  then return end
		elseif 我怪属性[3][2] < 敌怪属性[2][1] and 我怪属性[3][2] > 敌怪属性[2][2] and 敌怪属性[2][1] ~= -1  then
			print("盖亚-战斗-天翔骑士-3→2")
			局内操作.划动_智能攻击(3,2)
			if 局内等待() == 2  then return end
		elseif 我怪属性[3][2] < 敌怪属性[3][1] and 我怪属性[3][2] > 敌怪属性[3][2] and 敌怪属性[3][1] ~= -1 then
			print("盖亚-战斗-天翔骑士-3→3")
			局内操作.划动_智能攻击(3,3)
			if 局内等待() == 2  then return end
		end
	end
	
	if 局内检测.敌方怪兽() == 0 then
		局内操作.怪兽默认攻击()
		return
	end
	
	局内操作.智能攻击()
end

writeLog("决斗链接识别命令加载成功......")

