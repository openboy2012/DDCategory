//
//  AppDelegate.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "AppDelegate.h"
#import "DDCategory.h"
//#import <CocoaLumberjack/CocoaLumberjack.h>

#define ddLogLevel 1

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Standard lumberjack initialization
//    setenv("XcodeColors", "YES", 0);
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [self.window makeKeyAndVisible];
    
//    self.window = [[UIApplication sharedApplication].windows lastObject];
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
        
//    // set custom log format
//    VideoGoCustomFormatter *cf = [[VideoGoCustomFormatter alloc] init]; // should not release, create once in app life time
//    [[DDTTYLogger sharedInstance] setLogFormatter:cf];
    
    // And we're going to enable colors
//    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
//    
//    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:nil forFlag:DDLogFlagError];
//    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor orangeColor] backgroundColor:nil forFlag:DDLogFlagDebug];
//    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:nil forFlag:DDLogFlagInfo];
//    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
//    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
//    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    [DDLog addLogger:fileLogger];
    
//    DDLogDebug(@"1234");
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    NSLog(@"orientation is %ld",[[UIViewController dd_findBestViewController:window.rootViewController] supportedInterfaceOrientations]);
    return [[UIViewController dd_findBestViewController:window.rootViewController] supportedInterfaceOrientations];
}

@end
