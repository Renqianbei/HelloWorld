//
//  KPTabbar.h
//  KP
//
//  Created by Jincang Lu on 16/8/29.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPTabbar : UITabBarController

/**
 *  单例
 *
 *  @return 自定义tabbar
 */
+(instancetype)shareTabBarController:(BOOL)reset;

@property (nonatomic,copy) UIImageView * tabbarItem;


/**
 *  tabbar的隐藏
 *
 *  @param hidden YES 隐藏
 */
-(void)setTabbarHidden:(BOOL)hidden;


@end
