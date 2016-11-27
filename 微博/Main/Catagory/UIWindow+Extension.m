//
//  UIWindow+Extension.m
//  微博
//
//  Created by Apple on 2016/11/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "HWTabbarViewController.h"
#import "HWNewfeatureViewController.h"
@implementation UIWindow (Extension)
+(void)switchRootViewController{
    NSString *key = @"CFBundleVersion";
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //获得当前软件的版本号(从info.plist中获得)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if([currentVersion isEqualToString:lastVersion]){//版本号相同
        window.rootViewController = [[HWTabbarViewController alloc]init];
    }
    else{
         window.rootViewController = [[HWNewfeatureViewController alloc]init];
        //存储当前版本号到沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}
@end
