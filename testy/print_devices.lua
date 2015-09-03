#!/usr/bin/env luajit

-- print_devices.lua
-- print out all the devices in the system
-- can be chained with other commands to provide filters and such
-- generates a string which is a valid lua table
package.path = package.path..";../?.lua"

local ctxt, err = require("UDVContext")()
assert(ctxt ~= nil, "Error creating context")

local function printField(name, value)
	if value ~= nil then
		print(string.format("\t\t%s = '%s';", name, value));
	end
end

print("{")
for _, dev in ctxt:devices() do


	print(string.format("\t['%s'] = {",dev.SysName));
	printField("DevPath", dev.DevPath);
	printField("Subsystem", dev.Subsystem);
	printField("DevType", dev.DevType);
	printField("SysPath", dev.SysPath);
	printField("SysName", dev.SysName);
	printField("SysNum", dev.SysNum);
	printField("DevNode", dev.DevNode);
	printField("Driver", dev.Driver);
	printField("Action", dev.Action);
	printField("IsInitialized", dev.IsInitialized);

	local firstone = true
	for _, prop in dev:properties() do
		if firstone then
			print(string.format("\t\tproperties = {"))
			firstone = not firstone;
		end

		print(string.format("\t\t\t['%s'] = '%s',", prop.Name, prop.Value))
	end
	if not firstone then
		print(string.format("\t\t},"))
	end

	firstone = true;
	for _, tag in dev:tags() do
		if firstone then
			print(string.format("\t\ttags = {"))
			firstone = not firstone
		end

		print(string.format("\t\t\t'%s',", tag.Name))
	end
	if not firstone then
		print(string.format("\t\t},"))
	end
	
	print(string.format("\t},"))
end
print("}")
