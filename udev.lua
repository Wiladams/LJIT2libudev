local ffi = require("ffi")

local Lib_udev = require("udev_ffi")

local function safeffistring(str)
    if str == nil then
        return nil;
    end

    return ffi.string(str);
end

local exports = {
    Lib_udev = Lib_udev;  

    -- library functions
    udev_new = Lib_udev.udev_new;
    udev_unref = Lib_udev.udev_unref;


    udev_device_new_from_syspath = Lib_udev.udev_device_new_from_syspath;
    udev_device_get_action = Lib_udev.udev_device_get_action;
    udev_device_get_devtype = Lib_udev.udev_device_get_devtype;
    udev_device_get_devnode = Lib_udev.udev_device_get_devnode;
    udev_device_get_devpath = Lib_udev.udev_device_get_devpath;
    udev_device_get_driver = Lib_udev.udev_device_get_driver;
    udev_device_get_is_initialized = Lib_udev.udev_device_get_is_initialized;
    udev_device_get_parent = Lib_udev.udev_device_get_parent;
    udev_device_get_parent_with_subsystem_devtype = Lib_udev.udev_device_get_parent_with_subsystem_devtype;
    udev_device_get_properties_list_entry = Lib_udev.udev_device_get_properties_list_entry;
    udev_device_get_subsystem = Lib_udev.udev_device_get_subsystem;
    udev_device_get_sysattr_value = Lib_udev.udev_device_get_sysattr_value;
    udev_device_get_sysname = Lib_udev.udev_device_get_sysname;
    udev_device_get_sysnum = Lib_udev.udev_device_get_sysnum;
    udev_device_get_syspath = Lib_udev.udev_device_get_syspath;
    udev_device_get_tags_list_entry = Lib_udev.udev_device_get_tags_list_entry;
    udev_device_unref = Lib_udev.udev_device_unref;

    udev_enumerate_new = Lib_udev.udev_enumerate_new;
    udev_enumerate_add_match_subsystem = Lib_udev.udev_enumerate_add_match_subsystem;
    udev_enumerate_get_list_entry = Lib_udev.udev_enumerate_get_list_entry;
    udev_enumerate_scan_devices = Lib_udev.udev_enumerate_scan_devices;
    udev_enumerate_scan_subsystems = Lib_udev.udev_enumerate_scan_subsystems;
    udev_enumerate_unref = Lib_udev.udev_enumerate_unref;

    udev_hwdb_new = Lib_udev.udev_hwdb_new;
    udev_hwdb_ref = Lib_udev.udev_hwdb_ref;
    udev_hwdb_unref = Lib_udev.udev_hwdb_unref;
    udev_hwdb_get_properties_list_entry = Lib_udev.udev_hwdb_get_properties_list_entry;

    udev_list_entry_get_name = Lib_udev.udev_list_entry_get_name;
    udev_list_entry_get_next = Lib_udev.udev_list_entry_get_next;
    udev_list_entry_get_value = Lib_udev.udev_list_entry_get_value;

    udev_queue_new = Lib_udev.udev_queue_new;

    -- local functions
    safeffistring = safeffistring;
}
setmetatable(exports, {
  __call = function(self, tbl)
  	tbl = tbl or _G;
    for k,v in pairs(self) do
      tbl[k] = v;
    end

    return self;
  end,
})

return exports
