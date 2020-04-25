#import "AssetsPathResolverPlugin.h"

@implementation AssetsPathResolverPlugin

NSObject<FlutterPluginRegistrar>* _registrar;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  _registrar = registrar;
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"assets_path_resolver"
            binaryMessenger:[registrar messenger]];
  AssetsPathResolverPlugin* instance = [[AssetsPathResolverPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"resolvePath" isEqualToString:call.method]) {
    NSString* path = [call arguments];
    NSString* key = [_registrar lookupKeyForAsset:path];
    NSString* resolved = [[NSBundle mainBundle] pathForResource:key ofType:nil];
    result(resolved);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
