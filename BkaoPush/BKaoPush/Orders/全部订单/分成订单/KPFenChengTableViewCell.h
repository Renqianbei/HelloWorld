//
//  KPFenChengTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/11/1.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPFenChengTableViewCell : UITableViewCell

@property (nonatomic ,retain) UILabel  *dizhiLab;

@property (nonatomic ,retain) UILabel  *shouhuoLab;

@property (nonatomic ,retain) UILabel  *jiaoyiLab;

@property (nonatomic ,retain) UILabel  *yongjinLab;

@property (nonatomic ,retain) UILabel  *moneyLab;



@property (nonatomic  ,retain) UILabel   *bianhaoLab;//编号

@property (nonatomic  ,retain) UILabel   *timelab;

@property (nonatomic  ,retain) UILabel   *dingdanhaoLab;

@property (nonatomic  ,retain) UILabel   *juliLab;

@property (nonatomic  ,retain) UILabel   *nameLab;

@property (nonatomic  ,retain) UILabel   *dizhiLab1;

@property (nonatomic  ,retain) UILabel   *titleLab; // 标题

@property (nonatomic  ,retain) UILabel   *colorLab;  //颜色

@property (nonatomic  ,retain) UILabel   *countLab;  //数量

@property (nonatomic  ,retain) UILabel   *jiageLab;

@property (nonatomic  ,retain) UILabel   *zongshuLab; //商品总数

@property (nonatomic  ,retain) UILabel   *yunfeiLab;

@property (nonatomic  ,retain) UILabel   *beizhuLab;//备注

@property (nonatomic  ,retain) UILabel   *zongjiaLab;//总价

@property (nonatomic  ,retain) UILabel   *zongjiaLab1;//总价

@property (nonatomic  ,retain) UILabel   *zhuangtaiLab;//状态提示

@property (nonatomic  ,retain) UILabel   *disanfang;//第三方运送快递详情

@property (nonatomic  ,retain) UILabel   *disanjiaqian;//第三放运费价钱


-(void)createDataSource:(NSDictionary *)dic;
@end
