{$IFDEF FPC}
  {$IFDEF DARWIN}
    {$Define APPLE}
  {$ENDIF}
{$ELSE}
  {$IFDEF MACOS}
    {$Define APPLE}
  {$ENDIF}
  {$IFDEF IOS}
    {$Define APPLE}
  {$ENDIF}
{$ENDIF}


type
  EGLNativeDisplayType={$IFDEF MSWINDOWS}HDC{$ELSE}
  {$IFDEF APPLE}Integer{$ELSE}
  {$Message Error 'Not implemented for this platform'}
  {$ENDIF}{$ENDIF};

  EGLNativePixmapType={$IFDEF MSWINDOWS}HBITMAP{$ELSE}
  {$IFDEF APPLE}Pointer{$ELSE}
  {$Message Error 'Not implemented for this platform'}
  {$ENDIF}{$ENDIF};

  EGLNativeWindowType={$IFDEF MSWINDOWS}HWND{$ELSE}
  {$IFDEF APPLE}Pointer{$ELSE}
  {$Message Error 'Not implemented for this platform'}
  {$ENDIF}{$ENDIF};
{#elif defined(__EMSCRIPTEN__)

typedef int EGLNativeDisplayType;
typedef int EGLNativePixmapType;
typedef int EGLNativeWindowType;}

{#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */

typedef int   EGLNativeDisplayType;
typedef void *EGLNativePixmapType;
typedef void *EGLNativeWindowType;

#elif defined(WL_EGL_PLATFORM)

typedef struct wl_display     *EGLNativeDisplayType;
typedef struct wl_egl_pixmap  *EGLNativePixmapType;
typedef struct wl_egl_window  *EGLNativeWindowType;

#elif defined(__GBM__)

typedef struct gbm_device  *EGLNativeDisplayType;
typedef struct gbm_bo      *EGLNativePixmapType;
typedef void               *EGLNativeWindowType;

#elif defined(__ANDROID__) || defined(ANDROID)

struct ANativeWindow;
struct egl_native_pixmap_t;

typedef void*                           EGLNativeDisplayType;
typedef struct egl_native_pixmap_t*     EGLNativePixmapType;
typedef struct ANativeWindow*           EGLNativeWindowType;

#elif defined(USE_OZONE)

typedef intptr_t EGLNativeDisplayType;
typedef intptr_t EGLNativePixmapType;
typedef intptr_t EGLNativeWindowType;

#elif defined(__unix__) || defined(USE_X11)

/* X11 (tentative)  */
#include <X11/Xlib.h>
#include <X11/Xutil.h>

typedef Display *EGLNativeDisplayType;
typedef Pixmap   EGLNativePixmapType;
typedef Window   EGLNativeWindowType;

#elif defined(__HAIKU__)

#include <kernel/image.h>

typedef void              *EGLNativeDisplayType;
typedef khronos_uintptr_t  EGLNativePixmapType;
typedef khronos_uintptr_t  EGLNativeWindowType;}

const
  EGLLib={$IFDEF MSWINDOWS}'libEGL.dll'{$ELSE}'libEGL.so'{$ENDIF};
