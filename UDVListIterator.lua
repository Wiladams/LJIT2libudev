-- UDVListIterator.lua
local ffi = require("ffi")
local libudev = require("libudev_ffi")
local UDVListEntry = require("UDVListEntry")


local function UDVListIterator(handle)
	local firstttime = true;
	local currentEntry = handle;

	local function closure()
		if firsttime then
			firsttime = not firsttime;
			return currentEntry
		end

		currentEntry = libudev.udev_list_entry_get_next(currentEntry)

		-- you might be tempted to just return currentEntry without
		-- checking 'nil', but a cdata value that is nil is very different
		-- from straight up 'nil' as far as terminating an iterator
		if currentEntry == nil then
			return nil;
		end

		return UDVListEntry(currentEntry)
	end

	return closure;
end

return UDVListIterator;
