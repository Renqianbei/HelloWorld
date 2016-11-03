//
//  KPRequest.h
//  KP
//
//  Created by Jincang Lu on 16/9/23.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//m=home&s=api-getHomePage&userId=1&x=1&y=1

#import <Foundation/Foundation.h>

@interface KPRequest : NSObject



//登录验证
+ (NSURLSessionDataTask *) loginData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone withPass:(NSString *)pass withVerity:(NSString *)veritfy;


@end
