
--toast(msg.."\n"..genxin)
--sleep(1000)
--/storage/emulated/0/Pictures/
--http://puxiu.picp.vip/readall/puxiu

类_图色 = {}
类_定时器 = {}
类_系统 = {}
类_文件 = {}
类_字符串 = {}
类_数据库 = {}
类_时间操作 = {}
类_正则表达式 = {}
类_Json = {}
类_表 = {}
类_XML = {}
类_时间 = {}
类_节点 = {}
类_SQL3 = {}
类_接口 = {}
类_根文件 = {}
类_UI = {}
类_服务 = {}
类_应用 = {}
类_JD = {}
类_TS = {}
类_FZ = {}
类_懒猫 = {}
类_日志 = {}
类_易游 = {}
jd_单节点={}
类_白嫖={}
类_图灵={}
类_联众={}

jd_刷新=0
jd_节点全局判断变化=0
tl_图灵字库路径=""
local VerifyData = {}
local  qj_主标签
local qj_uiArr
local  row_id
local qj_关闭窗口={}
local qj_关闭布局={}
local qj_窗口个数=0
local qj_全局关闭
local qj_临时关闭 = true
setControlBarPosNew(1.0,0.25)
xs_HUd = createHUD()

local function open_url(url)--打开网址
	exec(string.format("am start -a android.intent.action.VIEW -d '%s'",url))
end
function 类_加载运行(text)
	--类_加载运行("/storage/emulated/0/Pictures/测试.txt")
	return load(类_文件.读取文件(text))()
end

function 类_保护(函数名,参)
	--[===[保护= 类_保护(foo,{"aaa","sss"})
	if 保护[1] then
	print("函数内容:"..保护[2])
	else
	print("强制内容")
	end]===]
	local pxz ={}
	for pxn =1,10 do
		if 参[pxn]  == nil then 参[pxn] = "" end
	end
	local pxa,px=pcall(函数名,参[1],参[2],参[3],参[4],参[5],参[6],参[7],参[8],参[9],参[10])
	pxz[1]=pxa
	pxz[2]=px
	if pxz[1] ==  false then
		print(pxz[2])
		local path2 =  "/storage/emulated/0/异常代码.txt"
		类_文件.写入文件(path2,"\n"..pxz[2])
	end
	return pxz
end

function 类_TS.匹配找图(左,上,右,下,多图名称,是否点击)
	local x=-1 y=-1
	keepCapture()
	ret,x,y=findImage(左,上,右,下,多图名称,0.95)
	releaseCapture()
	if x~=-1 and y ~=-1 then
		if 是否点击 then
			tap(x,y)
		end
		return true
	end
end

function 类_TS.高级找图(左,上,右,下,多图名称,是否点击)
	local x=-1 y=-1
	keepCapture()
	ret,x,y=findPicEx(左,上,右,下,多图名称,0.9)
	releaseCapture()
	if x~=-1 and y ~=-1 then
		if 是否点击 then
			tap(x,y)
		end
		return true
	end
end

function 类_TS.多点找色(左,上,右,下,主颜色,辅颜色,是否点击)
	local intX=-1 intY=-1
	keepCapture()
	intX,intY = findMultiColor(左,上,右,下,主颜色,辅颜色,0,0.9)
	releaseCapture()
	if intX>-1 and intY>-1 then
		if 是否点击 then
			tap(intX,intY)
		end
		return true
	end
end
function 类_TS.颜色对比(原色,对比色,偏色)
	local r1,g1,b1 = colorToRGB("0x"..原色)
	print(r1,g1,b1)
	local r2,g2,b2 = colorToRGB("0x"..对比色)
	print(r2,g2,b2)
	if  r1 <=  r2  + 偏色 and r1 >= r2  - 偏色 then
		if  g1 <=  g2  + 偏色 and g1 >= g2  - 偏色 then
			if  b1 <=  b2  + 偏色 and b1 >= b2  - 偏色 then
				--print("符合相似度")
				return true
			else
				--print("不符合相似度")
				return false
			end
		end
	end
end
function 类_TS.多点比色(数据,是否点击)
	keepCapture()
	local r = cmpColorEx(数据,0.9)
	releaseCapture()
	if r == 1then
		if 是否点击 then
			local zb = splitStr(数据,"|")
			tap(math.floor(zb[1]),math.floor(zb[2]))
		end
		return true
	end
end
function 类_JD.全局节点点击变化延时(延时秒)
	jd_节点全局判断变化 = 延时秒
end
function 类_JD.判断点击(节点组,序号,不判断)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	if 节点组 == nil  or  节点组 == ""  or  节点组 == 0 then
		节点组 =jd_单节点[序号]
	end
	local ret = nodeLib.findOne(节点组,true)
	if ret ~= nil then
		jd_刷新=jd_刷新+1
		if jd_刷新 >= 3 then
			nodeLib.updateNode()
			jd_刷新=0
		end
		jd_单节点[序号]=ret
		return  类_JD.节点点击(ret,序号,不判断)
	end
	return false
end
function 类_JD.节点点击(节点组,序号,不判断)
	showControlBar(False)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	if 节点组 == nil  or  节点组 == ""  or  节点组 == 0 then
		节点组 =jd_单节点[序号]
	end
	if 不判断 or jd_节点全局判断变化 == nil or  jd_节点全局判断变化 == ""  or  jd_节点全局判断变化 == 0 then
		nodeLib.click(节点组)
		sleep(100)
		showControlBar(true)
		return true
	else
		--print(节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
		--print(jd_节点全局判断变化)
		local 点击延时 = math.ceil(jd_节点全局判断变化/2/200)
		snapShot("/mnt/sdcard/zzfwjs"..序号..".png",节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
		nodeLib.click(节点组)
		sleep(200)
		for ifw = 1,点击延时-1 do
			sleep(140)
			if 类_TS.匹配找图(节点组.bounds["l"]-2,节点组.bounds["t"]-2,节点组.bounds["r"]+2,节点组.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..序号..".png")then
			else
				--print("节点点击已变化一"..ifw)
				showControlBar(true)
				return true
			end
		end
		snapShot("/mnt/sdcard/zzfwjs"..序号..".png",节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
		nodeLib.click(节点组)
		sleep(200)
		for ifw = 1,点击延时-1 do
			sleep(140)
			if 类_TS.匹配找图(节点组.bounds["l"]-2,节点组.bounds["t"]-2,节点组.bounds["r"]+2,节点组.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..序号..".png")then
			else
				--print("节点点击已变化二"..ifw)
				showControlBar(true)
				return true
			end
		end
		showControlBar(true)
		return false
	end
end
function 类_JD.指针点击(节点组,序号,不判断)
	showControlBar(False)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	if 节点组 == nil  or  节点组 == ""  or  节点组 == 0 then
		节点组 =jd_单节点[序号]
	end
	if 节点组 ~= nil then
		local x=math.floor((math.floor(节点组.bounds["r"])-math.floor(节点组.bounds["l"]))/2+math.floor(节点组.bounds["l"]))
		local y=math.floor((math.floor(节点组.bounds["b"])-math.floor(节点组.bounds["t"]))/2+math.floor(节点组.bounds["t"]))
		if 不判断 or jd_节点全局判断变化 == nil or  jd_节点全局判断变化 == ""  or  jd_节点全局判断变化 == 0 then
			tap(x,y)
			sleep(100)
			showControlBar(true)
			return true
		else
			--print(节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
			local 点击延时 = math.ceil(jd_节点全局判断变化/2/200)
			snapShot("/mnt/sdcard/zzfwjs"..序号..".png",节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
			tap(x,y)
			sleep(200)
			for ifw = 1,点击延时-1 do
				sleep(140)
				if 类_TS.匹配找图(节点组.bounds["l"]-2,节点组.bounds["t"]-2,节点组.bounds["r"]+2,节点组.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..序号..".png")then
				else
					--print("指针点击已变化一"..ifw)
					showControlBar(true)
					return true
				end
			end
			snapShot("/mnt/sdcard/zzfwjs"..序号..".png",节点组.bounds["l"],节点组.bounds["t"],节点组.bounds["r"],节点组.bounds["b"])
			tap(x,y)
			sleep(200)
			for ifw = 1,点击延时-1 do
				sleep(140)
				if 类_TS.匹配找图(节点组.bounds["l"]-2,节点组.bounds["t"]-2,节点组.bounds["r"]+2,节点组.bounds["b"]+2,"/mnt/sdcard/zzfwjs"..序号..".png")then
				else
					--print("指针点击已变化二"..ifw)
					showControlBar(true)
					return true
				end
			end
			showControlBar(true)
			return false
		end
	end
end

function 类_JD.输入文字(内容,节点组,序号)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	if 节点组 == nil  or  节点组 == ""  or  节点组 == 0 then
		节点组 = jd_单节点[序号]
	end
	return nodeLib.setText(节点组,内容)
end

function 类_JD.父找子节点(节点组,第几个,是否点击,序号,不判断)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	local ret = nodeLib.findChildNodes(节点组,true)
	if ret ~= nil then
		if 第几个 <= #ret then
			if jd_刷新 >= 3 then
				nodeLib.updateNode()
				jd_刷新=0
			end
			jd_单节点[序号]=ret[第几个]
			if 是否点击  then
				类_JD.节点点击(ret[第几个],序号,不判断)
			end
			return true
		end
	end
end

function 类_JD.多节点(节点组)
	local ret = nodeLib.findAll(节点组,true)
	if ret ~= nil then
		jd_刷新=jd_刷新+1
		if jd_刷新 >= 3 then
			nodeLib.updateNode()
			jd_刷新=0
		end
		return  ret
	else
		return ""
	end
end
function 类_JD.范围节点(节点组,左,上,右,下)
	local 节点数组={}
	local ret=类_JD.多节点(节点组)
	local cc = 1
	for i=1,#ret do
		if ret[i].bounds["l"] >= 左 and ret[i].bounds["t"] >=上 and ret[i].bounds["r"] <= 右 and  ret[i].bounds["b"] <= 下 then
			节点数组[cc]=ret[i]
			cc=cc+1
		end
	end
	return 节点数组
end
function 类_JD.单节点(节点组,是否点击,序号,不判断)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	local ret = nodeLib.findOne(节点组,true)
	if ret ~= nil then
		jd_刷新=jd_刷新+1
		if jd_刷新 >= 3 then
			nodeLib.updateNode()
			jd_刷新=0
		end
		jd_单节点[序号]=ret
		if 是否点击  then
			类_JD.节点点击(ret,序号,不判断)
		end
		return true
	end
	return false
end

function 类_JD.取属性(属性,节点信息,序号)
	if 序号 == nil  or  序号 == ""  or  序号 == 0 then
		序号 = 1
	end
	if 节点信息 == nil or  节点信息 == ""  or  节点信息 == 0 then
		节点信息 =jd_单节点[序号]
	end
	if 节点信息 ~= nil then
		return(节点信息[属性])
	end
end

function 类_应用.当前包名()
	return frontAppName()
end
function 类_应用.关闭(包名)
	exec(" am force-stop "..包名)
	return stopApp(包名)
end
function 类_应用.清除缓存(包名)
	exec("pm clear "..包名)
end
function 类_应用.卸载(包名)
	exec(" pm uninstall "..包名)
end
function 类_应用.启动(包名)
	
	local pkg = frontAppName()
	if pkg~= 包名 then
		runApp(包名)
		sleep(3000)
		return true
	end
	return false
end
function 类_应用.取所有包名(搜索包名)
	local 数组={}
	local ajd= exec("  pm list packages")
	if ajd ~= "" then
		ajd= string.gsub(ajd, "package:","")
		local gjhf= splitStr(ajd,"\n")
		if 搜索包名 == nil then
			for fghi=1,#gjhf do
				数组[fghi]=gjhf[fghi]
			end
		else
			local 包名次=0
			for fghi=1,#gjhf do
				if string.find(gjhf[fghi],搜索包名) ~= nil then
					包名次=包名次+1
					数组[包名次]=gjhf[fghi]
				end
				
			end
		end
	end
	return 数组
end
function 类_应用.组件信息()
	return  exec(" dumpsys activity activities")
end
function 类_FZ.滑块测试1无效(x,y,x1,y1,二值化)
	local 计算=0
	local w,h,arr = getScreenPixel(x,y,x1,y1)
	print("image size:"..w..","..h)
	local 二值={}
	local cd =0
	for iw=1,h do
		local rzhh=""
		for ih=1,w do
			local r,g,b = colorToRGB(arr[iw * w + (ih)])
			local rgb = (r+g+b)/2
			-- print(rgb)
			if rgb > 二值化 then
				rzhh=rzhh.."0"
				计算=0
			else
				rzhh=rzhh.."1"
				计算=计算+1
			end
			if 计算 >= 10 then
				print(iw * w + (ih))
				return false
			end
		end
		cd = cd +1
		二值[cd]=rzhh
		--print(二值[cd])
		类_文件.写入文件("/storage/emulated/0/Pictures/二值化.txt","\n"..二值[cd])
	end
end
function 类_FZ.滑块测试2无效(x,y,x1,y1,二值化,偏色)
	local r,g,b = colorToRGB(二值化)
	print(r,g,b)
	local rgb = (r+g+b)/2
	二值化 = rgb
	print(二值化)
	二值化 = ((r+偏色)+(g+偏色)+(b+偏色))/2
	print(二值化)
	偏色 = ((r-偏色)+(g-偏色)+(b-偏色))/2
	print(偏色)
	local w,h,arr = getScreenPixel(x,y,x1,y1)
	print("image size:"..w..","..h)
	local 二值={}
	local cd =0
	cccc=1
	for iw=1,h do
		local rzhh=""
		for ih=1,w do
			--r,g,b = colorToRGB(arr[iw * w + (ih)])
			r,g,b = colorToRGB(arr[cccc])
			rgb = (r+g+b)/2
			-- print(rgb)
			if rgb > 偏色  and rgb < 二值化 then
				rzhh=rzhh.."1"
			else
				rzhh=rzhh.."0"
			end
			cccc=cccc+1
		end
		cd = cd +1
		二值[cd]=rzhh
		print(二值[cd])
		类_文件.写入文件("/storage/emulated/0/Pictures/二值化.txt","\n"..二值[cd])
	end
end
function  类_FZ.英数键值输入(英数)
	--不支持无障碍
	英数 = string.lower(英数)
	local 长度 = string.len(英数)
	local 键值表={
	k0= 7,k1 = 8,k2 = 9,k3 = 10,k4 = 11,k5 = 12,k6 = 13,k7 = 14,k8 = 15,
	k9= 16,ka = 29,kb = 30,kc = 31,kd = 32,ke = 33,kf = 34,kg = 35,kh = 36,
	ki= 37,kj = 38,kk = 39,kl = 40,km = 41,kn = 42,ko = 43,kp = 44,kq = 45,
	kr= 46,ks = 47,kt = 48,ku = 49,kv = 50,kw = 51,kx = 52,ky = 53,kz = 54}
	for i=1,长度 do
		local  键值= "k"..utf8.mid(英数,i,1)
		if 键值表[键值] ~= nil then
			keyPress(键值表[键值])
		else
			exec(" input text "..utf8.mid(英数,i,1))
		end
		sleep(50)
	end
end
function 类_FZ.石墨链接(链接)
	--类_FZ.石墨链接("https://shimo.im/docs/TWQWCwddkYj3wvcc")
	if  string.find(链接,"/read") == nil then
		链接 =链接.."/read"
	end
	local ret,code = httpGet(链接)
	--print(ret)
	local aa=string.match(ret, "line="..'"'.."(.*)".."/p>")
	local as=splitStr(aa,"/p>")
	local 内容=""
	--print(#as)
	for i=1,#as do
		--print(as[i])
		aa=string.match(as[i], ">".."(.-)".."<")
		if aa ~= "" then
			内容=内容..aa.."\n"
			if  string.find(as[i],"nofollow"..'"'..">") ~= nil then
				aa=string.match(as[i], "href="..'"'.."(.-)"..'"')
				内容=内容..aa.."\n"
			end
		end
		
	end
	return 类_字符串.去首尾空(内容)
end
function 类_FZ.热更新(链接)
	--类_FZ.热更新("http://1574z6066r.qicp.vip/duqu?ku=测试&text=0")
	local ret
	if  string.find(链接,"----") ~= nil then
		ret = 链接
	else
		ret= httpGet(链接)
	end
	-- 版本号-下载链接
	--print(链接)
	local evr=splitStr(ret,"----")
	if utf8.inStr(1,evr[1],"html")<=0 and evr[1] ~=nil then
		--print(evr)
		local val = getStringConfig("evr")
		print(val)
		if val==evr[1] then
			toast("已是最新版本:"..evr[1],0,0,15)
			print("已是最新版本:"..evr[1])
			sleep(1000)
			return false --不需要更新
		end
		toast("发现新版本:"..evr[1],0,0,15)
		print("发现新版本:"..evr[1])
		--print(evr[2])
		local lBenDiLr = getWorkPath().."/".."script.lr"
		if downloadFile(类_字符串.去首尾空(evr[2]),lBenDiLr,progress)==0 then
			--os.remove("/data/data/"..getPackageName().."/files/script.lr")--删除旧脚本
			-- if installLrPkg(lBenDiLr) == 1 then
			print( os.rename("/data/data/"..getPackageName().."/files/scriptbak.lr","/data/data/"..getPackageName().."/files/script.lr"))
			installLrPkg(getWorkPath().."/".."script.lr")
			setStringConfig("evr",evr[1])--保存本地版本号
			toast("更新完成，重新启动",0,0,15)
			print("更新完成，重新启动")
			sleep(1000)
			restartScript()
			--end
		end
	end
	return false --不需要更新
end
function 类_FZ.获取打印句柄()
	return createHUD()
end
function 类_FZ.打印(内容,x,y,打印句柄)
	if x == nil or x == 0 then x = 100 end
	if y == nil or y == 0 then y = 1 end
	if 打印句柄 == nil or 打印句柄 == 0 then 打印句柄 = xs_HUd end
	showHUD(打印句柄,内容,12,"0xffff0000","0xffffffff",0,x,y,0,0)
end
function 类_FZ.隐藏打印句柄(打印句柄)
	if 打印句柄 == nil or 打印句柄 == 0 then 打印句柄 = xs_HUd end
	return hideHUD(打印句柄)
end
function 类_FZ.szk关闭屏幕()
	exec("app_process -Djava.class.path=/storage/emulated/0/classes101402.dex /data/local/tmp com.yashu.aaaaaaaaaaaaaaaaaaaaaa.SurfaceControl  screen off")
end
function 类_FZ.szk开启屏幕()
	exec("app_process -Djava.class.path=/storage/emulated/0/classes101402.dex /data/local/tmp com.yashu.aaaaaaaaaaaaaaaaaaaaaa.SurfaceControl  screen on")
end
function 类_FZ.szk激活()
	--classes101402.dex安装到/storage/emulated/0/classes101402.dex
	exec("sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh")
end
function 类_FZ.神经网络找字(x,y,x1,y1,text,点击,精准识别)
	local lr = ""
	if x == nil or x == true then
		点击=x
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
				if 精准识别 then
					if r[i]["text"] ==  text then
						if 点击 then
							tap (r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
							print(r[i]["l"]+((r[i]["r"]-r[i]["l"])/2),r[i]["t"]+((r[i]["b"]-r[i]["t"])/2))
						end
						return true
					end
				else
					if  string.find(r[i]["text"],text) ~= nil then
						if 点击 then
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
function 类_FZ.无障碍滑动(x,y,x1,y1,sim)
	local gesture = Gesture:new() --创建一个手势滑动对象
	local path = Path:new() --创建一个轨迹路径
	path:setStartTime(10) --从触发事件的第100毫秒后开始滑动
	path:setDurTime(sim) --滑动的时间
	path:addPoint(x,y) --轨迹上的第一个点
	path:addPoint(x1,y1) --轨迹上的第二个点
	gesture:addPath(path) --添加一个滑动路径
	onFinishEvent=function (type) --执行结果回调函数 type为0执行完成，为1是执行中途被取消
		print("event:"..type)
	end
	local r = gesture:dispatch(onFinishEvent)
	sleep(sim+500)
	if r then
		print("执行成功")
		return true
	else
		print("执行失败")
		return false
	end
end
function 类_FZ.多段滑动(返回值,段数)
	--类_FZ.多段滑动("69,932|250,939|340,930|685,935",20)
	local r =math.random(-10,10)
	local x,y,坐标,点数组
	点数组=splitStr(返回值,"|")
	for i=1,#点数组 do
		坐标=splitStr(点数组[i],",")
		if i == 1then
			x=tonumber(坐标[1])
			y=tonumber(坐标[2])
			touchDown(1,x,y)
			sleep(100)
		else
			for j=1,段数 do
				touchMove(1,math.floor(x+(tonumber(坐标[1])-x)*(j/段数)+(10*r-10)),math.floor(y+(tonumber(坐标[2])-y)*(j/段数)+(10*r-10)))
				sleep(math.random(100,200))
				--print(math.floor(x+(tonumber(坐标[1])-x)*(j/段数)+(10*r-10)))
				--print(math.floor(y+(tonumber(坐标[2])-y)*(j/段数)+(10*r-10)))
			end
			x=tonumber(坐标[1])
			y=tonumber(坐标[2])
		end
	end
	touchUp(1)
end

function 类_FZ.adb跳转(组件,参数)
	--print(类_FZ.adb跳转(" sg.bigo.live/sg.bigo.live.user.UserInfoDetailActivity "," --ei uid 552239610"))
	return exec(" am start -n "..组件.." "..参数)
end

function 类_FZ.url跳转(url)
	--类_FZ.url跳转("snssdk1128://user/profile/826437155953198?gd_label=click_wap_profile_bottom&needlaunchlog=1&refer=web&scene_from=share_reflow&type=need_follow")
	open_url(string.format(url))
end


function 类_FZ.飞桨识别(xx,yy,x1,y1,查找文字,是否点击)
	--paddle = require("libpaddleocr")
	--先释放飞桨资源extractAssets("paddle.rc",getWorkPath(),"*")
	--类_FZ.飞桨识别(65,373,535,719,"*猴王",true)
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
	--print("结果:",ret,"耗时:",(tickCount() - begintm).."毫秒")
	if ret ~= "" then
		local list=类_Json.解Json格式(ret)
		if #list.words_result==0	then
			return nil
		else
			if 查找文字 ~= nil then
				if  string.find(查找文字,"*") ~= nil then
					查找文字 = string.gsub(查找文字, "*","")
					for i=1,#list.words_result do
						--print(list.words_result[i].words.."--"..list.words_result[i].pos)
						if  string.find(list.words_result[i].words, 查找文字) ~= nil then
							if 是否点击 then
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
						if list.words_result[i].words == 查找文字 then
							if 是否点击 then
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

function 类_FZ.平方根(x,y)
	local w,h
	w = x^2
	h = y^2
	return math.sqrt(w+h)
end
function 类_FZ.邮件发送(发件邮件,发件密码,收件邮箱,邮件标题,邮件内容)
	--类_FZ.邮件发送("1730076400@qq.com","glrdtyckfwpwfci","1730076400@qq.com","测试","c阿斯蒂esd12fgs")
	if string.find(发件邮件,"@qq") ~= nil  then
		serve = "smtp.qq.com"
	elseif  string.find(发件邮件,"@163") ~= nil  then
		serve =  "smtp.ym.163.com"
	end
	local smtp = require("socket.smtp")
	local mime = require("mime")
	local ltn12 = require("ltn12")
	smtp.TIMEOUT = 30;
	local from = "<"..发件邮件..">";
	local rcpt = {"<"..收件邮箱..">"};
	local bodys="";
	local source = smtp.message{
	headers = {
	from = from,
	to ="<"..收件邮箱..">",
	subject = 邮件标题  },
	body={
	preamble = "",
	[1] = {
	body = mime.eol(1, 邮件内容)
	},}}
	local r, e = smtp.send{
	server =serve ,
	user=发件邮件,
	password=发件密码,
	from = from,
	rcpt = rcpt,
	source = source
	}
	if r  == 1 then
		return "成功"
	else
		return "失败--"..e
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
function 类_FZ.微信A16还原(A16)
	exec("pm clear com.tencent.mm")
	exec("pm grant com.tencent.mm android.permission.WRITE_EXTERNAL_STORAGE")
	exec("pm grant com.tencent.mm android.permission.READ_PHONE_STATE")
	local UUID = wxa16CRC(A16)
	local PATH = "/data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/"
	--print(A16 .. "," .. UUID)
	while true do
		if wxa16Exist(PATH .. "4") == false then
			print("开始还原设备")
			break
		end
		sleep(1000)
	end
	runApp "com.tencent.mm"
	print"正在还原设备"
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
	print "数据还原成功！"
	toast("数据还原成功！",0,0,20)
	sleep(2000)
end




function 类_FZ.微信A16提取()
	local a = io.popen("echo -nE \"$(su -c \"sed -n '1 p' " .. "/data/data/com.tencent.mm/.auth_cache/2510c390-11c5-3e70-8182-423e3a695e91/0" .. "\")\"")
	local t = a:read("*all")
	a:close()
	return t
end




function 类_日志.关闭日志()
	console.dismiss()
end
function 类_日志.打开日志(x,y,宽,高)
	local w,h
	w,h = getDisplaySize()
	if x == nil then x = 100 end
	if y == nil then y = 100 end
	if 宽 == nil then
		宽 = w/5*3.5
	end
	if 高 == nil then 高 = 400 end
	console.show()
	console.setPos(x,y,宽,高)
end
function 类_日志.写入日志(内容,类型)
	if 类型 == nil then
		类型 = 3
	end
	console.println(类型,内容)
end
function 类_日志.清空日志()
	console.clearLog()
end

function 类_图灵.设置字库路径(字库路径名字)
	if 字库路径名字 == nil then
		if (io.open(getSdPath().. "/识别库.lib", "r")) then
			tl_图灵字库路径 =getSdPath().. "/识别库.lib"
		elseif (io.open(getSdPath().. "/Pictures/识别库.lib", "r")) then
			tl_图灵字库路径 =getSdPath().. "/Pictures/识别库.lib"
		else
			tl_图灵字库路径="无"
		end
		print("当前字库路径名称:"..tl_图灵字库路径)
		toast("当前字库路径名称:"..tl_图灵字库路径,0,0,15)
		sleep(1000)
	else
		tl_图灵字库路径=字库路径名字
	end
end

function 类_图灵.范围识别(x1,y1,x2,y2,阈值颜色,行间隔,列间隔,保留宽,保留高,返回格式,字符间隔,相似度)
	--类_图灵.范围识别(52,176,526,378,"0-72")
	--类_图灵.范围识别(52,176,526,378,"0-72",0,0,0,0,2,5)
	if 行间隔 == nil  or 行间隔 == 0  then 行间隔 = 1 end
	if 列间隔 == nil  or 列间隔 == 0  then 列间隔 = 1 end
	if 保留宽 == nil  or 保留宽 == 0  then 保留宽 = "0-"..tostring(x2-x1) end
	if 保留高 == nil  or 保留高 == 0  then 保留高 = "0-"..tostring(y2-y1) end
	if 返回格式 == nil  or 返回格式 == 0  then 返回格式 = 0 end
	if 字符间隔 == nil  or 字符间隔 == 0  then 字符间隔 = 0 end
	if 相似度 == nil  or 相似度 == 0  then 相似度 = 80 end
	TURING.来源_获取屏幕像素(x1,y1,x2,y2)
	TURING.滤镜_彩色_二值化(阈值颜色)
	TURING.切割_范围投影切割(行间隔,列间隔,保留宽,保留高)
	TURING.字库_加载识别字库(tl_图灵字库路径)
	范围识别结果 = TURING.OCR(相似度,返回格式,字符间隔)
	return 范围识别结果
end

类_图灵.偏色计算 = function (x,y,二值化,偏色)
	local  rgb = getPixelColor(x,y)
	local r,g,b = colorToRGB(rgb)
	rgb = (r+g+b)/2
	r,g,b = colorToRGB(二值化)
	偏色大 = ((r+偏色)+(g+偏色)+(b+偏色))/2
	偏色小 = ((r-偏色)+(g-偏色)+(b-偏色))/2
	if tonumber(rgb) >= tonumber(偏色小)  and tonumber(rgb) <= tonumber(偏色大) then
		return "1"
	else
		return "0"
	end
end


function 类_图灵.图灵识别X(x1,y1,x2,y2,颜色偏色,颠倒颜色,保留宽,保留高)
	--图灵识别X(879,35,1070,219,"FBFBFA-303030",false)
	local begintm = tickCount()
	值分 = splitStr(颜色偏色,"-")
	if 保留宽 == nil  or 保留宽 == 0  then 保留宽 = "15-50" end
	if 保留高 == nil  or 保留高 == 0  then 保留高 = "15-50" end
	keepCapture()
	TURING.来源_获取屏幕像素(x1,y1,x2,y2)
	TURING.滤镜_彩色_二值化(颜色偏色)
	if 颠倒颜色 then
		TURING.滤镜_黑白_颠倒颜色(2)
	end
	TURING.来源_像素数据预览()
	TURING.切割_连通区域切割(true,保留宽,保留高)
	sp=TURING.切割_获取切割字符数据()
	--print(#sp)
	for i=1,#sp do
		结果 = {sp[i][1]+x1,sp[i][2]+y1}
		斜边长 =类_FZ.平方根(sp[i][3],sp[i][4])
		--print(斜边长)
		xx=sp[i][1]+x1
		yy=sp[i][2]+y1
		--print(xx..","..yy)
		for i=1,斜边长/3*2 do
			if 颠倒颜色 then
				if 类_图灵.偏色计算(xx+i,yy+i,值分[1],utf8.mid(值分[2],1,2)) == "1"then
					结果 = ""
					break
				end
			else
				if 类_图灵.偏色计算(xx+i,yy+i,值分[1],utf8.mid(值分[2],1,2)) == "0"then
					结果 = ""
					break
				end
			end
		end
		if 结果 ~= "" then
			print("耗时:",(tickCount() - begintm).."毫秒")
			releaseCapture()
			return 结果
		end
	end
	print("耗时:",(tickCount() - begintm).."毫秒")
	releaseCapture()
	return 结果
end

--[===[保护= 类_保护(类_图灵.图灵腾讯滑块,{530,156,660,349})
print(保护)
if 保护[1] then
if #保护 >= 2 then
print("函数内容:"..保护[2][1])
aa=保护[2][1]
swipe(332,392,aa-50,392,200)
else
print("识别失败重新识别")
end
end]===]
function 类_图灵.图灵腾讯滑块(x,y,x1,y1)
	local 原高度=y1-y
	local 原宽度=x1-x
	local 起点x,起点y,一算,rzhh,二算,ASD
	TURING.来源_获取屏幕像素(x,y,x1,y1)
	TURING.滤镜_黑白_获取轮廓(50,1,255,0,0)
	ASD=TURING.滤镜_彩色_二值化("0-100")
	--TURING.来源_像素数据预览()
	local 二值={}
	local cd =0
	for iy=1,原高度-2 do
		rzhh=""
		一算=0
		起点y= iy
		for ix=1,原宽度-1 do
			if ASD[ix][iy][1] == 255 and ASD[ix][iy+1][1] == 0 then
				rzhh=rzhh.."1"
				一算=一算+1
				if 一算 == 1 then
					起点x= ix-1
					if 起点x == 0 then
						起点x = 1
					end
				end
			else
				rzhh=rzhh.."0"
				一算=0
			end
			if 一算 >= 10 and 起点x < 原宽度 then
				--print(一算)
				-- 起点x=起点x-1
				for ik=1,3 do
					二算 =0
					for ig=1,11 do
						--print(起点x+x.."--"..起点y+ig+y)
						--print(ASD[起点x][起点y+ig][1].."=="..起点x.."="..起点y+ig)
						if ASD[起点x+ik][起点y+ig][1] == 255 then
							二算 = 二算+1
						else
							break
						end
					end
					--print(二算)
					if 二算 >= 10 then
						print(起点x+x.."--"..起点y+y)
						return {起点x+x,起点y+y}
					else
						起点x=起点x+1
					end
				end
				
			end
		end
		cd = cd +1
		二值[cd]=rzhh
		--类_文件.写入文件("/storage/emulated/0/Pictures/二值化.txt","\n"..二值[cd])
	end
end
function 类_联众.检查点数(联众账号,联众密码)
	local tb={user_name=联众账号,user_pw=联众密码}
	参数=jsonLib.encode(tb)
	协议头="Content-Type:application/json"
	local ret,code = httpPost("http://v1-http-api.jsdama.com/api.php?mod=php&act=point",参数,30,协议头)
	--print(ret)
	if ret ~= ""then
		ret = jsonLib.decode(ret)
		return ret["data"]
	end
end
function 类_联众.获取结果(B64,图片类型,账号,密码,软件V2secret,软件ID,最小长度,最大长度,人工提示模板ID)
	--类_联众.获取结果(B64,图片类型,账号,密码)
	if 软件V2secret == nil  or 软件V2secret == "" then
		软件V2secret="pktsgCPXvsHV83OybsL56CNIuaQjlpQepXgEuqaa"
		软件ID="21306"
	end
	if 最小长度 == nil or 最小长度 == "" then  最小长度=0 end
	if 最大长度 == nil or 最大长度 == ""  then  最大长度=0 end
	if 人工提示模板ID == nil or 人工提示模板ID == ""  then  人工提示模板ID=0 end
	local tb={
	captchaData= B64 ,
	captchaType= 图片类型 ,
	username= 账号 ,
	password= 密码 ,
	softwareSecret= 软件V2secret ,
	softwareId= 软件ID,
	captchaMinLength= 最小长度 ,
	captchaMaxLength= 最大长度 ,
	workerTipsId= 人工提示模板ID
	}
	参数=jsonLib.encode(tb)
	协议头="Content-Type:application/json"
	local ret,code = httpPost("http://v2-no-secure-api.jsdama.com/upload",参数,30,协议头)
	--print(ret)
	if ret ~= ""then
		ret = jsonLib.decode(ret)
		if ret["message"] ~= "" then
			return	类_字符串.URL编码转uft8字符(ret["message"])
		else
			return  ret["data"]["recognition"]
		end
	end
end
function  类_白嫖.OCR文字识别(左,上,右,下)
	local tick = tickCount()
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	b64 = 类_字符串.uft8字符转URL编码(b64)
	b64=httpPost("https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic?access_token=24.013a64e3e007fda91f102cf8f6c8a9c3.2592000.1640690211.282335-11278949&aipSdk=Android&aipSdkVersion=1_4_4&aipDevid=c0852d69-9910-4dd5-92ae-ec4fab9cb549","Content-Type=application/x-www-form-urlencoded&image="..b64)
	--print(b64)
	b64 = splitStr(b64,":[")
	local 数组={}
	if #b64 >= 2 then
		b64 = splitStr(b64[2],"]")
		if #b64 >= 2 then
			b64 = splitStr(b64[1],"},{")
			for pxwzs=1,#b64 do
				pxt = string.match(b64[pxwzs], "words"..'":"'.."(.-)"..'"')
				数组[pxwzs]=pxt
			end
		end
	end
	--print(tickCount()-tick)
	--print(数组)
	return 数组
end
wxa16Writew=function (FileName, text,user)
	print(user)
	print(exec('echo "'..text..'" > '..FileName))
	print(exec('chown '..user..' '..FileName))
end

function 类_白嫖.微信A16还原(数据)
	--类_白嫖.微信A16还原("0084345137535|oucnkndc|A386b8e64a9fdf70,3854575684")
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
	local 登录数据,code = httpGet("http://120.79.214.85/sq/crc?data="..数据)
	print(登录数据)
	for i = 0, 4, 1 do
		wxa16Writew(PATH..i,登录数据,user)
	end
	sleep(1000)
	stopApp("com.tencent.mm")
	keyPress("home")
	print "数据还原成功！"
	toast("数据还原成功！",0,0,20)
	sleep(2000)
end
function 类_图色.刷新屏幕()
	releaseCapture()
	keepCapture()
end
类_图色.分辨率系数  = 1
类_图色.设置分辨率比例 = function(mX, mY)
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
	类_图色.分辨率系数  = w / mX
end
function 类_图色.多点找色(...)
	类_图色.rx = 0
	类_图色.ry = 0
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
					print("色点名:" .. list[i][1] .. ",请填写正确的结尾参数")
					return false
				end
				local x, y = -1, -1
				x, y = findMultiColor(x1, y1, x2, y2, color, OffsetPos, dir, sim)
				类_图色.rx = 0
				类_图色.ry = 0
				if x ~= -1 then
					类_图色.rx = x
					类_图色.ry = y
					if offsetposx ~= 0 then
						print("新点击坐标->" .. x + offsetposx .. "," .. y + offsetposy)
					end
					if bool == true or LeftDoubleClick == true then
						if LeftDoubleClick == true then
							类_图色.双击(x + offsetposx, y + offsetposy, Rnd)
							print("发现色点:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->自动双击")
						else
							类_图色.单击(x + offsetposx, y + offsetposy, Rnd)
							print("发现色点:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->自动单击")
						end
						if wx ~= 0 then
							sleep(wtime)
							类_图色.单击(wx, wy, Rnd)
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
				print("色点名:" .. list[1] .. ",请填写正确的结尾参数")
				return false
			end
			local x, y = -1, -1
			x, y = findMultiColor(x1, y1, x2, y2, color, OffsetPos, dir, sim)
			类_图色.rx = 0
			类_图色.ry = 0
			if x ~= -1 then
				类_图色.rx = x
				类_图色.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						类_图色.双击(x + offsetposx, y + offsetposy, Rnd)
						print("发现色点:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动双击")
					else
						类_图色.单击(x + offsetposx, y + offsetposy, Rnd)
						print("发现色点:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动单击")
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
	print("类_图色.多点找色:调用出错" .. sRet)
	return false
end
function 类_图色.多点比色(...)
	类_图色.rx = 0
	类_图色.ry = 0
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
					print("色点名:" .. list[i][1] .. ",请填写正确的结尾参数")
					return false
				end
				local r = (cmpColorEx(color, sim))
				if r == 1 then
					local list2 = (类_字符串.分割字符串(color, "|"))
					x = list2[1]
					y = list2[2]
					类_图色.rx = x
					类_图色.ry = y
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
							类_图色.双击(x, y, Rnd)
							print("发现色点:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->自动双击")
							if wx ~= 0 then
								sleep(wtime)
								类_图色.单击(wx, wy, Rnd)
							end
						else
							类_图色.单击(x, y, Rnd)
							print("发现色点:" .. list[i][1] .. "-" .. x .. "-" .. y .. " -->自动单击")
							if wx ~= 0 then
								sleep(wtime)
								类_图色.单击(wx, wy, Rnd)
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
				print("色点名:" .. list[1] .. ",请填写正确的结尾参数")
				return false
			end
			local r = (cmpColorEx(color, sim))
			if r == 1 then
				local list2 = (类_字符串.分割字符串(color, "|"))
				x = list2[1]
				y = list2[2]
				类_图色.rx = x
				类_图色.ry = y
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
						类_图色.双击(x + offsetposx, y + offsetposy, Rnd)
						print("发现色点:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动双击")
						if wx ~= 0 then
							sleep(wtime)
							类_图色.单击(wx, wy, Rnd)
						end
					else
						类_图色.单击(x + offsetposx, y + offsetposy, Rnd)
						print("发现色点:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动单击")
						if wx ~= 0 then
							sleep(wtime)
							类_图色.单击(wx, wy, Rnd)
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
	print("类_图色.多点比色:调用出错" .. sRet)
	return false
end
HX_ColorCardScreenCount = {}
function 类_图色.判断是否卡屏(id, x, y, count)
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
类_图色.模拟输入文字 = function(str, isCle)
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
function 类_图色.找字(...)
	类_图色.rx = 0
	类_图色.ry = 0
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
		if 类_图色.开启多分辨率适配 == true and 类_图色.分辨率系数  > 1 then
			sim = sim / 类_图色.分辨率系数
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
				print("字符名:" .. list[1] .. ",请填写正确的结尾参数")
				return false
			end
			setDict(Index, path)
			useDict(Index)
			local ret, x, y = findStr(x1, y1, x2, y2, str, OffsetPos, sim)
			if x ~= -1 then
				print("发现字符:" .. list[1] .. "-" .. x .. "-" .. y)
				类_图色.rx = x
				类_图色.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						类_图色.双击(x + offsetposx, y + offsetposy, Rnd)
						print("发现字符:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动双击")
					else
						类_图色.单击(x + offsetposx, y + offsetposy, Rnd)
						print("发现字符:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动单击")
					end
					if wx ~= 0 then
						sleep(wtime)
						类_图色.单击(wx, wy, Rnd)
					end
				end
				return true
			end
		end
	end)
	if iRet == true then
		return sRet
	end
	print("类_图色.找字:调用出错" .. sRet)
	return false
end
function 类_图色.找图(...)
	类_图色.rx = 0
	类_图色.ry = 0
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
		if 类_图色.开启多分辨率适配 ~= true or 类_图色.分辨率系数  > 1 then
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
				print("图片名:" .. list[1] .. ",请填写正确的结尾参数" .. #list)
				return false
			end
			local x = -1
			y = -1
			ret, x, y = findPicEx(x1, y1, x2, y2, pic_name, sim)
			if x ~= -1 and y ~= -1 then
				print("发现图片:" .. list[1] .. "-" .. x .. "-" .. y)
				类_图色.rx = x
				类_图色.ry = y
				if bool == true or LeftDoubleClick == true then
					if LeftDoubleClick == true then
						类_图色.双击(x + offsetposx, y + offsetposy, Rnd)
						print("发现图片:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动双击")
					else
						类_图色.单击(x + offsetposx, y + offsetposy, Rnd)
						print("发现图片:" .. list[1] .. "-" .. x .. "-" .. y .. " -->自动单击")
					end
					if wx ~= 0 then
						sleep(wtime)
						类_图色.单击(wx, wy, Rnd)
					end
				end
				return true
			end
		end
	end)
	if iRet == true then
		return sRet
	end
	print("类_图色.找图:调用出错" .. sRet)
	return false
end

function 类_图色.随机单击(X, Y, R) --随机点击 X:x坐标 Y:y坐标 R（可选）:随机值
	R = R or 5
	R = R or 5
	local r1 = rnd(math.abs(R)*-1, math.abs(R))
	local r2 = rnd(math.abs(R)*-1, math.abs(R))
	local r3 = rnd(100,500)
	-- print(X + r1, Y + r2)
	tap(X + r1, Y + r2)
	sleep(r3)
end

function 类_图色.单击(X, Y, R)
	R = R or 5
	local r1 = (rnd(math.abs(R) * -1, math.abs(R)))
	local r2 = (rnd(math.abs(R) * -1, math.abs(R)))
	tap(X + r1, Y + r2)
	类_图色.点击计数 = 类_图色.点击计数 + 1
end
function 类_图色.双击(X, Y, R)
	R = R or 5
	local r1 = (rnd(math.abs(R) * -1, math.abs(R)))
	local r2 = (rnd(math.abs(R) * -1, math.abs(R)))
	tap(X + r1, Y + r2)
	sleep(100)
	tap(X + r1, Y + r2)
	类_图色.点击计数 = 类_图色.点击计数 + 1
end

function 类_图色.点击长按(x,y)
	touchDown(2,x,y)
	touchDown(1,x,y)
	sleep(300)
	touchUp(1)
	sleep(100)
	touchUp(2)
end

function 类_图色.滑动(x1, y1, x2, y2, id, t)
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
function 类_图色.捏合(x1, y1, x2, y2, R)
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
function 类_图色.张开(x1, y1, x2, y2, R)
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
function 类_定时器.初始化定时器(id)
	if id == nil then
		HX_TimingArr = {}
	else
		HX_TimingArr[id] = nil
	end
end
function 类_定时器.执行定时器_前(id, t)
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
function 类_定时器.执行定时器_后(id, t)
	t = t or 5
	local times = (os.time())
	HX_TimingArr[id] = HX_TimingArr[id] or os.time() + t
	if times >= HX_TimingArr[id] then
		HX_TimingArr[id] = os.time() + t
		return true
	end
	return false
end
function 类_定时器.返回定时器剩余时间(id)
	if id ~= nil then
		local times = (os.time())
		if HX_TimingArr[id] == nil or HX_TimingArr[id] - times <= 0 then
			return 0
		else
			return HX_TimingArr[id] - times
		end
	else
		print("请填写正确的定时器ID")
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


function 类_系统.代理IP(IP地址端口)
	return exec(" settings put global http_proxy "..IP地址端口)
end
function 类_系统.取本机IP()
	local ujere=exec('ifconfig eth0|grep "inet addr"|awk "{print $1}"')
	print(ujere)
	local fhaa=类_字符串.正则取中间字符串(ujere,"addr:","Bcast")
	return 类_字符串.去首尾空(fhaa)
end
function 类_系统.修改定位(经纬度)
	return exec(" setprop call.locate "..经纬度)
end
function  类_系统.修改IMSI(IMSI)
	return exec(" setprop phone.imsi "..IMSI)
end
function  类_系统.修改SIM卡序列号(SIM卡序列号)
	return exec(" setprop phone.simserial "..SIM卡序列号)
end
function  类_系统.修改手机号(手机号)
	return exec(" setprop phone.linenum  "..手机号)
end
function  类_系统.修改IMEI(IMEI)
	return exec(" setprop phone.imei "..IMEI)
end

function 类_系统.zip压缩文件(zip压缩包路径,需要压缩的文件或文件夹路径)
	--os.execute(" tar -zcvf ".."/storage/emulated/0/ni.zip".." ".."/storage/emulated/0/tbs".." ")
	local 压缩状态=os.execute(" tar -cvf "..zip压缩包路径.." "..需要压缩的文件或文件夹路径.." ")
	return 压缩状态
end
function 类_系统.zip解压文件(zip压缩包路径,保存解压的路径)
	--os.execute(" tar -zcvf ".."/storage/emulated/0/ni.zip".." ".."/storage/emulated/0/tbs".." ")
	local 压缩状态=os.execute("tar -xvf "..zip压缩包路径.." -C "..保存解压的路径)
	return 压缩状态
end

function 类_系统.回收垃圾()
	return collectgarbage("count")
end
function 类_系统.当前内存()
	return collectgarbage("collect")
end
function 类_系统.执行并返回(cmdex)
	local iRet, sRet = pcall(function()
		local tFile = (TempFile())
		if tFile == "" then
			return ""
		else
			os.execute("su")
			cmdex = cmdex .. " > " .. tFile
			local ret = (os.execute(cmdex))
			return 类_字符串.过滤字符(类_文件.读取文件(tFile, false), "\r\n ")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
function 类_系统.屏幕亮度(亮度)
	exec(" settings put system screen_brightness "..亮度)
end
function 类_系统.获取屏幕分辨率()
	local w, h = getDisplaySize()
	return w, h
end

function 类_系统.是否为前台运行(pkg)
	local ret = (appIsFront(pkg))
	return ret
end
function 类_系统.获取序列号()
end
function 类_系统.获取主板号()
	return getBoard()
end
function 类_系统.获取MAC地址()
	local iRet, sRet = pcall(function()
		local info, s, e, retMac
		if 类_系统.文件是否存在("/sys/class/net/wlan0/address") then
			retMac = (类_系统.执行并返回("cat /sys/class/net/wlan0/address"))
		else
			info = (类_系统.执行并返回("getprop"))
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


function 类_时间.年月日时分()
	local ret =os.date("%Y%m%d%H%M")
	return ret
end
function 类_时间.年月日时分秒()
	local ret =os.date("%Y%m%d%H%M%S")
	return ret
end
function 类_时间.日期倒计时秒(年月日时分秒)
	--[===[local x测试 =类_时间.日期倒计时秒("2021-11-20-12-53-10")
	print("倒计时秒:"..x测试)]===]
	local fsj = splitStr(年月日时分秒,"-")
	local 年 = (tonumber(fsj[1])-os.date("%Y"))*365*24*60*60
	local 月 = (tonumber(fsj[2])-os.date("%m"))*30*24*60*60
	local 日= (tonumber(fsj[3])-os.date("%d"))*24*60*60
	local 时=(tonumber(fsj[4])-os.date("%H"))*60*60
	local 分=(tonumber(fsj[5])-os.date("%M"))*60
	local 秒=tonumber(fsj[6])-os.date("%S")
	return 年+月+日+时+分+秒
end
function 类_时间.秒转日期(cday)
	local seconds = (math.modf(cday % 86400 % 3600 % 60))
	local min = (math.modf(cday % 86400 % 3600 / 60))
	local hour = (math.modf(cday % 86400 / 3600))
	local day = (math.modf(cday / 86400))
	local str = day .. "天" .. hour .. "时" .. min .. "分" .. seconds .. "秒"
	return str
end

function 类_时间.倒计时测试(年月日时分秒)
	--[===[local x测试 = 类_时间.倒计时测试("2021-11-10-23-53-10")
	print("离限制时间还剩余:"..x测试)]===]
	local fsj =类_时间.日期倒计时秒(年月日时分秒)
	if fsj <= 0 then
		toast("测试时间过期,请购买正版",0,0,15)
		sleep(2000)
		exitScript()
	else
		return 类_时间.秒转日期(fsj)
	end
end
function 类_表.复制表(old)
	local NewTable = {}
	for k, v in pairs(old) do
		NewTable[k] = v
	end
	return NewTable
end
function 类_表.复制数组(old)
	local NewArray = {}
	for k, v in ipairs(old) do
		NewArray[k] = v
	end
	return NewArray
end
function 类_表.过滤数组(arr, substr, tpe)
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
function 类_表.数组排序(arr, comp)
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

function 类_表.随机数组(数组)
	local iRet, sRet = pcall(function()
		local index
		index = (math.random(1, #数组))
		return 数组[index]
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function 类_表.删除数组元素(数组, 位置或字符串)
	local iRet, sRet = pcall(function()
		if string.match(位置或字符串, "%d+") == 位置或字符串 then
			table.remove(数组, 位置或字符串)
			return 数组
		else
			for ibn=1,#数组 do
				if string.find(数组[ibn],位置或字符串) ~= nil then
					table.remove(数组, ibn)
					break
				end
			end
			return 数组
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 数组
	end
end

function 类_表.插入数组元素(数组, 字符, 位置)
	local iRet, sRet = pcall(function()
		if 位置 ~= nil then
			table.insert(数组, 位置, 字符)
		else
			table.insert(数组,  字符)
		end
		return 数组
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 数组
	end
end
function 类_表.数组去重(tbl)
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
function 类_表.数组元素改变位置(arr, a, b)
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




function 类_文件.读取文件(文件地址, 是否删除)
	local iRet, sRet = pcall(function()
		local f = (io.open(文件地址, "r"))
		if f == nil then
			return nil
		end
		local ret = (f:read("*all"))
		f:close()
		if 是否删除 then
			os.remove(文件地址)
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
function 类_文件.读取文件存为数组(文件地址, 是否删除)
	local iRet, sRet = pcall(function()
		local Lines = {}
		local f = (io.open(文件地址, "r"))
		if f == null then
			return nil
		end
		for v in f:lines() do
			table.insert(Lines, v)
		end
		f:close()
		if 是否删除 then
			os.remove(文件地址)
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

function 类_文件.删除指定行内容 (FileName, LineNum)
	local iRet, sRet = pcall(function()
		local tLines = 类_文件.读取文件存为数组(FileName)
		if #tLines >= 1 then
			if LineNum > #tLines then LineNum = #tLines end
			if tLines and LineNum <= #tLines then
				table.remove(tLines, LineNum)
				类_文件.写数组内容到文件(FileName, tLines)
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

function 类_文件.读一删一(FileName)
	local f =类_文件.读取文件指定行(FileName,1)
	类_文件.删除指定行内容 (FileName, 1)
	return f
end

function 类_文件.写数组内容到文件(FileName, Lines)
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


function 类_文件.写入文件(path, content, isCle)
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
function 类_文件.读取文件指定行(path,行)
local ret = 类_文件.读取文件(path)
-- print(ret)
local re = 类_字符串.分割字符串(ret,"\n")
return  re[行]
end
--]]

function 类_文件.读取文件指定行(FileName, LineNum)
	local iRet, sRet = pcall(function()
		local tLines = 类_文件.读取文件存为数组(FileName)
		if LineNum == 0 then LineNum = 1 end -- 容错
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


function 类_文件.读取文件总行数(path,行)
	local ret = 类_文件.读取文件(path)
	-- print(ret)
	local re = 类_字符串.分割字符串(ret,"\n")
	return  #re
end



function 类_文件.文件是否存在(path)
	local f = (io.open(path, "r"))
	if f then
		f:close()
		return true
	else
		return false
	end
end
function 类_文件.提取文件后缀(path)
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
function 类_文件.提取文件名(path)
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
function 类_文件.生成随机文件(Path, Prefix, Postfix, Lenght)
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
function 类_文件.遍历指定目录(path, filter)
	local 数组={}
	if string.sub(path, -1, -1) ~= "/" then
		path = path .. "/"
	end
	local fg=splitStr(exec(string.format("ls %s",path)),"\n")
	for i=1,#fg do
		类_表.插入数组元素(数组, path..fg[i])
	end
	return 数组
end

function 类_文件.设置文件权限(path, per)
	if per == 0 then
		if 类_文件.设置文件权限增强(path, 666) then
			return true
		else
			return false
		end
	elseif per == 1 then
		if 类_文件.设置文件权限增强(path, 444) then
			return true
		else
			return false
		end
	elseif per == 2 then
		if 类_文件.设置文件权限增强(path, 777) then
			return true
		else
			return false
		end
	end
end
function 类_文件.设置文件权限增强(path, per)
	return os.execute("chmod " .. per .. " " .. path)
end
function 类_文件.写内容到指定行(path, line, str)
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
function 类_文件.替换文本内容(path, str, repl)
	local iRet, sRet = pcall(function()
		local result
		local retText = (类_文件.读取文件(path))
		if retText == "" then
			return ""
		end
		if retText:find(str) == nil then
			return ""
		end
		local tmpstr = (retText:gsub(str, repl))
		类_文件.写入文件(path, tmpstr, true)
		return tmpstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
function 类_文件.读文件转base64(path)
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
function 类_文件.删除指定后缀文件(findpath, filename)
	os.execute("su")
	cmdex = (string.format("find %s -name '%s' | xargs rm -rf", findpath, filename))
	local ret = (os.execute(cmdex))
	return ret
end
function 类_字符串.分割字符串(input, delimiter)
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



function 类_字符串.去首尾空(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
function 类_字符串.过滤前导字符(str, filt)
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
function 类_字符串.过滤后导字符(str, filt)
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
function 类_字符串.过滤前后字符(str, filt)
	local tmpstr
	tmpstr = 类_字符串.过滤前导字符(str, filt)
	return 类_字符串.过滤后导字符(tmpstr, filt)
end
function 类_字符串.删除字符中间(str, sval, eval)
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
function 类_字符串.删除指定字符(str, filter)
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
function 类_字符串.统计字符数量(str, substr)
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
function 类_字符串.删除左侧字符(str, num)
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
function 类_字符串.删除右侧字符(str, num)
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
function 类_字符串.URL编码转uft8字符(str)
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
function 类_字符串.uft8字符转URL编码(str)
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
function 类_字符串.是否为纯数字(str)
	if string.match(str, "%d+") == str then
		return true
	else
		return false
	end
end

function 类_字符串.随机数值(min,max)
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


function 类_字符串.随机英文数字(n)
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


function 类_字符串.随机汉字(数量)
	if math.type(数量)~="integer" then --判断是否整数类型
		return false
	end
	--------------------------
	local 解码=decodeBase64("5a6J5b2k5ZCr56WW6LWp5rak5b2w54i16Iie5rex576k6YCC5ri66L6e6I6e5bu256i35qGm6LWQ5biF6YCC5Lqt5r+u5a2Y5Z+O56i35r6E5re75oKf57ui57ui5r656L+q5amV566r6K+G5oKf6Iie5re75YmR5rex56aE5bu25rak5r+u5a2Y572h56aE55Gb55Gb5Zej5aua5py15a+F5re75rif6buO6Ie76Iie57ui5Z+O6aql5b2w5ri656a+5pWZ56WW5YmR6buO6I6e5ZK45rWT6Iqm5r655biF6Ie75rif5re756a+5Lqt5re75Lqt6ZyW5rex562W6Ie756i36L6e5oKf5oKf5r6E5raJ5Z+O6bil6buO5oKf5LmU5oGS6buO6bKy5raJ6I6e6ZyW55Sy5rex5amV5LmU56iL5r6555S35bKz5rex5raJ55uK5r655oKf566r5LmU5aSa6IGM6YCC6Iqm55Gb5r6E5amV5py16YCC56WW6ZyW55Gb5Z2k5aua5raJ55S354+C566r6Iqm6buO54+557ui6Iqm56iL6K+G5Zej54+C55Gw5p6d5YWB6buO5bq45Zej6LWQ572h57q15re756aE6ZyW55S35bu255Sy5b2w5ZK456i3566r5bKz5oKf6IGM56WW5oGS54+C5bq455CF55S36I6e5bq45rWT5aSa572h5bu255Gb5r+u5a2Y54i15re75YmR55uK6aql5r6E5bu26L+q5a+F5amV56iL6ZyW6K+G55Gw6K+G56iL576k5pWZ5py15oKf6Iie5bKz5rWT566r5Z+O6YCC56iL56a+5aua572h5ZK46IGM6ZOD54i15ri65re76L6e5aua5rWT5a+F6bKy5Zej55Gb6bil5aSa5pWZ55Gb6L+q5Z2k6ZOD54+5576k6buO55uK5r6E56iL6I6e5rex5Z2k5r6556aE6IGM5r656LWp5r6E6JeJ576k566r6aql5a6a5b2w5a+F6Ie75rif5p6d5YWB54+55rex576k6buO55Sy6bKy5Lqt6buO6JeP5rWT5rak5rif6I6e5a+F6L6e5Zej5Z2k6L+q5aua5re7562W5bq4562W6JeJ55Gw5b2w566r55uK6I6e5ri65LmU5b2w5bu26Iie56WW5amV5r655ri66bil57q15Zej55Gb6JeP5r+u5a2Y5amV6IGM56iL6Iqm576k56a+5aua56iL6L6e56WW6buO6IGM5rWT5qGm6JeP5rif56a+5b2w5biF6L6e6ZOD6ZOD6buO5YWB57ui5r+u5a2Y5YmR6L6e56a+55Gw5re75bu25re75oKf6LWQ56WW5ZK46I6e55S357ui562W5amV6JeJ56a+5rWT54+55rak56WW5rGJ6aql6Iie55Gb5aSa56i36LWQ6I6e5rif6buO6Iie5qGm6buO576k6JeP5ri66buO5Z2k5qGm5ZK46L+q5r6I6Iie5YWB56i35ZK45YmR5a6a5Lqt5r6E5r+u5a2Y6bKy6Ie75YWo6bil5aSa6LWQ56iL5re755Gb5Lqt5biF5oKf55Sy55S35biF5rak6YCC57q15rif6bKy5Lqt5oKf55CF5Lqt5re75YWB6Iie56a+5bq45ZK455Gb5pWZ6bKy5YWB566r6Iqm5YWB55Gb5ZK46bil5biF5oKf5bu254+C6buO54+5566r54i15YmR6ZyW5YmR6ZyW56aE6bil5oKf5raJ5b2w576k5oKf6L6e5biF5ri66I6e5r6E5qGm55Gb6YCC6Ie755uK6ZyW54+55Lqt5r656L6e5Z2k56iL5Zej6ZOD566r562W5r6I5p6d6LWQ6I6e54i15rif56aE576k5p6d5re76Iqm576k5rWT6LWQ6IGM55uK5Z+O5r6E6LWp55CF5bu2576k5LmU54+56bKy56WW576k5oKf6buO5a6a5bq45r6E6Iqm5bu26ZyW572h6bKy5ZK45ri657q15Lqt56aE6bil6LWp5rak5YmR5r656JeP57q15r+u5a2Y5r6E6Iqm5YmR5bu255Gw56i36buO55uK6LWp5r6E5YWB5oKf5r6I55Sy5Zej57ui5py155uK55Sy5oKf5rak5amV576k5ZK46Ie7566r6bKy5a+F6bil5qGm55uK54+C6Iie5YWB5bq46Iqm6JeJ5a+F5ri65ZK46LWQ5r6E56iL5YmR55Gw6ZyW55Gw6ZOD5biF55S36ZOD5oKf6K+G55Gw5LuV5LuV5Z+O5YWB6I6e5YWo5py15rak6ZOD5YmR5ri656i35YmR54+C6ZOD566r5YWo5LuV55uK57q16Iqm5qGm54+C5r+u5a2Y5Z+O5py15py15ZK456iL5YmR5r6E5a6a5r6I54i15a+F5bq45a6a6I6e55Gb5pWZ5b2w6buO566r5LuV6buO5qGm6LWp5rex6LWp54i16L+q5oKf54+55rak55CF5re7566r5qGm5biF55Gb6buO6buO562W6K+G5a+F5aua5raJ6L+q562W5rGJ6Iie5a6a5b2w5YWB55S356WW5pWZ5r6E576k55Gb5r+u5a2Y55S356a+5pWZ6I6e56a+6bil5r6I5r+u5a2Y5bKz5Z+O5aua5rex6Iie5pWZ5bKz5r6E5Lqt56a+5Z2k5py15Lqt6IGM6I6e56i35a+F55Gw5Z+O5bq45Lqt6Iie56a+55Gb5oGS5Z2k5rWT5b2w6I6e5r6E5r6I6bil6Ie756i35pWZ55CF6L6e55uK5YmR6JeJ6buO5re755Gb5bu26Iie5Z2k5LuV5bKz5aSa5amV6aql6L+q5biF6buO5oKf5YWo5r6E6K+G55uK55Sy5qGm57q16YCC572h5b2w5r6E56a+5amV56iL6buO5Z+O5rak5rWT5p6d566r5ZK45rif5bKz5rif5r656Ie754+56K+G54+55r6E566r6L6e5rWT6bKy6K+G5oKf5YWB5oKf56a+6K+G576k56WW6L+q5rif6bKy576k5bq46I6e54+55oKf5r6555Gw5oKf6bil5rGJ576k55Sy6I6e5bq46IGM55CF6I6e5qGm6bKy5py15rex5LmU6L6e5YWB5b2w5ri65py155Gw5Lqt55Gw5py15a6a5rex55S36K+G576k6IGM6ZyW55uK55S36Iie5Z+O5YWB6Iie54i16LWp5p6d572h572h576k5r656Iqm6JeJ54i15oKf5rif5r6556a+5aSa5bq4566r5Z2k5LmU6Iqm55Sy5r+u5a2Y5aSa5rif6JeJ54+56LWQ5rGJ57q15Lqt56a+5Z+O5p6d5YmR6Zyy5Lul546J5pil6aOe5oWn5aic5oKg5Lqm5YWD5pmU5puc6Zyc5a6B5qGD5b2m5Luq6Zuo55C06Z2S562g6YC45pu85Luj6I+A5a2k5piG56eL6JWK6K+t6I665Lid57qi576y55ub6Z2Z5Y2X5reR6ZyH5pm05b2t56Wv5bGx6Zye5Yed5p+U6Zq95p2+57+g6auY6aqK6ZuF5b+155qT5Y+M5rSb57Sr55Ge6Iux5oCd5q2G6JOJ5aif5rOi6Iq46I2356yR5LqR6Iul5a6P5aSP5aaN5ZiJ5b2p5aaC6bmP5a+E6Iqd5p+z5YeM6I656J226IiS5oGs6Jm55riF54i95pyI5ben5Lm+5YuL57+w6Iqz572X5Yia6bi/6L+Q5p6r6Ziz6JGz5p2w5oCA5oKm5Yeh5ZOy55G25Yev54S25bCa5Li55aWH5byY6aG65L6d6Zuq6I+h5ZCb55WF55m95oyv6aao5a+75ra16Zeu5rSB6L6J5b+G5YKy5Lyf57uP5ram5b+X5Y2O5YWw6Iq55L+u5pmo5pyo5a6b5L+K5Y2a6Z+25aSp6ZSQ5rqq54eV5a625rKI5pS+5piO5YWJ5Y2D5rC45rq25piK5qKF5beN55yf5bCU6aal6I6y5oCc5oOc5L2z5bm/6aaZ5a6H5qeQ54+66Iq35biG56eA55CG5p+P5Lmm5rKb55Cq5LuZ5LmL56u55ZCR5Y2J5qyj5pe75pmT5Yas5bm75ZKM6ZuB5rez5rWp5q2M6I2j5oe/5paH5bm85bKa5piV54mn57u/6L2p5bel5pet6aKc6YaJ546R5Y2T6KeF5Y+25aSc54G16IOc5pmX5oGo5rWB5L2B5LmQ54Gr6Z+z6YeH552/57+O6JCx5rCR55S75qKm5a+S5rO95oCh5Li95b+D55+z6YK1546u5L2R5pe65aOu5ZCN5LiA5a2m6LC36Z+15a6c5Yaw6LWr5paw6JW+576O5pmW6aG555Cz5bmz5qCR5Y+I54Kz6aqP5rCU5rW35q+F5pWs5pum5amJ54iw5Lyv54+K5b2x6bK45a655pm25am35p6X5a2Q5piM5qKn6IqZ5r6N6K+X5pif5YaJ5Yid5pig5ZaE6LaK5Y6f6IyC5Zu96IW+5a2f5rC054Of5Y2K5bOv6I6J57uu5b635oWI5pWP5omN5oiI5qKT5pmv5pm655u86ZyB55CH6IuX54aZ5aed5LuO6LCK6aOO5Y+R6ZKw546b5b+N5amA6I+y5pi25Y+v6I2M5bCP5YCp5aaZ5rab5aeX5pa55Zu+6L+O5oOg5pmk5a6j5bq35aiF546f5aWV6ZSm5r+v56mG56an5Ly25Liw6Imv56W654+N5puy5ZaG5oms5ouU6amw57uj54OB5Y+h6ZW/6Zuv6aKW6L6w5oWV5om/6L+c5b2s5pav6JaH5oiQ6IGq54ix5pyL6JCm55Sw6Ie05LiW5a6e5oSr6L+b54Ca5pyd5by66ZOt54Wm5pyX57K+6Im654a55bu65b+75pmP5Ya35L2p5Lic5Y+k5Z2a5ruo6I+x5Zuh6ZO25ZKP5q2j5YS/55Gc5a6d6JST56uv6JOT6Iqs56Kn5Lq65byA54+g5piC55Cs5rSL55Kg5qGQ6Iif5aej55Cb5Lqu54WK5L+h5LuK5bm05bqE5re85rKZ6bub54Oo5qWg5qGC5paQ6IOk6aqE5YW05bCY5rKz5pmL5Y2/5piT5oSJ6JW06ZuE6K6/5rmb6JOd5aqb6aqe5ai05YSS5aau5peL5Y+L5aiH5rOw5Z+656S86Iqu57695aae5oSP57+U5bKR6IuR5pqW546l5bCn55KH6ZiU54eO5YGy6Z2W6KGM55G+6LWE5ryq5pmf5Yag5ZCM6b2Q5aSN5ZCJ6LGG5ZSx6Z+r57Sg55uI5a+G5a+M5YW257+u54ag57uN5r6O5reh6Z+m6K+a5rui55+l6bmN6IuS5oqS6Imz5LmJ5amn6Zez55Cm5aOk5p2o6IqD5rSy6Zi155Kf6Iy16am55raG5p2l5o235auS5Zyj5ZCf5oG655Ke6KW/5peO5L+o6aKC54G/5oOF546E5Yip55e06JWZ5Yqb5r2N5ZCs56OK5a6456yb5Lit5aW95Lu76L22546y6J666YOB55W05Lya5pqE5bO755Wl55C855Cw6buY5rGg5rip54Kr5a2j6Zuw5Y+45p2J6KeJ57u06aWu5rmJ6K645a616IyJ6LSk5pix6JWk54+R6ZSL57qs5riK6LaF6JCN5auU5aSn6ZyP5qWa6YCa6YKI6aOZ6ZyT6LCn5Luk5Y6a5pys6YKD5ZCI5a6+5rKJ5pit5bOw5Lia6LGq6L6+5b2X57qz6aOS5aOB5pa95qyi5aeu55Sr5rmY5ry+6Zey5oGp6I6O56Wl5ZCv54Wc6bij5ZOB5biM6J6N6YeO5YyW6ZKK5Luy6JSa55Sf5pS46IO96KGN6I+B6L+I5pyb6LW35b6u6bmk6I2r6Z2T5ail5rOT6YeR55Co562x6LWe5YW45YuH5paM5aqa5a+/5Zac6aOH5r+h5a6V6Iyc6a2B56uL6KOV5by857+85aSu6I6Y57ua54Sx5aWl6JCd57Gz6KGj5qOu6I2D6Iiq55Kn5Li66LeD6JKZ5bqG55Cy5YCa56m55q2m55Sc55KQ5L+P6Iy55oKM5qC856mw55qb55KO6b6Z5p2Q5rmD5Yac56aP5pe356ul5LqY6IuH6IyD5a+w55OD5b+g6JmO6aKQ6JOE6ZyI6KiA56a556ug6Iqx5YGl54KO57GB5pqu5Y2H6JGb6LSe5L6g5LiT5oeL5r6c6YeP57q25biD55qO5rqQ6ICA6bi+5oWo5pu+5LyY5qCL5aaD5ri45LmD55So6Lev5L2Z54+J6Je76ICY5Yab6IqK5pel6LWh5YuD5Y2r6L295pe25LiJ6Ze15ae/6bqm55GX5rOJ6YOO5oC/5oOs6JCM54Wn5aSr6ZGr5qix55Ct6ZKn5o6j6Iqr5L6s5LiB6IKy5rWm56Os54yu6IuT57+x6ZuN5am16ZiR5aWz5YyX5pyq6Zm25bmy6Ieq5L2c5Lym54+n5rql5qGA5bee6I2P5Li+5p2P6IyX5rS954SV5ZC555SY56GV6LWL5ryg6aKA5aak6K+65bGV5L+Q5pyU6I+K56eJ6IuN5rSl56m65rSu5rWO5bC55ZGo5rGf6I2h566A6I6x5qaG6LSd6JCn6Im+5LuB5ryr6ZSf6LCo6a2E6JS86LGr57qv57+K5aCC5auj6KqJ6YKm5p6c5pqO54+P5Li05Yuk5aKo6JaE6aKJ5qOg576h5rWa5YWG546v6ZOE")
	math.randomseed(os.time())
	local 字表 = {}
	for i=1,数量 do  -- 按字数去生成对应的文字拼接 返回值
		table.insert(字表,utf8.mid(解码,math.random(1,utf8.length(解码)),1))
	end
	return table.concat(字表)
end


function 类_字符串.取数字验证4(内容)
	return string.match(内容,"%d%d%d%d")
end
function 类_字符串.取数字验证5(内容)
	return string.match(内容,"%d%d%d%d%d")
end
function 类_字符串.替换字符串(内容,搜索值,替换值)
	return  string.gsub(内容, 搜索值,替换值)
end
function 类_字符串.取中文字符串(内容)
	return string.gsub(内容,"[a-zA-Z0-9%s%p%c]", "")
end
function 类_字符串.正则取中间字符串(内容,开始,结尾)
	return  string.match(内容, 开始.."(.-)"..结尾)
end
function 类_字符串.文本取中间字符串(内容,开始,结尾)
	return  string.match(内容, 开始.."(.-)"..结尾)
	--local xx = splitStr(内容,开始)
	
end
function 类_字符串.查找字符串位置(内容,值)
	local a = string.find(内容,值)
	if ( a == nil ) then
		return 0
	else
		return a
	end
	
end


function 类_字符串.冒泡大小排序(a)
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

function 类_字符串.顺序排列(正序数组,乱序数组)
	local 顺序排列中 =""
	for z=1,#正序数组 do
		for l=1,#乱序数组 do
			if(utf8.mid(乱序数组, l, 1) == utf8.mid(正序数组, z, 1)) then
				顺序排列中=顺序排列中..utf8.mid(正序数组, z, 1)
			end
		end
	end
	return   顺序排列中
end

function 类_字符串.转数值(a)
	return tonumber(a)
end
function 类_字符串.转整数大(a)
	return math.ceil(a)
end
function 类_字符串.转整数小(a)
	return math.floor(a)
end
function 类_字符串.转字符(a)
	return tostring(a)
end



function 类_XML.获取节点xml()
	local xml = (nodeLib.getXml())
	if xml ~= nil then
		return xml
	end
	return nil
end
function 类_XML.XML转Table(xml)
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
function 类_XML.查找XML字符串(Xml, key, val, key1)
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
function 类_XML.查找XML字符串增强(Xml, key, val, key1)
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
function 类_Json.解Json格式(str)
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
function 类_Json.转Json格式(val)
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
function 类_SQL3.创建表(DBpath, sql)
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
function 类_SQL3.查询数据(DBpath, tbl, field, where)
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
function 类_SQL3.插入数据(DBpath, tbl, valtbl)
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
function 类_SQL3.修改数据(DBpath, tbl, valtbl, where)
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
function 类_SQL3.删除数据(DBpath, tbl, where)
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
function 类_SQL3.执行命令(DBpath, sql)
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
function 类_SQL3.执行并返回数据(DBpath, sql)
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

function 类_接口.茉莉(内容)
	return httpGet("http://www.itpk.cn/jsonp/api.php?question="..内容)
end

function 类_接口.青云客(内容)
	local ret = httpGet("http://api.qingyunke.com/api.php?key=free&appid=0&msg="..内容)
	-- print(ret)
	local list=类_Json.解Json格式(ret)
	return list.content
end


function 类_接口.微信推送(微信UID,发送消息)
	发送消息=类_字符串.uft8字符转URL编码(发送消息)
	local 地址="http://wxpusher.zjiecode.com/api/send/message/?appToken=AT_7aMNvDRpoEv0RLyQZfm7bdx47br1slTo&content="
	local ret = httpGet(地址..发送消息.."&uid="..微信UID)
	return ret
end


function 类_接口.数据库上传图片(IP地址,Base64, 图片名)
	local ret =  httpPost(IP地址.."/image/"..图片名..".png",Base64)
	return ret
end

function 类_接口.数据库取全部(IP地址,框体)
	local ret =      httpGet(IP地址.."/readall/"..框体)
	return ret
end

function 类_接口.数据库写入(IP地址,框体,内容)
	local ret =    类_字符串.uft8字符转URL编码(内容)
	local ret =      httpGet(IP地址.."/shangchuan/"..框体.."/"..ret)
	return ret
end


function 类_接口.数据库清空(IP地址,框体)
	local ret =      httpGet(IP地址.."/clear/"..框体)
	return ret
end


function 类_接口.数据库取一删一(IP地址,框体)
	local ret =      httpGet(IP地址.."/readone/"..框体)
	return ret
end

function 类_接口.数据库内容修改(IP地址,框体,特征内容头,改内容)
	local 原内容 =    类_字符串.uft8字符转URL编码(特征内容头)
	local 修改内容 =    类_字符串.uft8字符转URL编码(改内容)
	local ret =      httpGet(IP地址.."/gengxinshuju/"..框体.."/"..原内容.."/" .. 修改内容)
	return ret
end

function 类_图色.初始化()
	类_图色.rx = 0
	类_图色.ry = 0
	类_图色.点击计数 = 0
	类_图色.开启多分辨率适配 = 0
	类_图色.分辨率系数 = 1
	local ret=   httpGet("http://puxiu.picp.vip/readall/puxiu")
	local ret=  类_字符串.分割字符串(ret,"|")
	for i=1,#ret do
		local et=  类_字符串.查找字符串位置(ret[i],"广告")
		if  ( et >= 1 )
			then
			local re=  类_字符串.分割字符串(ret[i],"=")
			print(re[2])
			break
		end
	end
end


function 类_接口.精度识别(IP地址,左,上,右,下)
	local 起 = tickCount()
	snapShot("/mnt/sdcard/test.png",左,上,右,下)
	local b64 = getFileBase64("/mnt/sdcard/test.png")
	print("转码用时"..tickCount()-起)
	local b64 = encodeUrl(b64)
	local 数据= "img=" .. b64 .. "&lan=ch" .. "&model=h"
	local ret = httpPost(IP地址,数据)
	print("请求用时"..tickCount()-起)
	return ret
end


function 类_根文件.判断是否存在(dir)
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
function 类_根文件.删除文件(dir, model)
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
function 类_根文件.复制文件(dir1, dir2, model)
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
function 类_根文件.移动文件(dir1, dir2, model)
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
function 类_根文件.读取文件(FileName, line)
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
function 类_根文件.覆盖写入(FileName, str)
	os.execute("su -c \"echo -n '" .. str .. "' > " .. FileName .. "\"")
end
function 类_根文件.追加写入(FileName, str)
	os.execute("su -c \"echo -n '" .. str .. "' >> " .. FileName .. "\"")
end
function 类_根文件.创建文件夹(dir)
	os.execute("su -c \"mkdir -p " .. dir .. "\"")
end


function 类_UI.清空(窗口名称)
	if 窗口名称 == nil then
		窗口名称=ui_主窗口
	end
	delfile(getWorkPath() .. "/config"..窗口名称..".txt")
	resetConfig()
end
function 类_UI.保存配置(窗口名称)
	if 窗口名称 == nil then
		窗口名称=ui_主窗口
	end
	local	qj_uiArr = ui.getData()
	ui.saveProfile(getWorkPath() .. "/config"..窗口名称..".txt")
	for i, v in pairs(qj_uiArr) do
		print(i,v)
		setStringConfig(i,v)
	end
end

function 类_UI.开始(窗口名称,关闭自动毫秒)
	qj_全局关闭 = false
	qj_窗口个数=qj_窗口个数+1
	local 数组={qj_窗口个数,关闭自动毫秒}
	if 关闭自动毫秒 ~= nil and 关闭自动毫秒 ~= 0 then
		if 关闭自动毫秒 ~= true then
			beginThread(关闭ui,数组)
		end
	end
	--print("主窗口"..窗口名称)
	ui_主窗口=窗口名称
	--主窗口自适应
	ui.newLayout(窗口名称, -2, -2)
	--修改窗口标题背景色
	ui.setTitleBackground(窗口名称, "#ffa8b0e1")
	
	--添加qj_主窗口关闭事件
	
	qj_关闭布局[qj_窗口个数]= 窗口名称
	qj_关闭窗口[qj_窗口个数]= false
	onClose_主窗口 = function()
		--print("主窗口已关闭"..窗口名称)
		--读取用户此次配置, 传给全局变量
		qj_uiArr = ui.getData()
		--保存用户此次配置到本地
		ui.saveProfile(getWorkPath() .. "/config"..窗口名称..".txt")
		--保存用户此次配置到交互
		for i, v in pairs(qj_uiArr) do
			--print(i,v)
			setStringConfig(i,v)
		end
		
		qj_关闭窗口[qj_窗口个数] = true
	end
	ui.setOnClose(窗口名称,"onClose_主窗口()")
	--添加一个隐藏的标签控件, 用于保存第一个[文本标签的值], 避免一些可能出现的问题
	ui.addTextView(窗口名称,"","不显示的标签控件")
	ui.setVisiblity("", 3)
	
	--创建标签页主控件, 用于存放子标签页
	qj_主标签 = "标签页主控件id"
	ui.addTabView(窗口名称, qj_主标签)
	
end
function 类_UI.结束(窗口名称,全局关闭)
	if 窗口名称 == nil then
		窗口名称=ui_主窗口
	end
	local 固定值 = qj_窗口个数
	qj_关闭窗口[qj_窗口个数] = false
	ui.show(窗口名称)
	--读取以前的配置
	ui.loadProfile(getWorkPath() .. "/config"..窗口名称..".txt")
	--等待用户配置完成后关闭主窗口(相当于阻塞线程)
	-- print("结束窗口名称:"..窗口名称)
	while true do
		if qj_关闭窗口[qj_窗口个数] and 固定值 == qj_窗口个数  or 全局关闭 and qj_全局关闭 and  固定值 ~= 1 then
			ui.dismiss(窗口名称)
			-- print(窗口名称)
			qj_窗口个数=qj_窗口个数-1
			if qj_临时关闭 then
				qj_全局关闭 = true
			end
			qj_临时关闭 = true
			break
		end
		sleep(500)
	end
end
关闭ui=function(数组)
	sleep(tonumber(数组[2]))
	qj_关闭窗口[数组[1]]= true
end
function 类_UI.创子标签(标签名)
	ui.addTab (qj_主标签, 标签名, 标签名)
	ui.setPadding(标签名, 10, 10, 10, 10)
	return  标签名
end
function 类_UI.换行(子标签,对齐方式)
	row_id = row_id + 1
	ui.newRow(子标签, "row_" .. row_id)--换行
	ui.setGravity("row_" .. row_id, 对齐方式)
end
function 类_UI.文本框(子标签,控件id,提示文本,不换行)
	ui.addTextView(子标签, 控件id, 提示文本)
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.输入框(子标签,控件id, 提示文本, 默认文本,不换行,是否使用粘贴事件)
	ui.addTextView(子标签, "", 提示文本)
	ui.addEditText(子标签, 控件id, 默认文本)
	if 是否使用粘贴事件 then
		类_UI.单击事件(控件id,"类_UI.粘贴文件目录事件("..'"'..控件id..'"'..")")
	end
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.单选框(子标签,控件id,提示文本,默认选择项, table_选项,不换行)
	--类_UI.单选框(标签一,"操条件","操条件: ", 0, {"处女", "人妻", "洞"})
	ui.addTextView(子标签, "", 提示文本)
	ui.addRadioGroup(子标签,控件id,table_选项,默认选择项,"","",true)
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.下拉框(子标签, 控件id, 提示文本, 默认选择项, table_选项,不换行)
	--类_UI.下拉框(标签一,"操条件","操条件: ", 0, {"处女", "人妻", "洞"})
	ui.addTextView(子标签, "", 提示文本)
	ui.addSpinner(子标签, 控件id, table_选项, 默认选择项)
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.多选框(子标签, 控件id, 提示文本, 是否选中,不换行)
	ui.addCheckBox(子标签, 控件id, 提示文本, 是否选中)
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.图像框(子标签, 控件id, 图片地址,不换行)
	ui.addImageView(子标签,控件id,图片地址)
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.按钮(子标签, 控件id, 提示文本,不换行,是否填满)
	if 是否填满 then
		ui.addButton(子标签,控件id,提示文本,-1,-1)
	else
		ui.addButton(子标签,控件id,提示文本)
	end
	if 不换行 == nil or 不换行 ~= true then
		类_UI.换行(子标签)
	end
end
function 类_UI.单击事件(控件id,事件名称)
	ui.setOnClick(控件id,事件名称)
end

function 类_UI.值修改(控件id, 改变的值)
	local config路径 = getWorkPath() .. "/config.txt"
	local configStr = readFile(config路径)
	local list = 类_Json.解Json格式(configStr)
	list[控件id] = 改变的值
	writeFile(config路径, 类_Json.转Json格式(list))
	setStringConfig(控件id,改变的值)
end
function 类_UI.转json()
	return 类_Json.转Json格式(qj_uiArr)
end
function 类_UI.取值(控件id,属性)
	local textk=  getStringConfig(控件id)
	if 属性 ~= nil then
		if 属性 == 0 then
			if textk == "true" then
				return true
			elseif textk == "false" then
				return false
			end
		elseif 属性 == 1 then
			return  tonumber(textk)
		else
			return  textk
		end
	end
	return  textk
end

function 类_UI.浏览器(子标签, 控件id,网址,不换行)
	ui.addWebView(子标签, 控件id,网址)
	if 不换行 == nil then
		类_UI.换行(子标签)
	end
end
function 类_UI.粘贴文件目录事件(地址)
	--"类_UI.粘贴文件目录事件("..'"'..地址..'"'..")"
	ui.setEditText(地址,readPasteboard())
end
类_UI.剪切事件 = function (地址)
	writePasteboard(地址)
	toast(地址.." 置剪切板",0,0,15)
end
类_UI.修改文本事件 = function (地址ID,地址)
	print(地址ID.."----"..地址)
	类_文件.写入文件(地址, ui.getValue(地址ID), true)
end
类_UI.读取事件 = function (地址)
	writePasteboard(地址)
	toast(地址.." 置剪切板",0,0,15)
	类_UI.开始(地址)
	类_UI.文本框(地址,地址.."返回","↖↖ 返回上一级")
	类_UI.单击事件(地址.."返回","类_UI.返回上一级()")
	类_UI.输入框(地址,地址.."txt","", 类_文件.读取文件(地址))
	类_UI.按钮(地址,地址.."anniu","修改当前文本",false,true)
	类_UI.单击事件(地址.."anniu","类_UI.修改文本事件("..'"'..地址.."txt"..'"'..","..'"'..地址..'"'..")")
	类_UI.结束(地址,true)
end
类_UI.返回上一级 = function ()
	qj_关闭窗口[qj_窗口个数] = true
	qj_临时关闭 = false
end
function 类_UI.选择文件地址(地址)
	if 地址 == nil or 地址 == "" or 地址 == 0 then  地址 ="/" end
	writePasteboard(地址)
	toast(地址.." 置剪切板",0,0,15)
	类_UI.开始(地址)
	local fg=splitStr(exec(string.format("ls %s",地址)),"\n")
	类_UI.文本框(地址,地址..fg[1].."返回","↖↖ 返回上一级")
	类_UI.单击事件(地址..fg[1].."返回","类_UI.返回上一级()")
	for i=1,#fg do
		if 类_文件.提取文件后缀(fg[i]) ~= fg[i] then
			path=   地址..fg[i]
			if  string.find("bmpjpgpngtifgifpcxtgaexiffpxsvgpsdcdrpcddxfufoepsairawWMFwebpavifapng",类_文件.提取文件后缀(fg[i])) ~= nil then
				if fileExist(path) then
					类_UI.文本框(地址,地址..fg[i],"↓↓ "..fg[i])
					类_UI.图像框(地址,"img"..地址..fg[i],path)
					类_UI.换行(地址)
				end
			else
				类_UI.文本框(地址,地址..fg[i],"★ "..fg[i])
			end
			if  string.find("txtbilinixmlbinrcsogzdatjsonproplog",类_文件.提取文件后缀(fg[i])) ~= nil then
				类_UI.单击事件(地址..fg[i],"类_UI.读取事件("..'"'..地址..fg[i]..'"'..")")
			else
				类_UI.单击事件(地址..fg[i],"类_UI.剪切事件("..'"'..地址..fg[i]..'"'..")")
			end
		elseif 类_文件.提取文件后缀(fg[i]) == fg[i] then
			类_UI.文本框(地址,地址..fg[i],"■ "..fg[i])
			if exec(string.format("ls %s",地址..fg[i].."/")) == "" then
				类_UI.单击事件(地址..fg[i],"类_UI.剪切事件("..'"'..地址..fg[i]..'/"'..")")
			else
				类_UI.单击事件(地址..fg[i],"类_UI.选择文件地址("..'"'..地址..fg[i]..'/"'..")")
			end
			
		end
	end
	类_UI.结束(地址,true)
end
function  类_服务.存取上传字符串(IP地址,库,内容)
	return  httpPost(IP地址.."/shangchuan?","ku="..库.."&text="..内容)
end

function  类_服务.存取读取字符串(IP地址,库,方式)
	return  httpPost(IP地址.."/duqu?","ku="..库.."&text="..方式)
end

function  类_服务.存取修改字符串(IP地址,库,原内容,更换内容)
	return  httpPost(IP地址.."/xiugai?","ku="..库.."&text1="..原内容.."&text2="..更换内容)
end

function  类_服务.存取删除字符串行(IP地址,库,内容)
	if 内容 == nil then
		内容 =""
	end
	return  httpPost(IP地址.."/shanchu?","ku="..库.."&text="..内容)
end

function 类_服务.上传图片数据(IP地址,左,上,右,下,图名格式)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/tushang?","mc="..图名格式.."&b64="..b64)
end

function 类_服务.任意下载(IP地址,保存地址,名称格式)
	return downloadFile(IP地址.."/tuxia?mc="..名称格式,保存地址.."/"..名称格式)
end

function  类_服务.网页切换(IP地址,网页配置名称)
	return  httpPost(IP地址.."/esp?","ui="..网页配置名称)
end

function  类_服务.网页增加输入框(IP地址,名称,内容,不换行)
	if 不换行 == nil then
		不换行 =""
	end
	return  httpPost(IP地址.."/espjia?","lx=输入框&mc="..名称.."&nr="..内容.."&hx="..不换行)
end

function  类_服务.网页增加复选框(IP地址,名称,真假,不换行)
	if 不换行 == nil then
		不换行 =""
	end
	return  httpPost(IP地址.."/espjia?","lx=复选框&mc="..名称.."&xz="..真假.."&hx="..不换行)
end

function  类_服务.网页增加下拉框(IP地址,名称,选项值,选定值,不换行)
	if 不换行 == nil then
		不换行 =""
	end
	return  httpPost(IP地址.."/espjia?","lx=下拉框&mc="..名称.."&nr="..选项值.."&xz="..选定值.."&hx="..不换行)
end

function  类_服务.网页修改值(IP地址,名称,内容)
	return  httpPost(IP地址.."/espxiugai?","text1="..名称.."&text2="..内容)
end

function  类_服务.网页删除值(IP地址,名称)
	if 名称 == nil then
		名称=""
	end
	return  httpPost(IP地址.."/espshan?","text="..名称)
end


function  类_服务.网页读取值(IP地址,名称,网页配置名称)
	if 名称 == nil then
		名称=""
	end
	if 网页配置名称 == nil then
		网页配置名称=""
	end
	return  httpPost(IP地址.."/espduqu?","text="..名称.."&ui="..网页配置名称)
end

function  类_服务.网页调试发送(IP地址,名称)
	return  httpPost(IP地址.."/ts?","text="..名称)
end

function  类_服务.网页调试清空(IP地址)
	return  httpPost(IP地址.."/tsshan?","")
end

function  类_服务.网页调试读取(IP地址)
	return  httpPost(IP地址.."/tsduqu?","")
end

function  类_服务.网页调试更换(IP地址,调试名称)
	return  httpPost(IP地址.."/tsxiug?","mc="..调试名称)
end


function  类_服务.识别文字接口(IP地址,方式,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/wzsb"..方式.."?","tu="..b64)
end

function  类_服务.识别文字本地(IP地址,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/jzsb?","tu="..b64)
end

--[===[local tick = tickCount()
aa=类_服务.识别原文字本地("http://110.40.196.160:5689",0,0,720,1280)
if #aa >= 1 then
print(aa)
for v=1,#aa do
print(aa[v])
end
end
print("遍历速度:"..tickCount()-tick)

local tick = tickCount()
if 类_服务.识别原文字本地("http://110.40.196.160:5689",0,0,720,1280,"脚本列表",true,true) then
print("找到文字")
else
print("没找到文字")
end
print("找字速度:"..tickCount()-tick)
]===]
function  类_服务.识别原文字本地(IP地址,左,上,右,下,查找文字,是否点击,精准找字,语言,模式)
	--local b64 = 类_服务.识别原文字本地("http://110.40.196.160:5689",265,350,451,400)
	--local b64 = 类_服务.识别原文字本地("http://110.40.196.160:5689",265,350,451,400,"设置",true)
	--语言----日=japan  中=ch 韩=korean  英=en
	--模式----模式一=h  模式二=m
	if 语言 == nil or 语言 == 0 then 语言="ch" end
	if 查找文字 == "" or 查找文字 == 0 then 查找文字 = nil end
	if 模式 == nil or 模式 == 0 then 模式="m" end
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	b64 = encodeUrl(b64)
	local formStr = "img=" .. b64 .. "&lan=" .. 语言 .. "&model="..模式
	b64 = httpPost(IP地址.."/report?",formStr)
	--print(b64)
	b64 = string.gsub(b64, "\n","")
	b64 = string.gsub(b64, " ","")
	b64 = string.gsub(b64, '","',"|")
	b64 = string.gsub(b64, '"',"")
	b64 = splitStr(b64,":[")
	local 数组={}
	local pxt,pxx,pxy
	if #b64 >= 2 then
		b64 = splitStr(b64[2],"]")
		if #b64 >= 2 then
			b64 = splitStr(b64[1],"},{")
			for pxwzs=1,#b64 do
				--print(b64[pxwzs])
				pxt = string.match(b64[pxwzs], "content:".."(.-)".."|")
				if 查找文字 ~= nil then
					if 精准找字 then
						if pxt ==  查找文字 then
							if 是否点击 then
								pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
								pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
								pxx = splitStr(pxx,",")
								pxy = splitStr(pxy,",")
								tap(math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+左),math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+上))
							end
							return true
						end
					else
						if  string.find(pxt,查找文字) ~= nil then
							if 是否点击 then
								pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
								pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
								pxx = splitStr(pxx,",")
								pxy = splitStr(pxy,",")
								tap(math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+左),math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+上))
							end
							return true
						end
					end
				else
					pxx= string.match(b64[pxwzs], "ind_x1:".."(.-)".."|")
					pxy= string.match(b64[pxwzs], "ind_y1:".."(.-)".."|")
					pxx = splitStr(pxx,",")
					pxy = splitStr(pxy,",")
					数组[pxwzs]={
					text = pxt ,
					l = tonumber(pxx[1])+左 ,
					t = tonumber(pxx[2])+上 ,
					r = tonumber(pxy[1])+左 ,
					b = tonumber(pxy[2])+上 ,
					x = math.floor((tonumber(pxy[1])-tonumber(pxx[1]))/2+tonumber(pxx[1])+左) ,
					y = math.floor((tonumber(pxy[2])-tonumber(pxx[2]))/2+tonumber(pxx[2])+上)
					}
				end
			end
			if 查找文字 ~= nil then
				return false
			else
				return  数组
			end
		end
	end
end


function  类_服务.识别英数验证(IP地址,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/yssb?","tu="..b64)
end

function 类_服务.腾讯滑块识别(IP地址,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	local xy = httpPost(IP地址.."/hksb?","b64="..b64)
	xy = splitStr(xy,",")
	return {math.floor(xy[1])+左,math.floor(xy[2])+上}
end

function  类_服务.二维码解析图库(IP地址,图名格式,模式)
	if 模式 then
		return  httpPost(IP地址.."/ewmjx?","mc="..图名格式)
	else
		return  httpPost(IP地址.."/ewmjxzx?","mc="..图名格式)
	end
end

function 类_服务.二维码解析(IP地址,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/ewmjxzx?","b64="..b64)
end

function  类_服务.二维码生成(IP地址,内容,保存地址,图名格式)
	httpPost(IP地址.."/ewmsc?","text="..内容.."&mc="..图名格式)
	return downloadFile(IP地址.."/tuxia?mc="..图名格式,保存地址.."/"..图名格式)
end
function 类_服务.图片转外联(IP地址,左,上,右,下)
	snapShot("/storage/emulated/0/test.png",左,上,右,下)
	local b64 = getFileBase64("/storage/emulated/0/test.png")
	return  httpPost(IP地址.."/qtpwl?","b64="..b64)
end
function  类_服务.中英翻译(IP地址,内容)
	return   httpPost(IP地址.."/fanyi?","text="..内容)
end

function  类_服务.汉字转拼音(IP地址,内容)
	return   httpPost(IP地址.."/pinyin?","text="..内容)
end

function  类_服务.取时间戳(IP地址,十三位)
	return   httpPost(IP地址.."/qusj?","sj="..十三位)
end

function  类_服务.撩人话术(IP地址,内容)
	return   httpPost(IP地址.."/lrqh?","text="..内容)
end
function  类_服务.谷歌身份验证器(IP地址,内容)
	return   httpPost(IP地址.."/ggsfq?","text="..内容)
end
function  类_服务.JSON格式解析(IP地址,JSON数据,需要解析的字符串)
	JSON数据=类_字符串.uft8字符转URL编码(JSON数据)
	需要解析的字符串=类_字符串.uft8字符转URL编码(需要解析的字符串)
	return   httpPost(IP地址.."/json?","json="..JSON数据.."&text="..需要解析的字符串)
end
function 类_服务.卡密(IP地址,卡密)
	--类_服务.卡密("http://110.40.196.160:33333","ceshi")
	local 当前时间 =os.date("%Y%m%d%H%M")
	print(当前时间)
	local 机器码=类_字符串.去首尾空(getId()..getDeviceId())
	print(机器码)
	for i=1,5 do
		local asssd=httpPost(IP地址.."/cxduqu?","ku=卡密&text="..卡密)
		print(asssd)
		if asssd ~= ""  then
			local hfgh=splitStr(asssd,"----")
			if 类_字符串.去首尾空(hfgh[2]) ~= "" and hfgh[2] ~= nil then
				if 类_字符串.去首尾空(hfgh[2]) == tostring(机器码) then
					print("设备通过")
					if hfgh[3] ~= "" and hfgh[3] ~= nil then
						if hfgh[3] >= 当前时间 then
							print("验证通过")
							toast("验证通过",0,0,15)
							sleep(1000)
							return true
						else
							print("已到期")
							toast("已到期",0,0,15)
							sleep(1000)
							break
						end
					else
						print("未授权时间")
						toast("未授权时间",0,0,15)
						sleep(1000)
						break
					end
				else
					print("设备验证失败")
					toast("设备验证失败",0,0,15)
					sleep(1000)
					break
				end
			else
				print("绑定设备")
				toast("绑定设备",0,0,15)
				local asd=httpPost(IP地址.."/xiugai?","ku=卡密&text1="..卡密.."&text2="..卡密.."----"..机器码.."----"..hfgh[3])
				print(asd)
				sleep(1000)
			end
		else
			print("卡密不存在")
			toast("卡密不存在",0,0,15)
			local 延迟=类_字符串.随机数值(2000,10000)
			sleep(延迟)
		end
	end
	print("无法运行")
	toast("无法运行",0,0,15)
	sleep(1000)
	exitScript()
end


local function Verify(Appid,Appkey,username,password,Version)
	local var = {
	exit = true,
	data = '',
	}
	local function SecretKey(tb)--MD5密匙运算
		local str = "";
		for i=1,#tb,1 do
			str = str..tb[i].."";
		end
		print(str)
		return string.upper(MD5(str));
	end
	local function Http(url) --网络链接
		local Serverlist={"api.lcater.com"};
		for i=0,3 do
			for i,k in ipairs(Serverlist) do
				local DEV_json,code = httpGet("http://"..k..url,30)
				print(code)
				print(DEV_json)
				if code==200 and type(jsonLib.decode(DEV_json))=="table" then
					return true,DEV_json
				else
					print("链接服务器失败")
					toast("链接服务器失败")
					for i=1,10 do
						sleep(2000)
						print("链接失败"..20-i.."秒后重试。。")
						toast("链接失败"..20-i.."秒后重试。。")
					end
				end
			end
		end
		return false
	end
	local function HeartPacket(arr)
		while var.exit do
			sleep(60000)
			print("我是子线程:"..var.data)
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
							print("心跳成功:")
						else
							print("心跳失败:")
							setTimer(exitScript(),3000)
							var.exit = false
						end
					else
						print("数据验证失败")
						toast("数据验证失败")
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
				print("网络错误请检查")
				toast("网络错误请检查")
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
					print("数据验证失败")
					toast("数据验证失败")
				end
			elseif _table.code == 2005 then
				print("应用已开启强制更新，请更新后使用")
				toast("应用已开启强制更新，请更新后使用")
				progress=function (pos)
					toast("下载进度:"..pos,0,0,30)
				end
				local LocalUrl =  getSdPath().."/Download/".._table.file_name
				print(LocalUrl)
				print(_table.file_url)
				local Dow = downloadFile(_table.file_url,LocalUrl,progress)
				if Dow == 0 then
					if fileMD5(LocalUrl)==_table.file_md5 then
						installLrPkg(LocalUrl)
						delfile(LocalUrl)
						toast("版本更新成功，马上为你重启")
						restartScript()
					else
						print("MD5验证失败请重新下载")
						return false
					end
				else
					print("下载更新文件失败!")
					return false
				end
			else
				toast(_table.msg)
				print("请注册")
				open_url(string.format("http://www.lcater.com/#/userAuth?appid=%s&username=%s&password=%s",Appid,username,password))
				return false
			end
		else
			toast("网络错误请检查")
			return false
		end
		
	end
	if Auth() then
		return true
	else
		return false
	end
	
end

function 类_懒猫.注册(Appid)
	open_url(string.format("http://www.lcater.com/#/userAuth?appid=%s&username=%s&password=%s",Appid,"",""))
end
function 类_懒猫.验证(Appid,Appkey,版本)
	--类_懒猫.验证("379","MzI2.YWa3yw.aQHKD_Etlts0bU5-tpPMdAf9Jzo","0.1")
	类_UI.开始("登录用户",15000)
	local 类_懒猫="未注册请点击注册"
	类_UI.创子标签(类_懒猫)
	类_UI.输入框(类_懒猫,"lm账号","账号: ", 类_UI.取值("lm账号"))
	类_UI.输入框(类_懒猫,"lm密码","密码: ", 类_UI.取值("lm密码"))
	类_UI.按钮(类_懒猫, "lm注册充值", "注册充值")
	类_UI.单击事件("lm注册充值","类_懒猫.注册("..Appid..")")
	类_UI.结束()
	local username=类_UI.取值("lm账号")
	local password=类_UI.取值("lm密码")
	if not Verify(Appid,Appkey,username,password,版本) then
		writeLog("验证失败")
		toast("验证失败")
		sleep(1000)
		exitScript()
	else
		print('验证成功')
		writeLog("验证成功")
		toast("验证成功")
	end
end
function 类_易游.验证(版本号,单码调用码,到期时间调用码)
	--类_易游.验证("1")
	if 单码调用码 == nil then
		单码调用码 = "A69768BEC639D3FC"
		到期时间调用码 = "D9C0DB3543D800B9"
	end
	类_UI.开始("登录用户",15000)
	local 易游="请输入卡密"
	类_UI.创子标签(易游)
	类_UI.输入框(易游,"yiyou账号","卡密: ", 类_UI.取值("yiyou账号"),false,true)
	类_UI.结束()
	local 卡密=类_UI.取值("yiyou账号")
	local 机器码=getId()..getDeviceId()
	local 参数1="SingleCode="..卡密.."&Ver="..版本号.."&Mac="..机器码
	local ret = httpPost("http://w.eydata.net/"..单码调用码,参数1)
	if string.find(ret, "-") == nil then
		local 参数2="UserName="..卡密
		local ret = httpPost("http://w.eydata.net/"..到期时间调用码,参数2)
		print("到期时间:"..ret)
		writeLog("到期时间:"..ret)
		toast("到期时间:"..ret)
		return ret
	else
		print("出现错误:"..ret)
		writeLog("验证失败".."出现错误:"..ret)
		toast("验证失败".."出现错误:"..ret)
		sleep(1000)
		exitScript()
	end
end
