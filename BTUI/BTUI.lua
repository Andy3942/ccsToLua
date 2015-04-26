-- Filename: BTUI.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 公用方法

combine = function (src, dest)
	local functions = {}
	functions.__create = true
	functions.__cname = true
	functions.new = true
	for k, v in pairs(src) do
		if functions[k] ~= true then
			dest[k] = v
		end
	end
end

point = function ( x, y, node )
	if node then
		if x <= 1 and x >= -1 then
			x = node:getContentSize().width * x
		end
		if y <= 1 and y >= -1 then
			y = node:getContentSize().height * y
		end
	end
	return ccp(x, y)
end
local fp = io.open("/Users/bzx/Documents/sango/FknSango/CardSango/Resources/script/ccsToLua/BTUI/log.lua", "w")
fp:write("")
fp:close()