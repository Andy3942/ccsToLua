-- Filename: BTLabel.lua
-- Author: bzx
-- Date: 2015-04-25
-- Purpose: 文本

require "script/libs/LuaCCLabel"

BTLabel = class("BTLabel", function ()
	return BTNode:create()
end)

BTLabel._label = nil
BTLabel._ritchInfo = nil

function BTLabel:create(text,  fontName, fontSize)
	text = text or ""
	fontName = fontName or g_sFontName
	fontSize = fontSize or 20
	local ret = BTLabel.new()
	local label = CCLabelTTF:create(text, fontName, fontSize)
	ret:addChild(label)
	label:setAnchorPoint(ccp(0, 0))
	label:setPosition(ccp(0, 0))
	ret._label = label
	for k, v in pairs(getmetatable(label)) do
		if not self[k] then
			self[k] = function ( ... )
				label[k](label, ...)
			end
		end
	end
	ret:updateNodeSize()
	return ret
end

function BTLabel:setRichInfo(richInfo)
	self._ritchInfo = richInfo
	self:refresh()
end

function BTLabel:getRichInfo( ... )
	return self._ritchInfo
end

function BTLabel:refresh( ... )
	if self._ritchInfo == nil then
		return
	end
	if self._label ~= nil then
		self._label:removeFromParentAndCleanup(true)
	end
	self._label = LuaCCLabel.createRichLabel(self._ritchInfo)
	self:addChild(self._label)
	self._label:setAnchorPoint(ccp(0, 0))
	self._label:setPosition(ccp(0, 0))
	self:updateNodeSize()
end

function BTLabel:setString( text )
	self._label:setString(text)
	self:updateNodeSize()
end

function BTLabel:setDimensions(dim)
	self._label:setDimensions(dim)
	self:updateNodeSize()
end

function BTLabel:setFontName( fontName )
	self._label:setFontName(fontName)
	self:updateNodeSize()
end

function BTLabel:setFontSize( fontSize )
	self._label:setFontSize(fontSize)
	self:updateNodeSize()
end

function BTLabel:updateNodeSize( ... )
	self:setNodeSize(self._label:getContentSize())
end

function BTLabel:setNodeColor(color)
	if color.a == nil then
		self._label:setColor(color)
	else
		local newColor = ccc3(color.r, color.g, color4.b)
		local opacity = color.a
		self._label:setColor(newColor)
		self._label:setOpacity(opacity) 
	end
end

function BTLabel:setNodeOpacity( opacity )
	self._label:setOpacity(opacity)
end