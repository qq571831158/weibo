//
//  HWdropdownMenu.m
//  微博
//
//  Created by Apple on 2016/11/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWdropdownMenu.h"
@interface HWdropdownMenu()
@property(nonatomic,weak) UIImageView *containerView;
@end
@implementation HWdropdownMenu
-(UIImageView *)containerView{
    if(!_containerView){
        UIImageView *containerView = [[UIImageView alloc]init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
//        containerView.width = 217;
//        containerView.height = 217;
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
      }
    return self;
}

+(instancetype)menu{
    return [[self alloc]init];
}


-(void)setContent:(UIView *)content{
    _content = content;
    content.x=10;
    content.y=15;
    self.containerView.height = CGRectGetMaxY(content.frame)+11;
    self.containerView.width = CGRectGetMaxX(content.frame)+10;
    [self.containerView addSubview:content];
}
-(void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    self.content = contentController.view;
}
-(void)showFrom:(UIView *)from{
    //1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    //2添加自己到窗口上
    [window addSubview: self];
    //3.设置尺寸
    self.frame = window.bounds;
    //4.设置灰色图片的位置
    //默认情况下，frame是以父控件左上角为坐标原点
    //可以转换坐标原点，，改变frame的参照点
    CGRect newframe = [from.superview convertRect:from.frame toView:window];
    self.containerView.centerX = CGRectGetMidX(newframe);
    self.containerView.y = CGRectGetMaxY(newframe);
    
    if([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]){
        [self.delegate dropdownMenuDidShow:self];
    }
}

-(void)dismiss{
    [self removeFromSuperview];
    if([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]){
        [self.delegate dropdownMenuDidDismiss:self];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
@end
