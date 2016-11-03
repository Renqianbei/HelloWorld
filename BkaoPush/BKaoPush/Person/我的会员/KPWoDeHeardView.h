//
//  KPWoDeHeardView.h
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPKPWoDeHeardDelegate <NSObject>

-(void)KPAAquanbuaction:(UIButton *)button;


@end

@interface KPWoDeHeardView : UIView

@property(nonatomic,assign)id<KPKPWoDeHeardDelegate>delegates;


@end
