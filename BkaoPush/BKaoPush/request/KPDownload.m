//
//  KPDownload.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPDownload.h"

@implementation KPDownload





+(void)downloadDataWithType:(KPDownloadType)type Path:(NSString *)path parameters:(NSDictionary *)parameters sucess:(void (^)(NSData *data))sucess fail:(void (^)(NSError *error))fail
{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (type==KPDownloadTypeGet) {
        
        [manager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        }
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                 sucess(responseObject);
                 
                 //  NSLog(@"%@--->>>",responseObject);
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
                 
                 fail(error);
                 
                 //  NSLog(@"%@--->>>err",error);
             }];
        
        
        
    }
    else{
        
        
        [manager POST:path parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            sucess(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            fail(error);
        }];
    }
    
}






+ (NSURLSessionDataTask *) snsLoginData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone withMsgCode:(NSString *)msgCode
{
    NSDictionary * dict = @{@"method":@"exec",@"m":@"home",@"s":@"apib-userLoginByPhoneMsg",@"phone":phone,@"msgCode":msgCode,@"imeiCode":[KPTool UUID],@"equipName":[KPTool deviceVersion],@"_token":[KPTool Token]};
    
    return [[AFAppDotNetAPIClient sharedClient]POST:ROOT_POST_URL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dictionary  = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];

        if (block) {
            block(dictionary,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}






//手机获取验证码
+ (NSURLSessionDataTask *) setGetVeritfyData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone
{
    NSString * path = [NSString stringWithFormat:SNS_VERITFY_URL,ROOT_URL,phone,[KPTool Token],[KPTool UUID]];
    
    return [[AFAppDotNetAPIClient sharedClient]GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dictionary  = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
 
        if (block) {
            block(dictionary,nil);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"首页网络解析错误");
    }];
}



@end
