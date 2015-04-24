-- Filename: BTNode.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 

BTNode = class("BTNode", function ( ... )
	return CCNode:create()
end)

function BTNode:ctor()
	self._name = ""
	self._childre = {}
	self._isSwallowTouch = false
	self._touchEnabled = true
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

function BTNode:setName( name )
	self._name = name
end

function BTNode:getName()
	return self._name
end

function BTNode:removeFromParent( ... )
	self:removeFromParentAndCleanup(true)
end

function BTNode:setSwallowTouch( isSwallowTouch )
	self._isSwallowTouch = isSwallowTouch
	self:setTouchEnabled(true)
end

function BTNode:isSwallowTouch(  )
	return self._isSwallowTouch
end

function BTNode:setTouchEnabled( touchEnabled )
	self._touchEnabled = touchEnabled
	BTTouchDispatcher:getInstance():addListener(self)
end

function BTNode:getWorldPosition( ... )
	local parent = self:getParent()
	local position = nil
	if parent then
		position = parent:convertToWorldSpace(self:getPosition())
	end
	position = self:getPosition()
	return position
end

function BTButton:isTouched(point)
	local nodeSpace = self:convertToNodeSpace(point)
	local rect = self:rect()
	rect.origin = ccp(0, 0)
	return rect:containsPoint(nodeSpace)
end