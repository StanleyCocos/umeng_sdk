#import "UmengsdkPlugin.h"
//#if __has_include(<umengsdk/umengsdk-Swift.h>)
//#import <umengsdk/umengsdk-Swift.h>
//#else
//// Support project import fallback if the generated compatibility header
//// is not copied when this plugin is created as a library.
//// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
////#import "umengsdk-Swift.h"
//#endif

#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogHeaders.h>

@implementation UmengsdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
        methodChannelWithName:@"umengsdk"
              binaryMessenger:[registrar messenger]];
    UmengsdkPlugin* instance = [[UmengsdkPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
 
    if([@"initUmeng" isEqualToString:call.method]){
        [UMConfigure initWithAppkey:call.arguments[@"key"] channel: call.arguments[@"channel"]];
        Boolean isShowLog = (Boolean)call.arguments[@"log"];
        if(isShowLog){
            [UMConfigure setLogEnabled:true];
            [UMCommonLogManager setUpUMCommonLogManager];
        }
    } else {
        result(UIDevice.currentDevice.systemVersion);
    }
}

@end
