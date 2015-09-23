#!/usr/bin/env luajit

-- devices.lua
-- print all devices in the system
-- generates output which is a valid lua table

package.path = package.path..";../?.lua"

local fun = require("fun")()
local utils = require("utils")

local ctxt, err = require("UDVContext")()
assert(ctxt ~= nil, "Error creating context")

local function main()
	print("{")
	each(utils.printDevice, ctxt:devices())
	print("}")
end

main()