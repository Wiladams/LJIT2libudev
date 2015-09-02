-- UDVContext.lua
local ffi = require("ffi")
local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")


local UDVContext = {}
setmetatable(UDVContext, {
	__call = function(self, ...)
		return self:new(...);
	end,

})

local UDVContext_mt = {
	__index = UDVContext;
}


function UDVContext.init(self, handle)
	local obj = {
		Handle = handle;
	}
	setmetatable(obj, UDVContext_mt);
	
	return obj;
end

function UDVContext.new(self)
	local udev = libudev.udev_new();
	if udev == nil then
		return nil, "error with udev_new()"
	end

	ffi.gc(udev, libudev.udev_unref);
	
	return self:init(udev)
end


--[[
	When you scan_devices, the Name field contains the system
	path of the device.  This value can be used in a subsequent 
	call to get the actual device: 
		udev_device_new_from_syspath(udev, syspath)

--]]
function UDVContext.devices(self)
	-- create the query object
	local enumerate = libudev.udev_enumerate_new(self.Handle);
	--ffi.gc(enumerate, libudev.udev_enumerate_unref);

	-- fill it with results
	local res = libudev.udev_enumerate_scan_devices(enumerate);

	-- get the results
	local listEntry = libudev.udev_enumerate_get_list_entry(enumerate);
	--local results =  UDVListIterator(listEntry)
	return UDVListIterator, listEntry, listEntry 
end 

function UDVContext.subsystems(self)
	local enumerate = libudev.udev_enumerate_new(self.Handle);
	ffi.gc(enumerate, libudev.udev_enumerate_unref);

	local res = libudev.udev_enumerate_scan_subsystems(enumerate);

	local listEntry = libudev.udev_enumerate_get_list_entry(enumerate);
	
	return  UDVListIterator, listEntry, listEntry
end 

return UDVContext
