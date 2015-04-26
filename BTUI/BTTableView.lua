-- Filename: BTTableView.lua
-- Author: bzx
-- Date: 2015-04-26
-- Purpose:

BTTableView = class("BTTableView", function (eventHandler, viewSize)
	return LuaTableView:createWithHandler(eventHandler, viewSize)
end)

combine(BTScrollView, BTTableView)

BTTableView._objects = {}

function BTTableView:ctor( ... )
	BTScrollView.ctor(self)
	self._cells = {}
	self._eventHandler = nil
end

function BTTableView:create(eventHandler, viewSize)
	viewSize = viewSize or g_winSize
	local handler = LuaEventHandler:create(BTTableView.eventHandler)
	local ret = BTTableView.new(handler, viewSize)
	ret._eventHandler = eventHandler
	BTTableView._objects[tostring(ret)] = ret
	ret:reloadData()
	return ret
end

function BTTableView.eventHandler(functionName, tableView, index, cell)
	-- fuctionName = "cellSize", "cellAtIndex", "numberOfCells", "cellTouched", "scroll"
	local self = BTTableView._objects[tostring(tableView)]
	if self == nil then
		return 0
	end
	if self._eventHandler == nil then
		return 0
	end
	if cell ~= nil then
		cell = self._cells[tostring(cell)]
	end


	self._eventHandler = function ( functionName, tableView, index, cell )
		if functionName == "cellSize" then
			return CCSizeMake(100, 30)
		elseif functionName == "cellAtIndex" then
			local cell = CCTableView:create()
			local layer = CCLayerColor:create(ccc4(0xff, 0, 0, 0xff), 100, 30)
			cell:addChild(layer)
			return cell
		elseif functionName == "numberOfCells" then
			return 10
		elseif functionName == "cellTouched" then
		elseif functionName == "scroll" then
		end
	end

	local ret = self._eventHandler(functionName, tableView, index, cell)
	if functionName == "cellAtIndex" then
		self._cells[tostring(ret)] = ret
	end
	return ret
end

function BTScrollView:getCellByIndex( index )
	local cell = self:tableCellAtIndex(index)
	return self._cells[tostring(cell)]
end

function BTTableView:setEventHandler( eventHandler )
	self._eventHandler = eventHandler
end