//
//  HWTabbar.h
//  微博
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWTabBar;
@protocol HWTabbarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(HWTabBar *)tabBar;
@end
@interface HWTabBar : UITabBar
@property (nonatomic, weak) id<HWTabbarDelegate> delegate;
@end
