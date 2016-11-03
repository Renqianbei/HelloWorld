//
//  KPRequest.m
//  KP
//
//  Created by Jincang Lu on 16/9/23.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import "KPRequest.h"


@implementation KPRequest



//http://114.55.235.5:8888/kaopu/kpAPI.do?method=exec&m=home&s=api-getLoginPage&loginName=13666666666&password=123456wer


//s=apib-userLoginPage&loginName=13999999999&password=123456&_token=3&imeiCode=wqwwq221&equipName=iphone 6

//登录验证
+ (NSURLSessionDataTask *) loginData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone withPass:(NSString *)pass withVerity:(NSString *)veritfy
{
    NSDictionary * dict = @{@"method":@"exec",@"m":@"home",@"s":@"apib-userLoginPage",@"loginName":phone,@"password":pass,@"_token":[KPTool Token],@"imeiCode":[KPTool UUID],@"verifyCode":veritfy,@"equipName":[KPTool deviceVersion]};
    
    
    
    return [[AFAppDotNetAPIClient sharedClient]POST:ROOT_POST_URL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dictionary  = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        if (block) {
            block(dictionary,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}





@end
