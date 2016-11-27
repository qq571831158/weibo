//
//  HWdropdownMenu.h
//  微博
//
//  Created by Apple on 2016/11/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWdropdownMenu;
@protocol HWdropdownMenuDelegate <NSObject>
-(void)dropdownMenuDidDismiss:(HWdropdownMenu *)menu;
-(void)dropdownMenuDidShow:(HWdropdownMenu *)menu;
@end
@interface HWdropdownMenu : UIView
@property (nonatomic, weak) id<HWdropdownMenuDelegate>delegate;

+(instancetype)menu;

-(void)showFrom:(UIView *)from;;

-(void)dismiss;

@property(nonatomic,strong)UIView *content;

@property(nonatomic,strong)UIViewController *contentController;
@end
