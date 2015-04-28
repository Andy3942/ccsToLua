-- Filename: BTNode.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 

BTNode = class("BTNode", function ( ... )
	return CCNode:create()
end)

function BTNode:ctor()
	self._name = ""
	self._children = {}
	self._isSwallowTouch = false
	self._touchEnabled = false
	self._nodeSize = CCSizeMake(0, 0)
	self._bg = nil
	self._parent = nil
	self:setAnchorPoint(ccp(0, 0))
	self:ignoreAnchorPointForPosition(false)
end

function BTNode:create()
	local ret = BTNode.new()
	ret:setNodeSize(ret._nodeSize)
	return ret
end


function BTNode:addNode( node, zOrder, tag )
	self._children[node:getName()] = node
	self:addChild(node)
end

function BTNode:getNodeByName( name )
	return self._children[name]
end

function BTNode:removeNodeByName( name )
	local node = self._children[name]
	if node then
		node:removeFromParent()
	end
end

function BTNode:getNodeParent( ... )
	return self._parent
end

function BTNode:setNodeParent( parent )
	self._parent = parent
end

function BTNode:setNodeSize( size )
	self._nodeSize = size
	self:setContentSize(size)
end

function BTNode:getNodeSize( ... )
	return self._nodeSize
end

function BTNode:repalce(node)
	local parent = self:getParent()
	if parent then
		node:copyBaseInfo(self)
		self:removeFromParent()
		parent:addNode(node)
	end
end

function BTNode:copyBaseInfo(node)
	self:setPosition(node:getPosition())
	self:setAnchorPoint(node:getAnchorPoint())
	self:setScaleX(node:getScaleX())
	self:setScaleY(node:getScaleY())
end

function BTNode:setName( name )
	self._name = name
end

function BTNode:getName()
	return self._name
end

function BTNode:removeFromParent( ... )
	self:getNodeParent():removeNodeByName(self._name)
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
	if touchEnabled then
		BTTouchDispatcher:getInstance():addListener(self)
	else
		BTTouchDispatcher:getInstance():removeListener(self)
	end
end

function BTNode:isTouchEnabled( )
	return self._touchEnabled
end

function BTNode:getWorldPosition( ... )
	local parent = self:getParent()
	local position = nil
	if parent then
		position = parent:convertToWorldSpace(ccp(self:getPositionX(), self:getPositionY()))
	else
		position = self:getPosition()
	end
	return position
end

function BTNode:isTouched(point)
	local nodeSpace = self:convertToNodeSpace(point)
	local rect = CCRectMake(0, 0, self:getContentSize().width, self:getContentSize().height)
	return rect:containsPoint(nodeSpace)
end

function BTNode:setBgColor(bgColor)
	if self._colorLayer == nil then
		self._bg = BTLayerColor:create(ccc4(0, 0, 0, 100))
		self:addNode(self._bg)
		self._bg:setContentSize(self:getContentSize())
	end
	self._bg:setColor(bgColor)
end

function BTNode:setBgOpacity( bgOpacity )
	if self._bg then
		self._bg:setOpacity(bgOpacity)
	end
	self._bg:setContentSize(self:getContentSize())
end

function BTNode:setNodeOpacity( opacity )
	if self.setOpacity ~= nil then
		self:setOpacity(opacity)
	end
end

function BTNode:setNodeColor( color )
	if self.setColor ~= nil then
		self.setColor(color)
	end
end