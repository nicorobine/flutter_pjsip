#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "MainViewController.h"
#import "FlutterAppDelegate+Pjsip.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [GeneratedPluginRegistrant registerWithRegistry:self];
//    /** 设置主控制器继承FlutterViewController*/
//    MainViewController * VC = [[MainViewController alloc]init];
//    UINavigationController * NVC = [[UINavigationController alloc]initWithRootViewController:VC];
//    [self.window setRootViewController:NVC];
////    FlutterViewController * VC = [[FlutterViewController alloc]init];
//    [self setupPjsip:application rootController:VC];
//  return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    BOOL rs = [super application:application didFinishLaunchingWithOptions:launchOptions];
        [GeneratedPluginRegistrant registerWithRegistry:self];
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [[MainViewController alloc] initWithProject:[[FlutterDartProject alloc] init]  nibName:nil bundle:nil];
        [self.window makeKeyAndVisible];
        [GeneratedPluginRegistrant registerWithRegistry:self];
        [self setupPjsip:application rootController:self.window.rootViewController];
        return rs;
}

@end
