
动态={}
动态.素材路径 = "sdcard/青石/"
function 动态.换行(...) -- 标准:{布局,名称,大小={宽,高}}
	local t = ...
	row_id = row_id + 1
	if t["大小"] ~= nil then
		ui.newRow(t["布局"],t["名称"],t["大小"][1],t["大小"][2])
	else
		ui.newRow(t["布局"],t["名称"])
	end
	if t["对齐"] ~= nil then ui.setGravity(t["名称"],t["对齐"]) end
end

function 动态.创建多选框(...) -- 标准:{布局,名称,文本,选中,大小={宽,高}}
	local t = ...
	if t["大小"] ~= nil then
		ui.addCheckBox(t["布局"],t["名称"],t["文本"],t["选中"],t["大小"][1],t["大小"][2])
	else
		ui.addCheckBox(t["布局"],t["名称"],t["文本"],t["选中"])
	end
	动态.设置(t)
end

function 动态.设置(...) -- 标准:传入一个表 如{名称="",背景="",文字颜色=""} 根据表里参数调整控件样式
	local t =...
	if t["背景"] ~= nil then ui.setBackground(t["名称"],t["背景"]) end
	if t["隐藏"] ~= nil then ui.setVisiblity(t["名称"],t["隐藏"]) end
	if t["可用"] ~= nil then ui.setEnable(t["名称"],t["可用"]) end
	if t["文本"] ~= nil then ui.setText(t["名称"],t["文本"]) end
	if t["文字颜色"] ~= nil then ui.setTextColor(t["名称"],t["文字颜色"]) end
	if t["文字大小"] ~= nil then ui.setTextSize(t["名称"],t["文字大小"]) end
	if t["内边距"] ~=nil then ui.setPadding(t["名称"],t["内边距"][1],t["内边距"][2],t["内边距"][3],t["内边距"][4]) end
	if t["全宽"] ~=nil then ui.setFullScreen(t["名称"]) end
	if t["事件"] ~= nil then ui.setOnClick(t["名称"],t["事件"]) end
end

function 动态.创建输入框(...) -- 标准:{布局,名称,文本,大小={宽,高}}
	local t = ...
	if t["大小"] ~= nil then
		ui.addEditText(t["布局"],t["名称"],t["文本"],t["大小"][0],t["大小"][1])
	else
		ui.addEditText(t["布局"],t["名称"],t["文本"])
	end
	动态.设置(t)
end

function 动态.创建布局(...) --标准:{名称,大小={宽,高}}
	local t=...
	if t["大小"] ~=nil then
		ui.newLayout(t["名称"],t["大小"][1],t["大小"][2])
	else
		ui.newLayout(t["名称"])
	end
	动态.设置(...)
	动态.创建文字框({布局=t["名称"],名称="隐藏文本框",""}) -- 免异常
	动态.设置({名称="隐藏文本框",隐藏=3})
end

function 动态.创建文字框(...) -- 标准:{布局,名称,文本,大小={宽,高}}
	local t = ...
	if t["大小"] ~= nil then
		ui.addTextView(t["布局"],t["名称"],t["文本"],t["大小"][1],t["大小"][2])
	else
		ui.addTextView(t["布局"],t["名称"],t["文本"])
	end
	动态.设置(t)
end

function 动态.创建标签页(...) -- 标准:{布局,名称,高}
	local t=...
	print(ui.addTabView(t["布局"],t["名称"],t["高"]))
	动态.设置(t)
end

function 动态.创建子标签页(...)--标准:{母,名称,文本}
	local t=...
	print(ui.addTab(t["母"],t["名称"],t["文本"]))
	动态.设置(t)
end

function 动态.创建按钮(...) -- 标准:{布局=,名称=,文本=,大小={宽,高},事件=}
	local t =...
	if t["大小"] ~= nil then
		ui.addButton(t["布局"],t["名称"],t["文本"],t["大小"][1],t["大小"][2])
	else
		ui.addButton(t["布局"],t["名称"],t["文本"])
	end
	动态.设置(t)
end

function 动态.创建单选框(...) -- 标准:{布局,名称,内容={},默认选项,大小={宽,高},横向}
	local t =...
	if t["大小"] ~= nil then
		ui.addRadioGroup(t["布局"],t["名称"],t["内容"],t["默认选项"],t["大小"][1],t["大小"][1],t["横向"])
	else
		ui.addRadioGroup(t["布局"],t["名称"],t["内容"],t["默认选项"])
	end
	动态.设置(t)
end

function 动态.创建下拉框(...)--标准:{布局,名称,内容={},默认选项,大小={宽,高}}
	local t=...
	if t["大小"] ~= nil then
		ui.addSpinner(t["布局"],t["名称"],t["内容"],t["默认选项"],t["大小"][1],t["大小"][2])
	else
		ui.addSpinner(t["布局"],t["名称"],t["内容"],t["默认选项"])
	end
	动态.设置(t)
end

function 动态.创建图像控件(...) -- 标准:{布局,名称,文件名,大小={宽,高},事件}
	local t = ...
	if t["大小"] ~= nil then
		ui.addImageView(t["布局"],t["名称"],动态.素材路径..t["文件名"]..".jpg",t["大小"][1],t["大小"][2])
	else
		ui.addImageView(t["布局"],t["名称"],动态.素材路径..t["文件名"]..".jpg")
	end
	动态.设置(t)
end

function 动态.重设图像控件(...) -- 标准:{名称,文件名,大小={w,h}}
	local t= ...
	if t["大小"] ~= nil then
		ui.setImageView(t["名称"],动态.素材路径..t["文件名"]..".jpg",t["大小"][1],t["大小"][2])
	else
		ui.setImageView(t["名称"],动态.素材路径..t["文件名"]..".jpg")
	end
	if t["事件"] ~= nil then
		ui.setOnClick(t["名称"],t["事件"])
	end
end

function 动态.窗口关闭事件(名称,事件)
	ui.setOnClose(名称,事件)
end

function 动态.获取所有控件值()
	return ui.getData()
end

function 动态.保存配置文件(文件名)
	ui.saveProfile("sdcard/青石/"..文件名)
	sleep(500)
end

function 动态.读取配置文件(文件名)
	if readFile("sdcard/青石/"..文件名) ~= "" then
		return ui.loadProfile("sdcard/青石/"..文件名)
	end
end

function 动态.读取配置文件内容(文件名)
	
	if readFile("sdcard/青石/"..文件名) ~= "" then
		return readFile("sdcard/青石/"..文件名)
	else
		return {}
	end
end

function 动态.隐藏状态(...) -- 标准:{名称},隐藏值
	local t =...
	for i,v in ipairs(t["名称"]) do
		ui.setVisiblity(v,t["隐藏"])
	end
end

function 动态.关闭布局(名称)
	ui.dismiss(名称)
end

function 创建素材文件夹()
	print("素材文件夹:",mkdir("/sdcard/青石"))
	
	if fileExist("/sdcard/青石/功能设置配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","功能设置配置.txt")
	end
	if fileExist("/sdcard/青石/登录及实况配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","登录及实况配置.txt")
	end
	if fileExist("/sdcard/青石/使用说明配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","使用说明配置.txt")
	end
	if fileExist("/sdcard/青石/PVP配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","PVP配置.txt")
	end
	if fileExist("/sdcard/青石/PVE配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","PVE配置.txt")
	end
	if fileExist("/sdcard/青石/相似度配置.txt") == false then
		extractAssets("斑驳青石.rc","/sdcard/青石","相似度配置.txt")
	end
end
创建素材文件夹()

writeLog("UI命令库加载完成...")
--io.input("sdcard/青石/文件.txt")
--print(io.read())
--print(readFile("sdcard/青石/文件.txt")=="" )
