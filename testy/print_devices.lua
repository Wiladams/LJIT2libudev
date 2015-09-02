#!/usr/bin/env luajit
-- scan_subsystems.lua
package.path = package.path..";../?.lua"

local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")
local UDVContext = require("UDVContext")



local ctxt, err = UDVContext();

print("{")
for _, row in ctxt:devices() do
	print(string.format("\t['%s'] = {",row.Name))

	local dev = libudev.udev_device_new_from_syspath(ctxt.Handle, row.Name)
	local listEntry = libudev.udev_device_get_properties_list_entry(dev);

	print(string.format("\t\tproperties = {"))
	for _, prop in UDVListIterator, listEntry, listEntry do
		print(string.format("\t\t\t['%s'] = '%s',", prop.Name, prop.Value))
	end
	print(string.format("\t\t},"))
	print(string.format("\t},"))
end
print("}")
