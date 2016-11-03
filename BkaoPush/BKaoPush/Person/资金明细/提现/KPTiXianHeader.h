//
//  KPTiXianHeader.h
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KPLYTiXianActiondelegate <NSObject>

-(void)KPLYTiXianAction:(UIButton *)button;

@end

@interface KPTiXianHeader : UIView
@property (nonatomic ,assign)id<KPLYTiXianActiondelegate>delegates;

@end
