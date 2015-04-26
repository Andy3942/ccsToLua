-- Filename: BTLayerColor.lua
-- Author: bzx
-- Date: 2015-04-25
-- Purpose: 

BTLayerColor = class("BTLayerColor", function (color, width, height)
	color = color or ccc4(0, 0, 0, 0)
	width = width or g_winSize.width
	height = height or g_winSize.height
	return CCLayerColor:create(color, width, height)
end)

combine(BTLayer, BTLayerColor)

function BTLayerColor:create( color, width, height )
	return BTLayerColor.new(color, width, height)
end