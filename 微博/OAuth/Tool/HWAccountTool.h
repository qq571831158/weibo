//
//  HWAccountTool.h
//  微博
//
//  Created by Apple on 2016/11/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HWAccount;
@interface HWAccountTool : NSObject
+(void)saveAccount:(HWAccount *)account;
+(HWAccount *)account;
@end
