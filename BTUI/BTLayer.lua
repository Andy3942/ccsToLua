-- Filename: BTLayer.lua
-- Author: bzx
-- Date: 2015-04-25
-- Purpose: 

BTLayer = class("BTLayer", function ( ... )
	return CCLayer:create()
end)

combine(BTNode, BTLayer)

function BTLayer:ctor()
	BTNode.ctor(self)
	self:setContentSize(g_winSize)
end

function BTLayer:create( ... )
	return BTLayer.new()
end
