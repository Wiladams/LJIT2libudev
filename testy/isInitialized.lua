-- predicate to determine if a device is a DRM device and it's active
return function(dev)
	if dev.IsInitialized then
		return true;
	end

	return false;
end

