TURING = require("TURING")
extractAssets("斑驳青石.rc", getSdPath(), "场景_150.lib")
extractAssets("斑驳青石.rc", getSdPath(), "怪兽_185_125_149.lib")
extractAssets("斑驳青石.rc",getSdPath(), "攻击力字库.lib")
extractAssets("斑驳青石.rc",getSdPath(), "等级数字_2_175.lib")
extractAssets("斑驳青石.rc",getSdPath(), "等级_175.lib")
extractAssets("斑驳青石.rc",getSdPath(), "主界面_结算_等级.lib")
extractAssets("斑驳青石.rc",getSdPath(), "白龙.lib")
extractAssets("斑驳青石.rc",getSdPath(),"信息-攻击力.lib")
extractAssets("斑驳青石.rc",getSdPath(),"怪兽识别.lib")
extractAssets("斑驳青石.rc",getSdPath(),"效果.lib")
extractAssets("斑驳青石.rc",getSdPath(),"盖亚.lib")
extractAssets("斑驳青石.rc",getSdPath(),"生命值.lib")
识别X,识别Y,手牌X,手牌Y,手牌X_2,手牌Y_2 = -1,-1,-1,-1,-1,-1
识别={}
运算 = {}
HUD = {提示ID = createHUD(),模式ID=createHUD()}
图灵文字 = ""
function HUD.坐标绘制(文字,x,y)
	showHUD(createHUD(),文字..x..","..y,8,"FFFF0000","",0,x,y,0,0,0,0,0,0)
end

function HUD.任务(文字)
	showHUD(HUD.模式ID,文字,10,"0xffff0000","0x99ffffff",0,0,0,0,0)
end

function HUD.提示信息(文字)
	showHUD(HUD.提示ID,"状态:"..文字,11,"0xFFFF80C0","0x5581FED2",2,0,0,0,0)
end

function 异常提示(文字)
	while (true) do
		HUD.提示信息(文字)
	end
end

function 截图到内存(范围)
	if (范围[3]-范围[1]) * (范围[4]-范围[2]) > 2500 then
		releaseCapture()
		keepCapture()
		return true
	end
	return false
end
function 识别.找色(...) -- 标准: 范围数组,颜色,相似度
	local t = ...
	local 范围 = {}
	local 颜色,相似度
	if #t == 3 and type(t[1]) == "table" then
		范围 = {t[1][1],t[1][2],t[1][3],t[1][4]}
		颜色,相似度 = t[2],t[3]
	elseif #t == 6 and type(t[1]) == "number" then
		范围,颜色,相似度 = {t[1],t[2],t[3],t[4]},t[5],t[6]
	else
		print("范围找色函数异常 - 1")
		print(t)
		异常提示("异常-范围找色函数异常-联系作者")
	end
	local 截图 = 截图到内存(范围)
	local ret,x,y
	ret,x,y = findColor(范围[1],范围[2],范围[3],范围[4],颜色,0,相似度)
	if 截图 then  releaseCapture()end
	if x ~= 0 then
		识别X,识别Y = x,y
		return true
	end
	识别X,识别Y = -1,-1
	return false
end

function 识别.图灵识字(...)	 -- 标准 :范围数组,字库名,白名单文字,二值化变量,相似度,宽度,高度
	local temp ={...}
	local 范围={}
	local 二值变量,字库,文字,相似度,宽,高
	local 归一 = false
	if type(temp[1]) == "table" and #temp == 5 then
		范围 = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		字库 = temp[2]
		文字 = temp[3]
		二值变量 = temp[4]
		相似度 = temp[5]
	elseif type(temp[1])  == "number" and #temp == 8 then
		范围 = {temp[1],temp[2],temp[3],temp[4]}
		字库 = temp[5]
		文字 = temp[6]
		二值变量 = temp[7]
		相似度 = temp[8]
	elseif type(temp[1]) == "table" and #temp == 7 then
		范围 = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		字库 = temp[2]
		文字 = temp[3]
		二值变量 = temp[4]
		相似度 = temp[5]
		宽,高=temp[6],temp[7]
		归一 = true
	elseif type(temp[1])  == "number" and #temp == 9 then
		范围 = {temp[1],temp[2],temp[3],temp[4]}
		字库 = temp[5]
		文字 = temp[6]
		二值变量 = temp[7]
		相似度 = temp[8]
		宽,高=temp[9],temp[10]
		归一 = true
	else
		print("图灵识字函数异常-1")
		print(temp)
		异常提示("异常-图灵识字函数-联系作者")
	end
	
	TURING.来源_获取屏幕像素(范围[1],范围[2],范围[3],范围[4])
	TURING.滤镜_彩色_二值化(二值变量)
	TURING.切割_连通区域切割(true)
	if 归一  then
		TURING.滤镜_通用_缩放归一化(宽,高)
	end
	if 文字 == nil then
		if TURING.字库_加载识别字库(getSdPath() .."/" ..字库 ..".lib") == 0 then
			print("异常1-字库失效-联系作者")
			print(temp)
			异常提示("异常1-字库失效-联系作者")
			return false
		end
	else
		if TURING.字库_加载识别字库(getSdPath() .."/" ..字库 ..".lib",文字) ==0  then
			print("异常2-字库失效-联系作者")
			print(temp)
			异常提示("异常2-字库失效-联系作者")
			return false
		end
	end
	local 识别结果 = TURING.识别(相似度 * 100,1)
	local 结果,结果2
	if 识别结果 ~= nil and 识别结果 ~= "" then
		结果 = splitStr(识别结果,"|")
		if 结果 and next(结果) ~= nil then
			for i=1,#结果,2 do
				结果2 = splitStr(结果[i+1],",")
				--[===[for j=1,#结果2,2 do
				print("文字: "..结果[i].." 坐标: " .. 结果2[j]+范围[1]..","..结果2[j+1]+范围[2])
				end]===]
			end
			if 结果2 and next(结果2) ~= nil then
				识别X = 结果2[1]+范围[1]
				识别Y = 结果2[2]+范围[2]
				图灵文字 = 结果[1]
				return true
			end
		end
	end
	图灵文字=""
	return false
end

function 识别.找字(...)  -- 标准:范围,字库名,文字及颜色数组,相似度,点击判断0/1
	local temp ={...}
	local 范围 ={}
	local 字库名,文字,颜色,相似度,是否点击
	local 返回值 = false
	if type(temp[1]=="table") and #temp == 5 then
		范围 = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		字库名,文字,颜色,相似度,点击判断 = temp[2]..".txt",temp[3][1],temp[3][2],temp[4],temp[5]
	elseif type(temp[1]=="number") and #temp == 8 then
		范围={temp[1],temp[2],temp[3],temp[4]}
		字库名,文字,颜色,相似度,点击判断 = temp[5]..".txt",temp[6][1],temp[6][2],temp[7],temp[8]
	else
		print("异常-找字函数-联系作者")
		print(temp)
		异常提示("异常-找字函数-联系作者")
	end
	if 0 == setDict(0,字库名) then print("异常 - 字库设置失败") end
	if 0 == useDict(0) then print("异常 - 字库加载失败") end
	local 截图 = 截图到内存(范围)
	local ret,x,y = findStr(范围[1],范围[2],范围[3],范围[4],文字,颜色,相似度)
	if 截图 then  releaseCapture()end
	if x >= 0 then
		识别X = x
		识别Y = y
		if 是否点击 == 1 then
			tap(x,y)
			sleep(200)
		end
		返回值 = true
	end
	return 返回值
end

function 识别.识图(...) -- 标准: 数组范围,图片名,相似度,点击判断0/1
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
	local 截图 = 截图到内存(范围)
	local ret,x,y = findPic(范围[1],范围[2],范围[3],范围[4],图名..".png","101010",0,相似度)
	if 截图 then  releaseCapture()end
	if x > -1 then
		识别X = x
		识别Y = y
		if 点击 ==  1 then
			tap (x,y)
			sleep(200)
		end
		返回值 = true
	end
	return  返回值
end

-- 识别场地上的框框
-- 如果识别不到框，怪兽框被卡片遮挡住了，那么在这个位置就存在怪兽
-- false - 存在
-- true - 不存在
function 识别.多点找色(...) -- 标准 范围,颜色数组,方向,相似度
	local 返回值 = false
	local temp= {...}
	local 范围 = {}
	local 颜色数组={}
	local 方向,相似度
	if type(temp[1]) == "table" and #temp == 4 then
		范围 = {temp[1][1],temp[1][2],temp[1][3],temp[1][4]}
		颜色数组 ={temp[2][1],temp[2][2]}
		方向 = temp[3]
		相似度 = temp[4]
	elseif type(temp[1]) == "number" and #temp == 7 then
		范围 = {temp[1],temp[2],temp[3],temp[4]}
		颜色数组 = {temp[5][1],temp[5][2]}
		反向 = temp[6]
		相似度 = temp[7]
	else
    print("异常-函数多点找色-联系作者")
    print(temp)
		异常提示("异常-函数多点找色-联系作者")
	end
	local 截图 = 截图到内存(范围)
	local x,y = findMultiColor(范围[1],范围[2],范围[3],范围[4],颜色数组[1],颜色数组[2],方向,相似度)
  if 截图 then 
		releaseCapture()
	end
	if x > -1 then
		识别X = x
		识别Y = y
		返回值 = true
	end
	return 返回值
end

function 运算.颜色相似度(颜色1,颜色2)
	local r1,g1,b1 = colorToRGB(颜色1)
	local r2,g2,b2 = colorToRGB(颜色2)
	local r3 = r1-r2
	local g3 = g1-g2
	local b3 = b1 - b2
	local 相似度 = 1-math.sqrt(r3*r3+g3*g3+b3*b3)/math.sqrt(255*255+255*255+255*255)
	print("精准的相似度 : "..相似度)
	local 容差值 = math.floor(255 * (1-相似度) * 3)
	print("容差值: "..容差值)
end

function 运算.毫秒转分钟(hm)
	return math.floor(hm/60000)
end

function 垃圾回收()
	local 占用 = collectgarbage("count")/1024
	collectgarbage("collect")
	print("垃圾回收: ",占用-collectgarbage("count")/1024,"M")
end

function json转table(json)
	return jsonLib.decode(json)
end

function table转json(table)
	return jsonLib.encode(table)
end

function 分辨率调整()
	local w,h = getDisplaySize()
	local dpi =getDisplaySize()
	if w ~= 720 and h ~= 1280 and dpi_1 ~= 320 then
		local str = "请按指示调整分辨率: "
		if w > 720 then
			str = str .."屏幕宽度减: ".. 720-w .."\r"
		elseif w < 720 then
			str = str .."屏幕宽度加: ".. w-720 .."\r"
		end
		
		if h > 1280 then
			str = str .."屏幕高度减: ".. 1280-h .."\r"
		elseif h < 1280 then
			str = str .."屏幕高度加: ".. h-1280 .."\r"
		end
		
		if dpi > 320 then
			str = str .."DIP 减: ".. 320-dpi
		elseif dpi < 320 then
			str = str .."DIP 加: ".. dpi-320
		end
		while(true) do
			toast(str,0,0,12)
			sleep(1000)
		end
	end
	print("分辨率通过")
end

writeLog("系统命令库加载完成...")
