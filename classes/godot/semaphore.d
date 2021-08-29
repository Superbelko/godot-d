/**
A synchronization semaphore.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.semaphore;
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
A synchronization semaphore.

A synchronization semaphore which can be used to synchronize multiple $(D Thread)s. Initialized to zero on creation. Be careful to avoid deadlocks. For a binary version, see $(D Mutex).
*/
@GodotBaseClass struct Semaphore
{
	package(godot) enum string _GODOT_internal_name = "_Semaphore";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("post") GodotMethod!(GodotError) post;
		@GodotName("wait") GodotMethod!(GodotError) wait;
	}
	/// 
	pragma(inline, true) bool opEquals(in Semaphore other) const
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
	/// Construct a new instance of Semaphore.
	/// Note: use `memnew!Semaphore` instead.
	static Semaphore _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("_Semaphore");
		if(constructor is null) return typeof(this).init;
		return cast(Semaphore)(constructor());
	}
	@disable new(size_t s);
	/**
	Lowers the $(D Semaphore), allowing one more thread in. Returns $(D constant OK) on success, $(D constant ERR_BUSY) otherwise.
	*/
	GodotError post()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.post, _godot_object);
	}
	/**
	Tries to wait for the $(D Semaphore), if its value is zero, blocks until non-zero. Returns $(D constant OK) on success, $(D constant ERR_BUSY) otherwise.
	*/
	GodotError wait()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.wait, _godot_object);
	}
}
