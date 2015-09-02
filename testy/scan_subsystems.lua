#!/usr/bin/env luajit 

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

local UDVContext = require("UDVContext")


local ctxt, err = UDVContext();

print("{")
for _, row in ctxt:subsystems() do
	print(string.format("\t'%s',",row.Name))
end
print("}")
