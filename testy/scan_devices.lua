-- scan_devices.lua
package.path = package.path..";../?.lua"

local ffi = require("ffi")
local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")


local function UDVDeviceQuery(udev)
	local enumerate = libudev.udev_enumerate_new(udev);
	--ffi.gc(enumerate, libudev.udev_enumerate_unref);

	local res = libudev.udev_enumerate_scan_devices(enumerate);

	local listEntry = libudev.udev_enumerate_get_list_entry(enumerate);
	local results =  UDVListIterator(listEntry)

	return results
end 



local udev = libudev.udev_new();
ffi.gc(udev, libudev.udev_unref);

print("{")
for row in UDVDeviceQuery(udev) do
	print(string.format("\t'%s',",row:name()))
end
print("}")
