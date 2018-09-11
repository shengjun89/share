Screen.backgroundColor = "#FFF"
n = Screen.width/750

cardCntArr = []

pageName = new TextLayer
	text: "分享组件"
	fontSize: 56*n
	fontWeight: 800
	color: "#212121"
	y: 72*n
	x: 32*n


shareBtn = new Layer
	x: Align.right(-32*n)
	y: 38
	width: 48*n
	height: 48*n
	image: "images/sharebtn.svg"
	z: 2
	scale: 0.8
	
overlay = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#000"
	opacity: 0
	visible: false
	
overlay.states = 
	on:
		opacity:0.4	
		visible: true
		
sheet = new Layer
	width: Screen.width
	height: 540*n
	y: Align.bottom(540*n)
	opacity: 0
	backgroundColor: "rgba(247,247,247,1)"
	z: 3

title = new TextLayer
	parent: sheet
	x: Align.center
	y: 24*n
	text: "分享到"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1
	textAlign: "center"
	color: "rgba(155,155,155,1)"
	
closeBtn = new Layer
	width: Screen.width
	height: 100*n
	y: Align.bottom(100*n)
	backgroundColor: "rgba(255,255,255,1)"
	shadowColor: "rgba(238,238,238,1)"
	shadowX: 0
	shadowY: -1
	shadowBlur: 0
	shadowSpread: 0
	opacity: 0
	z: 4
	
closeBtn.states = 
	on:
		opacity:1
		y: Align.bottom()
		options: 
			delay:0.1	
	
cancel = new TextLayer
	text: "取消"	
	parent: closeBtn
	fontSize: 36*n
	color: "#212121"
	x: Align.center
	y: Align.center
	fontWeight: 600


sheet.states = 
	on:
		y: Align.bottom
		opacity: 1
		options: 
			time:0.2		

shareArr = ["images/sharepic1.png","images/sharepic2.png","images/sharepic3.png","images/sharepic4.png","images/sharepic5.png","images/sharepic6.png","images/sharepic7.png","images/sharepic8.png","images/sharepic9.png","images/sharepic10.png"]

btntxtArr = ["机票订单详情/酒店订单详情","酒店产品详情","门票活动","门票产品详情","机票活动"]

row = 0
col = 0
shareIcons = []

for i in [0...shareArr.length]
	if i%5==0
		row = 0
		col++			
	share = new Layer
		parent: sheet
		width: 144*n
		height: 150*n
		image: shareArr[i]
		x: 144*n*row+16*n
		y: title.y+(col-1)*180*n+440*n
		opacity: 0
		z: 2

	row++
	shareIcons.push(share)

c = 0
r = 0	
for i in [0...shareIcons.length]	
	if i%5==0
		r = 0
		c++	
	shareIcons[i].states =
		on:
			y: title.y+(c-2)*180*n+228*n
			opacity:1
			options:
				delay: 0.015*i+0.1
				curve: "spring(600,36,0)"			
	
sheet.height = share.height*c+closeBtn.height+144*n	
closeBtn.placeBefore(sheet)					
shareBtn.onTap (event, layer) ->
# 	print 1
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2	
	for i in [0...shareIcons.length]
		shareIcons[i].animate "on",time:0.2

closeBtn.onTap (event, layer) ->
# 	print 1
	sheet.animate "default",time:0.2
	overlay.animate "default",time:0.2
	closeBtn.animate "default",time:0.2
	for i in [0...shareIcons.length]
		shareIcons[i].animate "default",time:0.2
	for i in [0...Channels.length]
			Channels[i].ignoreEvents = false
			
overlay.onTap (event, layer) ->
# 	print 1
	sheet.animate "default",time:0.2
	overlay.animate "default",time:0.2
	closeBtn.animate "default",time:0.2
	for i in [0...shareIcons.length]
		shareIcons[i].animate "default",time:0.2
	for i in [0...Channels.length]
			Channels[i].ignoreEvents = false
			
Channels = []		
for i in [0...btntxtArr.length]		
	channel = new Layer
		x: Align.center
		y: 140*n*i+320*n
		backgroundColor: "transparent"
		width: Screen.width-64*n
		height: 108*n
	
	channelbg = new Layer
		parent: channel
		x: 0
		y: 0
		width: Screen.width-64*n
		height: 108*n
		backgroundColor: "rgba(255,255,255,1)"
		borderRadius: 54*n
		borderColor: "rgba(0,204,230,1)"
		borderWidth: 2*n
	
	btntxt = new TextLayer
		parent: channel
		x: Align.center
		y: 32*n
		text: btntxtArr[i]
		fontSize: 32*n
		fontFamily: "PingFang SC"
		fontWeight: 500
		letterSpacing: 0.0
		textAlign: "center"
		color: "rgba(0,161,181,1)"
	channel.placeBehind(overlay)	
	Channels.push(channel)

Channels[0].onTap (event, layer) ->
# 	sheet.height = share.height*c+closeBtn.height+144*n
	shareArr = ["images/sharepic2.png","images/sharepic3.png","images/sharepic4.png","images/sharepic5.png","images/sharepic7.png","images/sharepic8.png","images/sharepic11.png","images/sharepic9.png","images/sharepic13.png","images/sharepic6.png"]
# 	print shareArr
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2	
	for i in [0...shareIcons.length]
		shareIcons[i].image = shareArr[i]
		shareIcons[i].animate "on",time:0.2
		
Channels[1].onTap (event, layer) ->
	shareArr = ["images/sharepic2.png","images/sharepic3.png","images/sharepic5.png","images/sharepic11.png","images/sharepic13.png","","","","",""]
	sheet.height = 350*n
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2
	for i in [0...shareIcons.length]
		shareIcons[i].image = shareArr[i]
		shareIcons[i].animate "on",time:0.2
		
		
Channels[2].onTap (event, layer) ->
# 	sheet.height = share.height*c+closeBtn.height+144*n
	shareArr = ["images/sharepic3.png","images/sharepic2.png","images/sharepic11.png","images/sharepic7.png","images/sharepic13.png","images/sharepic5.png","images/sharepic4.png","images/sharepic8.png","",""]
# 	print shareArr
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2	
	for i in [0...shareIcons.length]
		shareIcons[i].image = shareArr[i]
		shareIcons[i].animate "on",time:0.2
		
		
		
Channels[3].onTap (event, layer) ->
# 	sheet.height = share.height*c+closeBtn.height+144*n
	shareArr = ["images/sharepic2.png","images/sharepic3.png","images/sharepic4.png","images/sharepic7.png","images/sharepic8.png","images/sharepic6.png","images/sharepic9.png","images/sharepic13.png","",""]
# 	print shareArr
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2	
	for i in [0...shareIcons.length]
		shareIcons[i].image = shareArr[i]
		shareIcons[i].animate "on",time:0.2
		
Channels[4].onTap (event, layer) ->
	shareArr = ["images/sharepic2.png","images/sharepic3.png","images/sharepic7.png","images/sharepic4.png","","","","","",""]
	sheet.height = 350*n
	sheet.animate "on",time:0.2
	overlay.animate "on",time:0.2
	closeBtn.animate "on",time:0.2
	for i in [0...shareIcons.length]
		shareIcons[i].image = shareArr[i]
		shareIcons[i].animate "on",time:0.2
		
for i in [0...Channels.length]
	Channels[i].onTap (event, layer) ->
		@ignoreEvents = false
		for i in [0...Channels.length]
			Channels[i].ignoreEvents = true
				