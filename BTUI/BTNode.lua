BTNode = class("BTNode", function ( ... )
	return CCNode:create()
end)

function BTNode:ctor()
	self._childre = {}
end

function BTNode:create()
	local ret = BTNode:new()
	return ret
end

function BTNode:addNode( node, zOrder, tag )
	self._childre[node:getName()] = node
	self:addChild(node, zOrder, tag)
end

function BTNode:getChildByName( name )
	return self._childre[name]
end