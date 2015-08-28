-- UDVContext.lua
local ffi = require("ffi")
local libudev = require("libudev_ffi")

local UDVContext = {}
setmetatable(UDVContext, {
	__call = function(self, ...)
	end,

})

local UDVContext_mt = {
	__index = UDVContext;
}


function UDVContext.init(self, handle)
	local obj = {
		Handle = handle;
	}
end

function UDVContext.new(self)
	local udev = libudev.udev_new();
	if udev == nil then
		return nil, "error with udev_new()"
	end

	ffi.gc(udev, libudev.udev_unref);
	
	return self:init(udev)
end

return UDVContext
