-- print_hwdb.lua
package.path = package.path..";../?.lua"

local UDVHwdb = require("UDVHwdb")
local aliases = require("modalias")

local hwdb, err = UDVHwdb();

local function print_values(modalias)
	print(string.format("\t['%s'] = {", modalias));

	for entry in hwdb:entries(modalias) do		
		print(string.format("\t\t['%s'] = '%s',", entry.Name, entry.Value));
	end 

	print("\t\t},");
end

print("{")
for _, alias in ipairs(aliases) do
	print_values(alias)
end
print("}")
