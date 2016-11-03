//
//  KPChongzhiHeaderView.h
//  BKaoPush
//
//  Created by LY on 16/10/27.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol KPChongZhiActiondelegate <NSObject>

-(void)KPChongZhiAction:(UIButton *)button;

@end
@interface KPChongzhiHeaderView : UIView

@property (nonatomic ,assign)id<KPChongZhiActiondelegate>delegates;
@end
