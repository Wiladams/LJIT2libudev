#!/usr/local/bin/luajit 

-- scan_subsystems.lua
package.path = package.path..";../?.lua"

local ffi = require("ffi")
local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")

--[[
	When you scan_devices, the Name field contains the system
	path of the device.  This value can be used in a subsequent 
	call to get the actual device: 
		udev_device_new_from_syspath(udev, syspath)

--]]
local function UDVDeviceQuery(udev)
	local enumerate = libudev.udev_enumerate_new(udev);
	ffi.gc(enumerate, libudev.udev_enumerate_unref);

	local res = libudev.udev_enumerate_scan_devices(enumerate);

	local listEntry = libudev.udev_enumerate_get_list_entry(enumerate);
	local results =  UDVListIterator(listEntry)

	return results
end 



local udev = libudev.udev_new();
ffi.gc(udev, libudev.udev_unref);

print("{")
for row in UDVDeviceQuery(udev) do
	print(string.format("\t['%s'] = {",row.Name))
	local dev = libudev.udev_device_new_from_syspath(udev, row.Name)

	local listEntry = libudev.udev_device_get_properties_list_entry(dev);
	local props =  UDVListIterator(listEntry)

	print(string.format("\t\tproperties = {"))
	for prop in UDVListIterator(listEntry) do
		print(string.format("\t\t\t['%s'] = '%s',", prop.Name, prop.Value))
	end
	print(string.format("\t\t},"))
	print(string.format("\t},"))
end
print("}")
