/**
Texture-based button. Supports Pressed, Hover, Disabled and Focused states.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.texturebutton;
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
import godot.basebutton;
import godot.control;
import godot.canvasitem;
import godot.node;
import godot.bitmap;
import godot.texture;
/**
Texture-based button. Supports Pressed, Hover, Disabled and Focused states.

$(D TextureButton) has the same functionality as $(D Button), except it uses sprites instead of Godot's $(D Theme) resource. It is faster to create, but it doesn't support localization like more complex $(D Control)s.
The "normal" state must contain a texture ($(D textureNormal)); other textures are optional.
See also $(D BaseButton) which contains common properties and methods associated with this node.
*/
@GodotBaseClass struct TextureButton
{
	package(godot) enum string _GODOT_internal_name = "TextureButton";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ BaseButton _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_click_mask") GodotMethod!(BitMap) getClickMask;
		@GodotName("get_disabled_texture") GodotMethod!(Texture) getDisabledTexture;
		@GodotName("get_expand") GodotMethod!(bool) getExpand;
		@GodotName("get_focused_texture") GodotMethod!(Texture) getFocusedTexture;
		@GodotName("get_hover_texture") GodotMethod!(Texture) getHoverTexture;
		@GodotName("get_normal_texture") GodotMethod!(Texture) getNormalTexture;
		@GodotName("get_pressed_texture") GodotMethod!(Texture) getPressedTexture;
		@GodotName("get_stretch_mode") GodotMethod!(TextureButton.StretchMode) getStretchMode;
		@GodotName("set_click_mask") GodotMethod!(void, BitMap) setClickMask;
		@GodotName("set_disabled_texture") GodotMethod!(void, Texture) setDisabledTexture;
		@GodotName("set_expand") GodotMethod!(void, bool) setExpand;
		@GodotName("set_focused_texture") GodotMethod!(void, Texture) setFocusedTexture;
		@GodotName("set_hover_texture") GodotMethod!(void, Texture) setHoverTexture;
		@GodotName("set_normal_texture") GodotMethod!(void, Texture) setNormalTexture;
		@GodotName("set_pressed_texture") GodotMethod!(void, Texture) setPressedTexture;
		@GodotName("set_stretch_mode") GodotMethod!(void, long) setStretchMode;
	}
	/// 
	pragma(inline, true) bool opEquals(in TextureButton other) const
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
	/// Construct a new instance of TextureButton.
	/// Note: use `memnew!TextureButton` instead.
	static TextureButton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("TextureButton");
		if(constructor is null) return typeof(this).init;
		return cast(TextureButton)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum StretchMode : int
	{
		/**
		Scale to fit the node's bounding rectangle.
		*/
		stretchScale = 0,
		/**
		Tile inside the node's bounding rectangle.
		*/
		stretchTile = 1,
		/**
		The texture keeps its original size and stays in the bounding rectangle's top-left corner.
		*/
		stretchKeep = 2,
		/**
		The texture keeps its original size and stays centered in the node's bounding rectangle.
		*/
		stretchKeepCentered = 3,
		/**
		Scale the texture to fit the node's bounding rectangle, but maintain the texture's aspect ratio.
		*/
		stretchKeepAspect = 4,
		/**
		Scale the texture to fit the node's bounding rectangle, center it, and maintain its aspect ratio.
		*/
		stretchKeepAspectCentered = 5,
		/**
		Scale the texture so that the shorter side fits the bounding rectangle. The other side clips to the node's limits.
		*/
		stretchKeepAspectCovered = 6,
	}
	/// 
	enum Constants : int
	{
		stretchScale = 0,
		stretchTile = 1,
		stretchKeep = 2,
		stretchKeepCentered = 3,
		stretchKeepAspect = 4,
		stretchKeepAspectCentered = 5,
		stretchKeepAspectCovered = 6,
	}
	/**
	
	*/
	Ref!BitMap getClickMask() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(BitMap)(GDNativeClassBinding.getClickMask, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getDisabledTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getDisabledTexture, _godot_object);
	}
	/**
	
	*/
	bool getExpand() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getExpand, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getFocusedTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getFocusedTexture, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getHoverTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getHoverTexture, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getNormalTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getNormalTexture, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getPressedTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getPressedTexture, _godot_object);
	}
	/**
	
	*/
	TextureButton.StretchMode getStretchMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(TextureButton.StretchMode)(GDNativeClassBinding.getStretchMode, _godot_object);
	}
	/**
	
	*/
	void setClickMask(BitMap mask)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setClickMask, _godot_object, mask);
	}
	/**
	
	*/
	void setDisabledTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDisabledTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setExpand(in bool p_expand)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setExpand, _godot_object, p_expand);
	}
	/**
	
	*/
	void setFocusedTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFocusedTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setHoverTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setHoverTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setNormalTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setNormalTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setPressedTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPressedTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setStretchMode(in long p_mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setStretchMode, _godot_object, p_mode);
	}
	/**
	If `true`, the texture stretches to the edges of the node's bounding rectangle using the $(D stretchMode). If `false`, the texture will not scale with the node.
	*/
	@property bool expand()
	{
		return getExpand();
	}
	/// ditto
	@property void expand(bool v)
	{
		setExpand(v);
	}
	/**
	Controls the texture's behavior when you resize the node's bounding rectangle, $(B only if) $(D expand) is `true`. Set it to one of the $(D stretchmode) constants. See the constants to learn more.
	*/
	@property TextureButton.StretchMode stretchMode()
	{
		return getStretchMode();
	}
	/// ditto
	@property void stretchMode(long v)
	{
		setStretchMode(v);
	}
	/**
	Pure black and white $(D BitMap) image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
	*/
	@property BitMap textureClickMask()
	{
		return getClickMask();
	}
	/// ditto
	@property void textureClickMask(BitMap v)
	{
		setClickMask(v);
	}
	/**
	Texture to display when the node is disabled. See $(D BaseButton.disabled).
	*/
	@property Texture textureDisabled()
	{
		return getDisabledTexture();
	}
	/// ditto
	@property void textureDisabled(Texture v)
	{
		setDisabledTexture(v);
	}
	/**
	Texture to display when the node has mouse or keyboard focus.
	*/
	@property Texture textureFocused()
	{
		return getFocusedTexture();
	}
	/// ditto
	@property void textureFocused(Texture v)
	{
		setFocusedTexture(v);
	}
	/**
	Texture to display when the mouse hovers the node.
	*/
	@property Texture textureHover()
	{
		return getHoverTexture();
	}
	/// ditto
	@property void textureHover(Texture v)
	{
		setHoverTexture(v);
	}
	/**
	Texture to display by default, when the node is $(B not) in the disabled, focused, hover or pressed state.
	*/
	@property Texture textureNormal()
	{
		return getNormalTexture();
	}
	/// ditto
	@property void textureNormal(Texture v)
	{
		setNormalTexture(v);
	}
	/**
	Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the $(D BaseButton.shortcut) key.
	*/
	@property Texture texturePressed()
	{
		return getPressedTexture();
	}
	/// ditto
	@property void texturePressed(Texture v)
	{
		setPressedTexture(v);
	}
}
