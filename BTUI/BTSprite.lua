-- Filename: BTSprite.lua
-- Author: bzx
-- Date: 2015-04-25
-- Purpose: 

BTSprite = class("BTSprite", function (...)
	local args = {...}
	local createName = args[1]
	table.remove(args, 1)
	return CCSprite[createName](CCSprite, unpack(args))
end)

combine(BTNode, BTSprite)

function BTSprite:create(filename, rect)
	return BTSprite.new("create", filename, rect)
end

function BTSprite:createWithTexture( texture, rect )
	return BTSprite.new("createWithTexture", filename, rect)
end

function BTSprite:createWithSpriteFrame( spriteFrame )
	return BTSprite.new("createWithSpriteFrame", spriteFrame)
end

function BTSprite:createWithSpriteFrameName( spriteFrameName )
	return BTSprite.new("createWithSpriteFrameName", spriteFrameName)
end