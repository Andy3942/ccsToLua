-- Filename: BTNode.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 

BTNode = class("BTNode", function ( ... )
	return CCNode:create()
end)

function BTNode:ctor()
	self._childre = {}
	self._isSwallowTouch = false
	self:setAnchorPoint(ccp(0.5, 0.5))
end

function BTNode:create()
	local ret = BTNode:new()
	return ret
end

function BTNode:addNode( node, zOrder, tag )
	self._childre[node:getName()] = node
	self:addChild(node, zOrder, tag)
end

function BTNode:getChildByName( name )
	return self._childre[name]
end

function BTNode:removeFromParent( ... )
	self:removeFromParentAndCleanup(true)
end

function BTNode:setSwallowTouch( isSwallowTouch )
	BTTouchDispatcher:getInstance():addListener(self)
	self._isSwallowTouch = isSwallowTouch
end

function BTNode:isSwallowTouch(  )
	return self._isSwallowTouch
end