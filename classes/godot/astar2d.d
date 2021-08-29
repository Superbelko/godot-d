/**
AStar class representation that uses 2D vectors as edges.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.astar2d;
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
/**
AStar class representation that uses 2D vectors as edges.

This is a wrapper for the $(D AStar) class which uses 2D vectors instead of 3D vectors.
*/
@GodotBaseClass struct AStar2D
{
	package(godot) enum string _GODOT_internal_name = "AStar2D";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_compute_cost") GodotMethod!(double, long, long) _computeCost;
		@GodotName("_estimate_cost") GodotMethod!(double, long, long) _estimateCost;
		@GodotName("add_point") GodotMethod!(void, long, Vector2, double) addPoint;
		@GodotName("are_points_connected") GodotMethod!(bool, long, long) arePointsConnected;
		@GodotName("clear") GodotMethod!(void) clear;
		@GodotName("connect_points") GodotMethod!(void, long, long, bool) connectPoints;
		@GodotName("disconnect_points") GodotMethod!(void, long, long) disconnectPoints;
		@GodotName("get_available_point_id") GodotMethod!(long) getAvailablePointId;
		@GodotName("get_closest_point") GodotMethod!(long, Vector2, bool) getClosestPoint;
		@GodotName("get_closest_position_in_segment") GodotMethod!(Vector2, Vector2) getClosestPositionInSegment;
		@GodotName("get_id_path") GodotMethod!(PoolIntArray, long, long) getIdPath;
		@GodotName("get_point_capacity") GodotMethod!(long) getPointCapacity;
		@GodotName("get_point_connections") GodotMethod!(PoolIntArray, long) getPointConnections;
		@GodotName("get_point_count") GodotMethod!(long) getPointCount;
		@GodotName("get_point_path") GodotMethod!(PoolVector2Array, long, long) getPointPath;
		@GodotName("get_point_position") GodotMethod!(Vector2, long) getPointPosition;
		@GodotName("get_point_weight_scale") GodotMethod!(double, long) getPointWeightScale;
		@GodotName("get_points") GodotMethod!(Array) getPoints;
		@GodotName("has_point") GodotMethod!(bool, long) hasPoint;
		@GodotName("is_point_disabled") GodotMethod!(bool, long) isPointDisabled;
		@GodotName("remove_point") GodotMethod!(void, long) removePoint;
		@GodotName("reserve_space") GodotMethod!(void, long) reserveSpace;
		@GodotName("set_point_disabled") GodotMethod!(void, long, bool) setPointDisabled;
		@GodotName("set_point_position") GodotMethod!(void, long, Vector2) setPointPosition;
		@GodotName("set_point_weight_scale") GodotMethod!(void, long, double) setPointWeightScale;
	}
	/// 
	pragma(inline, true) bool opEquals(in AStar2D other) const
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
	/// Construct a new instance of AStar2D.
	/// Note: use `memnew!AStar2D` instead.
	static AStar2D _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("AStar2D");
		if(constructor is null) return typeof(this).init;
		return cast(AStar2D)(constructor());
	}
	@disable new(size_t s);
	/**
	Called when computing the cost between two connected points.
	Note that this function is hidden in the default `AStar2D` class.
	*/
	double _computeCost(in long from_id, in long to_id)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(from_id);
		_GODOT_args.append(to_id);
		String _GODOT_method_name = String("_compute_cost");
		return this.callv(_GODOT_method_name, _GODOT_args).as!(RefOrT!double);
	}
	/**
	Called when estimating the cost between a point and the path's ending point.
	Note that this function is hidden in the default `AStar2D` class.
	*/
	double _estimateCost(in long from_id, in long to_id)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(from_id);
		_GODOT_args.append(to_id);
		String _GODOT_method_name = String("_estimate_cost");
		return this.callv(_GODOT_method_name, _GODOT_args).as!(RefOrT!double);
	}
	/**
	Adds a new point at the given position with the given identifier. The `id` must be 0 or larger, and the `weight_scale` must be 1 or larger.
	The `weight_scale` is multiplied by the result of $(D _computeCost) when determining the overall cost of traveling across a segment from a neighboring point to this point. Thus, all else being equal, the algorithm prefers points with lower `weight_scale`s to form a path.
	
	
	var astar = AStar2D.new()
	astar.add_point(1, Vector2(1, 0), 4) # Adds the point (1, 0) with weight_scale 4 and id 1
	
	
	If there already exists a point for the given `id`, its position and weight scale are updated to the given values.
	*/
	void addPoint(in long id, in Vector2 position, in double weight_scale = 1)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addPoint, _godot_object, id, position, weight_scale);
	}
	/**
	Returns whether there is a connection/segment between the given points.
	*/
	bool arePointsConnected(in long id, in long to_id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.arePointsConnected, _godot_object, id, to_id);
	}
	/**
	Clears all the points and segments.
	*/
	void clear()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.clear, _godot_object);
	}
	/**
	Creates a segment between the given points. If `bidirectional` is `false`, only movement from `id` to `to_id` is allowed, not the reverse direction.
	
	
	var astar = AStar2D.new()
	astar.add_point(1, Vector2(1, 1))
	astar.add_point(2, Vector2(0, 5))
	astar.connect_points(1, 2, false)
	
	
	*/
	void connectPoints(in long id, in long to_id, in bool bidirectional = true)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.connectPoints, _godot_object, id, to_id, bidirectional);
	}
	/**
	Deletes the segment between the given points.
	*/
	void disconnectPoints(in long id, in long to_id)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.disconnectPoints, _godot_object, id, to_id);
	}
	/**
	Returns the next available point ID with no point associated to it.
	*/
	long getAvailablePointId() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getAvailablePointId, _godot_object);
	}
	/**
	Returns the ID of the closest point to `to_position`, optionally taking disabled points into account. Returns `-1` if there are no points in the points pool.
	$(B Note:) If several points are the closest to `to_position`, the one with the smallest ID will be returned, ensuring a deterministic result.
	*/
	long getClosestPoint(in Vector2 to_position, in bool include_disabled = false) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getClosestPoint, _godot_object, to_position, include_disabled);
	}
	/**
	Returns the closest position to `to_position` that resides inside a segment between two connected points.
	
	
	var astar = AStar2D.new()
	astar.add_point(1, Vector2(0, 0))
	astar.add_point(2, Vector2(0, 5))
	astar.connect_points(1, 2)
	var res = astar.get_closest_position_in_segment(Vector2(3, 3)) # Returns (0, 3)
	
	
	The result is in the segment that goes from `y = 0` to `y = 5`. It's the closest position in the segment to the given point.
	*/
	Vector2 getClosestPositionInSegment(in Vector2 to_position) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getClosestPositionInSegment, _godot_object, to_position);
	}
	/**
	Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
	
	
	var astar = AStar2D.new()
	astar.add_point(1, Vector2(0, 0))
	astar.add_point(2, Vector2(0, 1), 1) # Default weight is 1
	astar.add_point(3, Vector2(1, 1))
	astar.add_point(4, Vector2(2, 0))
	
	astar.connect_points(1, 2, false)
	astar.connect_points(2, 3, false)
	astar.connect_points(4, 3, false)
	astar.connect_points(1, 4, false)
	
	var res = astar.get_id_path(1, 3) # Returns $(D 1, 2, 3)
	
	
	If you change the 2nd point's weight to 3, then the result will be `$(D 1, 4, 3)` instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.
	*/
	PoolIntArray getIdPath(in long from_id, in long to_id)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PoolIntArray)(GDNativeClassBinding.getIdPath, _godot_object, from_id, to_id);
	}
	/**
	Returns the capacity of the structure backing the points, useful in conjunction with `reserve_space`.
	*/
	long getPointCapacity() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getPointCapacity, _godot_object);
	}
	/**
	Returns an array with the IDs of the points that form the connection with the given point.
	
	
	var astar = AStar2D.new()
	astar.add_point(1, Vector2(0, 0))
	astar.add_point(2, Vector2(0, 1))
	astar.add_point(3, Vector2(1, 1))
	astar.add_point(4, Vector2(2, 0))
	
	astar.connect_points(1, 2, true)
	astar.connect_points(1, 3, true)
	
	var neighbors = astar.get_point_connections(1) # Returns $(D 2, 3)
	
	
	*/
	PoolIntArray getPointConnections(in long id)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PoolIntArray)(GDNativeClassBinding.getPointConnections, _godot_object, id);
	}
	/**
	Returns the number of points currently in the points pool.
	*/
	long getPointCount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getPointCount, _godot_object);
	}
	/**
	Returns an array with the points that are in the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
	$(B Note:) This method is not thread-safe. If called from a $(D Thread), it will return an empty $(D PoolVector2Array) and will print an error message.
	*/
	PoolVector2Array getPointPath(in long from_id, in long to_id)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PoolVector2Array)(GDNativeClassBinding.getPointPath, _godot_object, from_id, to_id);
	}
	/**
	Returns the position of the point associated with the given `id`.
	*/
	Vector2 getPointPosition(in long id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getPointPosition, _godot_object, id);
	}
	/**
	Returns the weight scale of the point associated with the given `id`.
	*/
	double getPointWeightScale(in long id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getPointWeightScale, _godot_object, id);
	}
	/**
	Returns an array of all points.
	*/
	Array getPoints()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.getPoints, _godot_object);
	}
	/**
	Returns whether a point associated with the given `id` exists.
	*/
	bool hasPoint(in long id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasPoint, _godot_object, id);
	}
	/**
	Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.
	*/
	bool isPointDisabled(in long id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isPointDisabled, _godot_object, id);
	}
	/**
	Removes the point associated with the given `id` from the points pool.
	*/
	void removePoint(in long id)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removePoint, _godot_object, id);
	}
	/**
	Reserves space internally for `num_nodes` points, useful if you're adding a known large number of points at once, for a grid for instance. New capacity must be greater or equals to old capacity.
	*/
	void reserveSpace(in long num_nodes)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.reserveSpace, _godot_object, num_nodes);
	}
	/**
	Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.
	*/
	void setPointDisabled(in long id, in bool disabled = true)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPointDisabled, _godot_object, id, disabled);
	}
	/**
	Sets the `position` for the point with the given `id`.
	*/
	void setPointPosition(in long id, in Vector2 position)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPointPosition, _godot_object, id, position);
	}
	/**
	Sets the `weight_scale` for the point with the given `id`. The `weight_scale` is multiplied by the result of $(D _computeCost) when determining the overall cost of traveling across a segment from a neighboring point to this point.
	*/
	void setPointWeightScale(in long id, in double weight_scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPointWeightScale, _godot_object, id, weight_scale);
	}
}
