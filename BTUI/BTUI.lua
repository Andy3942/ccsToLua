-- Filename: BTUI.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 公用方法

combine = function (src, dest)
	for k, v in pairs(src) do 
		dest[k] = v
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

require ""