namespace xlib

include std/dll.e
include std/machine.e

integer next_offset = 0
function offset( atom data_type, integer use_offset = next_offset )
	integer size = sizeof( data_type )
	
	if use_offset = next_offset then
		-- only pad when the user doesn't give us a specific offset
		use_offset += remainder( use_offset, size )
	end if
	
	next_offset = use_offset + sizeof( data_type )
	return use_offset
end function

constant
	_XDisplay_XExtData            = offset( C_POINTER, 0 ),
	_XDisplay_private1            = offset( C_POINTER ),
	_XDisplay_fd                  = offset( C_INT ),
	_XDisplay_private2            = offset( C_POINTER ),
	_XDisplay_proto_major_version = offset( C_INT ),
	_XDisplay_proto_minor_version = offset( C_INT ),
	_XDisplay_vendor              = offset( C_POINTER ),
	_XDisplay_private4            = offset( C_ULONG ),
	_XDisplay_private5            = offset( C_ULONG ),
	_XDisplay_private6            = offset( C_ULONG ),
	_XDisplay_resource_alloc      = offset( C_POINTER ),
	_XDisplay_byte_order          = offset( C_INT ),
	_XDisplay_bitmap_unit         = offset( C_INT ),
	_XDisplay_bitmap_pad          = offset( C_INT ),
	_XDisplay_bitmap_bit_order    = offset( C_INT ),
	_XDisplay_nformats            = offset( C_INT ),
	_XDisplay_ScreenFormat        = offset( C_POINTER ),
	_XDisplay_private8            = offset( C_INT ),
	_XDisplay_release             = offset( C_INT ),
	_XDisplay_private9            = offset( C_POINTER ),
	_XDisplay_private10           = offset( C_POINTER ),
	_XDisplay_qlen                = offset( C_INT ),
	_XDisplay_last_request_read   = offset( C_ULONG ),
	_XDisplay_request             = offset( C_ULONG ),
	_XDisplay_private11           = offset( C_POINTER ),
	_XDisplay_private12           = offset( C_POINTER ),
	_XDisplay_private13           = offset( C_POINTER ),
	_XDisplay_private14           = offset( C_POINTER ),
	_XDisplay_max_request_size    = offset( C_UINT ),
	_XDisplay_db                  = offset( C_POINTER ),
	_XDisplay_private15           = offset( C_POINTER ),
	_XDisplay_display_name        = offset( C_POINTER ),
	_XDisplay_default_screen      = offset( C_INT ),
	_XDisplay_nscreens            = offset( C_INT ),
	_XDisplay_screens             = offset( C_POINTER ),
	_XDisplay_motion_buffer       = offset( C_ULONG ),
	_XDisplay_private16           = offset( C_ULONG ),
	_XDisplay_private17           = offset( C_POINTER ),
	_XDisplay_private18           = offset( C_POINTER ),
	_XDisplay_private19           = offset( C_INT ),
	_XDisplay_xdefaults           = offset( C_POINTER ),
	_XDisplay_SIZE                = next_offset,
	$

constant 
	XGCValues_function           = offset( C_INT, 0 ),
	XGCValues_plane_mask         = offset( C_ULONG ),
	XGCValues_foreground         = offset( C_ULONG ),
	XGCValues_background         = offset( C_ULONG ),
	XGCValues_line_width         = offset( C_INT ),
	XGCValues_line_style         = offset( C_INT ),
	XGCValues_cap_style          = offset( C_INT ),
	XGCValues_join_style         = offset( C_INT ),
	XGCValues_fill_style         = offset( C_INT ),
	XGCValues_arc_mode           = offset( C_INT ),
	XGCValues_tile               = offset( C_ULONG ),
	XGCValues_stipple            = offset( C_ULONG ),
	XGCValues_ts_x_origin        = offset( C_INT ),
	XGCValues_ts_y_origin        = offset( C_INT ),
	XGCValues_font               = offset( C_ULONG ),
	XGCValues_subwindow_mode     = offset( C_INT ),
	XGCValues_graphics_exposures = offset( C_INT ),
	XGCValues_clip_x_origin      = offset( C_INT ),
	XGCValues_clip_y_origin      = offset( C_INT ),
	XGCValues_clip_mask          = offset( C_ULONG ),
	XGCValues_dash_offset        = offset( C_INT ),
	XGCValues_dashes             = offset( C_CHAR ),
	XGCValues_SIZE               = next_offset,
	$

constant
	XColor_pixel = offset( C_ULONG, 0 ),
	XColor_red   = offset( C_SHORT ),
	XColor_green = offset( C_SHORT ),
	XColor_blue  = offset( C_SHORT ),
	XColor_flags = offset( C_CHAR ),
	XColor_pad   = offset( C_CHAR ),
	XColor_SIZE  = next_offset,
	$

public constant
	XKeyEvent_type         = offset( C_INT, 0 ),
	XKeyEvent_serial       = offset( C_ULONG ),
	XKeyEvent_send_event   = offset( C_INT ),
	XKeyEvent_display      = offset( C_POINTER ),
	XKeyEvent_window       = offset( C_ULONG ),
	XKeyEvent_root         = offset( C_ULONG ),
	XKeyEvent_subwindow    = offset( C_ULONG ),
	XKeyEvent_time         = offset( C_ULONG ),
	XKeyEvent_x            = offset( C_INT ),
	XKeyEvent_y            = offset( C_INT ),
	XKeyEvent_x_root       = offset( C_INT ),
	XKeyEvent_y_root       = offset( C_INT ),
	XKeyEvent_state        = offset( C_UINT ),
	XKeyEvent_keycode      = offset( C_INT ),
	XKeyEvent_same_screen  = offset( C_INT ),
	XKeyEvent_SIZE         = next_offset,
	$

-- ug...manual structure padding below for 64-bit arch
public constant
	XClientMessageEvent_type         = offset( C_INT, 0 ),
	XClientMessageEvent_serial       = offset( C_ULONG ),
	XClientMessageEvent_send_event   = offset( C_INT ),
	XClientMessageEvent_display      = offset( C_POINTER, next_offset ),
	XClientMessageEvent_window       = offset( C_ULONG ),
	XClientMessageEvent_message_type = offset( C_ULONG ),
	XClientMessageEvent_format       = offset( C_INT ),
	XClientMessageEvent_data         = offset( C_ULONG ),
	XClientMessageEvent_data_b       = XClientMessageEvent_data,
	XClientMessageEvent_data_s       = XClientMessageEvent_data,
	XClientMessageEvent_data_l       = XClientMessageEvent_data,
	XClientMessageEvent_SIZE         = XClientMessageEvent_data + 20,
	$
	

public constant XEvent_SIZE = 1024

--** Input Event Masks. Used as event-mask window attribute and as arguments
--  to Grab requests.  Not to be confused with event names.
public constant
	NoEventMask			= 0,
	KeyPressMask			= power( 2, 0),
	KeyReleaseMask			= power( 2, 1)  ,
	ButtonPressMask			= power( 2, 2),  
	ButtonReleaseMask		= power( 2, 3)  ,
	EnterWindowMask			= power( 2, 4),  
	LeaveWindowMask			= power( 2, 5)  ,
	PointerMotionMask		= power( 2, 6),  
	PointerMotionHintMask		= power( 2, 7)  ,
	Button1MotionMask		= power( 2, 8),  
	Button2MotionMask		= power( 2, 9)  ,
	Button3MotionMask		= power( 2, 10), 
	Button4MotionMask		= power( 2, 11), 
	Button5MotionMask		= power( 2, 12), 
	ButtonMotionMask		= power( 2, 13), 
	KeymapStateMask			= power( 2, 14),
	ExposureMask			= power( 2, 15), 
	VisibilityChangeMask		= power( 2, 16) ,
	StructureNotifyMask		= power( 2, 17), 
	ResizeRedirectMask		= power( 2, 18), 
	SubstructureNotifyMask		= power( 2, 19) ,
	SubstructureRedirectMask	= power( 2, 20), 
	FocusChangeMask			= power( 2, 21), 
	PropertyChangeMask		= power( 2, 22), 
	ColormapChangeMask		= power( 2, 23), 
	OwnerGrabButtonMask		= power( 2, 24),
	$

--** Event names.  Used in "type" field in XEvent structures.  Not to be
-- confused with event masks above.  They start from 2 because 0 and 1
-- are reserved in the protocol for errors and replies.
public constant
	KeyPress		= 2,
	KeyRelease		= 3,
	ButtonPress		= 4,
	ButtonRelease		= 5,
	MotionNotify		= 6,
	EnterNotify		= 7,
	LeaveNotify		= 8,
	FocusIn			= 9,
	FocusOut		= 10,
	KeymapNotify		= 11,
	Expose			= 12,
	GraphicsExpose		= 13,
	NoExpose		= 14,
	VisibilityNotify	= 15,
	CreateNotify		= 16,
	DestroyNotify		= 17,
	UnmapNotify		= 18,
	MapNotify		= 19,
	MapRequest		= 20,
	ReparentNotify		= 21,
	ConfigureNotify		= 22,
	ConfigureRequest	= 23,
	GravityNotify		= 24,
	ResizeRequest		= 25,
	CirculateNotify		= 26,
	CirculateRequest	= 27,
	PropertyNotify		= 28,
	SelectionClear		= 29,
	SelectionRequest	= 30,
	SelectionNotify		= 31,
	ColormapNotify		= 32,
	ClientMessage		= 33,
	MappingNotify		= 34,
	GenericEvent		= 35,
	$
--** GC components: masks used in CreateGC, CopyGC, ChangeGC, OR'ed into GC.stateChanges */
public constant
	GCFunction          = power( 2, 0),
	GCPlaneMask         = power( 2, 1),
	GCForeground        = power( 2, 2),
	GCBackground        = power( 2, 3),
	GCLineWidth         = power( 2, 4),
	GCLineStyle         = power( 2, 5),
	GCCapStyle          = power( 2, 6),
	GCJoinStyle         = power( 2, 7),
	GCFillStyle         = power( 2, 8),
	GCFillRule          = power( 2, 9) ,
	GCTile              = power( 2, 10),
	GCStipple           = power( 2, 11),
	GCTileStipXOrigin   = power( 2, 12),
	GCTileStipYOrigin   = power( 2, 13),
	GCFont              = power( 2, 14),
	GCSubwindowMode     = power( 2, 15),
	GCGraphicsExposures = power( 2, 16),
	GCClipXOrigin       = power( 2, 17),
	GCClipYOrigin       = power( 2, 18),
	GCClipMask          = power( 2, 19),
	GCDashOffset        = power( 2, 20),
	GCDashList          = power( 2, 21),
	GCArcMode           = power( 2, 22),
	$

constant X11 = open_dll( "libX11.so" )

constant
	XOpenDisplay_cid        = define_c_func( X11, "XOpenDisplay", { C_POINTER }, C_POINTER  ),
	XDefaultScreen_cid      = define_c_func( X11, "XDefaultScreen", { C_POINTER }, C_INT ),
	XRootWindow_cid         = define_c_func( X11, "XRootWindow", { C_POINTER, C_INT }, C_POINTER ),
	XCreateSimpleWindow_cid = define_c_func( X11, "XCreateSimpleWindow", 
		{ C_POINTER, C_POINTER, C_INT, C_INT, C_UINT, C_UINT, C_INT, C_LONG, C_LONG }, C_ULONG ),
	XMapWindow_cid          = define_c_func( X11, "XMapWindow", { C_POINTER, C_POINTER }, C_INT ),
	XFlush_cid              = define_c_proc( X11, "XFlush", { C_POINTER } ),
	XCloseDisplay_cid       = define_c_proc( X11, "XCloseDisplay", { C_POINTER } ),
	XDestroyWindow_cid      = define_c_func( X11, "XDestroyWindow", { C_POINTER, C_POINTER }, C_INT ),
	XCreateGC_cid           = define_c_func( X11, "XCreateGC", { C_POINTER, C_POINTER, C_ULONG, C_POINTER }, C_INT ),
	XAllocColor_cid         = define_c_func( X11, "XAllocColor", { C_POINTER, C_ULONG, C_POINTER }, C_INT ),
	XNextEvent_cid          = define_c_func( X11, "XNextEvent", { C_POINTER, C_POINTER }, C_INT ),
	XWindowEvent_cid        = define_c_func( X11, "XWindowEvent", {  C_POINTER, C_ULONG, C_LONG, C_POINTER }, C_INT ),
	XSelectInput_cid        = define_c_func( X11, "XSelectInput", { C_POINTER, C_ULONG, C_LONG }, C_INT ),
	XSetWMProtocols_cid     = define_c_func( X11, "XSetWMProtocols", { C_POINTER, C_ULONG, C_POINTER, C_INT }, C_INT ),
	XInternAtom_cid         = define_c_func( X11, "XInternAtom", { C_POINTER, C_POINTER, C_INT }, C_ULONG ),
	
	XDefaultColormapOfScreen_cid = define_c_func( X11, "XDefaultColormapOfScreen", { C_POINTER }, C_POINTER ),
	XDefaultScreenOfDisplay_cid  = define_c_func( X11, "XDefaultScreenOfDisplay", { C_POINTER }, C_POINTER ),
	
	$

public function XOpenDisplay( object name )
	if sequence( name ) then
		name = allocate_string( name, 1 )
	end if
	return c_func( XOpenDisplay_cid, { name } )
end function

public function DefaultScreen( atom display )
	return c_func( XDefaultScreen_cid, { display } )
end function

public function RootWindow( atom display, integer screen )
	return c_func( XRootWindow_cid, { display, screen } )
end function

public function XCreateSimpleWindow( atom display, atom rootwindow, 
	integer x, integer y, integer width, integer height, 
	integer border_width, atom border, atom bkground )

	return c_func( XCreateSimpleWindow_cid, { display, rootwindow, x, y, width, height, border_width, border, bkground } )
end function

public function XMapWindow( atom display, atom window )
	return c_func( XMapWindow_cid, { display, window } )
end function

public procedure XFlush( atom display )
	c_proc( XFlush_cid, { display } )
end procedure

public procedure XCloseDisplay( atom display )
	c_proc( XCloseDisplay_cid, { display } )
end procedure

public function XDestroyWindow( atom display, atom window )
	return c_func( XDestroyWindow_cid, { display, window } )
end function

public function XCreateGC( atom display, atom drawable, integer valuemask, atom values )
	return c_func( XCreateGC_cid, { display, drawable, valuemask, values } )
end function

public procedure set_GC_value( atom gcvalue, integer component, atom value )
	switch component do
		case GCFunction then
			poke4( gcvalue + XGCValues_function, value )
		case GCPlaneMask then
		case GCForeground then
			poke_pointer( gcvalue + XGCValues_foreground, value )
		case GCBackground then
			poke_pointer( gcvalue + XGCValues_background, value )
		case GCLineWidth then
		case GCLineStyle then
		case GCCapStyle then
		case GCJoinStyle then
		case GCFillStyle then
		case GCFillRule then
		case GCTile then
		case GCStipple then
		case GCTileStipXOrigin then
		case GCTileStipYOrigin then
		case GCFont then
		case GCSubwindowMode then
		case GCGraphicsExposures then
		case GCClipXOrigin then
		case GCClipYOrigin then
		case GCClipMask then
		case GCDashOffset then
		case GCDashList then
		case GCArcMode then
	end switch
end procedure

public function new_GCValue( integer cleanup = 0 )
	return allocate( XGCValues_SIZE, cleanup )
end function

function new_XColor( integer cleanup = 0 )
	atom ptr = allocate( XColor_SIZE, cleanup )
	poke( ptr, repeat( 0, XColor_SIZE ) )
	return ptr
end function

public function alloc_color( atom display, integer red, integer green, integer blue, integer cleanup = 0 )
	atom 
		screen   = c_func( XDefaultScreenOfDisplay_cid, { display } ),
		colormap = c_func( XDefaultColormapOfScreen_cid, { screen } ),
		xcolor   = new_XColor( cleanup )
	
	poke2( xcolor + XColor_red, { red, green, blue } )
	c_func( XAllocColor_cid, { display, colormap, xcolor } )
	return xcolor
end function

public function new_XEvent( integer cleanup = 0 )
	return allocate( XEvent_SIZE, cleanup )
end function

public function XNextEvent( atom display, atom event )
	return c_func( XNextEvent_cid, { display, event } )
end function

public function XWindowEvent( atom display, atom window, atom mask, atom event )
	return c_func( XWindowEvent_cid, { display, window, mask, event } )
end function

public function XSelectInput( atom display, atom window, atom event_mask )
	return c_func( XSelectInput_cid, { display, window, event_mask } )
end function

public function XInternAtom( atom display, sequence name, integer only_if_exists )
	return c_func( XInternAtom_cid, { display, allocate_string( name, 1 ), only_if_exists } )
end function

public function XSetWMProtocols( atom display, atom window, object protocols )
	if atom( protocols ) then
		protocols = { protocols }
	end if
	
	atom ptr = allocate( sizeof( C_ULONG ) * length( protocols ), 1 )
	poke_pointer( ptr, protocols )
	return c_func( XSetWMProtocols_cid, { display, window, ptr, length( protocols ) } )
end function
