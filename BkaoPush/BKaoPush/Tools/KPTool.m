//
//  KPTool.m
//  KP
//
//  Created by Jincang Lu on 16/8/30.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import "KPTool.h"

@implementation KPTool





+ (UIAlertController *)KPAlertViewWithMessage:(NSString *)Message WithFirst:(NSString *)firstBtn WithSecond:(NSString *)secondBtn sure:(void (^)())sure cancel:(void (^)())cancel
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"" message:Message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:firstBtn style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (sure!=nil) {
            sure();
        }
        
    }];
    [alert addAction:action];
    
    if (secondBtn!=nil) {
        
        UIAlertAction * actions = [UIAlertAction actionWithTitle:secondBtn style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (cancel!=nil) {
               cancel();
            }
        }];
        
        [alert addAction:actions];
    }
    
    return alert;
}




//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(17[3,7])|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}


+ (NSString *)NowTime
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmssS"];
    NSDate * date = [NSDate date];
    NSString * dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}


+ (UIImage *)readImage:(NSString *)name type:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    return [UIImage imageWithContentsOfFile:filePath];
}



+ (NSInteger) systemFont:(NSInteger)font
{
    NSInteger wight;
    if (ScreenHeight==568.00) {
        
        wight = font-1;
    }
    else if (ScreenHeight==667.00){
        wight = font;
    }
    else if (ScreenHeight==736.00){
        wight = font+2;
    }
    else{
        wight = font-2;
    }
    
    
    return wight;
}



+ (UIFont *) systemFontS:(NSInteger)font
{
    NSInteger wight;
    if (ScreenHeight==568.00) {
        
        wight = font-2;
    }
    else if (ScreenHeight==667.00){
        wight = font;
    }
    else if (ScreenHeight==736.00){
        wight = font+2;
    }
    else{
        wight = font-2;
    }
    
    
    return [UIFont systemFontOfSize:font];
}



+ (float) length:(float)size
{
    NSInteger len;
    if (ScreenHeight==568.00) {
        
        len = size*0.8;
    }
    else if (ScreenHeight==667.00){
        len = size;
    }
    else if (ScreenHeight==736.00){
        len = size*1.2;
    }
    else{
        len = size*0.8;
    }
    
    
    return len;
}





+(CGSize)stringCGSize:(NSString *)string font:(NSInteger)font width:(float)width height:(float)height
{
    
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    

    return size;
}


+ (NSMutableAttributedString *)attributeString:(NSString *)str a:(NSInteger)a b:(NSInteger)b c:(NSInteger)c d:(NSInteger)d colorA:(UIColor *)colorA colorB:(UIColor *)colorB
{
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:str];
    [muStr addAttribute:NSForegroundColorAttributeName value:colorA range:NSMakeRange(a,b)];
    [muStr addAttribute:NSForegroundColorAttributeName value:colorB range:NSMakeRange(c,d)];
    
    return muStr;
}


+ (void) ide

{
    
    //NSLog(@"设备唯一标识符:%@",identifierStr);
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    //手机型号
    NSString * phoneModel =  [self deviceVersion];
    NSLog(@"手机型号:%@",phoneModel);
    
}

+ (NSString *) UUID
{
//    //设备唯一标识符

    //保存一个UUID字符串到钥匙串：
    
    NSString * GC =[SAMKeychain passwordForService:@"com.kaopush.kaopushcompany" account:@"kaopush"];
    
    if (GC.length==0) {
        
        CFUUIDRef uuid = CFUUIDCreate(NULL);assert(uuid != NULL);CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
        [SAMKeychain setPassword: [NSString stringWithFormat:@"%@", uuidStr]
                      forService:@"com.kaopush.kaopushcompany"account:@"kaopush"];
        return [NSString stringWithFormat:@"%@", uuidStr];
    }
    
    
    return GC;
}


+ (NSString*)deviceVersion
{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    return deviceString;
}



+ (BOOL)isPassword:(NSString *)pass
{
    NSString *      regex = @"(^(?![0-9]+$)[0-9A-Za-z]{6,8}$)";
    //NSString *      regex = @"(^[A-Za-z0-9]{6,8}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:pass];
}

+ (BOOL)isNumPassword:(NSString *)pass
{
    NSString *      regex = @"(^[0-9]{6,6}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:pass];
}







+ (void) writeUserinfo:(NSDictionary *) userinfo{
    
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/userinfo/"];
    NSString *Path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/userinfo/b%@",phone]];
    NSFileManager *manger=[NSFileManager defaultManager];
    BOOL rect=[manger fileExistsAtPath:docPath];
    if (!rect) {
        
        [manger createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [NSKeyedArchiver archiveRootObject:userinfo toFile:Path];
    // NSLog(@"登录信息保存结果  %@:%d",NSHomeDirectory(),b);
}


+ (NSDictionary *) userInfo{
    
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/userinfo/b%@",phone]];
    NSDictionary *user =[NSKeyedUnarchiver unarchiveObjectWithFile:docPath];
    
    return user;
}



+ (void) outUserInfo{
    
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/userinfo/b%@",phone]];
    [manager removeItemAtPath:docPath error:nil];
}



+ (void) writePersonInfo:(NSDictionary *) userinfo  filePath:(NSString *)filePath{
    
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@/",filePath]];
    NSString *Path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@/a%@",filePath,phone]];
    NSFileManager *manger=[NSFileManager defaultManager];
    BOOL rect=[manger fileExistsAtPath:docPath];
    if (!rect) {
        
        [manger createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [NSKeyedArchiver archiveRootObject:userinfo toFile:Path];

}


+ (NSDictionary *) PersonInfo:(NSString *)filePath{
    
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@/a%@",filePath,phone]];
    NSDictionary *user =[NSKeyedUnarchiver unarchiveObjectWithFile:docPath];
    
    return user;
}


+ (void) outPersonInfo:(NSString *)filePath{
    
    NSFileManager * manager = [NSFileManager defaultManager];
    NSString *phone =[[NSUserDefaults standardUserDefaults] objectForKey:PHONE];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@/a%@",filePath,phone]];
    [manager removeItemAtPath:docPath error:nil];
}


　+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size); //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage; //返回的就是已经改变的图片
}



+ (void) KPImageURL:(NSString *)url{

    [[NSUserDefaults standardUserDefaults] setObject:url forKey:@"KPIMAGE"];
}


//
+ (NSString *)Token{

    return @"";
}


@end
