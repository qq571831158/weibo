//
//  HWMessageCenterViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWMessageCenterViewController.h"
#import "HWTest1ViewController.h"
@interface HWMessageCenterViewController ()

@end

@implementation HWMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
    self.navigationItem.rightBarButtonItem.enabled = NO;

    }

-(void)composeMsg{
    NSLog(@"compose");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"test-message-%ld",(long)indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HWTest1ViewController *test1 = [[HWTest1ViewController alloc]init];
    test1.title = @"测试1控制器";
    test1.hidesBottomBarWhenPushed = YES;       //当test1被push的时候，test1被所在的tabbarcontroller的tabbar会自动隐藏
    [self.navigationController pushViewController:test1 animated:YES];
}

@end
