BTButton = class("BTButton", function ( ... )
	return BTNode:create()
end)

function BTButton:ctor()
	self._normal = nil
	self._selected = nil
	self._disable = nil
end

function BTButton:createWithImage( normalImage, selectedImage, disableImage)

end


