//
//  KPTool.h
//  KP
//
//  Created by Jincang Lu on 16/8/30.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface KPTool : NSObject






/**
 *  提示框的封装方法
 *
 *  @param Message  提示信息
 *  @param firstBtn 第一个按钮名称
 *  @param second   第二个按钮名称(无填nil)
 *  @param sure     第一个按钮的点击事件
 *  @param cancel   第二个按钮的点击事件
 *
 *  @return 返回一个alertController
 */

+ (UIAlertController *)KPAlertViewWithMessage:(NSString *)Message WithFirst:(NSString *)firstBtn WithSecond:(NSString *)second sure:(void(^)())sure cancel:(void(^)())cancel;

/**
 *  电话号正则表达式
 *
 *  @param mobile 检测正文
 *
 *  @return 是否是电话号码
 */
+ (BOOL)valiMobile:(NSString *)mobile;

/**
 *  获取当前精确时间
 *
 *  @return 年月日时分秒毫秒
 */
+ (NSString *)NowTime;


/**
 *  从本地读取图片
 *
 *  @param name 图片名
 *  @param type 图片扩展名
 *
 *  @return 返回Image
 */
+ (UIImage *)readImage:(NSString *)name type:(NSString *)type;

/**
 *  系统字体适配
 *
 *  @param font 输入iphone6的字体
 *
 *  @return 返回三种字体
 */
+ (NSInteger) systemFont:(NSInteger)font;


+ (UIFont *) systemFontS:(NSInteger)font;

//长度高度自适应
+ (float) length:(float)size;


+ (CGSize)stringCGSize:(NSString *)string font:(NSInteger)font width:(float)width height:(float)height;

+ (NSMutableAttributedString *)attributeString:(NSString *)str a:(NSInteger)a b:(NSInteger)b c:(NSInteger)c d:(NSInteger)d colorA:(UIColor *)colorA colorB:(UIColor *)colorB;



+ (void) ide;



//手机UUID
+ (NSString *) UUID;

//手机型号
+ (NSString*)deviceVersion;

//6位数字密码
+ (BOOL)isNumPassword:(NSString *)pass;


//密码正则式
+ (BOOL)isPassword:(NSString *)pass;





//登录存储数据
+ (void) writeUserinfo:(NSDictionary *) userInfo;

//拿取数据
+ (NSDictionary *) userInfo;

//退出登录
+ (void) outUserInfo;





//图片尺寸压缩一半
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;




//获取Token值
+ (NSString *)Token;


//所有图片的头地址
+ (void) KPImageURL:(NSString *)url;






+ (void) writePersonInfo:(NSDictionary *) userinfo  filePath:(NSString *)filePath;


+ (NSDictionary *) PersonInfo:(NSString *)filePath;


+ (void) outPersonInfo:(NSString *)filePath;





@end
