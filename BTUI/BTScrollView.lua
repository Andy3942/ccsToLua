-- Filename: BTScrollView.lua
-- Author: bzx
-- Date: 2015-04-25
-- Purpose: 

BTScrollView = class("BTScrollView", function ()
	return CCScrollView:create()
end)

combine(BTLayer, BTScrollView)

function BTScrollView:ctor( ... )
	BTNode.ctor(self)
	self._innerNodeSize = nil
end

function BTScrollView:create()
	local ret = BTScrollView.new()
	return ret
end

function BTScrollView:setInnerNodeSize(innerNodeSize)
	self._innerNodeSize = innerNodeSize
	self:setContentSize(innerNodeSize)
	self:setContentOffset(ccp(0, self:getViewSize().height - self:getContentSize().height))
end

function BTScrollView:getInnerNodeSize( ... )
	return self._innerNodeSize
end

function BTScrollView:setNodeSize(nodeSize)
	self._nodeSize = nodeSize
	self:setViewSize(nodeSize)
end