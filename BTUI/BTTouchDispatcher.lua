-- Filename: BTTouchDispatcher.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 触摸事件调度器

BTTouchDispatcher = class("BTTouchDispatcher", {})

function BTTouchDispatcher.ctor()
	self.new = nil
	self._listeners = {}
	self._layer = nil
	self._isStop = false
end

function BTTouchDispatcher:getInstance()
	return self
end

function BTTouchDispatcher:addEventListener( listener )
	self._listeners[tostring(listener.uerdata)] = {node = listener}
end

function BTTouchDispatcher:startListen( ... )
	self._isStop = false
	if not self._layer then
		self._layer = CCLayer:create()
		CCDirector:sharedDirector():getRunningScene():addChild(self._layer)
		self._layer:registerScriptHandler(self.onNodeEvent)
	end
end

function BTTouchDispatcher:stopListen( ... )
	self._isStop = true
end

function BTTouchDispatcher:onTouchEvent(event, x, y)
	if self._isStop then
		return
	end
	if event == "began" then
		for k, listener in pairs(self._listeners) do
			listener.isHandleTouch = listener.node:isTouched(ccp(x, y))
		end
	end
	local sortListeners = self:sortListener()
	for i = 1, #sortListeners do
		local listenerAddress = tostring(sortListeners[i])
		local listener = self._listeners[listenerAddress]
		if listener.isHandleTouch then
			if listener.node.onTouchEvent ~= nil then
				local ret = listener.node:onTouchEvent(event, x, y)
				if ret == false then
					listener.isHandleTouch = false
				end
			end
		 	if listener:isSwallowTouch() then
				break
			end
		end
	end
end

function BTTouchDispatcher:onNodeEvent( event )
	if event == "enter" then
		self._layer:registerScriptTouchHandler(self.onTouchEvent,false, -999999999, false)
	elseif event == "exit" then
		self._layer:unregisterScriptTouchHandler()
	end
end

function BTTouchDispatcher:sortListeners( node, newListeners)
	if not node then
		node = CCDirector:sharedDirector():getRunningScene()
		newListeners = {}
	end 
	local childrenArray = scene:getChildren()
	local children = {}
	for i = childrenArray:count(), 0, -1 do
		local child = childrenArray:objectAtIndex(i)
		if self._listeners[tostring(child)] then
			table.insert(children, child)
			child.sortValue = i + child:getZOrder()
		end
	end
	table.sort(children, self.sortListenerComparator)
	for i = 1, #children do
		local child = children[i]
		self:sortListeners(child, newListeners)
		table.insert(newListeners, child)
	end
	return newListeners
end

function BTTouchDispatcher:sortListenerComparator(listen1, listen2)
	return listen1.sortValue < listen2.sortValue
end
