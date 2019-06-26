{********************************************************************************
*Copyright (c) 2019 Gavrilov Artem                                              *
*                                                                               *
*Permission is hereby granted, free of charge, to any person obtaining a copy of*
*this software and associated documentation files (the "Software"), to deal in  *
*the Software without restriction, including without limitation the rights to   *
*use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies  *
*of the Software, and to permit persons to whom the Software is furnished to do *
*so, subject to the following conditions:                                       *
*                                                                               *
*The above copyright notice and this permission notice shall be included in all *
*copies or substantial portions of the Software.                                *
*                                                                               *
*THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     *
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       *
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    *
*AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         *
*LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  *
*OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  *
*SOFTWARE.                                                                      *
********************************************************************************}
unit EGL15;

interface

uses
  {$IFDEF MSWINDOWS}Winapi.Windows,{$ENDIF}
  System.SysUtils;

{$i Platform.inc}

//EGL 1.0
type
  EGLDisplay=Pointer;
  EGLConfig=Pointer;
  PEGLConfig=^EGLConfig;
  EGLSurface=Pointer;
  EGLContext=Pointer;
const
  EGL_ALPHA_SIZE=$3021;
  EGL_BAD_ACCESS=$3002;
  EGL_BAD_ALLOC=$3003;
  EGL_BAD_ATTRIBUTE=$3004;
  EGL_BAD_CONFIG=$3005;
  EGL_BAD_CONTEXT=$3006;
  EGL_BAD_CURRENT_SURFACE=$3007;
  EGL_BAD_DISPLAY=$3008;
  EGL_BAD_MATCH=$3009;
  EGL_BAD_NATIVE_PIXMAP=$300A;
  EGL_BAD_NATIVE_WINDOW=$300B;
  EGL_BAD_PARAMETER=$300C;
  EGL_BAD_SURFACE=$300D;
  EGL_BLUE_SIZE=$3022;
  EGL_BUFFER_SIZE=$3020;
  EGL_CONFIG_CAVEAT=$3027;
  EGL_CONFIG_ID=$3028;
  EGL_CORE_NATIVE_ENGINE=$305B;
  EGL_DEPTH_SIZE=$3025;
  EGL_DONT_CARE:Integer=-1;
  EGL_DRAW=$3059;
  EGL_EXTENSIONS=$3055;
  EGL_GREEN_SIZE=$3023;
  EGL_HEIGHT=$3056;
  EGL_LARGEST_PBUFFER=$3058;
  EGL_LEVEL=$3029;
  EGL_MAX_PBUFFER_HEIGHT=$302A;
  EGL_MAX_PBUFFER_PIXELS=$302B;
  EGL_MAX_PBUFFER_WIDTH=$302C;
  EGL_NATIVE_RENDERABLE=$302D;
  EGL_NATIVE_VISUAL_ID=$302E;
  EGL_NATIVE_VISUAL_TYPE=$302F;
  EGL_NONE=$3038;
  EGL_NON_CONFORMANT_CONFIG=$3051;
  EGL_NOT_INITIALIZED=$3001;
  EGL_NO_CONTEXT:EGLContext=0;
  EGL_NO_DISPLAY:EGLDisplay=0;
  EGL_NO_SURFACE:EGLSurface=0;
  EGL_PBUFFER_BIT=$0001;
  EGL_PIXMAP_BIT=$0002;
  EGL_READ=$305A;
  EGL_RED_SIZE=$3024;
  EGL_SAMPLES=$3031;
  EGL_SAMPLE_BUFFERS=$3032;
  EGL_SLOW_CONFIG=$3050;
  EGL_STENCIL_SIZE=$3026;
  EGL_SUCCESS=$3000;
  EGL_SURFACE_TYPE=$3033;
  EGL_TRANSPARENT_BLUE_VALUE=$3035;
  EGL_TRANSPARENT_GREEN_VALUE=$3036;
  EGL_TRANSPARENT_RED_VALUE=$3037;
  EGL_TRANSPARENT_RGB=$3052;
  EGL_TRANSPARENT_TYPE=$3034;
  EGL_VENDOR=$3053;
  EGL_VERSION=$3054;
  EGL_WIDTH=$3057;
  EGL_WINDOW_BIT=$0004;

function eglChooseConfig(dpy:EGLDisplay;const attrib_list:PInteger;configs:PEGLConfig;config_size:Integer;out num_config:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCopyBuffers(dpy:EGLDisplay;surface:EGLSurface;target:EGLNativePixmapType):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreateContext(dpy:EGLDisplay;config:EGLConfig;share_context:EGLContext;const attrib_list:PInteger):EGLContext;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePbufferSurface(dpy:EGLDisplay;config:EGLConfig;const attrib_list:PInteger):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePixmapSurface(dpy:EGLDisplay;config:EGLConfig;pixmap:EGLNativePixmapType;const attrib_list:PInteger):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreateWindowSurface(dpy:EGLDisplay;config:EGLConfig;win:EGLNativeWindowType;const attrib_list:PInteger):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroyContext(dpy:EGLDisplay;ctx:EGLContext):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroySurface(dpy:EGLDisplay;surface:EGLSurface):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetConfigAttrib(dpy:EGLDisplay;config:EGLConfig;attribute:Integer;out value):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetConfigs(dpy:EGLDisplay;configs:PEGLConfig;config_size:Integer;out num_config:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetCurrentDisplay():EGLDisplay;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetCurrentSurface(readdraw:Integer):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetDisplay(display_id:EGLNativeDisplayType):EGLDisplay;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetError():Integer;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetProcAddress(const procname:PAnsiChar):Pointer;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglInitialize(dpy:EGLDisplay;major:PInteger=nil;minor:PInteger=nil):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglMakeCurrent(dpy:EGLDisplay;draw:EGLSurface;read:EGLSurface;ctx:EGLContext):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQueryContext(dpy:EGLDisplay;ctx:EGLContext;attribute:Integer;var value):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQueryString(dpy:EGLDisplay;name:Integer):PAnsiChar;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQuerySurface(dpy:EGLDisplay;surface:EGLSurface;attribute:Integer;var value):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglSwapBuffers(dpy:EGLDisplay;surface:EGLSurface):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglTerminate(dpy:EGLDisplay):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitGL():LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitNative(engine:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

//EGL 1.1
const
  EGL_BACK_BUFFER=$3084;
  EGL_BIND_TO_TEXTURE_RGB=$3039;
  EGL_BIND_TO_TEXTURE_RGBA=$303A;
  EGL_CONTEXT_LOST=$300E;
  EGL_MIN_SWAP_INTERVAL=$303B;
  EGL_MAX_SWAP_INTERVAL=$303C;
  EGL_MIPMAP_TEXTURE=$3082;
  EGL_MIPMAP_LEVEL=$3083;
  EGL_NO_TEXTURE=$305C;
  EGL_TEXTURE_2D=$305F;
  EGL_TEXTURE_FORMAT=$3080;
  EGL_TEXTURE_RGB=$305D;
  EGL_TEXTURE_RGBA=$305E;
  EGL_TEXTURE_TARGET=$3081;
function eglBindTexImage(dpy:EGLDisplay;surface:EGLSurface;buffer:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglReleaseTexImage(dpy:EGLDisplay;surface:EGLSurface;buffer:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglSurfaceAttrib(dpy:EGLDisplay;surface:EGLSurface;attribute,value:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglSwapInterval(dpy:EGLDisplay;interval:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

//EGL 1.2
type
  EGLClientBuffer=Pointer;
const
  EGL_ALPHA_FORMAT=$3088;
  EGL_ALPHA_FORMAT_NONPRE=$308B;
  EGL_ALPHA_FORMAT_PRE=$308C;
  EGL_ALPHA_MASK_SIZE=$303E;
  EGL_BUFFER_PRESERVED=$3094;
  EGL_BUFFER_DESTROYED=$3095;
  EGL_CLIENT_APIS=$308D;
  EGL_COLORSPACE=$3087;
  EGL_COLORSPACE_sRGB=$3089;
  EGL_COLORSPACE_LINEAR=$308A;
  EGL_COLOR_BUFFER_TYPE=$303F;
  EGL_CONTEXT_CLIENT_TYPE=$3097;
  EGL_DISPLAY_SCALING=10000;
  EGL_HORIZONTAL_RESOLUTION=$3090;
  EGL_LUMINANCE_BUFFER=$308F;
  EGL_LUMINANCE_SIZE=$303D;
  EGL_OPENGL_ES_BIT=$0001;
  EGL_OPENVG_BIT=$0002;
  EGL_OPENGL_ES_API=$30A0;
  EGL_OPENVG_API=$30A1;
  EGL_OPENVG_IMAGE=$3096;
  EGL_PIXEL_ASPECT_RATIO=$3092;
  EGL_RENDERABLE_TYPE=$3040;
  EGL_RENDER_BUFFER=$3086;
  EGL_RGB_BUFFER=$308E;
  EGL_SINGLE_BUFFER=$3085;
  EGL_SWAP_BEHAVIOR=$3093;
  EGL_UNKNOWN:integer=-1;
  EGL_VERTICAL_RESOLUTION=$3091;
function eglBindAPI(api:Cardinal):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQueryAPI():Cardinal;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePbufferFromClientBuffer(dpy:EGLDisplay;buftype:Cardinal;buffer:EGLClientBuffer;config:EGLConfig;const attrib_list:PInteger):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglReleaseThread():LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitClient():LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

//EGL 1.3
const
  EGL_CONFORMANT=$3042;
  EGL_CONTEXT_CLIENT_VERSION=$3098;
  EGL_MATCH_NATIVE_PIXMAP=$3041;
  EGL_OPENGL_ES2_BIT=$0004;
  EGL_VG_ALPHA_FORMAT=$3088;
  EGL_VG_ALPHA_FORMAT_NONPRE=$308B;
  EGL_VG_ALPHA_FORMAT_PRE=$308C;
  EGL_VG_ALPHA_FORMAT_PRE_BIT=$0040;
  EGL_VG_COLORSPACE=$3087;
  EGL_VG_COLORSPACE_sRGB=$3089;
  EGL_VG_COLORSPACE_LINEAR=$308A;
  EGL_VG_COLORSPACE_LINEAR_BIT=$0020;

//EGL 1.4
const
  EGL_DEFAULT_DISPLAY:EGLNativeDisplayType=0;
  EGL_MULTISAMPLE_RESOLVE_BOX_BIT=$0200;
  EGL_MULTISAMPLE_RESOLVE=$3099;
  EGL_MULTISAMPLE_RESOLVE_DEFAULT=$309A;
  EGL_MULTISAMPLE_RESOLVE_BOX=$309B;
  EGL_OPENGL_API=$30A2;
  EGL_OPENGL_BIT=$0008;
  EGL_SWAP_BEHAVIOR_PRESERVED_BIT=$0400;
function eglGetCurrentContext():EGLContext;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

//EGL 1.5
type
  EGLSync=Pointer;
  EGLAttrib=NativeInt;
  PEGLAttrib=^EGLAttrib;
  EGLTime=UInt64;
  EGLImage=Pointer;
const
  EGL_CONTEXT_MAJOR_VERSION=$3098;
  EGL_CONTEXT_MINOR_VERSION=$30FB;
  EGL_CONTEXT_OPENGL_PROFILE_MASK=$30FD;
  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY=$31BD;
  EGL_NO_RESET_NOTIFICATION=$31BE;
  EGL_LOSE_CONTEXT_ON_RESET=$31BF;
  EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT=$00000001;
  EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT=$00000002;
  EGL_CONTEXT_OPENGL_DEBUG=$31B0;
  EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE=$31B1;
  EGL_CONTEXT_OPENGL_ROBUST_ACCESS=$31B2;
  EGL_OPENGL_ES3_BIT=$00000040;
  EGL_CL_EVENT_HANDLE=$309C;
  EGL_SYNC_CL_EVENT=$30FE;
  EGL_SYNC_CL_EVENT_COMPLETE=$30FF;
  EGL_SYNC_PRIOR_COMMANDS_COMPLETE=$30F0;
  EGL_SYNC_TYPE=$30F7;
  EGL_SYNC_STATUS=$30F1;
  EGL_SYNC_CONDITION=$30F8;
  EGL_SIGNALED=$30F2;
  EGL_UNSIGNALED=$30F3;
  EGL_SYNC_FLUSH_COMMANDS_BIT=$0001;
  EGL_FOREVER=$FFFFFFFFFFFFFFFF;
  EGL_TIMEOUT_EXPIRED=$30F5;
  EGL_CONDITION_SATISFIED=$30F6;
  EGL_NO_SYNC:EGLSync=0;
  EGL_SYNC_FENCE=$30F9;
  EGL_GL_COLORSPACE=$309D;
  EGL_GL_COLORSPACE_SRGB=$3089;
  EGL_GL_COLORSPACE_LINEAR=$308A;
  EGL_GL_RENDERBUFFER=$30B9;
  EGL_GL_TEXTURE_2D=$30B1;
  EGL_GL_TEXTURE_LEVEL=$30BC;
  EGL_GL_TEXTURE_3D=$30B2;
  EGL_GL_TEXTURE_ZOFFSET=$30BD;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X=$30B3;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X=$30B4;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y=$30B5;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y=$30B6;
  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z=$30B7;
  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z=$30B8;
  EGL_IMAGE_PRESERVED=$30D2;
  EGL_NO_IMAGE:EGLImage=0;
function eglCreateSync(dpy:EGLDisplay;&type:Cardinal;const attrib_list:PEGLAttrib):EGLSync;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroySync(dpy:EGLDisplay;sync:EGLSync):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglClientWaitSync(dpy:EGLDisplay;sync:EGLSync;flags:Integer;timeout:EGLTime):Integer;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetSyncAttrib(dpy:EGLDisplay;sync:EGLSync;attribute:Integer;value:PEGLAttrib):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreateImage(dpy:EGLDisplay;ctx:EGLContext;target:Cardinal;buffer:EGLClientBuffer;const attrib_list:PEGLAttrib):EGLImage;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroyImage(dpy:EGLDisplay;image:EGLImage):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetPlatformDisplay(&platform:Cardinal;native_display:Pointer;const attrib_list:PEGLAttrib):EGLDisplay;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePlatformWindowSurface(dpy:EGLDisplay;config:EGLConfig;native_window:Pointer;const attrib_list:PEGLAttrib):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePlatformPixmapSurface(dpy:EGLDisplay;config:EGLConfig;native_pixmap:Pointer;const attrib_list:PEGLAttrib):EGLSurface;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitSync(dpy:EGLDisplay;sync:EGLSync;flags:Integer):LongBool;{$IFDEF windows}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

implementation

end.
