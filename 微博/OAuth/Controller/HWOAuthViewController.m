//
//  HWOAuthViewController.m
//  微博
//
//  Created by Apple on 2016/11/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HWOAuthViewController.h"
#import "AFNetworking.h"
#import "HWTabbarViewController.h"
#import "HWNewfeatureViewController.h"
#import "HWAccount.h"
#import "MBProgressHUD+MJ.h"
#import "HWAccountTool.h"
@interface HWOAuthViewController ()<UIWebViewDelegate>

@end

@implementation HWOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建webview
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    //2.加载webview
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2410190765&redirect_uri=https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //1.获得url
    NSString *url = request.URL.absoluteString;
    //2.判断是否为回调
    NSRange range = [url rangeOfString:@"code="];
    if(range.length != 0){
        int fromIndex = (int)range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        [self accessTokenWithCode:code];
        return NO;
    }
    NSLog(@"%@",request.URL.absoluteString);
    return YES;
}

-(void)accessTokenWithCode:(NSString *)code {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[@"client_id"] = @"2410190765";
    paras[@"client_secret"]= @"e9da98efc281e14600ed5c010cf411d7";
    paras[@"grant_type"]= @"authorization_code";
    paras[@"redirect_uri"] = @"https://www.baidu.com";
    paras[@"code"] = code;
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:paras success:^(AFHTTPRequestOperation
          *operation , NSDictionary  *responseObject){
        //1。将返回的账号字典数据转成模型，存进沙盒
        
        [MBProgressHUD hideHUD];
        HWAccount *account = [HWAccount accountWithDict:responseObject];
        [HWAccountTool saveAccount:account];
        
        [UIWindow switchRootViewController];
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        [MBProgressHUD hideHUD];
    }];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载..."];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}

@end
