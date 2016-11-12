//
//  AppDelegate.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "HWTabbarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    //2.设置根控制器
    self.window.rootViewController = [[HWTabbarViewController alloc]init];
    //3.显示窗口
    [self.window  makeKeyAndVisible];
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

//UIViewController *vc1 = [[UIViewController alloc]init];
//vc1.tabBarItem.title = @"首页";
//vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
//vc1.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//NSMutableDictionary *textarr = [NSMutableDictionary dictionary];
//textarr[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
//[vc1.tabBarItem setTitleTextAttributes:textarr forState:UIControlStateNormal];
//NSMutableDictionary *selectedtextarr = [NSMutableDictionary dictionary];
//selectedtextarr[NSForegroundColorAttributeName] = [UIColor orangeColor];
//[vc1.tabBarItem setTitleTextAttributes:selectedtextarr forState:UIControlStateSelected];
//vc1.view.backgroundColor = HWRandomColor;
//
//
//
//UIViewController *vc2 = [[UIViewController alloc]init];
//vc2.view.backgroundColor = HWRandomColor;
//vc2.tabBarItem.title = @"消息";
//vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
//vc2.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_message_center_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//UIViewController *vc3 = [[UIViewController alloc]init];
//vc3.view.backgroundColor = HWRandomColor;
//vc3.tabBarItem.title = @"发现";
//vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
//vc3.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_discover_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//UIViewController *vc4 = [[UIViewController alloc]init];
//vc4.view.backgroundColor = HWRandomColor;
//vc4.tabBarItem.title = @"我";
//vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//vc4.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_profile_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
////tabbarvc.viewControllers=@[vc1,vc2,vc3,vc4];
//[tabbarvc addChildViewController:vc1];
//[tabbarvc addChildViewController:vc2];
//[tabbarvc addChildViewController:vc3];
//[tabbarvc addChildViewController:vc4];
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
