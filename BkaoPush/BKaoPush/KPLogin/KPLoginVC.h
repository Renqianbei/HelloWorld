//
//  KPLoginVC.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPLoginDelegate <NSObject>



//登录响应事件
- (void) KPLoginBAction;

@end

@interface KPLoginVC : UIViewController


@property (nonatomic, assign) id <KPLoginDelegate> delegate;

@end
