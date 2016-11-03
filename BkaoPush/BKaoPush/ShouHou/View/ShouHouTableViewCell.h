//
//  ShouHouTableViewCell.h
//  BKaoPush
//
//  Created by njxh on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShouHouModel;
//售后界面中用到的cell
@interface ShouHouTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *orderNumLabel;   //订单号
@property (nonatomic, strong) UILabel *applyTimeLabel;  //申请时间
@property (nonatomic, strong) UILabel *saleRequireLabel;  //售后要求
@property (nonatomic, strong) UILabel *saleResultLabel;   //售后结果
@property (nonatomic, strong) UILabel *tradeNameLabel;    //商品名称
@property (nonatomic, strong) UIButton *checkButton;      //查看详情按钮
@property (nonatomic, strong) ShouHouModel *shouHouModel; //售后cell数据模型
@property (nonatomic, strong) NSDictionary *dict;    //测试数据

@property (nonatomic, copy) void (^clickCheckButtonBlock) (NSString *blockInfo);
@end
