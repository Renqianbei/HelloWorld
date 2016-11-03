//
//  AppDelegate+AppService.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/22.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)



-(void)checkNetwork
{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager startMonitoring];
    
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //        AFNetworkReachabilityStatusUnknown          = -1,
        //        AFNetworkReachabilityStatusNotReachable     = 0,
        //        AFNetworkReachabilityStatusReachableViaWWAN = 1,
        //        AFNetworkReachabilityStatusReachableViaWiFi = 2,
        if (status==0) {
            UIAlertController * alert =[KPTool KPAlertViewWithMessage:@"无网络访问" WithFirst:@"确定" WithSecond:nil sure:nil cancel:nil];
            [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
        }
        switch ((int)status) {
            case -1:{
                NSLog(@"未知网络");}
                break;
            case 1:{
                NSLog(@"移动网络");}
                break;
            case 2:{
                NSLog(@"WiFi");}
                break;
        }
        
    }];
    
}




- (void) IQKeyBoard{
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.toolbarDoneBarButtonItemText =@"完成";
    //    manager.shouldResignOnTouchOutside = YES;
    //    manager.shouldToolbarUsesTextFieldTintColor = YES;
    //    manager.enableAutoToolbar = NO;
}



@end
