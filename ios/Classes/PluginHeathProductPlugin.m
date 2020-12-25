#import "PluginHeathProductPlugin.h"
#if __has_include(<plugin_heath_product/plugin_heath_product-Swift.h>)
#import <plugin_heath_product/plugin_heath_product-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_heath_product-Swift.h"
#endif

@implementation PluginHeathProductPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginHeathProductPlugin registerWithRegistrar:registrar];
}
@end
