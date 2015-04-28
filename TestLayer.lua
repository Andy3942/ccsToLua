TestLayer = class("TestLayer", function()
    return BTLayer:create()
end)

TestLayer._Scene = nil
TestLayer._Text_1 = nil

function TestLayer:create()
    local ret = TestLayer:new()
    ret:loadText_1()
    return ret
end

function TestLayer:loadText_1()
    self._Text_1 = BTLabel:create("你好啊哈哈    哈哈", g_sFontPangWa, 30)
    self:addNode(self._Text_1)
    self._Text_1:setTag(41.0)
    self._Text_1:setPosition(ccp(200.6667, 671.8423))
    self._Text_1:setAnchorPoint(ccp(0.5, 0.5))
    self._Text_1:setNodeColor(ccc3(255.0, 59.0, 12.0))
    self._Text_1:setNodeOpacity(167.0)
    local ritchInfo = 
    {
        elements = {
            {
                text = "fuckkkkkkkkkkk"
            }
        }
    }
    self._Text_1:setRichInfo(ritchInfo)
end

