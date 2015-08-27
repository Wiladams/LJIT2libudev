package.path = package.path..";../?.lua"

--[[
  Reference:
  http://c-qs.blogspot.com/2012/06/libudev-and-sysfs-tutorial.html
--]]

local ffi = require("ffi")
local libudev = require("libudev_ffi")()

local function safeffistring(str)
  --print("safeffistring: ", str)
    if str == nil then
        str = "BLANK"
    end

    return ffi.string(str);
end

local function printf(fmt, ...)
    io.write(string.format(fmt, ...))
end 


local function main () 
    -- Create the udev object 
    local udev = udev_new();
 
    if (udev == nil) then
        printf("Can't create udev\n");
        return false;
    end
    --ffi.gc(udev, udev_unref);

    -- Create a list of the devices in the 'hidraw' subsystem.
    local enumerate = udev_enumerate_new(udev);
    --ffi.gc(enumerate, udev_enumerate_unref);

    --udev_enumerate_add_match_subsystem(enumerate, "hidraw");
    udev_enumerate_scan_devices(enumerate);
    local devices = udev_enumerate_get_list_entry(enumerate);

    -- For each item enumerated, print out its information.
    local dev_list_entry = devices; 

    while dev_list_entry ~= nil do
        print("==== list_entry ====")
    --[[ Get the filename of the /sys entry for the device
     and create a udev_device object (dev) representing it --]]
        local syspath = safeffistring(udev_list_entry_get_name(dev_list_entry));
        --local value = safeffistring(udev_list_entry_get_value(dev_list_entry));

        printf("SysPath: %s\n", syspath);

        local dev = udev_device_new_from_syspath(udev, syspath);
        --ffi.gc(dev, udev_device_unref);

        local nodepath =   safeffistring(udev_device_get_devnode(dev))   
        local devtype = safeffistring(udev_device_get_devtype(dev))     
        local sysname = safeffistring(udev_device_get_sysname(dev))

        printf("  Node Path: %s\n", nodepath);
        printf("    SysName: %s\n", sysname)
        printf("Device Type: %s\n", devtype)


        -- move to the next item in the list
        dev_list_entry = udev_list_entry_get_next(dev_list_entry)
    end
end


main()
