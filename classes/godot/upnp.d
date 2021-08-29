/**
UPNP network functions.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.upnp;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.classdb;
import godot.reference;
import godot.upnpdevice;
/**
UPNP network functions.

Provides UPNP functionality to discover $(D UPNPDevice)s on the local network and execute commands on them, like managing port mappings (port forwarding) and querying the local and remote network IP address. Note that methods on this class are synchronous and block the calling thread.
To forward a specific port:


const PORT = 7777
var upnp = UPNP.new()
upnp.discover(2000, 2, "InternetGatewayDevice")
upnp.add_port_mapping(port)


To close a specific port (e.g. after you have finished using it):


upnp.delete_port_mapping(port)


*/
@GodotBaseClass struct UPNP
{
	package(godot) enum string _GODOT_internal_name = "UPNP";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("add_device") GodotMethod!(void, UPNPDevice) addDevice;
		@GodotName("add_port_mapping") GodotMethod!(long, long, long, String, String, long) addPortMapping;
		@GodotName("clear_devices") GodotMethod!(void) clearDevices;
		@GodotName("delete_port_mapping") GodotMethod!(long, long, String) deletePortMapping;
		@GodotName("discover") GodotMethod!(long, long, long, String) discover;
		@GodotName("get_device") GodotMethod!(UPNPDevice, long) getDevice;
		@GodotName("get_device_count") GodotMethod!(long) getDeviceCount;
		@GodotName("get_discover_local_port") GodotMethod!(long) getDiscoverLocalPort;
		@GodotName("get_discover_multicast_if") GodotMethod!(String) getDiscoverMulticastIf;
		@GodotName("get_gateway") GodotMethod!(UPNPDevice) getGateway;
		@GodotName("is_discover_ipv6") GodotMethod!(bool) isDiscoverIpv6;
		@GodotName("query_external_address") GodotMethod!(String) queryExternalAddress;
		@GodotName("remove_device") GodotMethod!(void, long) removeDevice;
		@GodotName("set_device") GodotMethod!(void, long, UPNPDevice) setDevice;
		@GodotName("set_discover_ipv6") GodotMethod!(void, bool) setDiscoverIpv6;
		@GodotName("set_discover_local_port") GodotMethod!(void, long) setDiscoverLocalPort;
		@GodotName("set_discover_multicast_if") GodotMethod!(void, String) setDiscoverMulticastIf;
	}
	/// 
	pragma(inline, true) bool opEquals(in UPNP other) const
	{ return _godot_object.ptr is other._godot_object.ptr; }
	/// 
	pragma(inline, true) typeof(null) opAssign(typeof(null) n)
	{ _godot_object.ptr = n; return null; }
	/// 
	pragma(inline, true) bool opEquals(typeof(null) n) const
	{ return _godot_object.ptr is n; }
	/// 
	size_t toHash() const @trusted { return cast(size_t)_godot_object.ptr; }
	mixin baseCasts;
	/// Construct a new instance of UPNP.
	/// Note: use `memnew!UPNP` instead.
	static UPNP _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("UPNP");
		if(constructor is null) return typeof(this).init;
		return cast(UPNP)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum UPNPResult : int
	{
		/**
		UPNP command or discovery was successful.
		*/
		upnpResultSuccess = 0,
		/**
		Not authorized to use the command on the $(D UPNPDevice). May be returned when the user disabled UPNP on their router.
		*/
		upnpResultNotAuthorized = 1,
		/**
		No port mapping was found for the given port, protocol combination on the given $(D UPNPDevice).
		*/
		upnpResultPortMappingNotFound = 2,
		/**
		Inconsistent parameters.
		*/
		upnpResultInconsistentParameters = 3,
		/**
		No such entry in array. May be returned if a given port, protocol combination is not found on an $(D UPNPDevice).
		*/
		upnpResultNoSuchEntryInArray = 4,
		/**
		The action failed.
		*/
		upnpResultActionFailed = 5,
		/**
		The $(D UPNPDevice) does not allow wildcard values for the source IP address.
		*/
		upnpResultSrcIpWildcardNotPermitted = 6,
		/**
		The $(D UPNPDevice) does not allow wildcard values for the external port.
		*/
		upnpResultExtPortWildcardNotPermitted = 7,
		/**
		The $(D UPNPDevice) does not allow wildcard values for the internal port.
		*/
		upnpResultIntPortWildcardNotPermitted = 8,
		/**
		The remote host value must be a wildcard.
		*/
		upnpResultRemoteHostMustBeWildcard = 9,
		/**
		The external port value must be a wildcard.
		*/
		upnpResultExtPortMustBeWildcard = 10,
		/**
		No port maps are available. May also be returned if port mapping functionality is not available.
		*/
		upnpResultNoPortMapsAvailable = 11,
		/**
		Conflict with other mechanism. May be returned instead of $(D constant UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING) if a port mapping conflicts with an existing one.
		*/
		upnpResultConflictWithOtherMechanism = 12,
		/**
		Conflict with an existing port mapping.
		*/
		upnpResultConflictWithOtherMapping = 13,
		/**
		External and internal port values must be the same.
		*/
		upnpResultSamePortValuesRequired = 14,
		/**
		Only permanent leases are supported. Do not use the `duration` parameter when adding port mappings.
		*/
		upnpResultOnlyPermanentLeaseSupported = 15,
		/**
		Invalid gateway.
		*/
		upnpResultInvalidGateway = 16,
		/**
		Invalid port.
		*/
		upnpResultInvalidPort = 17,
		/**
		Invalid protocol.
		*/
		upnpResultInvalidProtocol = 18,
		/**
		Invalid duration.
		*/
		upnpResultInvalidDuration = 19,
		/**
		Invalid arguments.
		*/
		upnpResultInvalidArgs = 20,
		/**
		Invalid response.
		*/
		upnpResultInvalidResponse = 21,
		/**
		Invalid parameter.
		*/
		upnpResultInvalidParam = 22,
		/**
		HTTP error.
		*/
		upnpResultHttpError = 23,
		/**
		Socket error.
		*/
		upnpResultSocketError = 24,
		/**
		Error allocating memory.
		*/
		upnpResultMemAllocError = 25,
		/**
		No gateway available. You may need to call $(D discover) first, or discovery didn't detect any valid IGDs (InternetGatewayDevices).
		*/
		upnpResultNoGateway = 26,
		/**
		No devices available. You may need to call $(D discover) first, or discovery didn't detect any valid $(D UPNPDevice)s.
		*/
		upnpResultNoDevices = 27,
		/**
		Unknown error.
		*/
		upnpResultUnknownError = 28,
	}
	/// 
	enum Constants : int
	{
		upnpResultSuccess = 0,
		upnpResultNotAuthorized = 1,
		upnpResultPortMappingNotFound = 2,
		upnpResultInconsistentParameters = 3,
		upnpResultNoSuchEntryInArray = 4,
		upnpResultActionFailed = 5,
		upnpResultSrcIpWildcardNotPermitted = 6,
		upnpResultExtPortWildcardNotPermitted = 7,
		upnpResultIntPortWildcardNotPermitted = 8,
		upnpResultRemoteHostMustBeWildcard = 9,
		upnpResultExtPortMustBeWildcard = 10,
		upnpResultNoPortMapsAvailable = 11,
		upnpResultConflictWithOtherMechanism = 12,
		upnpResultConflictWithOtherMapping = 13,
		upnpResultSamePortValuesRequired = 14,
		upnpResultOnlyPermanentLeaseSupported = 15,
		upnpResultInvalidGateway = 16,
		upnpResultInvalidPort = 17,
		upnpResultInvalidProtocol = 18,
		upnpResultInvalidDuration = 19,
		upnpResultInvalidArgs = 20,
		upnpResultInvalidResponse = 21,
		upnpResultInvalidParam = 22,
		upnpResultHttpError = 23,
		upnpResultSocketError = 24,
		upnpResultMemAllocError = 25,
		upnpResultNoGateway = 26,
		upnpResultNoDevices = 27,
		upnpResultUnknownError = 28,
	}
	/**
	Adds the given $(D UPNPDevice) to the list of discovered devices.
	*/
	void addDevice(UPNPDevice device)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addDevice, _godot_object, device);
	}
	/**
	Adds a mapping to forward the external `port` (between 1 and 65535) on the default gateway (see $(D getGateway)) to the `internal_port` on the local machine for the given protocol `proto` (either `TCP` or `UDP`, with UDP being the default). If a port mapping for the given port and protocol combination already exists on that gateway device, this method tries to overwrite it. If that is not desired, you can retrieve the gateway manually with $(D getGateway) and call $(D addPortMapping) on it, if any.
	If `internal_port` is `0` (the default), the same port number is used for both the external and the internal port (the `port` value).
	The description (`desc`) is shown in some router UIs and can be used to point out which application added the mapping. The mapping's lease duration can be limited by specifying a `duration` (in seconds). However, some routers are incompatible with one or both of these, so use with caution and add fallback logic in case of errors to retry without them if in doubt.
	See $(D upnpresult) for possible return values.
	*/
	long addPortMapping(in long port, in long port_internal = 0, in String desc = gs!"", in String proto = gs!"UDP", in long duration = 0) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.addPortMapping, _godot_object, port, port_internal, desc, proto, duration);
	}
	/**
	Clears the list of discovered devices.
	*/
	void clearDevices()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.clearDevices, _godot_object);
	}
	/**
	Deletes the port mapping for the given port and protocol combination on the default gateway (see $(D getGateway)) if one exists. `port` must be a valid port between 1 and 65535, `proto` can be either `TCP` or `UDP`. See $(D upnpresult) for possible return values.
	*/
	long deletePortMapping(in long port, in String proto = gs!"UDP") const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.deletePortMapping, _godot_object, port, proto);
	}
	/**
	Discovers local $(D UPNPDevice)s. Clears the list of previously discovered devices.
	Filters for IGD (InternetGatewayDevice) type devices by default, as those manage port forwarding. `timeout` is the time to wait for responses in milliseconds. `ttl` is the time-to-live; only touch this if you know what you're doing.
	See $(D upnpresult) for possible return values.
	*/
	long discover(in long timeout = 2000, in long ttl = 2, in String device_filter = gs!"InternetGatewayDevice")
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.discover, _godot_object, timeout, ttl, device_filter);
	}
	/**
	Returns the $(D UPNPDevice) at the given `index`.
	*/
	Ref!UPNPDevice getDevice(in long index) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(UPNPDevice)(GDNativeClassBinding.getDevice, _godot_object, index);
	}
	/**
	Returns the number of discovered $(D UPNPDevice)s.
	*/
	long getDeviceCount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getDeviceCount, _godot_object);
	}
	/**
	
	*/
	long getDiscoverLocalPort() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getDiscoverLocalPort, _godot_object);
	}
	/**
	
	*/
	String getDiscoverMulticastIf() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getDiscoverMulticastIf, _godot_object);
	}
	/**
	Returns the default gateway. That is the first discovered $(D UPNPDevice) that is also a valid IGD (InternetGatewayDevice).
	*/
	Ref!UPNPDevice getGateway() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(UPNPDevice)(GDNativeClassBinding.getGateway, _godot_object);
	}
	/**
	
	*/
	bool isDiscoverIpv6() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isDiscoverIpv6, _godot_object);
	}
	/**
	Returns the external $(D IP) address of the default gateway (see $(D getGateway)) as string. Returns an empty string on error.
	*/
	String queryExternalAddress() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.queryExternalAddress, _godot_object);
	}
	/**
	Removes the device at `index` from the list of discovered devices.
	*/
	void removeDevice(in long index)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeDevice, _godot_object, index);
	}
	/**
	Sets the device at `index` from the list of discovered devices to `device`.
	*/
	void setDevice(in long index, UPNPDevice device)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDevice, _godot_object, index, device);
	}
	/**
	
	*/
	void setDiscoverIpv6(in bool ipv6)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDiscoverIpv6, _godot_object, ipv6);
	}
	/**
	
	*/
	void setDiscoverLocalPort(in long port)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDiscoverLocalPort, _godot_object, port);
	}
	/**
	
	*/
	void setDiscoverMulticastIf(in String m_if)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDiscoverMulticastIf, _godot_object, m_if);
	}
	/**
	If `true`, IPv6 is used for $(D UPNPDevice) discovery.
	*/
	@property bool discoverIpv6()
	{
		return isDiscoverIpv6();
	}
	/// ditto
	@property void discoverIpv6(bool v)
	{
		setDiscoverIpv6(v);
	}
	/**
	If `0`, the local port to use for discovery is chosen automatically by the system. If `1`, discovery will be done from the source port 1900 (same as destination port). Otherwise, the value will be used as the port.
	*/
	@property long discoverLocalPort()
	{
		return getDiscoverLocalPort();
	}
	/// ditto
	@property void discoverLocalPort(long v)
	{
		setDiscoverLocalPort(v);
	}
	/**
	Multicast interface to use for discovery. Uses the default multicast interface if empty.
	*/
	@property String discoverMulticastIf()
	{
		return getDiscoverMulticastIf();
	}
	/// ditto
	@property void discoverMulticastIf(String v)
	{
		setDiscoverMulticastIf(v);
	}
}
