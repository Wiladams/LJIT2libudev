#!/usr/bin/env luajit 

--[[
	This is standalone executable command 
	Use it like this:
	$ ./scan_subsystems.lua
	
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
