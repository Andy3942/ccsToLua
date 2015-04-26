-- Filename: BTTouchDispatcher.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 触摸事件调度器

BTTouchDispatcher = {}--class("BTTouchDispatcher", {})

function BTTouchDispatcher:ctor()
	self.new = nil
	self._listeners = {}
	self._layer = nil
	self._isStop = false
end

BTTouchDispatcher:ctor()
local instance = nil

function BTTouchDispatcher:getInstance()
	if instance == nil then
		instance = self
		self:startListen()
	end
	return self
end

function BTTouchDispatcher:addListener( listener )
	self._listeners[tostring(listener)] = {node = listener}
end

function BTTouchDispatcher:startListen( ... )
	self._isStop = false
	if not self._layer then
		self._layer = CCLayer:create()
		self._layer:registerScriptHandler(BTTouchDispatcher.onNodeEvent)
		CCDirector:sharedDirector():getRunningScene():removeChildByTag(394215, true)
		CCDirector:sharedDirector():getRunningScene():addChild(self._layer, 1, 394215)
	end
end

function BTTouchDispatcher:stopListen( ... )
	self._isStop = true
end

function BTTouchDispatcher:removeListener( listener )
	self._listeners[tostring(listener)] = nil
end

function BTTouchDispatcher:onTouchEvent(event, x, y)
	local self = instance
	if self._isStop then
		return
	end
	if event == "began" then
		for k, listener in pairs(self._listeners) do
			listener.isHandleTouch = listener.node:isTouched(ccp(x, y)) and listener.node:isTouchEnabled()
		end
	end
	local sortListeners = self:sortListeners()
	for i = 1, #sortListeners do
		local node = sortListeners[i]
		local listenerKey = tostring(node)
		local listener = self._listeners[listenerKey]
		if listener and listener.isHandleTouch then
			if listener.node.onTouchEvent ~= nil then
				local ret = listener.node:onTouchEvent(event, x, y)
				if ret == false then
					listener.isHandleTouch = false
				end
			end
		 	if listener.node:isSwallowTouch() then
				return true
			end
		end
		if event == "began" then
			local layer = tolua.cast(node, "CCLayer")
			if layer and layer:isTouchEnabled() and BTNode.isTouched(layer) then
				return false
			end
			if tolua.cast(node, "CCMenuItem") then
				return false
			end
		end
	end
	return false
end

function BTTouchDispatcher:onNodeEvent(event )
	local self = instance
	if event == "enter" then
		self._layer:registerScriptTouchHandler(BTTouchDispatcher.onTouchEvent, false, -999999999, true)
		self._layer:setTouchEnabled(true)
	elseif event == "exit" then
		self._layer:unregisterScriptTouchHandler()
	end
end

function BTTouchDispatcher:sortListeners( node, newListeners)
	if not node then
		node = CCDirector:sharedDirector():getRunningScene()
		newListeners = {}
	end 
	local childrenArray = node:getChildren()
	if not childrenArray then
		return
	end
	local children = {}
	for i = childrenArray:count() - 1, 0, -1 do
		local child = tolua.cast(childrenArray:objectAtIndex(i), "CCNode")
		table.insert(children, child)
		child.sortValue = i + child:getZOrder()
	end
	table.sort(children, BTTouchDispatcher.sortListenerComparator)
	for i = 1, #children do
		local child = children[i]
		self:sortListeners(child, newListeners)
		table.insert(newListeners, child)
	end
	return newListeners
end

function BTTouchDispatcher.sortListenerComparator(listen1, listen2)
	return listen1.sortValue <= listen2.sortValue
end
