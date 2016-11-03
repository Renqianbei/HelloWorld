//
//  AppDelegate+AppService.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/22.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)

//检测网络环境的
-(void)checkNetwork;

//初始化键盘控制的
- (void) IQKeyBoard;


@end
