#!/usr/bin/env luajit

-- print_hwdb.lua
package.path = package.path..";../?.lua"

local UDVHwdb = require("UDVHwdb")
local aliases = require("modalias")
local fun = require("fun")()
local ctxt, err = require("UDVContext")()
assert(ctxt ~= nil, "Error creating context")


local hwdb, err = UDVHwdb();

local function print_values(modalias)
	print(string.format("\t['%s'] = {", modalias));

	for _, entry in hwdb:entries(modalias) do		
		print(string.format("\t\t['%s'] = '%s',", entry.Name, entry.Value));
	end 

	print("\t\t},");
end

local function project_modalias(dev)
	return dev:getProperty("modalias")
end

print("{")
each(print_values, filter(function(x) return x ~= nil end, map(project_modalias,ctxt:devices())))

print("}")
