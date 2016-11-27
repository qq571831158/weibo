//
//  HWHomeViewController.m
//  微博
//
//  Created by Apple on 2016/11/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWdropdownMenu.h"
#import "HWTitleMenuViewController.h"
@interface HWHomeViewController ()<HWdropdownMenuDelegate>

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏左右内容
    self.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithTarget:self action:@selector(friendsearch) image:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted"];
    //设置导航栏中间内容
    UIButton *titleButton = [[UIButton alloc]init];
    titleButton.width = 150;
    titleButton.height = 30;
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}
-(void)titleClick:(UIButton *) titleButton{
//    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
//    UIView *cover = [[UIView alloc]init];
//    cover.backgroundColor = [UIColor clearColor];
//    cover.frame = window.frame;
//    
//    [window addSubview: cover];
//    
//    UIImageView *dropdownMenu = [[UIImageView alloc]init];
//    dropdownMenu.image = [UIImage imageNamed:@"popover_background"];
//    dropdownMenu.width = 217;
//    dropdownMenu.height = 217;
//    dropdownMenu.y = 40;
//    dropdownMenu.userInteractionEnabled = YES;
//    [dropdownMenu addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    
//    [cover addSubview:dropdownMenu];
    HWdropdownMenu *menu = [HWdropdownMenu menu];
    menu.delegate = self;
    //menu.content = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 100) style:UITableViewStylePlain];
    HWTitleMenuViewController *vc = [[HWTitleMenuViewController alloc]init];
    vc.view.height = 44*3;
    vc.view.width = 150;
    menu.contentController = vc;
    [menu showFrom:titleButton];
}

-(void)dropdownMenuDidDismiss:(HWdropdownMenu *)menu{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
    //[titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

-(void)dropdownMenuDidShow:(HWdropdownMenu *)menu{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
    //[titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];

}

-(void)friendsearch{
    NSLog(@"friend");
}

-(void)pop{
    NSLog(@"pop");
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
