TestLayer = class("TestLayer", function 
    return CCLayerColor:create()
end)

TestLayer._layer = nil
TestLayer._sprite_1 = nil
TestLayer._Button_1 = nil

function TestLayer:create()
    local ret = TestLayer:new()
    ret:loadSprite_1()
    ret:loadButton_1()
        return ret
    end

function TestLayer:loadSprite_1()
    self._sprite_1:setTag(4.0)
    self._sprite_1:setPosition(ccp(2.0, 1.0))
    self._sprite_1:setAnchorPoint(ccp(0.4, 0.5)
    self._layer:addChild(self._sprite_1)
end

function TestLayer:loadButton_1()
    self._Button_1 = CCLayerColor:create()
    self._Button_1:setTag(5.0)
    self._Button_1:setPosition(ccp(608.5, 73.2))
    self._Button_1:setAnchorPoint(ccp(0.5, 0.5)
    self._layer:addChild(self._Button_1)
end

