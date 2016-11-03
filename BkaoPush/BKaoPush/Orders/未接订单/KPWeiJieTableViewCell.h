//
//  KPWeiJieTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPLYSelectActiondelegate <NSObject>

-(void)KPLYSelectAction:(UIButton *)button;

@end


@interface KPWeiJieTableViewCell : UITableViewCell

@property (nonatomic  ,retain) UILabel   *bianhaoLab;//编号

@property (nonatomic  ,retain) UILabel   *timelab;

@property (nonatomic  ,retain) UILabel   *dingdanhaoLab;
@property (nonatomic  ,retain) UILabel   *juliLab;

@property (nonatomic  ,retain) UILabel   *nameLab;

@property (nonatomic  ,retain) UILabel   *dizhiLab;

@property (nonatomic  ,retain) UILabel   *titleLab; // 标题

@property (nonatomic  ,retain) UILabel   *colorLab;  //颜色

@property (nonatomic  ,retain) UILabel   *countLab;  //数量

@property (nonatomic  ,retain) UILabel   *jiageLab;

@property (nonatomic  ,retain) UILabel   *zongshuLab; //商品总数

@property (nonatomic  ,retain) UILabel   *yunfeiLab;

@property (nonatomic  ,retain) UILabel   *beizhuLab;//备注

@property (nonatomic  ,retain) UILabel   *zongjiaLab;//总价

@property (nonatomic  ,retain) UILabel   *zongjiaLab1;//总价

@property (nonatomic  ,assign) id<KPLYSelectActiondelegate>delegates;

-(void)cateateDataSource :(NSDictionary *)dic;

@end
