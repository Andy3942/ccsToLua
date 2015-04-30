TestLayer = class("TestLayer", function()
    return STLayer:create()
end)

TestLayer._layer = nil
TestLayer._bgLayer = nil
TestLayer._Image_1 = nil
TestLayer._Sprite_5 = nil
TestLayer._title = nil
TestLayer._Button_1 = nil
TestLayer._replaceButton = nil
TestLayer._comprehendButton = nil
TestLayer._Image_2 = nil
TestLayer._curAwakenNameLabel = nil
TestLayer._curAwakenLabel = nil
TestLayer._curAwakenDescLabel = nil
TestLayer._Image_2_0 = nil
TestLayer._ListView_1 = nil
TestLayer._cell = nil
TestLayer._checkButton = nil
TestLayer._Image_5 = nil
TestLayer._AwakenNameLabel = nil
TestLayer._AwakenDescLabel = nil
TestLayer._Sprite_6 = nil
TestLayer._comprehendTimes = nil

function TestLayer:create()
    local ret = TestLayer:new()
    ret:loadBglayer()
    ret:loadImage_1()
    ret:loadSprite_5()
    ret:loadTitle()
    ret:loadButton_1()
    ret:loadReplacebutton()
    ret:loadComprehendbutton()
    ret:loadImage_2()
    ret:loadCurawakennamelabel()
    ret:loadCurawakenlabel()
    ret:loadCurawakendesclabel()
    ret:loadImage_2_0()
    ret:loadListview_1()
    ret:loadCell()
    ret:loadCheckbutton()
    ret:loadImage_5()
    ret:loadAwakennamelabel()
    ret:loadAwakendesclabel()
    ret:loadSprite_6()
    ret:loadComprehendtimes()
    return ret
end

function TestLayer:loadBglayer()
    self._bgLayer = STLayout:create()
    self:addNode(self._bgLayer)
    self._bgLayer:setNodeSize(CCSizeMake(640.0, 960.0))
    self._bgLayer:setTag(17.0)
    self._bgLayer:setBgColor(ccc3(150.0, 200.0, 255.0))
    self._bgLayer:setBgOpacity(102.0)
    self._bgLayer:setTouchEnabled(true)
end

function TestLayer:loadImage_1()
    self._Image_1 = STScale9Sprite:create("images/common/viewbg1.png", CCRectMake(100.0, 80.0, 13.0, 11.0))
    self._bgLayer:addNode(self._Image_1)
    self._Image_1:setNodeSize(CCSizeMake(630.0, 754.0))
    self._Image_1:setTag(18.0)
    self._Image_1:setPosition(ccp(320.0, 480.0))
    self._Image_1:setPercentPositionXEnabled(true)
    self._Image_1:setPercentPositionX(0.5)
    self._Image_1:setPercentPositionYEnabled(true)
    self._Image_1:setPercentPositionY(0.5)
    self._Image_1:setAnchorPoint(ccp(0.5, 0.5))
end

function TestLayer:loadSprite_5()
    self._Sprite_5 = STSprite:create("images/formation/changeformation/titlebg.png")
    self._Image_1:addNode(self._Sprite_5)
    self._Sprite_5:setNodeSize(CCSizeMake(315.0, 61.0))
    self._Sprite_5:setTag(19.0)
    self._Sprite_5:setPosition(ccp(315.0, 747.0003))
    self._Sprite_5:setPercentPositionXEnabled(true)
    self._Sprite_5:setPercentPositionX(0.5)
    self._Sprite_5:setAnchorPoint(ccp(0.5, 0.5))
end

function TestLayer:loadTitle()
    self._title = STLabel:create("批量领悟", g_sFontPangWa, 33)
    self._Sprite_5:addNode(self._title)
    self._title:setTag(20.0)
    self._title:setPosition(ccp(157.5, 30.5))
    self._title:setPercentPositionXEnabled(true)
    self._title:setPercentPositionX(0.5)
    self._title:setPercentPositionYEnabled(true)
    self._title:setPercentPositionY(0.5)
    self._title:setAnchorPoint(ccp(0.5, 0.5))
    self._title:setNodeColor(ccc3(255.0, 228.0, 0.0))
    self._title:setNodeOpacity(255.0)
end

function TestLayer:loadButton_1()
    self._Button_1 = STButton:createWithImage("images/common/btn_close_n.png", "images/common/btn_close_h.png", nil, true)
    self._Button_1:setCapInsets(CCRectMake(0.0, 0.0, 77.0, 77.0))
    self._Image_1:addNode(self._Button_1)
    self._Button_1:setNodeSize(CCSizeMake(77.0, 77.0))
    self._Button_1:setTag(21.0)
    self._Button_1:setPosition(ccp(640.0, 769.0))
    self._Button_1:setAnchorPoint(ccp(1.0, 1.0))
    self._Button_1:setTouchEnabled(true)
end

function TestLayer:loadReplacebutton()
    self._replaceButton = STButton:createWithImage("images/common/btn/btn1_d.png", "images/common/btn/btn1_n.png", nil, true)
    self._replaceButton:setCapInsets(CCRectMake(0.0, 0.0, 150.0, 73.0))
    self._Image_1:addNode(self._replaceButton)
    self._replaceButton:setNodeSize(CCSizeMake(198.0, 73.0))
    self._replaceButton:setTag(23.0)
    self._replaceButton:setPosition(ccp(199.0, 79.5))
    self._replaceButton:setAnchorPoint(ccp(0.5, 0.5))
    self._replaceButton:setTouchEnabled(true)
end

function TestLayer:loadComprehendbutton()
    self._comprehendButton = STButton:createWithImage("images/common/btn/btn1_d.png", "images/common/btn/btn1_n.png", nil, true)
    self._comprehendButton:setCapInsets(CCRectMake(70.0, 30.0, 10.0, 13.0))
    self._Image_1:addNode(self._comprehendButton)
    self._comprehendButton:setNodeSize(CCSizeMake(198.0, 73.0))
    self._comprehendButton:setTag(22.0)
    self._comprehendButton:setPosition(ccp(431.0, 79.5))
    self._comprehendButton:setAnchorPoint(ccp(0.5, 0.5))
    self._comprehendButton:setTouchEnabled(true)
end

function TestLayer:loadImage_2()
    self._Image_2 = STScale9Sprite:create("images/common/bg/bg_ng_attr.png", CCRectMake(30.0, 30.0, 15.0, 15.0))
    self._Image_1:addNode(self._Image_2)
    self._Image_2:setNodeSize(CCSizeMake(570.0, 170.0))
    self._Image_2:setTag(24.0)
    self._Image_2:setPosition(ccp(316.4925, 609.5971))
    self._Image_2:setPercentPositionXEnabled(true)
    self._Image_2:setPercentPositionX(0.5024)
    self._Image_2:setAnchorPoint(ccp(0.5, 0.5))
end

function TestLayer:loadCurawakennamelabel()
    self._curAwakenNameLabel = STLabel:create("狂怒8", g_sFontPangWa, 25)
    self._Image_2:addNode(self._curAwakenNameLabel)
    self._curAwakenNameLabel:setTag(31.0)
    self._curAwakenNameLabel:setPosition(ccp(21.2165, 105.9704))
    self._curAwakenNameLabel:setAnchorPoint(ccp(0.0, 0.5))
    self._curAwakenNameLabel:setNodeColor(ccc3(228.0, 0.0, 255.0))
    self._curAwakenNameLabel:setNodeOpacity(255.0)
end

function TestLayer:loadCurawakenlabel()
    self._curAwakenLabel = STLabel:create("当前觉醒能力", g_sFontPangWa, 25)
    self._Image_2:addNode(self._curAwakenLabel)
    self._curAwakenLabel:setTag(33.0)
    self._curAwakenLabel:setPosition(ccp(285.0, 144.7767))
    self._curAwakenLabel:setPercentPositionXEnabled(true)
    self._curAwakenLabel:setPercentPositionX(0.5)
    self._curAwakenLabel:setAnchorPoint(ccp(0.5, 0.5))
    self._curAwakenLabel:setNodeColor(ccc3(0.0, 255.0, 24.0))
    self._curAwakenLabel:setNodeOpacity(255.0)
end

function TestLayer:loadCurawakendesclabel()
    self._curAwakenDescLabel = STLabel:create("描述描述描述描述描述描述描述描述描", g_sFontName, 21)
    self._Image_2:addNode(self._curAwakenDescLabel)
    self._curAwakenDescLabel:setTag(34.0)
    self._curAwakenDescLabel:setPosition(ccp(26.2687, 75.6791))
    self._curAwakenDescLabel:setAnchorPoint(ccp(0.0, 1.0))
end

function TestLayer:loadImage_2_0()
    self._Image_2_0 = STScale9Sprite:create("images/common/bg/bg_ng_attr.png", CCRectMake(30.0, 30.0, 15.0, 15.0))
    self._Image_1:addNode(self._Image_2_0)
    self._Image_2_0:setNodeSize(CCSizeMake(570.0, 380.0))
    self._Image_2_0:setTag(28.0)
    self._Image_2_0:setPosition(ccp(319.0303, 319.4179))
    self._Image_2_0:setPercentPositionXEnabled(true)
    self._Image_2_0:setPercentPositionX(0.5064)
    self._Image_2_0:setAnchorPoint(ccp(0.5, 0.5))
end

function TestLayer:loadListview_1()
    self._ListView_1 = STTableView:create()
    self._ListView_1:setClippingToBounds(false)
    self._ListView_1:setBounceable(false)
    self._Image_2_0:addNode(self._ListView_1)
    self._ListView_1:setNodeSize(CCSizeMake(570.0, 300.0))
    self._ListView_1:setInnerNodeSize(CCSizeMake(570.0, 300.0))
    self._ListView_1:setTag(26.0)
    self._ListView_1:setPosition(ccp(285.0, 160.0006))
    self._ListView_1:setPercentPositionXEnabled(true)
    self._ListView_1:setPercentPositionX(0.5)
    self._ListView_1:setPercentPositionYEnabled(true)
    self._ListView_1:setPercentPositionY(0.4211)
    self._ListView_1:setAnchorPoint(ccp(0.5, 0.5))
    self._ListView_1:setBgColor(ccc3(150.0, 150.0, 255.0))
    self._ListView_1:setBgOpacity(0.0)
    self._ListView_1:setTouchEnabled(true)
end

function TestLayer:loadCell()
    self._cell = STLayout:create()
    self._ListView_1:addNode(self._cell)
    self._cell:setNodeSize(CCSizeMake(570.0, 170.0))
    self._cell:setTag(35.0)
    self._cell:setPosition(ccp(0.0, 130.0))
    self._cell:setBgColor(ccc3(150.0, 200.0, 255.0))
    self._cell:setBgOpacity(0.0)
    self._cell:setTouchEnabled(true)
end

function TestLayer:loadCheckbutton()
    self._checkButton = STButton:createWithImage("images/common/checkbg.png", nil, nil, true)
    self._checkButton:setCapInsets(CCRectMake(15.0, 15.0, 4.0, 2.0))
    self._cell:addNode(self._checkButton)
    self._checkButton:setNodeSize(CCSizeMake(40.0, 40.0))
    self._checkButton:setTag(39.0)
    self._checkButton:setPosition(ccp(525.6365, 85.0))
    self._checkButton:setPercentPositionYEnabled(true)
    self._checkButton:setPercentPositionY(0.5)
    self._checkButton:setAnchorPoint(ccp(0.5, 0.5))
    self._checkButton:setTouchEnabled(true)
end

function TestLayer:loadImage_5()
    self._Image_5 = STScale9Sprite:create("images/common/bgng_lefttimes.png", CCRectMake(15.0, 15.0, 3.0, 3.0))
    self._cell:addNode(self._Image_5)
    self._Image_5:setNodeSize(CCSizeMake(470.0, 150.0))
    self._Image_5:setTag(36.0)
    self._Image_5:setPosition(ccp(16.6476, 85.0))
    self._Image_5:setPercentPositionYEnabled(true)
    self._Image_5:setPercentPositionY(0.5)
    self._Image_5:setAnchorPoint(ccp(0.0, 0.5))
end

function TestLayer:loadAwakennamelabel()
    self._AwakenNameLabel = STLabel:create("狂怒8", g_sFontPangWa, 25)
    self._cell:addNode(self._AwakenNameLabel)
    self._AwakenNameLabel:setTag(41.0)
    self._AwakenNameLabel:setPosition(ccp(31.2165, 118.9703))
    self._AwakenNameLabel:setAnchorPoint(ccp(0.0, 0.5))
    self._AwakenNameLabel:setNodeColor(ccc3(228.0, 0.0, 255.0))
    self._AwakenNameLabel:setNodeOpacity(255.0)
end

function TestLayer:loadAwakendesclabel()
    self._AwakenDescLabel = STLabel:create("描述描述描述描述描述描述描述描述描", g_sFontName, 21)
    self._cell:addNode(self._AwakenDescLabel)
    self._AwakenDescLabel:setTag(42.0)
    self._AwakenDescLabel:setPosition(ccp(32.5187, 90.9999))
    self._AwakenDescLabel:setAnchorPoint(ccp(0.0, 1.0))
end

function TestLayer:loadSprite_6()
    self._Sprite_6 = STSprite:create("images/common/red_line.png")
    self:addNode(self._Sprite_6)
    self._Sprite_6:setNodeSize(CCSizeMake(308.0, 45.0))
    self._Sprite_6:setTag(29.0)
    self._Sprite_6:setPosition(ccp(320.0, 580.7463))
    self._Sprite_6:setPercentPositionXEnabled(true)
    self._Sprite_6:setPercentPositionX(0.5)
    self._Sprite_6:setAnchorPoint(ccp(0.5, 0.5))
end

function TestLayer:loadComprehendtimes()
    self._comprehendTimes = STLabel:create("领悟10次", g_sFontPangWa, 25)
    self._Sprite_6:addNode(self._comprehendTimes)
    self._comprehendTimes:setTag(30.0)
    self._comprehendTimes:setPosition(ccp(154.0, 22.5))
    self._comprehendTimes:setPercentPositionXEnabled(true)
    self._comprehendTimes:setPercentPositionX(0.5)
    self._comprehendTimes:setPercentPositionYEnabled(true)
    self._comprehendTimes:setPercentPositionY(0.5)
    self._comprehendTimes:setAnchorPoint(ccp(0.5, 0.5))
    self._comprehendTimes:setNodeColor(ccc3(0.0, 228.0, 255.0))
    self._comprehendTimes:setNodeOpacity(255.0)
end

function TestLayer:getMemberNodeByName(name)
    return self["_" .. name]
end
