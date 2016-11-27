//
//  HWTabbarViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWTabbarViewController.h"
#import "HWHomeViewController.h"
#import "HWMessageCenterViewController.h"
#import "HWDiscoverViewController.h"
#import "HWProfileViewController.h"
#import "HWNavigationController.h"
#import "HWTabBar.h"
@interface HWTabbarViewController ()<HWTabbarDelegate>

@end

@implementation HWTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HWHomeViewController *home = [[HWHomeViewController alloc]init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    HWMessageCenterViewController *messageCenter =[[HWMessageCenterViewController alloc]init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    HWDiscoverViewController *discover = [[HWDiscoverViewController alloc]init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    HWProfileViewController *profile = [[HWProfileViewController alloc]init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    //2.更换系统系在的tabbar
   // self.tabBar = [[HWTabbar alloc]init];
    HWTabBar *tabBar = [[HWTabBar alloc]init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    }

-(void )addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectedImage
{
    //设置子控制器颜色图片
//    childVc.tabBarItem.title = title;    设置tabbar标题
//    childVc.navigationItem.title = title;  设置nav标题
    childVc.title = title;                  //同时设置tabbar和nav标题
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *textarr = [NSMutableDictionary dictionary];
    textarr[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectedtextarr = [NSMutableDictionary dictionary];
    selectedtextarr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textarr forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedtextarr forState:UIControlStateSelected];
    //childVc.view.backgroundColor = HWRandomColor ;
    HWNavigationController *nav = [[HWNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


-(void)tabBarDidClickPlusButton:(HWTabBar *)tabBar{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
