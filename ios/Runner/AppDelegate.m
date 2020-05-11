#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@import UIKit;
@import Firebase;


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        [FIRApp configure];
        [GMSServices provideAPIKey:@"AIzaSyBTAN5AvaQuKAQOI3UKienu32xD0Y136zI"];
        [GeneratedPluginRegistrant registerWithRegistry:self];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
