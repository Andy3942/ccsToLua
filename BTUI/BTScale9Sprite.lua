-- Filename: BTScale9Sprite.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 

BTScale9Sprite = class("BTScale9Sprite", function ( ... )
	return CCScale9Sprite:create()
end)

for k,v in pairs(BTNode) do BTScale9Sprite[k] = v end


function BTScale9Sprite:( ... )
	-- body
end