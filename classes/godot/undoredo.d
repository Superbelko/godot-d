/**
Helper to manage undo/redo operations in the editor or custom tools.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.undoredo;
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
/**
Helper to manage undo/redo operations in the editor or custom tools.

It works by registering methods and property changes inside "actions".
Common behavior is to create an action, then add do/undo calls to functions or property changes, then committing the action.
Here's an example on how to add an action to the Godot editor's own $(D UndoRedo), from a plugin:


var undo_redo = get_undo_redo() # Method of EditorPlugin.

func do_something():
    pass # Put your code here.

func undo_something():
    pass # Put here the code that reverts what's done by "do_something()".

func _on_MyButton_pressed():
    var node = get_node("MyNode2D")
    undo_redo.create_action("Move the node")
    undo_redo.add_do_method(self, "do_something")
    undo_redo.add_undo_method(self, "undo_something")
    undo_redo.add_do_property(node, "position", Vector2(100,100))
    undo_redo.add_undo_property(node, "position", node.position)
    undo_redo.commit_action()


$(D createAction), $(D addDoMethod), $(D addUndoMethod), $(D addDoProperty), $(D addUndoProperty), and $(D commitAction) should be called one after the other, like in the example. Not doing so could lead to crashes.
If you don't need to register a method, you can leave $(D addDoMethod) and $(D addUndoMethod) out; the same goes for properties. You can also register more than one method/property.
*/
@GodotBaseClass struct UndoRedo
{
	package(godot) enum string _GODOT_internal_name = "UndoRedo";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ GodotObject _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("add_do_method") GodotMethod!(void, GodotObject, String, GodotVarArgs) addDoMethod;
		@GodotName("add_do_property") GodotMethod!(void, GodotObject, String, Variant) addDoProperty;
		@GodotName("add_do_reference") GodotMethod!(void, GodotObject) addDoReference;
		@GodotName("add_undo_method") GodotMethod!(void, GodotObject, String, GodotVarArgs) addUndoMethod;
		@GodotName("add_undo_property") GodotMethod!(void, GodotObject, String, Variant) addUndoProperty;
		@GodotName("add_undo_reference") GodotMethod!(void, GodotObject) addUndoReference;
		@GodotName("clear_history") GodotMethod!(void, bool) clearHistory;
		@GodotName("commit_action") GodotMethod!(void) commitAction;
		@GodotName("create_action") GodotMethod!(void, String, long) createAction;
		@GodotName("get_current_action_name") GodotMethod!(String) getCurrentActionName;
		@GodotName("get_version") GodotMethod!(long) getVersion;
		@GodotName("has_redo") GodotMethod!(bool) hasRedo;
		@GodotName("has_undo") GodotMethod!(bool) hasUndo;
		@GodotName("is_commiting_action") GodotMethod!(bool) isCommitingAction;
		@GodotName("redo") GodotMethod!(bool) redo;
		@GodotName("undo") GodotMethod!(bool) undo;
	}
	/// 
	pragma(inline, true) bool opEquals(in UndoRedo other) const
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
	/// Construct a new instance of UndoRedo.
	/// Note: use `memnew!UndoRedo` instead.
	static UndoRedo _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("UndoRedo");
		if(constructor is null) return typeof(this).init;
		return cast(UndoRedo)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum MergeMode : int
	{
		/**
		Makes "do"/"undo" operations stay in separate actions.
		*/
		mergeDisable = 0,
		/**
		Makes so that the action's "do" operation is from the first action created and the "undo" operation is from the last subsequent action with the same name.
		*/
		mergeEnds = 1,
		/**
		Makes subsequent actions with the same name be merged into one.
		*/
		mergeAll = 2,
	}
	/// 
	enum Constants : int
	{
		mergeDisable = 0,
		mergeEnds = 1,
		mergeAll = 2,
	}
	/**
	Register a method that will be called when the action is committed.
	*/
	void addDoMethod(VarArgs...)(GodotObject object, in String method, VarArgs varArgs)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(object);
		_GODOT_args.append(method);
		foreach(vai, VA; VarArgs)
		{
			_GODOT_args.append(varArgs[vai]);
		}
		String _GODOT_method_name = String("add_do_method");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	Register a property value change for "do".
	*/
	void addDoProperty(VariantArg2)(GodotObject object, in String property, in VariantArg2 value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addDoProperty, _godot_object, object, property, value);
	}
	/**
	Register a reference for "do" that will be erased if the "do" history is lost. This is useful mostly for new nodes created for the "do" call. Do not use for resources.
	*/
	void addDoReference(GodotObject object)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addDoReference, _godot_object, object);
	}
	/**
	Register a method that will be called when the action is undone.
	*/
	void addUndoMethod(VarArgs...)(GodotObject object, in String method, VarArgs varArgs)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(object);
		_GODOT_args.append(method);
		foreach(vai, VA; VarArgs)
		{
			_GODOT_args.append(varArgs[vai]);
		}
		String _GODOT_method_name = String("add_undo_method");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	Register a property value change for "undo".
	*/
	void addUndoProperty(VariantArg2)(GodotObject object, in String property, in VariantArg2 value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addUndoProperty, _godot_object, object, property, value);
	}
	/**
	Register a reference for "undo" that will be erased if the "undo" history is lost. This is useful mostly for nodes removed with the "do" call (not the "undo" call!).
	*/
	void addUndoReference(GodotObject object)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addUndoReference, _godot_object, object);
	}
	/**
	Clear the undo/redo history and associated references.
	Passing `false` to `increase_version` will prevent the version number to be increased from this.
	*/
	void clearHistory(in bool increase_version = true)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.clearHistory, _godot_object, increase_version);
	}
	/**
	Commit the action. All "do" methods/properties are called/set when this function is called.
	*/
	void commitAction()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.commitAction, _godot_object);
	}
	/**
	Create a new action. After this is called, do all your calls to $(D addDoMethod), $(D addUndoMethod), $(D addDoProperty), and $(D addUndoProperty), then commit the action with $(D commitAction).
	The way actions are merged is dictated by the `merge_mode` argument. See $(D mergemode) for details.
	*/
	void createAction(in String name, in long merge_mode = 0)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.createAction, _godot_object, name, merge_mode);
	}
	/**
	Gets the name of the current action.
	*/
	String getCurrentActionName() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getCurrentActionName, _godot_object);
	}
	/**
	Gets the version. Every time a new action is committed, the $(D UndoRedo)'s version number is increased automatically.
	This is useful mostly to check if something changed from a saved version.
	*/
	long getVersion() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getVersion, _godot_object);
	}
	/**
	Returns `true` if a "redo" action is available.
	*/
	bool hasRedo()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasRedo, _godot_object);
	}
	/**
	Returns `true` if an "undo" action is available.
	*/
	bool hasUndo()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasUndo, _godot_object);
	}
	/**
	Returns `true` if the $(D UndoRedo) is currently committing the action, i.e. running its "do" method or property change (see $(D commitAction)).
	*/
	bool isCommitingAction() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isCommitingAction, _godot_object);
	}
	/**
	Redo the last action.
	*/
	bool redo()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.redo, _godot_object);
	}
	/**
	Undo the last action.
	*/
	bool undo()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.undo, _godot_object);
	}
}
