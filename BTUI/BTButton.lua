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
	disabled 	= 3,	
}

BTButton.Event = {
	pressed 	= 1,
	moved 		= 2,
	touchEnd    = 3,
}

function BTButton:ctor()
	BTNode.ctor(self)
	self._normal = nil
	self._selected = nil
	self._disabled = nil
	self._scale9Enabled = false
	self._status = self.Status.unselected
	self._touchBeganPosition = nil
	self._touchEndPosition = nil
	self._touchBeganWorldPosition = nil
	self._clickCallback = nil
	self._isSwallowTouch = true
	self._capInsets = nil
end

function BTButton:createWithImage( normalImage, selectedImage, disabledImage, scale9Enabled)
	local ret = BTButton.new()
	ret:initWithImage(normalImage, selectedImage, disabledImage, scale9Enabled)
	return ret
end

function BTButton:createWithNode( normal, selected, disabled)
	local ret = BTButton.new()
	ret:initWithNode(normal, selected, disabled)
	return ret
end

function BTButton:setScale9Eabled( enable )
	self._scale9Enabled = enable
end

function BTButton:initWithImage( normalImage, selectedImage, disabledImage, scale9Enabled )
	self._scale9Enabled = scale9Enabled or false
	local normal = nil
	local selected = nil
	local disabled = nil
	if scale9Enabled then
		normal = BTScale9Sprite:create(normalImage)
		if selectedImage then
			selected = BTScale9Sprite:create(selectedImage)
		end
		if disabledImage then
			disabled = BTScale9Sprite:create(disabledImage)
		end
	else
		normal = BTSprite:create(normalImage)
		if selectedImage then
			selected = BTSprite:create(selectedImage)
		end
		if selectedImage then
			disabled = BTSprite:create(disabledImage)
		end
	end
	self:initWithNode(normal, selected, disabled)
end

function BTButton:initWithNode( normal, selected, disabled )
	self._normal = normal
	self._selected = selected
	self._disabled = disabled
	self:addNode(normal)
	if self._selected then
		self:addNode(selected)
	end
	if self._disabled then
		self:addNode(disabled)
	end
	self:updateContentSize()
	self:updateVisibility()
	self:setTouchEnabled(true)
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

function BTButton:setCapInsets( capInsets )
	self._capInsets = capInsets
	if self._scale9Enabled then
		self._normal:setCapInsets(capInsets)
		if self._selected then
			self._selected:setCapInsets(capInsets)
		end
		if self._disabled then
			self._disabled:setCapInsets(capInsets)
		end
	end
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

function BTButton:setDisabled( disabled )
	if self._disabled then
		self._disabled:removeFromParent()
	end
	self._disabled = disabled
	self:addNode(disabled)
	self:setPosition(point(0.5, 0.5, self))
end

function BTButton:updatePosition( ... )
	local anchorPoint = ccp(0.5, 0.5)
	local position = point(0.5, 0.5, self)
	self._normal:setAnchorPoint(anchorPoint)
	self._normal:setPosition(position)
	if self._selected then
		self._selected:setAnchorPoint(anchorPoint)
		self._selected:setPosition(position)
	end
	if self._disabled then
		self._disabled:setAnchorPoint(anchorPoint)
		self._disabled:setPosition(position)
	end
end

function BTButton:updateContentSize( ... )
	self:setNodeSize(self._normal:getContentSize())
end

function BTButton:setNodeSize( nodeSize )
	self._nodeSize = nodeSize
	self:setContentSize(nodeSize)
	if self._scale9Enabled then
		self._normal:setContentSize(nodeSize)
		if self._selected then
			self._selected:setContentSize(nodeSize)
		end
		if self._disabled then
			self._disabled:setContentSize(nodeSize)
		end
	end
	self:updatePosition()
end

function BTButton:setEnabled( enabled )
	if enabled then
		self:setStatus(self.Status.unselected)
	else
		self:setStatus(self.Status.disabled)
	end
end

function BTButton:setStatus( status )
	if self._status ~= status then
		self._status = status
		self:updateVisibility()
	end
end

function BTButton:isEnabled( ... )
	return self._status ~= self.Status.disabled
end

function BTButton:updateVisibility( ... )
	local normal_visible = true
	local selected_visible = false
	local disabled_visible = false
	if self._status == BTButton.Status.disabled then
		if self._disabled then
			normal_visible = false
			disabled_visible = true
		end
	elseif self._status == BTButton.Status.selected then
		if self._selected then
			normal_visible = false
			selected_visible = true
		end
	end
	if self._normal then
		self._normal:setVisible(normal_visible)
	end
	if self._selected then
		self._selected:setVisible(selected_visible)
	end
	if self._disabled then
		self._disabled:setVisible(disabled_visible)
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
		self:setStatus(BTButton.Status.selected)
	elseif event == "moved" then
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
