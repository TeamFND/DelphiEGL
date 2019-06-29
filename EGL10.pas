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
unit EGL10;

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

function eglChooseConfig(dpy:EGLDisplay;const attrib_list:PInteger;configs:PEGLConfig;config_size:Integer;out num_config:Integer):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCopyBuffers(dpy:EGLDisplay;surface:EGLSurface;target:EGLNativePixmapType):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreateContext(dpy:EGLDisplay;config:EGLConfig;share_context:EGLContext;const attrib_list:PInteger):EGLContext;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePbufferSurface(dpy:EGLDisplay;config:EGLConfig;const attrib_list:PInteger):EGLSurface;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreatePixmapSurface(dpy:EGLDisplay;config:EGLConfig;pixmap:EGLNativePixmapType;const attrib_list:PInteger):EGLSurface;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglCreateWindowSurface(dpy:EGLDisplay;config:EGLConfig;win:EGLNativeWindowType;const attrib_list:PInteger):EGLSurface;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroyContext(dpy:EGLDisplay;ctx:EGLContext):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglDestroySurface(dpy:EGLDisplay;surface:EGLSurface):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetConfigAttrib(dpy:EGLDisplay;config:EGLConfig;attribute:Integer;out value):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetConfigs(dpy:EGLDisplay;configs:PEGLConfig;config_size:Integer;out num_config:Integer):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetCurrentDisplay():EGLDisplay;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetCurrentSurface(readdraw:Integer):EGLSurface;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetDisplay(display_id:EGLNativeDisplayType):EGLDisplay;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetError():Integer;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglGetProcAddress(const procname:PAnsiChar):Pointer;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglInitialize(dpy:EGLDisplay;major:PInteger=nil;minor:PInteger=nil):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglMakeCurrent(dpy:EGLDisplay;draw:EGLSurface;read:EGLSurface;ctx:EGLContext):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQueryContext(dpy:EGLDisplay;ctx:EGLContext;attribute:Integer;var value):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQueryString(dpy:EGLDisplay;name:Integer):PAnsiChar;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglQuerySurface(dpy:EGLDisplay;surface:EGLSurface;attribute:Integer;var value):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglSwapBuffers(dpy:EGLDisplay;surface:EGLSurface):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglTerminate(dpy:EGLDisplay):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitGL():LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;
function eglWaitNative(engine:Integer):LongBool;{$IFDEF MSWINDOWS}stdcall;{$ELSE}cdecl;{$ENDIF}external EGLLib;

implementation

end.
