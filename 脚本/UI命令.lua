
��̬={}
��̬.�ز�·�� = "sdcard/��ʯ/"
function ��̬.����(...) -- ��׼:{����,����,��С={��,��}}
	local t = ...
	row_id = row_id + 1
	if t["��С"] ~= nil then
		ui.newRow(t["����"],t["����"],t["��С"][1],t["��С"][2])
	else
		ui.newRow(t["����"],t["����"])
	end
	if t["����"] ~= nil then ui.setGravity(t["����"],t["����"]) end
end

function ��̬.������ѡ��(...) -- ��׼:{����,����,�ı�,ѡ��,��С={��,��}}
	local t = ...
	if t["��С"] ~= nil then
		ui.addCheckBox(t["����"],t["����"],t["�ı�"],t["ѡ��"],t["��С"][1],t["��С"][2])
	else
		ui.addCheckBox(t["����"],t["����"],t["�ı�"],t["ѡ��"])
	end
	��̬.����(t)
end

function ��̬.����(...) -- ��׼:����һ���� ��{����="",����="",������ɫ=""} ���ݱ�����������ؼ���ʽ
	local t =...
	if t["����"] ~= nil then ui.setBackground(t["����"],t["����"]) end
	if t["����"] ~= nil then ui.setVisiblity(t["����"],t["����"]) end
	if t["����"] ~= nil then ui.setEnable(t["����"],t["����"]) end
	if t["�ı�"] ~= nil then ui.setText(t["����"],t["�ı�"]) end
	if t["������ɫ"] ~= nil then ui.setTextColor(t["����"],t["������ɫ"]) end
	if t["���ִ�С"] ~= nil then ui.setTextSize(t["����"],t["���ִ�С"]) end
	if t["�ڱ߾�"] ~=nil then ui.setPadding(t["����"],t["�ڱ߾�"][1],t["�ڱ߾�"][2],t["�ڱ߾�"][3],t["�ڱ߾�"][4]) end
	if t["ȫ��"] ~=nil then ui.setFullScreen(t["����"]) end
	if t["�¼�"] ~= nil then ui.setOnClick(t["����"],t["�¼�"]) end
end

function ��̬.���������(...) -- ��׼:{����,����,�ı�,��С={��,��}}
	local t = ...
	if t["��С"] ~= nil then
		ui.addEditText(t["����"],t["����"],t["�ı�"],t["��С"][0],t["��С"][1])
	else
		ui.addEditText(t["����"],t["����"],t["�ı�"])
	end
	��̬.����(t)
end

function ��̬.��������(...) --��׼:{����,��С={��,��}}
	local t=...
	if t["��С"] ~=nil then
		ui.newLayout(t["����"],t["��С"][1],t["��С"][2])
	else
		ui.newLayout(t["����"])
	end
	��̬.����(...)
	��̬.�������ֿ�({����=t["����"],����="�����ı���",""}) -- ���쳣
	��̬.����({����="�����ı���",����=3})
end

function ��̬.�������ֿ�(...) -- ��׼:{����,����,�ı�,��С={��,��}}
	local t = ...
	if t["��С"] ~= nil then
		ui.addTextView(t["����"],t["����"],t["�ı�"],t["��С"][1],t["��С"][2])
	else
		ui.addTextView(t["����"],t["����"],t["�ı�"])
	end
	��̬.����(t)
end

function ��̬.������ǩҳ(...) -- ��׼:{����,����,��}
	local t=...
	print(ui.addTabView(t["����"],t["����"],t["��"]))
	��̬.����(t)
end

function ��̬.�����ӱ�ǩҳ(...)--��׼:{ĸ,����,�ı�}
	local t=...
	print(ui.addTab(t["ĸ"],t["����"],t["�ı�"]))
	��̬.����(t)
end

function ��̬.������ť(...) -- ��׼:{����=,����=,�ı�=,��С={��,��},�¼�=}
	local t =...
	if t["��С"] ~= nil then
		ui.addButton(t["����"],t["����"],t["�ı�"],t["��С"][1],t["��С"][2])
	else
		ui.addButton(t["����"],t["����"],t["�ı�"])
	end
	��̬.����(t)
end

function ��̬.������ѡ��(...) -- ��׼:{����,����,����={},Ĭ��ѡ��,��С={��,��},����}
	local t =...
	if t["��С"] ~= nil then
		ui.addRadioGroup(t["����"],t["����"],t["����"],t["Ĭ��ѡ��"],t["��С"][1],t["��С"][1],t["����"])
	else
		ui.addRadioGroup(t["����"],t["����"],t["����"],t["Ĭ��ѡ��"])
	end
	��̬.����(t)
end

function ��̬.����������(...)--��׼:{����,����,����={},Ĭ��ѡ��,��С={��,��}}
	local t=...
	if t["��С"] ~= nil then
		ui.addSpinner(t["����"],t["����"],t["����"],t["Ĭ��ѡ��"],t["��С"][1],t["��С"][2])
	else
		ui.addSpinner(t["����"],t["����"],t["����"],t["Ĭ��ѡ��"])
	end
	��̬.����(t)
end

function ��̬.����ͼ��ؼ�(...) -- ��׼:{����,����,�ļ���,��С={��,��},�¼�}
	local t = ...
	if t["��С"] ~= nil then
		ui.addImageView(t["����"],t["����"],��̬.�ز�·��..t["�ļ���"]..".jpg",t["��С"][1],t["��С"][2])
	else
		ui.addImageView(t["����"],t["����"],��̬.�ز�·��..t["�ļ���"]..".jpg")
	end
	��̬.����(t)
end

function ��̬.����ͼ��ؼ�(...) -- ��׼:{����,�ļ���,��С={w,h}}
	local t= ...
	if t["��С"] ~= nil then
		ui.setImageView(t["����"],��̬.�ز�·��..t["�ļ���"]..".jpg",t["��С"][1],t["��С"][2])
	else
		ui.setImageView(t["����"],��̬.�ز�·��..t["�ļ���"]..".jpg")
	end
	if t["�¼�"] ~= nil then
		ui.setOnClick(t["����"],t["�¼�"])
	end
end

function ��̬.���ڹر��¼�(����,�¼�)
	ui.setOnClose(����,�¼�)
end

function ��̬.��ȡ���пؼ�ֵ()
	return ui.getData()
end

function ��̬.���������ļ�(�ļ���)
	ui.saveProfile("sdcard/��ʯ/"..�ļ���)
	sleep(500)
end

function ��̬.��ȡ�����ļ�(�ļ���)
	if readFile("sdcard/��ʯ/"..�ļ���) ~= "" then
		return ui.loadProfile("sdcard/��ʯ/"..�ļ���)
	end
end

function ��̬.��ȡ�����ļ�����(�ļ���)
	
	if readFile("sdcard/��ʯ/"..�ļ���) ~= "" then
		return readFile("sdcard/��ʯ/"..�ļ���)
	else
		return {}
	end
end

function ��̬.����״̬(...) -- ��׼:{����},����ֵ
	local t =...
	for i,v in ipairs(t["����"]) do
		ui.setVisiblity(v,t["����"])
	end
end

function ��̬.�رղ���(����)
	ui.dismiss(����)
end

function �����ز��ļ���()
	print("�ز��ļ���:",mkdir("/sdcard/��ʯ"))
	
	if fileExist("/sdcard/��ʯ/������������.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","������������.txt")
	end
	if fileExist("/sdcard/��ʯ/��¼��ʵ������.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","��¼��ʵ������.txt")
	end
	if fileExist("/sdcard/��ʯ/ʹ��˵������.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","ʹ��˵������.txt")
	end
	if fileExist("/sdcard/��ʯ/PVP����.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","PVP����.txt")
	end
	if fileExist("/sdcard/��ʯ/PVE����.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","PVE����.txt")
	end
	if fileExist("/sdcard/��ʯ/���ƶ�����.txt") == false then
		extractAssets("�߲���ʯ.rc","/sdcard/��ʯ","���ƶ�����.txt")
	end
end
�����ز��ļ���()

writeLog("UI�����������...")
--io.input("sdcard/��ʯ/�ļ�.txt")
--print(io.read())
--print(readFile("sdcard/��ʯ/�ļ�.txt")=="" )
