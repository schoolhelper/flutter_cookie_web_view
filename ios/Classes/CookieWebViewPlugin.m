#import "CookieWebViewPlugin.h"
#import <cookie_web_view/cookie_web_view-Swift.h>

@implementation CookieWebViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCookieWebViewPlugin registerWithRegistrar:registrar];
}
@end
