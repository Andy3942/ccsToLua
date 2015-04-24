-- Filename: BTButton.lua
-- Author: bzx
-- Date: 2015-04-24
-- Purpose: 按钮

BTButton = class("BTButton", function ( ... )
	return BTNode:create()
end)

BTButton.Status = {
	unselected 	= 1,
	selected 	= 2,
	enabled 	= 3,	
}

function BTButton:ctor()
	self._normal = nil
	self._selected = nil
	self._disable = nil
	self._scale9Enabled = false
	self._status = self.Status.unselected
end

function BTButton:createWithImage( normalImage, selectedImage, disableImage)

end

function BTButton:createWithSprite( normal, selected, disable )
end

function BTButton:setScale9Eabled( enable )
	self._scale9Enabled = enable
end

function BTButton:initWithImage( normalImage, selectedImage, disableImage )
end

function BTButton:initWithNode( normal, selected, disable )
end

function BTButton:setNormal( normal )
	if self._normal then
		self._normal:removeFromParent()
	end
	self._normal = normal
	self:addNode(normal)
	self:updateContentSize()
	normal:setPosition(point(0.5, 0.5, self))
end

function BTButton:getNormal( ... )
	return self._normal
end

function BTButton:setSelected( selected )
	if self._selected then
		self._selected:removeFromParent()
	end
	self._selected = selected
	self:addNode(selected)
	selected:setPosition(point(0.5, 0.5, self))
end

function BTButton:getSelected( ... )
	return self._selected
end

function BTButton:setDisable( disable )
	if self._disable then
		self._disable:removeFromParent()
	end
	self._disable = disable
	self:addNode(disable)
	self:setPosition(point(0.5, 0.5, self))
end

function BTButton:updateContentSize( ... )
	self:setContentSize(self._normal:getContentSize())
end

function BTButton:setSize( size )
	self:setContentSize(size)
end

function BTButton:setEnabled( enabled )
	if enabled then
		self:setStatus(self.Status.unselected)
	else
		self:setStatus(self.Status.disable)
	end
end

function BTButton:setStatus( status )
	if self._status ~= status then
		self._status = status
		self:updateVisibility()
	end
end

function BTButton:isEnabled( ... )
	return self._status ~= self.Status.enabled
end

function updateVisibility( ... )
	local normal_visible = true
	local selected_visible = false
	local disable_visible = false
	if not self._enabled then
		if self._disable then
			normal_visible = false
			selected_visible = false
			disable_visible = true
		else
			normal_visible = true
			selected_visible = false
			disable_visible = false
		end
	end
	if self._normal then
		self._normal:setVisible(normal_visible)
	end
	if self._selected then
		self._selected:setVisible(selected_visible)
	end
	if self._enabled then
		self._disable:setVisible(disable_visible)
	end
end

function onTouchEvent( event )
	-- body
end

