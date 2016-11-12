//
//  HWProfileViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWProfileViewController.h"
#import "HWTest1ViewController.h"
@interface HWProfileViewController ()

@end

@implementation HWProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
        
}

-(void)setting{
    HWTest1ViewController *test1 = [[HWTest1ViewController alloc]init];
    test1.title = @"设置";
    [self.navigationController pushViewController:test1 animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}



@end
