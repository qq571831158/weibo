//
//  HWDiscoverViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWDiscoverViewController.h"
#import "HWSearchBar.h"
@interface HWDiscoverViewController ()

@end

@implementation HWDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建搜索框
    HWSearchBar *searchBar = [HWSearchBar searchBar];
    searchBar.width=300;
    searchBar.height=30;
    self.navigationItem.titleView = searchBar;
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这里是发现"];
    
    
    return cell;
}
@end
