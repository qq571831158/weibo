//
//  HWNewfeatureViewController.m
//  微博
//
//  Created by Apple on 2016/11/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWNewfeatureViewController.h"
#import "HWTabbarViewController.h"
#define HWNewfeatureCount 4
@interface HWNewfeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) UIPageControl *pageControl;
@end

@implementation HWNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    
    
    //1. 创建一个scrollView: 显示所有的新特性
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
   
    [self.view addSubview:scrollView];
    
    //2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for(int i=0;i<HWNewfeatureCount;i++){
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.width = scrollW;
        imageView.height= scrollH;
        imageView.y = 0;
        imageView.x = i*scrollW;
   //3.显示图片
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        if (i==HWNewfeatureCount-1) {
            [self setupLastImageView:imageView];
        }
    }
     scrollView.contentSize = CGSizeMake(HWNewfeatureCount*scrollW, 0);
     scrollView.bounces = NO;//去除弹簧效果
     scrollView.pagingEnabled = YES;  //分页
     scrollView.showsHorizontalScrollIndicator = NO;//去除水平滚动条
     scrollView.delegate = self;
    //4.添加pageControl 分页  展示目前的页数
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = HWNewfeatureCount;
//    pageControl.width = 100;
//    pageControl.height = 50;
//    pageControl.userInteractionEnabled = NO; 不设置宽高一样显示
    pageControl.centerX = scrollW*0.5;
    pageControl.centerY = scrollH-50;
    pageControl.currentPageIndicatorTintColor = HWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = HWColor(189, 189, 189);
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(void)setupLastImageView:(UIImageView *)imageView{
    //开启交互
    imageView.userInteractionEnabled = YES;
    //1.分享给大家(checkbox)
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 100;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width*0.5;
    shareBtn.centerY = imageView.height*0.65;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
   // shareBtn.contentEdgeInsets = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    //shareBtn.titleEdgeInsets         标题内编剧
    //shareBtn.imageEdgeInsets
    //2.开始微博
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height*0.75;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
    

}

-(void)startClick{
    //切换到HWTabBarController
    //切换控制器的手段
    //1.push   2.modal     3.切换window的rootViewController
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[HWTabbarViewController alloc]init];
}

-(void)shareClick:(UIButton *)shareBtn{
    shareBtn.selected = !shareBtn.isSelected;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x/scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}

@end
