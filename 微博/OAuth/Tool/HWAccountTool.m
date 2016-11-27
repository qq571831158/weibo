//
//  HWAccountTool.m
//  微博
//
//  Created by Apple on 2016/11/27.
//  Copyright © 2016年 Apple. All rights reserved.
//
#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.archive"]
#import "HWAccountTool.h"
#import "HWAccount.h"
@implementation HWAccountTool


+(void)saveAccount:(HWAccount *)account{
    account.create_time = [NSDate date];
    [NSKeyedArchiver archiveRootObject:account toFile:HWAccountPath];
}

+(HWAccount *)account{
    HWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HWAccountPath];
    long  long expires_in = [account.expires_in longLongValue];
    
    NSDate *expiresTime = [account.create_time dateByAddingTimeInterval:expires_in];
    
    NSDate *now = [NSDate date];
    //NSOrderAscending = -1L ,牲升序    右边>左边；
    NSComparisonResult result = [expiresTime compare:now];
    if (result != NSOrderedDescending) {
        return nil;
    }
    return account;
}
@end
