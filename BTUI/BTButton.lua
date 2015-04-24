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

BTButton.Event = {
	pressed 	= 1,
	moved 		= 2,
	touchEnd    = 3,
}

function BTButton:ctor()
	self._normal = nil
	self._selected = nil
	self._disable = nil
	self._scale9Enabled = false
	self._status = self.Status.unselected
	self._size = CCSizeMake(0, 0)
	self._touchBeganPosition = nil
	self._touchEndPosition = nil
	self._touchBeganWorldPosition = nil
	self._clickCallback = nil
end

function BTButton:createWithImage( normalImage, selectedImage, disableImage, scale9Enabled)
	self:initWithImage(normalImage, selectedImage, disableImage, scale9Enabled)
end

function BTButton:createWithNode( normal, selected, disable)
	self:initWithNode(normal, selected, disable)
end

function BTButton:setScale9Eabled( enable )
	self._scale9Enabled = enable
end

function BTButton:initWithImage( normalImage, selectedImage, disableImage, scale9Enabled )
	self._scale9Enabled = scale9Enabled or false
	local normal = nil
	local selected = nil
	local disable = nil
	if scale9Enabled then
		normal = BTScale9Sprite:create(normalImage)
		if selectedImage then
			selected = BTScale9Sprite:create(selectedImage)
		end
		if disableImage then
			disable = BTScale9Sprite:create(disableImage)
		end
	else
		normal = BTSprite:create(normalImage)
		if selectedImage then
			selected = BTSprite:create(selectedImage)
		end
		if selectedImage then
			disable = BTSprite:create(disableImage)
		end
	end
	self:initWithNode(normal, selected, disable)
end

function BTButton:initWithNode( normal, selected, disable )
	self._normal = normal
	self._selected = selected
	self._disable = disable
	self:addNode(normal)
	self:updateContentSize()
	
	self:updateVisibility()
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

function BTButton:setSize( size )
	self._size = size
	if self._scale9Enabled then
		normal:setContentSize(size)
		if selected then
			selected:setContentSize(size)
		end
		if disable then
			selected:setContentSize(size)
		end
	end
	self:setContentSize(size)
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

function BTButton:updatePosition( ... )
	local anchorPoint = ccp(0.5, 0.5)
	local position = point(0.5, 0.5, self)
	normal:setAnchorPoint(anchorPoint)
	normal:setPosition(position)
	if selected then
		selected:setAnchorPoint(anchorPoint)
		selected:setPosition(position)
	end
	if disable then
		disable:setAnchorPoint(anchorPoint)
		disable:setPosition(position)
	end
end

function BTButton:updateContentSize( ... )
	self:setSize(self._normal:getContentSize())
end

function BTButton:setSize( size )
	self._size = size
	self:setContentSize(size)
	if self._scale9Enabled then
		self._normal:setContentSize(size)
		if selected then
			self._selected:setContentSize(size)
		end
		if disable then
			self._disable:setContentSize(size)
		end
	end
	self:updatePosition()
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

function BTButton:updateVisibility( ... )
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

function BTButton:setClickCallback( callback )
	self._clickCallback = callback
end

function BTButton:onTouchEvent( event, x, y )
	local position = ccp(x, y)
	if event == "began" then
		self._touchBeganPosition = ccp(x, y)
		self._touchBeganWorldPosition = self:getWorldPosition()
	elseif event = "moved" then
		if not self:isTouched(position) then
			self:setStatus(BTButton.Status.unselected)
			return false
		end
		local worldPosition = self:getWorldPosition()
		if not worldPosition:equals(self._touchBeganWorldPosition) then
			self:setStatus(BTButton.Status.unselected)
			return false
		end
	else
		local worldPosition = self:getWorldPosition()
		if worldPosition:equals(self._touchBeganWorldPosition) then
			if self._clickCallback ~= nil then
				self._clickCallback(self:getTag(), self)
			end
		end
		self:setStatus(BTButton.Status.unselected)
	end
end
