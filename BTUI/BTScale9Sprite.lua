-- Filename: BTScale9Sprite.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 

BTScale9Sprite = class("BTScale9Sprite", function (file, capInsets)
	local spriteFrame = CCSpriteFrame:create(file)
	if capInsets == nil then
		local size = spriteFrame:getOriginalSizeInPixels()
		capInsets = CCRect(size.width * 0.5 - 1, size.height * 0.5 - 1, size.width * 0.5 + 1, size.height * 0.5 + 1)
	end
	return CCScale9Sprite:createWithSpriteFrame(spriteFrame, capInsets)
end)

combine(BTNode, BTScale9Sprite)


function BTScale9Sprite:create(file, capInsets)
	return BTScale9Sprite:new(file, capInsets)
end