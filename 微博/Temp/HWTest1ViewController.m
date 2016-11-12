//
//  HWTest1ViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWTest1ViewController.h"
#import "HWTest2ViewController.h"
@interface HWTest1ViewController ()

@end

@implementation HWTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HWTest2ViewController *test2 = [[HWTest2ViewController alloc]init];
    test2.title = @"测试2控制器";
    [self.navigationController pushViewController:test2 animated:YES];
}

@end
