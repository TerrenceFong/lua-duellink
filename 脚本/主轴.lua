require("决斗链接命令库")
require("对接泡椒云")
require("puxiu(1)")
local DDMControl = require("DDMControlV2")
while true do
	local 初始化结果 = DDMControl.初始化(
		"api.privateapi.xyz",
		"9000",
		"de6d43dbbdf84b74a981bb560b3b94e0",
		"038277bf-9513-4727-bc9d-2a7bfa60e035",
		""
	)
	print(初始化结果)
	if 初始化结果 == true then
		break
	end
end

setStopCallBack(function(error)
	if error then
		writeLog("脚本异常结束了!!!")
		writeLog(error)
		print(error)
	end

	writeLog("正常退出脚本-脚本运行结果: 总时间:", math.floor(tickCount()/60000) ," 分钟 " ," 总局数: " , 实况.局数 , " 效率: " , string.format("%.2f",tickCount()/60000/实况.局数) ," 分/局 ", "胜率: " , 实况.胜场/实况.局数*100 ,"%")
	snapShot("sdcard/青石/正常退出截图.png",0,0,720,1280)
	if 异常ID ~= nil then
		stopThread(异常ID)
	end
	if 心跳ID ~= nil then
		stopThread(心跳ID)
	end
	
	if 防卡死ID ~= nil then
		stopThread(防卡死ID)
	end
--[===[	if 登录结果["code"] == 0 then
		卡密下线(卡密)
	end]===]
end)
传送门开关 = true
首次切换角色 = true
路人强制开关 = false
白龙开关 = false

对局 = {}
function  路人()
	local 翻页次数=0
	if 实况.首次路人开关 and UI_in.路人开关 then
		print("路人 - 首次清理")
		实况.首次路人开关 = false
	elseif UI_in.路人开关 and 路人强制开关  then
		print("路人 - 决斗珠模式")
	elseif UI_in.路人开关 and 判断.路人闹钟()==false then
		print("路人 - 时间未到")
		return
	elseif UI_in.路人开关 == false  then
		print("路人 - 关闭状态")
		return
	end
	局外操作.返回主界面()
	
	while(翻页次数 < 8 ) do
		if 局外检测.主界面() and 局外检测.路人可刷() == false and (UI_in.决斗珠开关 == false or UI_in.决斗珠次数 < 1) then
			print("路人 - 完毕.")
			return
		elseif 局外检测.主界面() and 局外检测.路人可刷() == false and UI_in.决斗珠开关 and UI_in.决斗珠次数 > 0 then
			print(" 路人 - 使用决斗珠")
			局外操作.使用决斗珠()
			return
		end

		if 局外检测.主界面() and 局外检测.路人() then
			if 局外检测.对话() then
				local time = tickCount()
				while(true) do
					HUD.提示信息("路人 - 对话中")
					if tickCount() - time > 5000 then
						print("'主界面 - 路人 - 对话中：超过阈值，直接退出循环")
						break
					end
					if 局外检测.路人_自动决斗() then
						local x,y = 识别X,识别Y
						局外操作.路人切换奖励()
						tap (x,y)
						HUD.提示信息("路人 - 对局")
						print('主界面 - 路人 - 对话中 - 对局')
						结算处理.路人()
						break
					end
					局外操作.点击空白(100)
					局外操作.对话快进()
					if 识别.识图(299,419,342,456,"路人-选择卡组",0.8,0) then
						tap(199,805)
						sleep(200)
					end
					if 识别.识图(303,444,339,479,"路人-难度选择",0.8,0) then
						tap(480,632)
						sleep(200)
					end
				end
			else
				HUD.提示信息("非路人对话界面-返回主界面")
				局外操作.返回主界面()
				局外操作.主界面翻页()
				翻页次数 = 翻页次数 + 1
			end
		else
			if 局外检测.主界面() == false then
				局外操作.返回主界面()
			end
			局外操作.主界面翻页()
			翻页次数 = 翻页次数 + 1
		end

		-- 兜底处理
		if 局外检测.路人_自动决斗() then
			local x,y = 识别X,识别Y
			局外操作.路人切换奖励()
			tap (x,y)
			HUD.提示信息("路人 - 对局")
			print('路人_自动决斗 - 对局')
			结算处理.路人()
		end
	end
end

function 获取脚本任务()
	local arr ={}
	local temp = splitStr(功能设置arr["输入-任务"],",")
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

function 对局.白龙()
	print("卡组 -- 白龙")
	白龙开关 = true
	while (true) do
		对局.白龙行动步骤()
		对局.白龙战斗步骤()
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then
				print("对局结束")
				白龙开关 = false
				return
			end
		end
	end
end

function 对局.默认()
	while (true) do
		对局.默认_行动步骤()
		对局.默认_战斗步骤()
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then
				print("对局结束")
				return
			end
		end
	end
end

function 对局.默认_行动步骤()
	if 局内检测.行动步骤() then
		print("默认_行动步骤 进行")
		精确.怪兽卡()
		
		if UI_in.额外特招  then
			基本.额外特招()
		end
		
		if UI_in.技能开关 then
			基本.发动技能()
		end
		
		if UI_in.怪效开关 then
			基本.发动在场怪效()
		end
		
		if UI_in.魔陷开关  then
			基本.发动魔陷()
		end
		
		精确.魔法卡()
		
		if UI_in.场地开关 then
			基本.发动场地()
		end
		
		精确.陷阱卡()
		
		if UI_in.改守为攻 then
			基本.改守为攻()
		end
		
		if UI_in.墓地开关 then
			
			基本.发动墓效()
		end
		
		if 局内检测.我方怪兽() ~= 0 and 基本.检测敌方金宫() == false then
			print("进入战斗阶段")
			局内操作.结束行动步骤(1)
		else
			print("直接结束回合")
			局内操作.结束行动步骤(0)
		end
	end
end

function 对局.默认_战斗步骤()
	if 局内检测.战斗步骤() then
		print("默认_战斗步骤 选择")
		if UI_in.攻击方式 == 0 then
			print("默认攻击")
			局内操作.怪兽默认攻击()
		elseif UI_in.攻击方式 == 1 then
			print("直接攻击")
			局内操作.怪兽直接攻击()
		elseif UI_in.攻击方式 == 2 then
			print("智能攻击")
			局内操作.智能攻击()
		end
		局内操作.结束战斗步骤()
	end
end

function 对局.白给()
	while(true) do
		if 局内检测.行动步骤() then
			基本.发动魔陷()
			精确.魔法卡_自杀()
			精确.陷阱卡()
			局内操作.结束行动步骤(0)
		end
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then  return end
		end
	end
end

function 对局.PVP自定义()
	while (true) do
		if 局内检测.行动步骤() then
			for i=1,8 do
				if 局内等待() == 2 then return end
				局内操作.行动步骤(math.tointeger(PVParr["行动"..i]))
			end
			if 局内检测.我方怪兽() ~= 0 and 基本.检测敌方金宫() == false then
				局内操作.结束行动步骤(1)
			else
				局内操作.结束行动步骤(0)
			end
		end
		
		if 局内检测.战斗步骤() then
			for i=1,4 do
				if 局内等待() == 2 then return end
				局内操作.战斗步骤(math.tointeger(PVParr["战斗"..i]))
			end
			局内操作.结束战斗步骤()
		end
		
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then  return end
		end
	end
end

function 对局.PVE自定义()
	while (true) do
		if 局内检测.行动步骤() then
			for i=1,8 do
				if 局内等待() == 2 then return end
				局内操作.行动步骤(math.tointeger(PVEarr["行动"..i]))
			end
			if 局内检测.我方怪兽() ~= 0 then
				局内操作.结束行动步骤(1)
			else
				局内操作.结束行动步骤(0)
			end
		end
		
		if 局内检测.战斗步骤() then
			for i=1,4 do
				if 局内等待() == 2 then return end
				局内操作.战斗步骤(math.tointeger(PVEarr["战斗"..i]))
			end
			局内操作.结束战斗步骤()
		end
		
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then  return end
		end
	end
end

function 对局.PVP卡组()
	local 卡组 =  math.tointeger(功能设置arr["下拉-PVP卡组"])
	if 卡组 == 0 then
		对局.默认()
	elseif 卡组 == 1 then
		对局.白给()
	elseif 卡组 == 2 then
		--真红眼
	elseif 卡组 == 3 then
		对局.白龙()
	elseif 卡组 == 4 then
		--六五
	elseif 卡组 == 5 then
		对局.盖亚()
		--盖亚
	elseif 卡组 == 6 then
		对局.PVP自定义()
	end
end

function 对局.PVE卡组()
	local 卡组 =  math.tointeger(功能设置arr["下拉-PVE卡组"])
	if 卡组 == 0 then
		对局.默认()
	elseif 卡组 == 1 then
		--真红眼
	elseif 卡组 == 2 then
		对局.白龙()
	elseif 卡组 == 3 then
		--六五
	elseif 卡组 == 4 then
		对局.盖亚()
		--盖亚
	elseif 卡组 == 5 then
		对局.PVE自定义()
	end
end

function 对局.启动(选择) -- 0 PVE 1 PVP
	local 初始时间 = tickCount()
	HUD.提示信息("等待匹配中...")
	while (true) do
		if 局内检测.局内() then
			print("开始对局...")
			break
		end
		if 局外检测.休闲决斗()  then
			tap(识别X,识别Y)
			sleep(100)
		end
		if 局外检测.排名决斗() then
			tap(识别X,识别Y)
			sleep(100)
		end
		if tickCount() - 初始时间 >  60000  then
			print("加载超时结束本次对局")
			局外操作.返回主界面()
			return
		end
		局外操作.点击空白(100)
	end
	if 选择 == 0 then
		对局.PVE卡组()
	elseif 选择 == 1 then
		对局.PVP卡组()
	end
end

function 启动主轴()
	--[===[	
		writeLog("登录方式: ",UI_in.登录方式,"卡密:",登录及实况arr["输入-卡密"])
		if UI_in.登录方式==1 then
			卡密 = 登录及实况arr["输入-卡密"]
			if 卡密登录(卡密) then
				心跳ID = beginThread(卡密心跳,卡密,1)
				if 心跳ID == nil then
					toast("心跳启动失败",0,0,15)
					exitScript()
				else
					toast(登录结果["result"]["card_type"],"剩余时间:",登录结果["result"]["expires"],0,0,15)
					writeLog(登录结果["result"]["card_type"] .. " 剩余时间:",登录结果["result"]["expires"])
					sleep(2000)
				end
			else
				toast("错误:",登录结果["message"],0,0,15)
				sleep(2000)
			end
		else
			if 试用登录() then
				心跳ID = beginThread(试用心跳,1)
				if 心跳ID == nil then
					toast("心跳启动失败",0,0,12)
					exitScript()
				else
					toast("剩余时间:",登录结果["result"]["expires"],0,0,15)
					writeLog("剩余时间: ".. 登录结果["result"]["expires"])
					sleep(2000)
				end
			else
				toast("错误:",登录结果["message"],0,0,15)
				sleep(2000)
			end
		end
	]===]
	
	DDMControl.云控_连接云控系统()
	local 获取设备名字结果=DDMControl.云控_获取设备名字()
	print(获取设备名字结果)
	DDMControl.云控_上传运行日志(获取设备名字结果)

	分辨率调整()
	局外检测.主界面等级()
	
	异常ID = beginThread(异常处理线程)
	if UI_in.防卡死开关  then
		防卡死ID = beginThread(防卡死线程)
	end
	
	if UI_in.路人开关 then
		路人()
	end
	::one::
	local 任务 = 获取脚本任务()
	for i=1,#任务/2 do
		模式局数  = 任务[2*i]
		当前模式 = 任务[i*2-1]
		while (模式局数>0) do
			if 当前模式 == 1 then
				HUD.任务("传送门 剩余/"..模式局数)
				传送门()
			elseif 当前模式 == 2 then
				HUD.任务("活动 剩余/"..模式局数)
				活动()
			elseif 当前模式 == 3 then
				HUD.任务("休闲 剩余/"..模式局数)
				休闲()
			elseif 当前模式 == 4 then
				HUD.任务("排名 剩余/"..模式局数)
				排名()
			end
			模式局数 = 模式局数 - 1
		end
	end
	if UI_in.任务完成选项 == 0 then
		writeLog("完成一轮任务重新开始")
		goto one
	elseif UI_in.任务完成选项 == 1 then
		HUD.提示信息("死循环路人中")
		writeLog("死循环路人")
		UI_in.路人开关 = true
		while(true) do
			路人()
		end
	else
		writeLog("关闭游戏及脚本")
		stopApp(游戏包名)
		exitScript()
	end
end

function 传送门()
	if 传送门开关 == false then
		return
	end
	if 局外检测.主界面() then
		路人()
	end
	局外操作.进入传送门()
	if 局外操作.传送门准备() == false then
		return
	else
		对局.启动(0)
	end
	结算处理.传送门()
end

function 休闲()
	if 局外检测.休闲决斗() == false then
		局外操作.进入休闲()
	end
	
	if 局外检测.休闲决斗() then
		路人()
		if 局外检测.休闲决斗() then
			tap (识别X,识别Y)
			对局.启动(1)
		else
			局外操作.进入休闲()
		end
		local time  = tickCount()
		while (局外检测.休闲决斗() == false) do
			结算处理.休闲()
			if tickCount() - time > 50000 then
				局外操作.返回主界面()
				return
			end
		end
	end
end

function 排名()
	if 局外检测.排名决斗() == false then
		局外操作.进入排名()
	end
	if 局外检测.排名决斗() then
		路人()
		if 局外检测.排名决斗() then
			tap(识别X,识别Y)
			对局.启动(1)
		else
			局外操作.进入排名()
		end
		local time  = tickCount()
		while (局外检测.排名决斗() == false) do
			结算处理.排名()
			if tickCount() - time > 50000 then
				局外操作.返回主界面()
				return
			end
		end
	end
end

function 活动()
	if UI_in.活动 == 1 then
		骰子活动()
	elseif UI_in.活动==2 then
		组队锦标赛()
	elseif UI_in.活动==3 then
		RAIDULE活动()
	end
end

function RAIDULE活动()
	局外操作.进入活动("RAIDDUEL")
	local 救援活动颜色 = {"D5FFB8","13|0|D5FFB8|30|0|D5FFB8|59|0|D5FFB8|91|0|D7FFBC|91|13|87FF36|69|13|88FD3B|40|14|84FF31|28|14|84FF31|19|14|84FF31|5|14|84FF31"}
	local 自动决斗颜色 = {"FFE993","-11|0|FDE792|13|0|F5E08D|27|0|FFEB96|38|0|FFEB96|48|0|FFEB96|67|0|FFEC97|84|0|FFEC97|114|0|FFEB96|127|0|FFEB96|127|29|FFA827"}
	local 下一步颜色 = {"FFFFFF","0|4|662807|25|0|FFFFFF|25|4|662807|47|5|612607|47|9|F0EEED|61|1|712C07|69|2|FFFFFF|77|2|FFFFFF|91|2|6D2C07|77|19|FFFFFF"}
	while (true) do
		if 局外检测.活动界面("RAIDDUEL") then
			HUD.提示信息("RAIDDUEL 中 ... ")
			if 识别.多点找色(310,400,312,1120,救援活动颜色,0,0.9) then
				tap(识别X,识别Y)
				sleep(200)
			else
				swipe(609,1180,609,800,100)
				sleep(2000)
			end
		end
		if 识别.多点找色(465,1086,494,1110,自动决斗颜色,0,0.9) then
			tap(识别X,识别Y)
			sleep(200)
		end
		
		if 识别.多点找色(314,1202,316,1204,下一步颜色,0,0.9) or 识别.多点找色(313,1208,315,1210,下一步颜色,0,0.9) then
			tap(识别X,识别Y)
			sleep(200)
		end
		局外操作.结算_好()
		局外操作.结算_决斗评价()
		局外操作.结算_升级奖励()
		局外操作.对话快进()
		局外操作.点击空白(200)
		if 局外检测.主界面()then
			RAIDULE活动()
		end
		if 局外检测.灰主界面()  then
			局外操作.返回主界面()
		end
	end
end

function 骰子活动()
	UI_in.使用物品 = true
	local  使用物品= function()
		if UI_in.骰子_使用物品  then
			while(局外检测.活动界面("骰子活动")) do
				tap(532,1104)
				sleep(2000)
			end
			local 范围 = {{375,406,409,444},{375,562,410,595},{374,715,410,751},{380,863,420,909}}
			for i=1,4 do
				::one::if 识别.识图(范围[i],"骰子活动-使用-2",0.7,1) then
					tap (识别X,识别Y)
					sleep(500)
					if 识别.识图(251,239,297,279,"骰子活动-使用物品界面",0.8,0) then
						if i< 4 then
							i=i+1
							goto one
						else
							break
						end
						break
					end
					sleep(1000)
					while(局外检测.活动界面("骰子活动")) do
						HUD.提示信息("等待...")
						sleep(500)
					end
					return true
				end
			end
			return false
		end
	end
	局外操作.进入活动("骰子活动")
	while (true) do
		HUD.提示信息("骰子活动")
		::one::
		if 局外检测.活动界面("骰子活动")  and 识别.识图(484,911,548,972,"骰子活动-无道具",0.8,0) == false then
			tap (524,938) -- 点击掷骰子
			sleep(500)
		end
		
		if 识别.识图(300,442,340,482,"难度选择",0.8,0) then
			tap(647,612)
			sleep(100)
		end
		
		if 识别.识图(464,1091,496,1133,"骰子活动-自动决斗",0.8,1) then
			sleep(100)
			tap(识别X,识别Y)
			sleep(2000)
			local time = tickCount()
			while(识别.识图(464,1091,496,1133,"骰子活动-自动决斗",0.8,1)) do
				sleep(2000)
				if tickCount() - time > 20000 then
					break
				end
			end
			
			local time = tickCount()
			while(局内检测.局内() == false) do
				sleep(500)
				if tickCount() -time > 20000 then
					break
				end
			end
			local time = tickCount()
			while (true) do
				if 局外检测.活动界面("骰子活动") then
					snapShot("sdcard/青石/test.png",0,0,720,1280)
					break
				end
				if 局内检测.局内() == false and 局外检测.活动界面("骰子活动")==false then
					局外操作.结算_好()
					局外操作.结算_决斗评价()
					局外操作.结算_升级奖励()
					局外操作.对话快进()
					识别.识图(481,727,522,768,"骰子活动-确认",0.8,1)
				end
				局内操作.点击空白(200)
				
				if tickCount() - time > 5*60000 then
					print("骰子活动-对局超时")
					局外操作.返回主界面()
					局外操作.进入活动("骰子活动")
					goto one
					return
				end
			end
			if UI_in.使用物品 and 识别.识图(484,911,548,972,"骰子活动-无道具",0.8,0)then
				print("使用物品")
				if 使用物品() == false then
					print("无道具了 活动结束")
					局外操作.返回主界面()
					return
				end
			else
				return
			end
		end
		
		if UI_in.使用物品 and 识别.识图(484,911,548,972,"骰子活动-无道具",0.8,0) then
			print("使用物品")
			if 使用物品() == false then
				print("无道具了 活动结束")
				局外操作.返回主界面()
				return
			end
		end
		
		if 局外检测.主界面() then
			print("检测到主界面重新进入活动")
			局外操作.进入活动("骰子活动")
		end
		
		if 局外检测.灰主界面() then
			print("检测到灰主界面")
			局外操作.返回主界面()
			局外操作.进入活动("骰子活动")
		end
		
		识别.识图(477,707,518,743,"骰子活动-确认-2",0.8,1)
		
		识别.识图(479,844,516,883,"骰子活动-确认-2",0.8,1)
		
		局外操作.对话快进()
		
		局外操作.点击空白(100)
	end
end

function 组队锦标赛()
	
	local 颜色_组队决斗 = {"60C1FF","0|7|2CADFF|9|9|1DA7FF|24|9|1DA7FF|33|9|1DA7FF|57|9|1DA7FF|73|9|1DA7FF|92|9|1DA7FF|102|2|4CB9FF|119|5|35B0FF|119|10|0E99F2"}
	local 颜色_下一步 = {"712C07","11|-1|FFFFFF|32|-1|FFFFFF|75|0|FFFFFF|84|0|FFFFFF|94|0|FFFFFF|103|0|712C07|84|18|FFFFFF|52|9|FFFFFF|20|22|FFFFFF|43|26|923909"}
	local 颜色_活动流程 = {"FFFFFF","19|0|E2DBD7|37|0|D6CECA|74|1|D4CFCD|108|5|FFFFFF|108|11|FFFFFF|108|16|FFFFFF|108|21|FFFFFF|71|21|FFFFFF|40|21|FFFFFF|8|21|FFFFFF"}
	local 颜色_物品不足 = {"FFFFFF","245|0|E7E7E7|279|0|E4E4E4|299|-18|ECECEC|217|-26|808080|191|-26|808080|156|-26|808080|119|-26|808080|92|-26|808080|67|-26|808080|36|-64|868686"}
	local 颜色_更改赛种 = {"141AA3","39|1|FFFFFF|66|1|FFFFFF|92|1|FFFFFF|115|1|FFFFFF|150|1|1A1A8F|150|33|8F8F8F|88|33|EEEEEE|68|33|D4CFD4|42|33|A0A1A1|20|33|8F8F8F"}
	local 颜色_ARC杯 = {"B4BBBB","70|-1|B0B0B0|50|-1|BAB0B0|98|-1|9F9F9F|128|-1|999292|109|41|22222F|86|24|383445|60|24|383440|32|24|222633|1|24|69616F|22|40|222232"}
	local 颜色_zexal杯 = {"DBDBD5","22|0|CCCCCC|71|0|B4B4B4|104|0|9A9A9A|104|50|222233|85|36|222233|65|37|2C2233|30|37|3E3B4C|9|37|151525|10|57|20202D|101|57|1D2122"}
	local 颜色_5DS杯 = {"494453","23|0|67676A|48|0|514754|66|2|2D2738|66|28|B3B3B5|59|33|5C5C5D|57|40|272737|36|40|161626|13|40|333338|-2|40|594E5E|-11|40|6A6A7A"}
	local 颜色_GX杯 = {"1A1822","-18|0|848489|-17|14|5A5A64|-17|19|B4B8B8|-17|24|625462|-17|43|2B2B2C|7|43|1C1C26|22|24|322735|14|3|22222F|39|3|22222D|35|46|222230"}
	local 颜色_DM杯 = {"322C33","16|0|181219|28|4|302B39|47|4|3A3F45|77|4|2D2D35|75|51|A8A8A8|46|51|BBBAB9|24|51|D6D5D1|8|51|D9CDCD|-5|51|DDDDD9|-20|51|DDDDDD"}
	local 颜色_组队决斗2 = {"E6F5FF","13|0|DEECF5|36|0|E4F3FD|80|0|E6F5FF|116|0|E6F5FF|117|24|2CADFF|89|24|32B0FF|54|24|32B0FF|21|24|32B0FF|10|24|32B0FF|-4|25|2BADFF"}
	local 赛种 = 功能设置arr["下拉-赛种"] + 1
	
	local 选择赛种 =  function ()
		if 识别.多点找色(305,1221,307,1223,颜色_活动流程,0,0.9) then
			if 赛种 == 1 then
				swipe(460,300,460,900,100) -- 上滑
				sleep(1000)
				if 识别.多点找色(264,377,266,379,颜色_ARC杯,0,0.9)  then
					tap(识别X,识别Y)
				elseif 识别.多点找色(269,619,271,621,颜色_zexal杯,0,0.9) then
					tap(识别X,识别Y)
				elseif 识别.多点找色(272,874,274,876,颜色_5DS杯,0,0.9) then
					tap(识别X,识别Y)
				else
					swipe(460,900,460,300,100)  -- 下滑
					sleep(2000)
					if 识别.多点找色(320,614,322,616,颜色_GX杯,0,0.9) then
						tap(识别X,识别Y)
					elseif 识别.多点找色(279,855,281,857,颜色_DM杯,0,0.9) then
						tap(识别X,识别Y)
					end
				end
			elseif 赛种 <= 3 then
				swipe(460,900,460,300,100)  -- 下滑
				sleep(1000)
				if 赛种 == 2 and  识别.多点找色(279,855,281,857,颜色_DM杯,0,0.9) then
					tap(识别X,识别Y)
				elseif 赛种 == 3 and 识别.多点找色(320,614,322,616,颜色_GX杯,0,0.9) then
					tap(识别X,识别Y)
				end
			elseif 赛种 > 3 then
				swipe(460,300,460,900,100) -- 上滑
				sleep(1000)
				if 赛种 == 4 and 识别.多点找色(272,874,274,876,颜色_5DS杯,0,0.9) then
					tap(识别X,识别Y)
				elseif 赛种 == 5 and 识别.多点找色(269,619,271,621,颜色_zexal杯,0,0.9)  then
					tap(识别X,识别Y)
				elseif 赛种 == 6 and 识别.多点找色(264,377,266,379,颜色_ARC杯,0,0.9) then
					tap(识别X,识别Y)
				end
			end
			sleep(2000)
		end
	end
	
	if 局外检测.活动界面("组队锦标赛") == false then
		局外操作.进入活动("组队锦标赛")
	end
	
	if 识别.多点找色(36,297,38,299,颜色_更改赛种,0,0.9) then
		tap (识别X,识别Y)
		sleep(2000)
		local time = tickCount()
		while (true) do
			if 识别.多点找色(305,1221,307,1223,颜色_活动流程,0,0.9)  then
				break
			end
			if tickCount() - time > 5000 then
				局外操作.进入活动("组队锦标赛")
			end
		end
		选择赛种()
	end
	
	while (true) do
		HUD.提示信息("组队锦标赛中 ... ")
		if 局外检测.活动界面("组队锦标赛") then
			if 识别.多点找色(296,878,298,880,颜色_组队决斗,0,0.9) or 识别.多点找色(298,891,300,893,颜色_组队决斗2,0,0.9)  then
				tap (识别X,识别Y)
				sleep(200)
			end
		end
		
		if 识别.识图(302,410,343,443,"难度选择",0.8,0) then
			tap (652,591)
			sleep(200)
		end
		选择赛种()
		局外操作.结算_好()
		局外操作.结算_决斗评价()
		局外操作.结算_升级奖励()
		局外操作.对话快进()
		if 识别.多点找色(307,1203,309,1205,颜色_下一步,0,0.9) then
			tap(识别X,识别Y)
			sleep(200)
		end
		
		if 识别.多点找色(219,907,221,909,颜色_物品不足,0,0.9) then
			print("物品不足退出活动")
			局外操作.返回主界面()
			return
		end
		
		识别.识图(463,1089,499,1136,"骰子活动-自动决斗",0.8,1)
		
		局外操作.点击空白(200)
	end
	
end

function 异常处理线程()
	print("异常处理线程启动")
	local 异常X,异常Y = -1,-1
	function 异常识图(...) -- 标准: 数组范围,图片名,相似度,点击判断0/1
		local 返回值  = false
		local temp = {...}
		local 范围 = {}
		local 图名,相似度,点击
		if type(temp[1]) == "table" and #temp == 4 then
			范围={temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
			图名=temp[2]
			相似度 = temp[3]
			点击 = temp[4]
		elseif type(temp[1]) == "number" and #temp == 7 then
			范围={temp[1],temp[2],temp[3],temp[4]}
			图名 = temp[5]
			相似度 = temp[6]
			点击 = temp[7]
		else
			print("异常- 形参类型"..type(temp[1]).." 长度: "..#temp)
			print("异常-识图函数-联系作者")
    	print(temp)
			异常提示("异常-识图函数-联系作者")
		end
		keepCapture()
		local ret,x,y = findPic(范围[1],范围[2],范围[3],范围[4],图名..".png","101010",0,相似度)
		if x > -1 then
			异常X = x
			异常Y = y
			if 点击 ==  1 then
				tap (x,y)
				sleep(200)
			end
			返回值 = true
		end
		releaseCapture()
		return  返回值
	end
	while(true) do
		if 异常识图(范围.主界面,"主界面检测",0.8,0) == false and 异常识图(范围.局内检测,"局内检测1.png|局内检测2.png|局内检测3",0.8,0) == false then
			if 异常识图(477,746,511,785,"重试",0.8,0) then
				正常运行判定 = false
				sleep(100)
				if UI_in.掉线选择 == 0 then
					tap(502,771)
					print("异常-掉线-重试")
				else
					tap(202,762)
					print("异常-掉线-重启")
				end
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(324,783,365,822,"重启-2",0.8,0) then
				正常运行判定 =false
				sleep(100)
				tap(357,797)
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(471,693,515,737,"重试-2",0.8,0) then
				正常运行判定 = false
				sleep(100)
				if UI_in.掉线选择 == 0 then
					tap(503,715)
					print("异常-没发现网络-重试")
				else
					tap(212,711)
					print("异常-没发现网络-重启")
				end
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(168,678,214,723,"未完成对局_结束",0.8,0)then
				正常运行判定 = false
				sleep(100)
				tap(异常X,异常Y)
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(296, 705, 420, 794,"重启",0.98,0) then
				正常运行判定 = false
				sleep(100)
				print("异常-发生错误重启")
				tap(204,701)
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(256, 774, 309, 825,"开始游戏_开",0.9,0)then
				正常运行判定 = false
				sleep(100)
				print("异常-开始游戏")
				tap(异常X,异常Y)
				sleep(500)
				正常运行判定 = true
			end
			
			if 异常识图(281, 587, 323, 628,"通讯异常_通",0.9,0) then
				正常运行判定 = false
				sleep(100)
				tap(357, 704)
				sleep(500)
				print("异常_通讯异常")
				正常运行判定 = true
			end
			
			if 异常识图(4,54,45,92,"通知",0.95,0) then
				正常运行判定 = false
				sleep(100)
				tap(57,1234)
				sleep(500)
				print("异常_通知界面")
				正常运行判定 = true
			end
			
			if 异常识图(205,762,236,798,"暂不安装",0.9,0) then
				正常运行判定 = false
				sleep(100)
				tap (272,778)
				sleep(500)
				print("模拟器-取消安装")
				正常运行判定 = true
			end
			
			if 异常识图(532,1065,610,1135,"对局卡死判定",0.9,0) then
				正常运行判定 = false
				sleep(100)
				stopApp(游戏包名)
				sleep(1000)
				runApp(游戏包名)
				正常运行判定 = true
			end
            
			if 异常识图(286,575,288,579,"连接错误",0.8,0) then
				正常运行判定 = false
				sleep(100)
				tap (360,713)
				sleep(500)
				print("异常-连接错误")
				正常运行判定 = true
			end
            
		elseif 异常识图(范围.局内检测,"局内检测2.png|局内检测3",0.8,0) then
			if 异常识图(286,575,288,579,"连接错误",0.8,0) then
				正常运行判定 = false
				sleep(100)
				tap (360,713)
				sleep(500)
				print("异常-连接错误")
				正常运行判定 = true
			end
		end
		sleep(5000)
	end
end

function 防卡死线程()
	print("启动防卡死线程")
	while(true) do
		local count = 实况.局数
		local i =1
		for i=1,UI_in.防卡死时间 do
			sleep(60000)
		end
		if count == 实况.局数 and i == UI_in.防卡死时间 then
			snapShot("sdcard/青石/异常卡死截图.png",0,0,720,1280)
			sleep(500)
			writeLog("卡死重启")
			正常运行判定 = false
			stopApp(游戏包名)
			sleep(1000)
			runApp(游戏包名)
			正常运行判定 = true
		end
	end
end

function 切换角色(...)
	-- 50,300,90,520
	-- 50,520,90,700
	-- 50,700,90,880
	-- 50,880,90,1060
	local 划动 = function()
		swipe(5,1054,5,440,1000)
		sleep(3000)
	end
	t = ...
	if UI_in.切换角色开关 == false then
		return
	end
	
	if 局外检测.复制卡组界面() == false then
		局外操作.进入复制卡组界面()
	end
	
	local 划动至顶页 = function ()
		if 首次切换角色 then
			HUD.提示信息("首次切换角色,划动至顶页..")
			local time = tickCount()
			while(true) do
				snapShot(文件路径.."test.png",23,318,112,343)
				swipe(5,440,5,1054,100)
				sleep(3000)
				if 识别.识图(23,318,112,343,文件路径.."test",0.95,0) then
					if 局外检测.复制卡组界面() then
						首次切换角色 = false
						切换角色({50,300,90,520})
						return true
					else
						局外操作.返回主界面()
						切换角色({50,300,90,520})
						return true
					end
				end
				
				if tickCount() - time > 3* 60000 then
					print("划动至首页超时")
					局外操作.返回主界面()
					切换角色({50,300,90,520})
					return true
				end
			end
		else
			return false
		end
	end
	HUD.提示信息("寻找合适等级角色...")
	if 局外检测.等级_等(t) then
		local x,y = 识别X,识别Y
		tap(0,识别Y)
		sleep(200)
		if UI_in.等级 < 局外检测.卡组_等级({识别X,识别Y,识别X+80,识别Y+30}) then
			local y1,y2 = t[4],t[4]+180
			if y1 < 881 and y2 < 1061 then
				print("下一格")
				切换角色({t[1],y1,t[3],y2})
			else
				if 划动至顶页() == false then
					print("重新开始")
					划动()
					切换角色({50,300,90,520})
				end
			end
		else
			HUD.提示信息("找到了..开始切换角色..")
			局外操作.切换角色(230,y+60)
		end
	else
		if t[4] + 180 < 1061 then
			print("下一格")
			切换角色({t[1],t[4],t[3],t[4]+180})
			return
		else
			if 划动至顶页() == false then
				print("重新开始")
				划动()
				切换角色({50,300,90,520})
			end
		end
		
		if 局外检测.复制卡组界面() then
			snapShot(文件路径.."test.png",16,326,119,362)
			划动()
			if 识别.识图(16,326,119,362,文件路径.."test",0.95,0) then
				print("没有满足等级角色结束函数 返回主界面")
				if UI_in.等级flag  then
					传送门开关 = false
				end
				操作.返回主界面()
				return
			else
				切换角色({50,300,90,520})
			end
		else
			print(1)
		end
	end
end

function 对局.白龙行动步骤()
	if 局内检测.行动步骤() and 局内等待() == 1 then
		
		sleep(200)
		
		白龙.对局初始化()
		
		if UI_in.墓地开关 then
			基本.发动墓效()
		end
		
		print("使用宝牌")
		白龙.使用宝牌()
		
		print("特招亚白龙")
		白龙.特招亚白龙()
		
		print("使用魔法卡")
		精确.魔法卡()
		
		if UI_in.改守为攻 then
			基本.改守为攻()
		end
		
		local 我方怪兽 = 局内检测.我方怪兽()
		if 白龙.检索1_9星怪兽("8") > 0  and 我方怪兽< 3 then   -- 场上存在8星怪兽
			print("存在8星怪兽通召 贤士 或 白石")
			白龙.通召贤士()
			白龙.通召白石(1)
			白龙.通召少女()
			
			if 白龙.其他通召 and 白龙.通召点 == false  then
				print("白龙-通常召唤怪兽")
				精确.怪兽卡()
			end
			
		elseif 白龙.检索1_9星怪兽("1")> 0 and 我方怪兽< 3 then -- 场上存在1星怪兽
			print("存在 1星 怪兽 发动贤士效果 通召白石 或 贤士")
			if 白龙.发动贤士效果() then
				print("贤士效果发动成功")
				白龙.通召白石(1)
				白龙.通召少女()
				白龙.通召贤士()
			else
				print("贤士效果发动失败")
				白龙.通召少女()
				白龙.通召白石(1)
				白龙.通召贤士()
			end
			if 白龙.其他通召 and 白龙.通召点 == false  then
				print("白龙-通常召唤怪兽")
				精确.怪兽卡()
			end
		else
			if 白龙.通召点 == false and 我方怪兽< 2 then
				print("未通召 检索白石 贤士 数量")
				白龙.白石贤士数量()
				print("贤士: ",白龙.贤士数,"白石: " ,白龙.白石数)
				if 白龙.白石数 > 0 and 白龙.贤士数 > 0 then
					print("有白石和贤士 通召白石拉贤士")
					白龙.通召白石(1)
					白龙.发动贤士效果()
					
				elseif 白龙.贤士数 > 1 then
					print("有两贤士 通召贤士发贤士效果")
					白龙.通召贤士()
					白龙.发动贤士效果()
					
				elseif 白龙.贤士数 == 1 then
					print("只有一个贤士 优先召唤少女")
					白龙.通召少女()
					白龙.通召贤士()
				elseif 白龙.贤士数 == 0  and 白龙.白石数 > 0 then
					print("只有白石 优先召唤少女")
					白龙.通召少女()
					白龙.通召白石(0)
					if 白龙.其他通召 and 白龙.通召点 == false then
						精确.怪兽卡()
					end
				elseif 白龙.贤士数 == 0 and 白龙.白石数 == 0 then
					print("白石 贤士 全无 召唤少女")
					白龙.通召少女()
					if 白龙.其他通召 and  白龙.通召点 == false then
						print("白龙-通常召唤怪兽")
						精确.怪兽卡()
					end
				end
			else
				print("不进行召唤")
			end
		end
		白龙.检索摄理()
		白龙.陷阱卡()
		
		if UI_in.墓地开关 then
			if 基本.发动墓效() then
				print("发动墓效成功检索一次亚白龙")
				白龙.特招亚白龙()
			end
		end
		
		if 白龙.检索1_9星怪兽("8") > 0 and 白龙.检索1_9星怪兽("1") > 0 then
			print("1+8同调")
			基本.额外特招()
		end
		
		if 白龙.检索1_9星怪兽("8") > 1 then
			print("8+8融合")
			白龙.爆裂龙开关 =true
			基本.额外特招()
			白龙.爆裂龙开关 = false
			if 白龙.通召点 == false and 白龙.检索1_9星怪兽("8") > 0 then
				print("存在 8星怪兽可同调")
				白龙.通召白石(1)
				白龙.通召少女()
				白龙.通召贤士()
				基本.额外特招()
			end
		end
		
		if UI_in.技能开关 then
			if 基本.发动技能() then
				print("开启技能")
				白龙.使用融合()
			end
		end
		
		if 白龙.检索1_9星怪兽("9") > 0 then
			基本.发动在场怪效()
		end
		
		if UI_in.改守为攻 then
			基本.改守为攻()
		end
		
		if 局内检测.我方攻怪兽() ~= 0 and 基本.检测敌方金宫() == false then
			局内操作.结束行动步骤(1)
		else
			局内操作.结束行动步骤(0)
		end
	end
end

function  对局.白龙战斗步骤()
	if 局内检测.战斗步骤() and 局内等待() == 1 then
		if 局内检测.敌方怪兽() > 0 then
			白龙.战阶检索爆裂()
			白龙.智能攻击()
		else
			局内操作.怪兽默认攻击()
		end
		
		
		局内操作.结束战斗步骤()
	end
end

function 对局.盖亚()
	print("卡组 -- 盖亚")
	盖亚.开关 = true
	while (true) do
		对局.盖亚主要步骤()
		对局.盖亚战斗步骤()
		if 局内等待() == 2 then
			for i=1,10 do
				局内操作.点击空白(200)
			end
			if 局内检测.局内() == false  then
				盖亚.开关 = false
				print("对局结束")
				return
			end
		end
	end
end

function 对局.盖亚主要步骤()
	if 局内检测.行动步骤() and 局内等待()==1 then
		local 场地效果开关 =  true
		盖亚.通召点,盖亚.技能开关,盖亚.诅咒之龙效果,盖亚.怪效强制开关,盖亚.士兵效果 = false,false,false,false,false
		盖亚.检测手牌()
		local 征服flag = 盖亚.检测在场征服()
		if 局内检测.在场_场地魔法() == false then
			print("盖亚-场上不存在场地魔法卡")
			if 盖亚.混沌数量 >  0 then
				print("盖亚-使用混沌之场")
				盖亚.使用混沌之场()
				
				盖亚.检测手牌()
				if 盖亚.征服数量 > 0 then
					盖亚.使用征服()
					盖亚.检测手牌()
					if 基本.发动场地() then 场地效果开关 = false end
				else
					if 基本.发动技能() then
						盖亚.检测手牌()
						if 基本.发动场地() then 场地效果开关 = false end
					end
				end
				
			elseif 盖亚.征服数量 > 0  then
				print("盖亚-使用征服")
				盖亚.使用征服()
				盖亚.检测手牌()
				if 基本.发动场地() then 场地效果开关 = false end
			elseif 盖亚.征服数量 == 0 and 盖亚.怪数量 > 1 then
				print("盖亚-发动技能")
				if 基本.发动技能() then
					盖亚.检测手牌()
					if 基本.发动场地() then 场地效果开关 = false end
				end
			end
			
		else
			if 征服flag == false and 盖亚.征服数量 > 0 then
				盖亚.使用征服()
				盖亚.检测手牌()
				if 基本.发动场地() then 场地效果开关 = false end
			elseif 征服flag == false then
				if 基本.发动技能() then
					盖亚.检测手牌()
					if 基本.发动场地() then 场地效果开关 = false end
				end
			end
		end
		盖亚.检测手牌()
		local flag =  false
		局内检测.敌方攻击力()
		for i=1,3 do
			if 实况.攻击力[2][i] > 2300 then
				flag = true
				break
			end
		end
		
		if 场地效果开关 then 基本.发动场地() end
		
		if 盖亚.魔道骑士数量 > 0 and (局内检测.我方怪兽() == 0 or flag) then
			print("盖亚-手牌存在魔道骑士")
			盖亚.召唤魔导骑士()
			if 盖亚.通召点 then
				盖亚.发动在场诅咒龙效果()
			end
		else
			if 盖亚.本源数量 > 0 then
				print("盖亚-不存在 魔道骑士 发动本源效果")
				盖亚.发动本源效果()
			else
				
				if 局内检测.我方怪兽() == 0 then
					精确.怪兽卡()
				end
			end
		end
		
		盖亚.使用魔法卡()
		精确.陷阱卡()
		
		if 盖亚.士兵数量 > 0 then
			local 属性 = 盖亚.战阶识别我怪信息()
			for i=1,3 do
				if ( 属性[i][1] ==1 or 属性[i][1] == 2 ) and 属性[i][2] < 2600 then
					盖亚.发动士兵效果()
					break
				end
			end
		end
		
		if 局内检测.我方攻怪兽() ~= 0 then
			局内操作.结束行动步骤(1)
		else
			局内操作.结束行动步骤(0)
		end
	end
end

function  对局.盖亚战斗步骤()
	if 局内检测.战斗步骤() and 局内等待() == 1 then
		if 局内检测.敌方怪兽() > 0 then
			盖亚.智能攻击()
		else
			局内操作.怪兽默认攻击()
		end
		
		
		if 盖亚.士兵数量 >0 then
			if 局内等待() == 1 then
				sleep(1000)
			end
			if 局内检测.敌方怪兽() == 0 and 局内检测.敌方生命值() <= 2600  then
				print("盖亚-发动士兵效果斩杀")
				盖亚.发动士兵效果()
				战斗步骤_初始化()
				局内操作.怪兽默认攻击()
			end
		end
		局内操作.结束战斗步骤()
	end
end

--sleep(3000)
local time = tickCount()
-- 类_保护(启动主轴,{nil})
DDMControl.脚本_异常捕获运行(启动主轴, 3)
print("用时:",tickCount() - time)

