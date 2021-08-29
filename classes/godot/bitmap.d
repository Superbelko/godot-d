/**
Boolean matrix.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.bitmap;
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
import godot.resource;
import godot.image;
/**
Boolean matrix.

A two-dimensional array of boolean values, can be used to efficiently store a binary matrix (every matrix element takes only one bit) and query the values using natural cartesian coordinates.
*/
@GodotBaseClass struct BitMap
{
	package(godot) enum string _GODOT_internal_name = "BitMap";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Resource _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_get_data") GodotMethod!(Dictionary) _getData;
		@GodotName("_set_data") GodotMethod!(void, Dictionary) _setData;
		@GodotName("create") GodotMethod!(void, Vector2) create;
		@GodotName("create_from_image_alpha") GodotMethod!(void, Image, double) createFromImageAlpha;
		@GodotName("get_bit") GodotMethod!(bool, Vector2) getBit;
		@GodotName("get_size") GodotMethod!(Vector2) getSize;
		@GodotName("get_true_bit_count") GodotMethod!(long) getTrueBitCount;
		@GodotName("grow_mask") GodotMethod!(void, long, Rect2) growMask;
		@GodotName("opaque_to_polygons") GodotMethod!(Array, Rect2, double) opaqueToPolygons;
		@GodotName("set_bit") GodotMethod!(void, Vector2, bool) setBit;
		@GodotName("set_bit_rect") GodotMethod!(void, Rect2, bool) setBitRect;
	}
	/// 
	pragma(inline, true) bool opEquals(in BitMap other) const
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
	/// Construct a new instance of BitMap.
	/// Note: use `memnew!BitMap` instead.
	static BitMap _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("BitMap");
		if(constructor is null) return typeof(this).init;
		return cast(BitMap)(constructor());
	}
	@disable new(size_t s);
	/**
	
	*/
	Dictionary _getData() const
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_get_data");
		return this.callv(_GODOT_method_name, _GODOT_args).as!(RefOrT!Dictionary);
	}
	/**
	
	*/
	void _setData(in Dictionary arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_set_data");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	Creates a bitmap with the specified size, filled with `false`.
	*/
	void create(in Vector2 size)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.create, _godot_object, size);
	}
	/**
	Creates a bitmap that matches the given image dimensions, every element of the bitmap is set to `false` if the alpha value of the image at that position is equal to `threshold` or less, and `true` in other case.
	*/
	void createFromImageAlpha(Image image, in double threshold = 0.1)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.createFromImageAlpha, _godot_object, image, threshold);
	}
	/**
	Returns bitmap's value at the specified position.
	*/
	bool getBit(in Vector2 position) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getBit, _godot_object, position);
	}
	/**
	Returns bitmap's dimensions.
	*/
	Vector2 getSize() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getSize, _godot_object);
	}
	/**
	Returns the amount of bitmap elements that are set to `true`.
	*/
	long getTrueBitCount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getTrueBitCount, _godot_object);
	}
	/**
	Applies morphological dilation to the bitmap. The first argument is the dilation amount, Rect2 is the area where the dilation will be applied.
	*/
	void growMask(in long pixels, in Rect2 rect)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.growMask, _godot_object, pixels, rect);
	}
	/**
	
	*/
	Array opaqueToPolygons(in Rect2 rect, in double epsilon = 2) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.opaqueToPolygons, _godot_object, rect, epsilon);
	}
	/**
	Sets the bitmap's element at the specified position, to the specified value.
	*/
	void setBit(in Vector2 position, in bool bit)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBit, _godot_object, position, bit);
	}
	/**
	Sets a rectangular portion of the bitmap to the specified value.
	*/
	void setBitRect(in Rect2 rect, in bool bit)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBitRect, _godot_object, rect, bit);
	}
	/**
	
	*/
	@property Dictionary data()
	{
		return _getData();
	}
	/// ditto
	@property void data(Dictionary v)
	{
		_setData(v);
	}
}
