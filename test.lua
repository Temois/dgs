------------Stress Test
function scrollBarTest()
	for i=1,1000 do
		dgsCreateScrollBar(50+1*i,200,20,500,false)
	end
end
function memoTest()
	for i=1,1000 do
		dgsCreateMemo(50+1*i,200,500,500,"",false)
	end
end
function editTest()
	for i=1,1000 do
		dgsCreateEdit(50,100+10*i,500,40,"",false)
	end
end

------------Full demo
function createFullDemo()
	loadstring(dgsImportOOPClass(true))()
	local window = DGSClass:Window(0,0,600,600,"DGS Full Demo",false)
	local button = window:Button(10,210,80,50,"Test Button",false)
	local switchButton1 = window:SwitchButton(100,210,60,20,"","",false)
	local switchButton2 = window:SwitchButton(100,240,60,20,"","",true)
	local gridlist = window:GridList(0,0,290,200,false)
	gridlist:setMultiSelectionEnabled(true)
	gridlist:addColumn("Column 1",0.5,true)
	gridlist:addColumn("Column 2",0.5,true)
	for i=1,100 do
		gridlist:addRow(i,i,math.random(1,500))
	end
	local combobox = window:ComboBox(10,270,150,30,"test",false)
	combobox:setEditEnabled(true)
	for i=1,100 do
		combobox:addItem(i)
	end
	
	local tabPanel = window:TabPanel(290,210,280,220,false)
	local tab1 = tabPanel:Tab("Tab1")
	local memo = tab1:Memo(10,10,260,100,"This is a memo for demo",false)
	local tab2 = tabPanel:Tab("Tab2")
	local edit1 = tab1:Edit(10,120,260,30,"",false)
	edit1:setPlaceHolder("I am the place holder, and this edit is for demo")
	local edit2 = tab1:Edit(10,160,260,30,"This is a edit for demo",false)
	local progressBar = window:ProgressBar(10,440,580,25,false)
	progressBar:setProperty("functions",[[
		local progress = dgsGetProperty(self,"progress")
		dgsSetProperty(self,"progress",(progress+0.5)%100)
		return true
	]])
	local RadioButton1 = window:RadioButton(10,380,180,30,"This is a radio button for demo",false)
	local RadioButton2 = window:RadioButton(10,410,180,30,"This is a radio button for demo",false)
	local CheckBox1 = window:CheckBox(10,320,180,30,"This is a check box for demo",true,false)
	local CheckBox2 = window:CheckBox(10,350,180,30,"This is a check box for demo",false,false)
	
	local scb = window
		:ScrollBar(320,50,260,20,true,false)
		:setAlpha(0.5)
		:setScrollPosition(50)
		:setGrades(10)
		:setProperty("length",{0.8,true})
			
end

------------

function createTest()
	dgsAddEasingFunction("test_line",[[
		return math.abs(progress^2-0.5)*2
	]])
	
	wind = dgsCreateWindow(0.2*sW,0,0.4*sW,0.4*sH,"Example Scroll Pane (exclude this window)",false)
	pane = dgsCreateScrollPane(20,0,200,200,false,wind)
	dgsScrollPaneSetScrollBarState(pane,false)
	scrollbar = dgsCreateScrollBar(0,0,20,180,false,false,wind)
	dgsSetProperty(scrollbar,"theScrollPane",pane)
	dgsSetProperty(scrollbar,"functions",[[
		local scb = dgsScrollPaneGetScrollBar(dgsElementData[self].theScrollPane)[1]
		dgsElementData[self].multiplier = dgsElementData[scb].multiplier
		dgsElementData[self].length = dgsElementData[scb].length
	]])
	addEventHandler("onDgsElementScroll",pane,function(vertical)
		dgsScrollBarSetScrollPosition(scrollbar,vertical)
	end,false)
	
	addEventHandler("onDgsElementScroll",scrollbar,function(value)
		local scbs = dgsScrollPaneGetScrollBar(pane)
		dgsScrollBarSetScrollPosition(scbs[1],value)
	end,false)
	
	gdlt = dgsCreateImage(0.5,0,1.1,1.1,_,true,pane,tocolor(255,255,255,255))
	gdlt2 = dgsCreateImage(0.1,0,0.7,0.7,_,true,pane,tocolor(0,255,255,255))
	dgsSizeTo(wind,0.5*sW,0.5*sH,false,false,"test_line",1000)
end


function createScrollPane()
	wind = dgsCreateWindow(0.2*sW,0,0.4*sW,0.6*sH,"Example Scroll Pane (exclude this window)",false)
	pane1 = dgsCreateScrollPane(0,0,400,400,false,wind)
	
	gridlist = dgsCreateGridList(0,0,5000,5000,false,pane1)
	local dsm = dxCreateFont("dsm.ttf")
	dgsSetFont(gridlist,dsm)
	dgsGridListAddColumn(gridlist,"test1",0.3)
	dgsGridListAddColumn(gridlist,"test2",0.3)
	for i=1,200 do
		local row = dgsGridListAddRow(gridlist)
		dgsGridListSetItemText(gridlist,row,1,tostring(i).." Test DGS")
		dgsGridListSetItemText(gridlist,row,2,tostring(50-i).." Test DGS")
	end
	setTimer(function()
	local x,y = dgsScrollPaneGetViewOffset(pane1)
	dgsScrollPaneSetViewOffset(pane1,x+10)
	end,50,0)
end

function createTest2()
	tabp = dgsCreateTabPanel(400,200,400,400,false)
	tab1 = dgsCreateTab("DGS",tabp)
	tab2 = dgsCreateTab("Tab123123123123",tabp)
	for i=1,10 do
		dgsCreateTab(i.."Panel",tabp)
	end
	dgsSetText(tab2,"12")
	gdlt2 = dgsCreateButton(0,0,100,120,"test",false,tab1,tocolor(255,255,255,255))
	dgsSetProperty(gdlt2,"shadow",{1,1,tocolor(0,0,0,255),true})
	dgsSetProperty(tabp,"tabPadding",{20,false})
end

function createTest3()
	local rb1= dgsCreateRadioButton(500,500,200,30,"aaaa",false)
	local rb2 = dgsCreateRadioButton(500,520,200,30,"bbbb",false)
	local rb3 = dgsCreateRadioButton(500,540,200,30,"bbbb",false)
end

function createTest4()
	local window = dgsCreateWindow(100,100,400,400,"test",false)
	tabp = dgsCreateTabPanel(0,0,0.8,0.8,true,window)
	tab1 = dgsCreateTab("DGS",tabp)
	rb1 = dgsCreateComboBox(0,0,200,30,"test",false,tab1)
	for i=1,20 do
		dgsComboBoxAddItem(rb1,i)
	end
end

function createTest5()
	local cb1 = dgsCreateCheckBox(500,500,200,30,"test_indeterminate",false)
	local cb2 = dgsCreateCheckBox(500,520,200,30,"test_checked",false)
	local cb2 = dgsCreateCheckBox(500,540,200,30,"test_unchecked",false)
	dgsCheckBoxSetSelected(cb1,nil)
end

function testButtonDisable()
	local button = dgsCreateButton(500,500,200,80,"test",false)
	dgsSetEnabled(button,false)
end

function testMoveHandler()
	local window = dgsCreateWindow(100,100,800,800,"test",false)
	local button = dgsCreateButton(50+i,0,200,80,"test",false,window)
end

function testProgressBar()
	local pb= dgsCreateProgressBar(500,200,600,600,false)
	dgsSetProperty(pb,"bgColor",tocolor(0,0,0,255))
	dgsProgressBarSetStyle(pb,"ring-round",{rotation=90})
	local start = 0
	addEventHandler("onClientRender",root,function()
		dgsProgressBarSetProgress(pb,start)
		start = start + 0.1
	end)
end

function testButtonPerformance()
	for i=1,1000 do
		local button = dgsCreateButton(500,500,200,80,"test",false)
	end
end

function createTestMemo()
	local sW,sH = dgsGetScreenSize()
	local memo = dgsCreateMemo(500,200,200,300,[[This is a dgs-dxmemo
	
	Thisdp's
	DirectX
	Graphical User Interface
	System
	
	MTA DxLib
	Version 2.88
	Test UTF8: 你好
	Test Selection
	
	DGS Memo Updates
	1.Added Scroll Bars
	2.Fix backspace and delete doesn't works well
	
	Very looooooooooong
	Test Scroll Bars
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10]],false)
	--dgsMemoSetReadOnly(memo,true)
	dgsSetFont(memo,"default-bold")
	dgsSetProperty(memo,"selectVisible",false)
end

function createTestMemo()
	local sW,sH = dgsGetScreenSize()
	local memo = dgsCreateMemo(500,200,150,100,[[DGS Dx Memo Line Changing Test]],false)
	--dgsMemoSetScrollBarState(memo,false,false)
	dgsMemoSetWordWrapState(memo,false)
	--dgsMemoSetReadOnly(memo,true)
end

function editTest() --Test Tab Switch for edit.
	edit = dgsCreateEdit(0.3,0.3,0.2,0.05,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaas",true)
	setTimer(function()
		dgsEditSetMaxLength(edit,10,true)
	end,1000,1)
	edit2 = dgsCreateEdit(0.3,0.4,0.2,0.05,"123123",true)
	edit3 = dgsCreateEdit(0.3,0.5,0.2,0.05,"123123",true)
	edit4 = dgsCreateEdit(0.3,0.6,0.2,0.05,"123123",true)
	dgsEditSetReadOnly(edit4,true)
	dgsBringToFront(edit,"left")
	dgsEditSetCaretPosition (edit, 1)
	dgsSetProperty(edit2,"placeHolder","Type something if you want to tell me")
	dgsSetProperty(edit2,"placeHolderIgnoreRenderTarget",true)
	dgsEditAddAutoComplete(edit3,"mypass",false)
	dgsSetProperty(edit,"bgColor",tocolor(255,255,255,0))
	dgsSetProperty(edit,"bgColorBlur",tocolor(255,255,255,100))
end
--edit = dgsCreateEdit(0.3,0.3,0.2,0.05,"",true)
--[[
local arabicUnicode = {{0x0600,0x06FF},{0x08A0,0x08FF},{0x0750,0x077F},{0xFB50,0xFDFF},{0xFE70,0xFEFF},{0x1EE00,0x1EEFF}}
local arabicPattern = ""
for i=1,#arabicUnicode do
	arabicPattern = arabicPattern..utf8.char(arabicUnicode[i][1]).."-"..utf8.char(arabicUnicode[i][2])
end
arabicPattern = "["..arabicPattern.."]"
function hasArabicCharacters(text)
	return utf8.find(text,arabicPattern)
end

function isArabicCharacters(character)
	local code = utf8.byte(character)
	local isArabic = code >= arabicUnicode[1][1] and code <= arabicUnicode[1][2] 
	isArabic = isArabic or (code >= arabicUnicode[2][1] and code <= arabicUnicode[2][2])
	isArabic = isArabic or (code >= arabicUnicode[3][1] and code <= arabicUnicode[3][2])
	isArabic = isArabic or (code >= arabicUnicode[4][1] and code <= arabicUnicode[4][2])
	isArabic = isArabic or (code >= arabicUnicode[5][1] and code <= arabicUnicode[5][2])
	isArabic = isArabic or (code >= arabicUnicode[6][1] and code <= arabicUnicode[6][2])
	return isArabic
end
print(hasArabicCharacters("aلعت القياسا"))

0x08A0-0x08FF
0x0750-0x077F
0xFB50-0xFDFF
0xFE70-0xFEFF
0x1EE00-0x1EEFF

]]
function editTest4()
	window = dgsCreateWindow(200,200,800,600,"",false)
	tabp = dgsCreateTabPanel(400,200,400,400,false,window)
	tab1 = dgsCreateTab("DGS",tabp)
	tab1 = dgsCreateTab("DGS",tabp)
	tab1 = dgsCreateTab("DGS",tabp)
	edit = dgsCreateEdit(0.1,0.3,0.8,0.5,"123123",true,tab1)
	addEventHandler("onDgsTabPanelTabSelect",tabp,function(new,old,newEle,oldEle)
	end)
end

function edatest()
	local eda = dgsCreateEDA(400,400,300,100,false)
	dgsEDASetDebugModeEnabled(eda,true)
end

function gridlistTest()
	gridlist = dgsCreateGridList(300,50,600,600,false)
	dgsSetProperty(gridlist,"clip",false)
	--dgsSetProperty(gridlist,"leading",10)
	--dgsSetProperty(gridlist,"mode",true)
	dgsGridListAddColumn(gridlist,"test1",0.2)
	dgsGridListAddColumn(gridlist,"test2",0.1)
	for i=1,200 do
		local row = dgsGridListAddRow(gridlist)
		dgsGridListSetItemText(gridlist,row,1,tostring(i).." Test DGS")
		dgsGridListSetItemText(gridlist,row,2,tostring(50-i).." Test DGS")
	end
	dgsGridListSetMultiSelectionEnabled(gridlist,true)
	dgsGridListSetSelectedItems(gridlist,{{1,1},{1,2}})
	configGridList(gridlist)
	dgsGridListSetColumnFont(gridlist,1,"default-bold")
	dgsGridListSetScrollPosition(gridlist,100)
end

function centerEdit()
	edit = dgsCreateEdit(100,300,300,100,"center edit",false)
	dgsSetProperty(edit,"alignment",{"left","center"})
	dgsEditSetWhiteList(edit,"%l")
end

function dgsAnimTest()
	if not dgsEasingFunctionExists("shadowOffset") then
		dgsAddEasingFunction("shadowOffset",[[
			local old = setting[3] or {}
			local new = setting[2]
			local offsetX = old[1] or 0
			local offsetY = old[2] or 0
			local offsetColor = old[3] or tocolor(0,0,0,255)
			local tofX,tofY = new[1],new[2]
			return {offsetX+(tofX-offsetX)*progress,offsetY+(tofY-offsetY)*progress,new[3]}
		]])
	end
	local label = dgsCreateLabel(500,500,400,20,"Testttttttttttttttttttt",false)
	dgsAnimTo(label,"shadow",{100,100,tocolor(0,0,0,255)},"shadowOffset",10000)
end


function GridListSortingTest()
	for x=1,10 do
		local sortfnc = [[
			local arg = {...}
			local column = dgsElementData[self].sortColumn
			return arg[1][column][1] < arg[2][column][1]
		]]

		--Be More Clear
		local sortfnc = [[
			local arg = {...}
			local a = arg[1]
			local b = arg[2]
			local column = dgsElementData[self].sortColumn
			local texta,textb = a[column][1],b[column][1]
			return texta < textb
		]]
		
		gridlist = dgsCreateGridList(200,50,600,600,false)
		dgsGridListAddColumn(gridlist,"test1",0.2)
		--dgsGridListAddColumn(gridlist,"test2",0.1)
		dgsSetProperty(gridlist,"mode",false)
		for i=1,30 do
			local row = dgsGridListAddRow(gridlist)
			dgsGridListSetItemText(gridlist,row,1,tostring(i).." Test DGS")
			--dgsGridListSetItemText(gridlist,row,2,tostring(500-i).." Test DGS")
		end
		--dgsGridListSetSortEnabled(gridlist,false) --disable click sorting
		--dgsGridListSetSortFunction(gridlist,sortfnc)
		--dgsGridListSetSortColumn(gridlist,2)
	end
end

function Plugin_media()
	bro = dgsCreateMediaBrowser(600,600)
	rndRect1 = dgsCreateRoundRect(1,tocolor(255,255,255,255),bro)
	material1 = dgsCreate3DInterface(0,0,4,4,2,800,500,tocolor(255,255,255,255),1,0,0,_,0)
	img = dgsCreateImage(0,0,800,500,rndRect1,false,material1)
	dgsMediaLoadMedia(bro,"test.webm","VIDEO") -- Give a video file PLZ! (Only .webm file)
	--dgsMediaLoadMedia(bro,"test.ogg","AUDIO") -- Give a audio file PLZ! (Only .ogg file)
	dgsMediaPlay(bro)
end

function testBrowser()
	local browser = dgsCreateBrowser(100,100,1400,700,false,_,false,true)
	addEventHandler("onClientBrowserCreated",browser,function()
		loadBrowserURL(browser,"http://www.youtube.com")
	end)
end

function test3DInterface()
	material = dgsCreate3DInterface(4,0,5,4,4,600,600,tocolor(255,255,255,255),1,2,0,_,0)
	dgsSetProperty(material,"faceTo",{-10,-10,0})
	material2 = dgsCreate3DInterface(0,0,5,4,4,400,400,tocolor(255,255,255,255),1,0,0)
	edit1 = dgsCreateEdit(0,0,1,1,"DGS 3D Interface Edit 1",true,material)
	edit2 = dgsCreateEdit(0,0,1,1,"DGS 3D Interface Edit 1",true,material2)
end

function test3DInterface()
	material = dgsCreate3DInterface(0,0,7,6*1.896296296296296,6,2048,1080,tocolor(255,255,255,255),1,0,0,_,0)
	browser = dgsCreateBrowser(0,0,2048,1080,false,material,false,true)
	toggleBrowserDevTools(browser,true,true)
	addEventHandler("onClientBrowserCreated",browser,function()
		loadBrowserURL(browser,"http://angel.thisdp.cn:1314/")
	end)
	dgsSetProperty(material,"maxDistance",1000)
	dgsSetProperty(material,"fadeDistance",1000)
end

function test3DInterfaceAttach()
	material = dgsCreate3DInterface(0,0,2,2,2,600,600,tocolor(255,255,255,255),1,0,0,_,0)
	dgs3DInterfaceAttachToElement(material,localPlayer,0,0,1)
	dgsSetProperty(material,"faceRelativeTo","world")
	dgsSetProperty(material,"maxDistance",1000)
	dgsSetProperty(material,"fadeDistance",1000)
	local window = dgsCreateWindow(0,0,600,600,"test",false)
	dgsSetParent(window,material)
end

function testBlurBox()
	local bb1 = dgsCreateBlurBox()
	local bb2 = dgsCreateBlurBox()
	local window = dgsCreateWindow(200,200,600,500,"test",false)
	dgsSetProperty(window,"color",tocolor(0,0,0,100))
	dgsSetProperty(window,"functions",[[
		local arguments = {...}
		local blurbox = arguments[1]
		local renderArguments = renderArguments
		local x,y,w,h = renderArguments[1],renderArguments[2],renderArguments[3],renderArguments[4]
		dgsBlurBoxRender(blurbox,x,y,w,h)
	]],bb1)
	
	local window = dgsCreateWindow(200,200,600,500,"test",false)
	dgsSetProperty(window,"color",tocolor(0,0,0,100))
	dgsSetProperty(window,"functions",[[
		local arguments = {...}
		local blurbox = arguments[1]
		local renderArguments = renderArguments
		local x,y,w,h = renderArguments[1],renderArguments[2],renderArguments[3],renderArguments[4]
		dgsBlurBoxRender(blurbox,x,y,w,h)
	]],bb2)
end

function exampleDetectArea()
	local image = dgsCreateImage(200,200,100,100,_,false,_,tocolor(255,255,255,128))
	local da = dgsCreateDetectArea(0,0,100,100,false,image)
	dgsDetectAreaSetFunction(da,[[
		if mxRlt^2+myRlt^2 < 0.5 then
			return true
		end
	]])
	dgsDetectAreaSetDebugModeEnabled(da,true)
end

function test3DText()
	local text = dgsCreate3DText(0,0,4,"DGS 3D Text Test",white)
	dgsSetProperty(text,"fadeDistance",20)
	dgsSetProperty(text,"shadow",{1,1,tocolor(0,0,0,255),true})
	dgsSetProperty(text,"outline",{"out",1,tocolor(255,255,255,255)})
	dgs3DTextAttachToElement(text,localPlayer,0,5)
end

function languageTest_ComboBox()
	languageTab = {wtf="DGS %rep%"}
	languageTab2 = {wtf="Test %rep% %rep%"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	combobox = dgsCreateComboBox(500,400,200,30,{"wtf","1"},false)
	for i=1,20 do
		dgsComboBoxAddItem(combobox,{"wtf",i})
	end
	dgsSetProperty(combobox,"scrollBarThick",15)
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function testScrollBar()
	scrollbar = dgsCreateScrollBar(400,500,20,180,false,false)
	dgsSetProperty(scrollbar,"troughWidth",{0.2,true})
	dgsSetProperty(scrollbar,"scrollArrow",false)
	scrollbar = dgsCreateScrollBar(500,530,180,20,true,false)
	--dgsScrollBarSetGrades(scrollbar,5)
	--dgsScrollBarSetScrollPosition(scrollbar,3,true)
end

function languageTest_GridList()
	languageTab = {wtf="DGS %rep%",test="Test Lang1"}
	languageTab2 = {wtf="Test %rep% %rep%",test="Test Lang2"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	gridlist = dgsCreateGridList (0.51, 0.54, 0.16, 0.14, true )
	dgsGridListAddColumn(gridlist,{"test"},0.5)
	dgsGridListAddColumn(gridlist,{"test"},0.5)
	for i=1,5000 do
		local row = dgsGridListAddRow(gridlist)
		dgsGridListSetItemText(gridlist,row,1,{"wtf",i,i})
		dgsGridListSetItemText(gridlist,row,2,tostring(50-i).." Test DGS")
	end
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function languageTest_label()
	languageTab = {wot="D-G-S %rep%"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	label = dgsCreateLabel (0.51, 0.54, 0.16, 0.14, {"wtf"}, true )
	dgsSetText(label,{"wot","1"})
end

function languageTest_TabPanel()
	languageTab = {wtf="DGS %rep%",test="Test Lang1"}
	languageTab2 = {wtf="Test %rep% %rep%",test="Test Lang2"}
	dgsSetTranslationTable("test",languageTab)
	dgsSetAttachTranslation("test")
	tabp = dgsCreateTabPanel(400,200,400,400,false)
	tab1 = dgsCreateTab({"wtf"},tabp)
	tab2 = dgsCreateTab("Tab",tabp)
	for i=1,10 do
		dgsCreateTab(i.."Panel",tabp)
	end
	gdlt2 = dgsCreateButton(10,0,100,120,"test",false,tab1,tocolor(255,255,255,255))
	dgsSetProperty(gdlt2,"shadow",{1,1,tocolor(0,0,0,255),true})
	setTimer(function()
		dgsSetTranslationTable("test",languageTab2)
	end,1000,1)
end

function dgsRoundRectTest()
	local rndRect = dgsCreateRoundRect(0.5,true,tocolor(0,0,0,150),_,false,true)
	local button = dgsCreateButton(200,200,800,400,"text",false)
	dgsSetProperty(button,"image",{rndRect,rndRect,rndRect})
	--local rndRect2 = dgsCreateRoundRect(0.5,tocolor(0,0,0,150))
	--local image2 = dgsCreateImage(200,400,400,100,rndRect2,false,_,tocolor(255,0,0,255))
end

function dgsRoundRectWithWindowText()
	local titleRoundRect = dgsCreateRoundRect({{10,false},{10,false}},tocolor(0,0,0,255))
	local bgRoundRect = dgsCreateRoundRect({_,_,{10,false},{10,false}},tocolor(0,0,0,255))
	local window = dgsCreateWindow(0.2*sW,0,0.4*sW,0.4*sH,"Example window",false)
	dgsRoundRectSetColorOverwritten(titleRoundRect,false)
	dgsRoundRectSetColorOverwritten(bgRoundRect,false)
	dgsSetProperty(window,"titleImage",titleRoundRect)
	dgsSetProperty(window,"image",bgRoundRect)
end

function test_switchButton()
	local button = dgsCreateSwitchButton(200,200,100,25,"on","off",false)
end

function testShader()
	--Circle
	local circle = dxCreateShader("shaders/circle.fx")
	local image = dgsCreateImage(300,300,400,400,circle,false)
end

function test9SliceScale()
	local img = dxCreateTexture("yourTexture.png")
	local nSli = dgsCreateNineSlice(img,0.2,0.8,0.4,0.6)
	local image = dgsCreateImage(400,400,400,400,nSli,false)
end
-----------------------------Plugin Test
function scrollPane3DEffectTest()
	material = dgsCreate3DInterface(0,0,4,4,4,500,500,tocolor(255,255,255,255),1,0,0,_,0)
	dgsSetProperty(material,"maxDistance",1000)
	dgsSetProperty(material,"fadeDistance",1000)
	local img = dgsCreateImage(0,0,1,1,_,true,material,tocolor(0,0,0,180))
	edit1 = dgsCreateEdit(0,0,200,100,"DGS 3D Interface Edit 1",false,img)
	edit2 = dgsCreateEdit(0,400,200,50,"DGS 3D Interface Edit 2",false,img)
	
	local effect3d = dgsCreateEffect3D(20)
	local sp = dgsCreateScrollPane(300,300,500,500,false)
	local img = dgsCreateImage(0,0,1,1,_,true,sp,tocolor(0,0,0,180))
	dgsEffect3DApplyToScrollPane(effect3d,sp)
	edit1 = dgsCreateEdit(0,0,200,100,"DGS 3D Effect Edit 1",false,img)
	edit2 = dgsCreateEdit(0,400,200,50,"DGS 3D Effect Edit 2",false,img)
end
-----QRCode
function QRCodeTest()
	local QRCode = dgsRequestQRCode("https://wiki.multitheftauto.com/wiki/Resource:Dgs")
	local image = dgsCreateImage(200,200,128,128,QRCode,false)
	outputChatBox(dgsGetQRCodeLoaded(QRCode) and "Loaded" or "Loading")
	addEventHandler("onDgsQRCodeLoad",QRCode,function()
		outputChatBox(dgsGetQRCodeLoaded(source) and "Loaded" or "Loading")
	end,false)
end

-----------------------------OOP Test
function oopTest()
	loadstring(dgsImportOOPClass())()-- load OOP class
	window1 = DGSClass:createWindow(0,0,0.5,0.1,"test",true) --create a window with oop
	window2 = DGSClass:createWindow(0.2,0,0.5,0.1,"test",true) --create a window with oop
	label = window1:createLabel(0,0,1,1,"label",true) --create a label inside the window
	label.parent = window2
end

function testColorPicker()
	--material1 = dgsCreate3DInterface(0,0,4,4,2,1600,800,tocolor(255,255,255,255),1,0,0,_,0)
	colorPicker_HLDisk = dgsCreateColorPicker("HLDisk",50,50,200,200,false,material1)
	colorPicker_HSDisk = dgsCreateColorPicker("HSDisk",250,50,200,200,false,material1)
	colorPicker_HSLSquare = dgsCreateColorPicker("HSLSquare",50,250,200,200,false,material1)
	colorPicker_HSVRing = dgsCreateColorPicker("HSVRing",250,250,200,200,false,material1)
	addEventHandler("onDgsColorPickerChange",colorPicker_HLDisk,syncColorPicker)
	addEventHandler("onDgsColorPickerChange",colorPicker_HSDisk,syncColorPicker)
	addEventHandler("onDgsColorPickerChange",colorPicker_HSLSquare,syncColorPicker)
	addEventHandler("onDgsColorPickerChange",colorPicker_HSVRing,syncColorPicker)
	r = dgsColorPickerCreateComponentSelector(500,200,200,10,true,false,material1)
	dgsBindToColorPicker(r,colorPicker_HSVRing,"RGB","R",true,true)
	g = dgsColorPickerCreateComponentSelector(500,220,200,10,true,false,material1)
	dgsBindToColorPicker(g,colorPicker_HSVRing,"RGB","G",true,true)
	b = dgsColorPickerCreateComponentSelector(500,240,200,10,true,false,material1)
	dgsBindToColorPicker(b,colorPicker_HSVRing,"RGB","B",true,true)
	
	H = dgsColorPickerCreateComponentSelector(750,200,200,10,true,false,material1)
	dgsBindToColorPicker(H,colorPicker_HSVRing,"HSL","H",true,true)
	S = dgsColorPickerCreateComponentSelector(750,220,200,10,true,false,material1)
	dgsBindToColorPicker(S,colorPicker_HSVRing,"HSL","S",true,true)
	L = dgsColorPickerCreateComponentSelector(750,240,200,10,true,false,material1)
	dgsBindToColorPicker(L,colorPicker_HSVRing,"HSL","L",true,true)
	
	H = dgsColorPickerCreateComponentSelector(1000,200,200,10,true,false,material1)
	dgsBindToColorPicker(H,colorPicker_HSVRing,"HSV","H",true,true)
	S = dgsColorPickerCreateComponentSelector(1000,220,200,10,true,false,material1)
	dgsBindToColorPicker(S,colorPicker_HSVRing,"HSV","S",true,true)
	V = dgsColorPickerCreateComponentSelector(1000,240,200,10,true,false,material1)
	dgsBindToColorPicker(V,colorPicker_HSVRing,"HSV","V",true,true)
	
	A = dgsColorPickerCreateComponentSelector(500,260,700,10,true,false,material1)
	dgsBindToColorPicker(A,colorPicker_HSVRing,"RGB","A",_,true)
end

-----------------------------DGS Object Preview Support Test
function testObjectPreview()
	wind = dgsCreateWindow(0.2*sW,0,0.4*sW,0.4*sH,"Example Scroll Pane (exclude this window)",false)
	local objPrevName = "object_preview"
	dgsLocateObjectPreviewResource(objPrevName)
	local veh = createVehicle(411,0,0,3)
	local objPrev = dgsCreateObjectPreviewHandle(veh,0,0,0)
	local image = dgsCreateImage(20,20,300,300,_,false,wind)
	dgsAttachObjectPreviewToImage(objPrev,image)
end
-----------------------------DGS Animation With Shader Example
--Example 1, Simple Button Effect
function testButtonEffect()
	local bEffect = dxCreateShader("shaders/ButtonEffect.fx")				--Create our shader
	local button = dgsCreateButton(300,300,200,100,"Button",false)			--Create our dgs button
	dgsSetProperty(button,"image",{bEffect,bEffect,bEffect})				--Set all image of dgs button as shader
	dgsAddEasingFunction("ButtonEffect_1",[[								--Define our custom easing function that can be only used in dgs
		local shader = propertyTable.image[1]								--Get the shader
		local circleRadius = dgsGetProperty(self,"circleRadius") or 0		--Get the property value
		circleRadius = circleRadius+(setting[2]-circleRadius)*progress		--Calculate the changing
		if isElement(shader) and dgsGetType(shader) == "shader" then		--Is the shader existing?
			dxSetShaderValue(shader,"radius",circleRadius*8)				--If so, then set shader value
		end
		return circleRadius													--Return the property value
	]])
	
	function dgsButtonEffectHandler(mx,my)
		if dgsIsAniming(source) then dgsStopAniming(source) end				--If it is animating, then suspend it
		local wid,hei = dgsGetSize(source,false)							--Get the size of the dgs button to calculate the ratio and the mouse relative position
		local x,y = dgsGetPosition(source,false)							--Get the position of the dgs button to calculate the mouse relative position
		local ratio = wid/hei												--Calculate the ratio
		local shader = dgsGetProperty(source,"image")[1]					--Get the shader
		if not isElement(shader) then return false end						--If there is no shader, then jump out
		dxSetShaderValue(shader,"ratio",ratio)								--Set ratio
		local mouseRltX,mouseRltY = (mx-x)/wid,(my-y)/hei					--Get mouse relative position
		dxSetShaderValue(shader,"circlePos",{mouseRltX,mouseRltY})			--Push in to shader
		if eventName == "onDgsMouseEnter" then								--Animation in onDgsMouseEnter
			dgsAnimTo(source,"circleRadius",1,"ButtonEffect_1",800)				--Let's Do It!
		else																--Animation in onDgsMouseLeave
			dgsAnimTo(source,"circleRadius",0,"ButtonEffect_1",600)				--Let's Do It Reverse!
		end
	end
	addEventHandler("onDgsMouseEnter",button,dgsButtonEffectHandler)
	addEventHandler("onDgsMouseLeave",button,dgsButtonEffectHandler)
end