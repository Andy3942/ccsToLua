-- Filename: BTPanel.lua
-- Author: bzx
-- Date: 2015-04-26
-- Purpose: 

BTPanel = class("BTPanel", function (color, size)
	color = color or ccc4(0, 0, 0, 0)
	size = size or g_winSize
	return BTLayerColor:create(color, size.width, size.height)
end)

function BTPanel:create(color, size)
	return BTPanel.new(color, size)
end