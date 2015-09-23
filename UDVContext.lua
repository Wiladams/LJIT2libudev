-- UDVContext.lua
local ffi = require("ffi")
local udev = require("udev_ffi")
local UDVListIterator = require("UDVListIterator")
local UDVListEntry = require("UDVListEntry")
local UDVDevice = require("UDVDevice")

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
	local ctxt = udev.udev_new();
	if ctxt == nil then
		return nil, "error with udev_new()"
	end

	ffi.gc(ctxt, udev.udev_unref);
	
	return self:init(ctxt)
end

-- Get a specific device from a syspath
function UDVContext.deviceFromSysPath(self, syspath)
	local dev = udev.udev_device_new_from_syspath(self.Handle, syspath)
	if dev == nil then
		return nil;
	end

	return UDVDevice:init(self, dev, syspath);
end

-- Iterators

--[[
	When you scan_devices, the Name field contains the system
	path of the device.  This value can be used in a subsequent 
	call to get the actual device: 
		udev_device_new_from_syspath(udev, syspath)

--]]
local function UDVDeviceIterator(ctxt, currentEntry)
	--print("UDVListIterator: ", currentEntry, handle)
	if currentEntry == nil then
		return nil;
	end
	
	local entry = UDVListEntry(currentEntry)
	-- if we have an entry, but for some reason the name == nil
	-- then just return nil
	if entry.Name == nil then
		return nil;
	end
	
	-- get the next entry before returning
	local nextEntry = udev.udev_list_entry_get_next(currentEntry)
	--print("nextEntry: ", nextEntry)
	
	-- return nextState, currentState
	return nextEntry, ctxt:deviceFromSysPath(entry.Name);
end

function UDVContext.devices(self)
	-- create the query object
	local enumerate = udev.udev_enumerate_new(self.Handle);
	--ffi.gc(enumerate, udev.udev_enumerate_unref);

	-- fill it with results
	local res = udev.udev_enumerate_scan_devices(enumerate);

	local listEntry = udev.udev_enumerate_get_list_entry(enumerate);

	return UDVDeviceIterator, self, listEntry 
end 

function UDVContext.subsystems(self)
	local enumerate = udev.udev_enumerate_new(self.Handle);
	ffi.gc(enumerate, udev.udev_enumerate_unref);

	local res = udev.udev_enumerate_scan_subsystems(enumerate);

	local listEntry = udev.udev_enumerate_get_list_entry(enumerate);
	
	return  UDVListIterator, listEntry, listEntry
end 

return UDVContext
