#!/usr/bin/env luajit 

--[[
	This is standalone executable command 
	Use it like this:
	$ ./scan_subsystems.lua
	
	This command will generate a list, single string 
	per line, of all the subsystems found.
--]]

-- scan_subsystems.lua
package.path = package.path..";../?.lua"

local UDVContext = require("UDVContext")

local ctxt, err = UDVContext();

for _, row in ctxt:subsystems() do
	print(row.Name)
end
