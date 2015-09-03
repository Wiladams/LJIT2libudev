-- UDVDevice.lua
local libudev = require("libudev_ffi")
local UDVListIterator = require("UDVListIterator")

local UDVDevice = {}
setmetatable(UDVDevice, {
	__call = function(self, ...)
		return UDVDevice:new(...)
	end,
})
local UDVDevice_mt = {
	__index = UDVDevice;
}

--[[
int udev_device_get_is_initialized(struct udev_device *udev_device);
struct udev_list_entry *udev_device_get_devlinks_list_entry(struct udev_device *udev_device);
struct udev_list_entry *udev_device_get_properties_list_entry(struct udev_device *udev_device);
struct udev_list_entry *udev_device_get_tags_list_entry(struct udev_device *udev_device);
struct udev_list_entry *udev_device_get_sysattr_list_entry(struct udev_device *udev_device);
const char *udev_device_get_property_value(struct udev_device *udev_device, const char *key);
unsigned long long int udev_device_get_seqnum(struct udev_device *udev_device);
unsigned long long int udev_device_get_usec_since_initialized(struct udev_device *udev_device);
const char *udev_device_get_sysattr_value(struct udev_device *udev_device, const char *sysattr);
int udev_device_set_sysattr_value(struct udev_device *udev_device, const char *sysattr, char *value);
int udev_device_has_tag(struct udev_device *udev_device, const char *tag);
--]]

function UDVDevice.init(self, ctxt, handle, syspath)
	local obj = {
		Context = ctxt;
		Handle = handle;

		Name = syspath;
		DevPath = libudev.safeffistring(libudev.udev_device_get_devpath(handle));		
		Subsystem = libudev.safeffistring(libudev.udev_device_get_subsystem(handle));		
		DevType = libudev.safeffistring(libudev.udev_device_get_devtype(handle));		
		SysPath = libudev.safeffistring(libudev.udev_device_get_syspath(handle));		
		SysName = libudev.safeffistring(libudev.udev_device_get_sysname(handle));		
		SysNum = libudev.safeffistring(libudev.udev_device_get_sysnum(handle));		
		DevNode = libudev.safeffistring(libudev.udev_device_get_devnode(handle));		
		Driver = libudev.safeffistring(libudev.udev_device_get_driver(handle));
		Action = libudev.safeffistring(libudev.udev_device_get_action(handle));
		
		IsInitialized = libudev.udev_device_get_is_initialized(handle)==1;
	}
	setmetatable(obj, UDVDevice_mt)

	return obj;
end

function UDVDevice.new(self, ctxt, syspath)
	local dev = libudev.udev_device_new_from_syspath(ctxt.Handle, syspath)
	if dev == nil then
		return nil;
	end

	return self:init(ctx, handle, syspath)
end

function UDVDevice.properties(self)
	local listEntry = libudev.udev_device_get_properties_list_entry(self.Handle);

	return UDVListIterator, listEntry, listEntry;
end

return UDVDevice
