//
//  HWTabbar.m
//  微博
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWTabbar.h"
@interface HWTabBar()
@property(nonatomic,weak)UIButton *plusBtn;
@end
@implementation HWTabBar
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    
    }
    
    return self;
}


-(void)plusClick{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.plusBtn.centerX = self.width*0.5;
    self.plusBtn.centerY = self.height*0.5;
    CGFloat tabbarButtonW = self.width/5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if([child isKindOfClass:class]){
            child.width = tabbarButtonW;
            child.x = tabbarButtonIndex *tabbarButtonW;
            tabbarButtonIndex++;
            if(tabbarButtonIndex == 2){
                tabbarButtonIndex++;
            }
        }
    }
    
    
    
//    int count = (int)self.subviews.count;
//    for(int i=0;i<count;i++){
//        UIView *Child = self.subviews[i];
//        Class class = NSClassFromString(@"UITabBarButton");
//        if([Child isKindOfClass:class]){
//            Child.width = tabbarButtonW;
//            Child.x = tabbarButtonIndex *tabbarButtonW;
//            tabbarButtonIndex++;
//            if(tabbarButtonIndex == 2){
//                tabbarButtonIndex++;
//            }
//        }
//    }
}

@end
