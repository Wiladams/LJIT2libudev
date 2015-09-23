-- UDVListIterator.lua
-- this is a generator, which contains an implicit
-- map to go from the C struct to the Lua table

local udev = require("udev")
local UDVListEntry = require("UDVListEntry")

local function UDVListIterator(listHead, currentEntry)
	if currentEntry == nil then
		return nil;
	end
	
	local entry = UDVListEntry(currentEntry)
	-- if we have an entry, but for some reason the name == nil
	-- then just return nil
	if entry.Name == nil then
		return nil;
	end
	
	-- get the next entry before returning
	local nextEntry = udev.udev_list_entry_get_next(currentEntry)

	return nextEntry, entry;
end

return UDVListIterator;
