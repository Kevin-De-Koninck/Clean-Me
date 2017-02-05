#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DJActivityIndicator.h"
#import "DJBezierPath.h"
#import "DJProgressHUD.h"
#import "DJProgressIndicator.h"

FOUNDATION_EXPORT double DJProgressHUD_OSXVersionNumber;
FOUNDATION_EXPORT const unsigned char DJProgressHUD_OSXVersionString[];

