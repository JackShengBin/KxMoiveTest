//
//  AppDelegate.m
//  高仿映客
//
//  Created by 梦想 on 2016/11/8.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "AppDelegate.h"
#import "BINNavViewController.h"
#import "BINHomeViewController.h"
#import "BINLiveViewController.h"
#import "BINMeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.view.backgroundColor = [UIColor clearColor];
    tabbar.viewControllers = [self createControllersArray];
    self.window.rootViewController = tabbar;

    return YES;
}

- (NSArray *)createControllersArray{
    
    NSMutableArray *arrays = [NSMutableArray new];
    BINHomeViewController *first = [[BINHomeViewController alloc] init];
    first.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tab_live"] selectedImage:[UIImage imageNamed:@"tab_live_p"]];
    first.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    BINLiveViewController *second = [[BINLiveViewController alloc] init];
    second.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tab_room"] selectedImage:[UIImage imageNamed:@"tab_room_p"]];
    second.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    BINMeViewController *third = [[BINMeViewController alloc] init];
    third.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tab_me"] selectedImage:[UIImage imageNamed:@"tab_me_p"]];
    third.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    NSArray *controllers = @[first, second, third];
    for (int i = 0; i < controllers.count; i++) {
        BINNavViewController *nav = [[BINNavViewController alloc] initWithRootViewController:controllers[i]] ;
        [arrays addObject:nav];
    }
    return arrays;
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


@end
