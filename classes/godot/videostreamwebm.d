/**
$(D VideoStream) resource for WebM videos.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.videostreamwebm;
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
import godot.videostream;
import godot.resource;
import godot.reference;
/**
$(D VideoStream) resource for WebM videos.

$(D VideoStream) resource handling the $(D url=https://www.webmproject.org/)WebM$(D /url) video format with `.webm` extension. Both the VP8 and VP9 codecs are supported. The VP8 and VP9 codecs are more efficient than $(D VideoStreamTheora), but they require more CPU resources to decode (especially VP9). Both the VP8 and VP9 codecs are decoded on the CPU.
$(B Note:) Alpha channel (also known as transparency) is not supported. The video will always appear to have a black background, even if it originally contains an alpha channel.
$(B Note:) There are known bugs and performance issues with WebM video playback in Godot. If you run into problems, try using the Ogg Theora format instead: $(D VideoStreamTheora)
*/
@GodotBaseClass struct VideoStreamWebm
{
	package(godot) enum string _GODOT_internal_name = "VideoStreamWebm";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ VideoStream _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_file") GodotMethod!(String) getFile;
		@GodotName("set_file") GodotMethod!(void, String) setFile;
	}
	/// 
	pragma(inline, true) bool opEquals(in VideoStreamWebm other) const
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
	/// Construct a new instance of VideoStreamWebm.
	/// Note: use `memnew!VideoStreamWebm` instead.
	static VideoStreamWebm _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("VideoStreamWebm");
		if(constructor is null) return typeof(this).init;
		return cast(VideoStreamWebm)(constructor());
	}
	@disable new(size_t s);
	/**
	Returns the WebM video file handled by this $(D VideoStreamWebm).
	*/
	String getFile()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getFile, _godot_object);
	}
	/**
	Sets the WebM video file that this $(D VideoStreamWebm) resource handles. The `file` name should have the `.webm` extension.
	*/
	void setFile(in String file)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFile, _godot_object, file);
	}
	/**
	
	*/
	@property String file()
	{
		return getFile();
	}
	/// ditto
	@property void file(String v)
	{
		setFile(v);
	}
}
