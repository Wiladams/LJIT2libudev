#!/usr/local/bin/luajit 

--[[
	This is standalone executable command 
	Use it like this:
	$ ./scan_subsystems.lua

	You will see a list of subsystems 
	If you luajit command is not in /usr/local/bin, change the 
	first line to reflect where it actually is.
	
	If you are chaining commands together, this is a source,
	not a sink
--]]

-- scan_subsystems.lua
package.path = package.path..";../?.lua"

local ffi = require("ffi")
local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")


local function UDVSubsystemQuery(udev)
	local enumerate = libudev.udev_enumerate_new(udev);
	ffi.gc(enumerate, libudev.udev_enumerate_unref);

	local res = libudev.udev_enumerate_scan_subsystems(enumerate);

	local listEntry = libudev.udev_enumerate_get_list_entry(enumerate);
	local results =  UDVListIterator(listEntry)

	return results
end 



local udev = libudev.udev_new();
ffi.gc(udev, libudev.udev_unref);

print("{")
for row in UDVSubsystemQuery(udev) do
	print(string.format("\t'%s',",row.Name))
end
print("}")
