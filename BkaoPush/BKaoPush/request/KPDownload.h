//
//  KPDownload.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPDownload : NSObject
typedef NS_ENUM(NSInteger,KPDownloadType) {
    KPDownloadTypeGet,
    KPDownloadTypePost
};






/**
 *  下载
 *
 *  @param type       post get
 *  @param path       url
 *  @param parameters 上传属性
 *  @param sucess     成功时
 *  @param fail       失败时
 */
+(void)downloadDataWithType:(KPDownloadType)type Path:(NSString *)path parameters:(NSDictionary *)parameters sucess:(void (^)(NSData *data))sucess fail:(void (^)(NSError *error))fail;


//验证码登录
+ (NSURLSessionDataTask *) snsLoginData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone withMsgCode:(NSString *)msgCode;

//短信登录  获取验证码
+ (NSURLSessionDataTask *) setGetVeritfyData:(void (^) (id obj, NSError *err))block withPhoneNumber:(NSString *)phone;


@end
