//
//  HWAccount.h
//  微博
//
//  Created by Apple on 2016/11/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWAccount : NSObject<NSCoding>
/** 获取的密钥*/
@property(nonatomic,copy) NSString *access_token;
/** 生命周期 */
@property(nonatomic,copy) NSNumber *expires_in;
/** 当前授权用户的uid */
@property(nonatomic,copy) NSString *uid;
/** 账号的创建时间 */
@property(nonatomic,strong) NSDate *create_time;

+(instancetype)accountWithDict:(NSDictionary *)dict;
@end
