//
//  AppDelegate.m
//  X-BIONIC
//
//  Created by Qiuhaosheng on 14-8-28.
//  Copyright (c) 2014年 SY. All rights reserved.
//

#import "XBMainViewController.h"
#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // 初始化一个主视图控制器
    XBMainViewController *XBMainVC = [[XBMainViewController alloc] init];
    // 初始化一个导航控制器实例，把XBMainVC作为指定的根视图控制器
    UINavigationController *XBMainNC = [[UINavigationController alloc] initWithRootViewController:XBMainVC];
    // 把导航控制器的实例作为根视图控制器
    self.window.rootViewController = XBMainNC;
    // 改变导航栏图标颜色
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
    // 设置屏幕的颜色
    self.window.backgroundColor = [UIColor whiteColor];
    // 让视图可见，并显示在屏幕上
    [self.window makeKeyAndVisible];
    
    // 修改字体样式
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor],NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue" size:18], NSFontAttributeName, nil]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
