//
//  KPWeiJieHeaderView.h
//  BKaoPush
//
//  Created by LY on 16/11/1.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPLYheadButtonOnclickdelegate <NSObject>

-(void)KPLYheadButtonOnclick:(UIButton *)button;

@end

@interface KPWeiJieHeaderView : UIView

@property (nonatomic  ,assign) NSInteger  section;
@property (nonatomic  ,retain) UIButton * button;
@property (nonatomic  ,retain) UILabel   *bianhaoLab;//编号

@property (nonatomic  ,retain) UILabel   *timelab;

@property (nonatomic  ,retain) UILabel   *dingdanhaoLab;

@property (nonatomic  ,retain) UILabel   *juliLab;

@property (nonatomic  ,retain) id<KPLYheadButtonOnclickdelegate>delagates;

@end
