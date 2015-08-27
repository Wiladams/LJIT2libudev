local ffi = require("ffi")
local libudev = require("libudev_ffi")

local function safeffistring(str)
  --print("safeffistring: ", str)
    if str == nil then
        str = "BLANK"
    end

    return ffi.string(str);
end


local UDVListEntry = {}
setmetatable(UDVListEntry, {
	__call = function(self, ...)
		return self:new(...)
	end,
})

local UDVListEntry_mt = {
	__index = UDVListEntry;
}

function UDVListEntry.init(self, handle)
	local obj = {
		Handle = handle;
	}
	setmetatable(obj, UDVListEntry_mt);

	return obj;
end


function UDVListEntry.new(self, handle)
	if handle == nil then
		return nil, "invalid argument"
	end

	return self:init(handle);
end

function UDVListEntry.name(self)
	return safeffistring(libudev.udev_list_entry_get_name(self.Handle));
end

function UDVListEntry.value(self)
	return safeffistring(libudev.udev_list_entry_get_value(self.Handle));
end

return UDVListEntry
