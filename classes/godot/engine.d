/**
Access to engine properties.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.engine;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.mainloop;
/**
Access to engine properties.

The $(D Engine) singleton allows you to query and modify the project's run-time parameters, such as frames per second, time scale, and others.
*/
@GodotBaseClass struct EngineSingleton
{
	package(godot) enum string _GODOT_internal_name = "_Engine";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ GodotObject _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		godot_object _singleton;
		immutable char* _singletonName = "Engine";
		@GodotName("get_author_info") GodotMethod!(Dictionary) getAuthorInfo;
		@GodotName("get_copyright_info") GodotMethod!(Array) getCopyrightInfo;
		@GodotName("get_donor_info") GodotMethod!(Dictionary) getDonorInfo;
		@GodotName("get_frames_drawn") GodotMethod!(long) getFramesDrawn;
		@GodotName("get_frames_per_second") GodotMethod!(double) getFramesPerSecond;
		@GodotName("get_idle_frames") GodotMethod!(long) getIdleFrames;
		@GodotName("get_iterations_per_second") GodotMethod!(long) getIterationsPerSecond;
		@GodotName("get_license_info") GodotMethod!(Dictionary) getLicenseInfo;
		@GodotName("get_license_text") GodotMethod!(String) getLicenseText;
		@GodotName("get_main_loop") GodotMethod!(MainLoop) getMainLoop;
		@GodotName("get_physics_frames") GodotMethod!(long) getPhysicsFrames;
		@GodotName("get_physics_interpolation_fraction") GodotMethod!(double) getPhysicsInterpolationFraction;
		@GodotName("get_physics_jitter_fix") GodotMethod!(double) getPhysicsJitterFix;
		@GodotName("get_singleton") GodotMethod!(GodotObject, String) getSingleton;
		@GodotName("get_target_fps") GodotMethod!(long) getTargetFps;
		@GodotName("get_time_scale") GodotMethod!(double) getTimeScale;
		@GodotName("get_version_info") GodotMethod!(Dictionary) getVersionInfo;
		@GodotName("has_singleton") GodotMethod!(bool, String) hasSingleton;
		@GodotName("is_editor_hint") GodotMethod!(bool) isEditorHint;
		@GodotName("is_in_physics_frame") GodotMethod!(bool) isInPhysicsFrame;
		@GodotName("set_editor_hint") GodotMethod!(void, bool) setEditorHint;
		@GodotName("set_iterations_per_second") GodotMethod!(void, long) setIterationsPerSecond;
		@GodotName("set_physics_jitter_fix") GodotMethod!(void, double) setPhysicsJitterFix;
		@GodotName("set_target_fps") GodotMethod!(void, long) setTargetFps;
		@GodotName("set_time_scale") GodotMethod!(void, double) setTimeScale;
	}
	/// 
	pragma(inline, true) bool opEquals(in EngineSingleton other) const
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
	/// Construct a new instance of EngineSingleton.
	/// Note: use `memnew!EngineSingleton` instead.
	static EngineSingleton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("_Engine");
		if(constructor is null) return typeof(this).init;
		return cast(EngineSingleton)(constructor());
	}
	@disable new(size_t s);
	/**
	Returns engine author information in a Dictionary.
	`lead_developers`    - Array of Strings, lead developer names
	`founders`           - Array of Strings, founder names
	`project_managers`   - Array of Strings, project manager names
	`developers`         - Array of Strings, developer names
	*/
	Dictionary getAuthorInfo() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getAuthorInfo, _godot_object);
	}
	/**
	Returns an Array of copyright information Dictionaries.
	`name`    - String, component name
	`parts`   - Array of Dictionaries {`files`, `copyright`, `license`} describing subsections of the component
	*/
	Array getCopyrightInfo() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.getCopyrightInfo, _godot_object);
	}
	/**
	Returns a Dictionary of Arrays of donor names.
	{`platinum_sponsors`, `gold_sponsors`, `silver_sponsors`, `bronze_sponsors`, `mini_sponsors`, `gold_donors`, `silver_donors`, `bronze_donors`}
	*/
	Dictionary getDonorInfo() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getDonorInfo, _godot_object);
	}
	/**
	Returns the total number of frames drawn. If the render loop is disabled with `--disable-render-loop` via command line, this returns `0`. See also $(D getIdleFrames).
	*/
	long getFramesDrawn()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getFramesDrawn, _godot_object);
	}
	/**
	Returns the frames per second of the running game.
	*/
	double getFramesPerSecond() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFramesPerSecond, _godot_object);
	}
	/**
	Returns the total number of frames passed since engine initialization which is advanced on each $(B idle frame), regardless of whether the render loop is enabled. See also $(D getFramesDrawn).
	*/
	long getIdleFrames() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getIdleFrames, _godot_object);
	}
	/**
	
	*/
	long getIterationsPerSecond() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getIterationsPerSecond, _godot_object);
	}
	/**
	Returns Dictionary of licenses used by Godot and included third party components.
	*/
	Dictionary getLicenseInfo() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getLicenseInfo, _godot_object);
	}
	/**
	Returns Godot license text.
	*/
	String getLicenseText() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getLicenseText, _godot_object);
	}
	/**
	Returns the main loop object (see $(D MainLoop) and $(D SceneTree)).
	*/
	MainLoop getMainLoop() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(MainLoop)(GDNativeClassBinding.getMainLoop, _godot_object);
	}
	/**
	Returns the total number of frames passed since engine initialization which is advanced on each $(B physics frame).
	*/
	long getPhysicsFrames() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getPhysicsFrames, _godot_object);
	}
	/**
	Returns the fraction through the current physics tick we are at the time of rendering the frame. This can be used to implement fixed timestep interpolation.
	*/
	double getPhysicsInterpolationFraction() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getPhysicsInterpolationFraction, _godot_object);
	}
	/**
	
	*/
	double getPhysicsJitterFix() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getPhysicsJitterFix, _godot_object);
	}
	/**
	Returns a global singleton with given `name`. Often used for plugins, e.g. `GodotPayment` on Android.
	*/
	GodotObject getSingleton(in String name) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotObject)(GDNativeClassBinding.getSingleton, _godot_object, name);
	}
	/**
	
	*/
	long getTargetFps() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getTargetFps, _godot_object);
	}
	/**
	
	*/
	double getTimeScale()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTimeScale, _godot_object);
	}
	/**
	Returns the current engine version information in a Dictionary.
	`major`    - Holds the major version number as an int
	`minor`    - Holds the minor version number as an int
	`patch`    - Holds the patch version number as an int
	`hex`      - Holds the full version number encoded as a hexadecimal int with one byte (2 places) per number (see example below)
	`status`   - Holds the status (e.g. "beta", "rc1", "rc2", ... "stable") as a String
	`build`    - Holds the build name (e.g. "custom_build") as a String
	`hash`     - Holds the full Git commit hash as a String
	`year`     - Holds the year the version was released in as an int
	`string`   - `major` + `minor` + `patch` + `status` + `build` in a single String
	The `hex` value is encoded as follows, from left to right: one byte for the major, one byte for the minor, one byte for the patch version. For example, "3.1.12" would be `0x03010C`. $(B Note:) It's still an int internally, and printing it will give you its decimal representation, which is not particularly meaningful. Use hexadecimal literals for easy version comparisons from code:
	
	
	if Engine.get_version_info().hex &gt;= 0x030200:
	    # Do things specific to version 3.2 or later
	else:
	    # Do things specific to versions before 3.2
	
	
	*/
	Dictionary getVersionInfo() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getVersionInfo, _godot_object);
	}
	/**
	Returns `true` if a singleton with given `name` exists in global scope.
	*/
	bool hasSingleton(in String name) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasSingleton, _godot_object, name);
	}
	/**
	
	*/
	bool isEditorHint() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isEditorHint, _godot_object);
	}
	/**
	Returns `true` if the game is inside the fixed process and physics phase of the game loop.
	*/
	bool isInPhysicsFrame() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isInPhysicsFrame, _godot_object);
	}
	/**
	
	*/
	void setEditorHint(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setEditorHint, _godot_object, enabled);
	}
	/**
	
	*/
	void setIterationsPerSecond(in long iterations_per_second)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setIterationsPerSecond, _godot_object, iterations_per_second);
	}
	/**
	
	*/
	void setPhysicsJitterFix(in double physics_jitter_fix)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPhysicsJitterFix, _godot_object, physics_jitter_fix);
	}
	/**
	
	*/
	void setTargetFps(in long target_fps)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTargetFps, _godot_object, target_fps);
	}
	/**
	
	*/
	void setTimeScale(in double time_scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTimeScale, _godot_object, time_scale);
	}
	/**
	If `true`, the script is currently running inside the editor. This is useful for `tool` scripts to conditionally draw editor helpers, or prevent accidentally running "game" code that would affect the scene state while in the editor:
	
	
	if Engine.editor_hint:
	    draw_gizmos()
	else:
	    simulate_physics()
	
	
	See $(D url=https://docs.godotengine.org/en/3.3/tutorials/misc/running_code_in_the_editor.html)Running code in the editor$(D /url) in the documentation for more information.
	$(B Note:) To detect whether the script is run from an editor $(I build) (e.g. when pressing `F5`), use $(D OS.hasFeature) with the `"editor"` argument instead. `OS.has_feature("editor")` will evaluate to `true` both when the code is running in the editor and when running the project from the editor, but it will evaluate to `false` when the code is run from an exported project.
	*/
	@property bool editorHint()
	{
		return isEditorHint();
	}
	/// ditto
	@property void editorHint(bool v)
	{
		setEditorHint(v);
	}
	/**
	The number of fixed iterations per second. This controls how often physics simulation and $(D Node._physicsProcess) methods are run. This value should generally always be set to `60` or above, as Godot doesn't interpolate the physics step. As a result, values lower than `60` will look stuttery. This value can be increased to make input more reactive or work around tunneling issues, but keep in mind doing so will increase CPU usage.
	*/
	@property long iterationsPerSecond()
	{
		return getIterationsPerSecond();
	}
	/// ditto
	@property void iterationsPerSecond(long v)
	{
		setIterationsPerSecond(v);
	}
	/**
	Controls how much physics ticks are synchronized with real time. For 0 or less, the ticks are synchronized. Such values are recommended for network games, where clock synchronization matters. Higher values cause higher deviation of the in-game clock and real clock but smooth out framerate jitters. The default value of 0.5 should be fine for most; values above 2 could cause the game to react to dropped frames with a noticeable delay and are not recommended.
	$(B Note:) For best results, when using a custom physics interpolation solution, the physics jitter fix should be disabled by setting $(D physicsJitterFix) to `0`.
	*/
	@property double physicsJitterFix()
	{
		return getPhysicsJitterFix();
	}
	/// ditto
	@property void physicsJitterFix(double v)
	{
		setPhysicsJitterFix(v);
	}
	/**
	The desired frames per second. If the hardware cannot keep up, this setting may not be respected. A value of 0 means no limit.
	*/
	@property long targetFps()
	{
		return getTargetFps();
	}
	/// ditto
	@property void targetFps(long v)
	{
		setTargetFps(v);
	}
	/**
	Controls how fast or slow the in-game clock ticks versus the real life one. It defaults to 1.0. A value of 2.0 means the game moves twice as fast as real life, whilst a value of 0.5 means the game moves at half the regular speed.
	*/
	@property double timeScale()
	{
		return getTimeScale();
	}
	/// ditto
	@property void timeScale(double v)
	{
		setTimeScale(v);
	}
}
/// Returns: the EngineSingleton
@property @nogc nothrow pragma(inline, true)
EngineSingleton Engine()
{
	checkClassBinding!EngineSingleton();
	return EngineSingleton(EngineSingleton.GDNativeClassBinding._singleton);
}
