//
//  KPGoodsShowCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPGoodSellModel.h"
typedef NS_ENUM(NSInteger) {
    Selling = 0,   //在售
    HasDone  //已下架
}CellType;


@interface KPGoodsShowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *goodDescrip;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UILabel *sellTotalPrice;
@property (weak, nonatomic) IBOutlet UILabel *sellCount;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (nonatomic,strong)KPGoodSellModel * model;
@property (nonatomic,strong)void(^clickBlock)(NSInteger index);

/**
 设置cell类型 是 在售  还是 已下架

 @param type <#type description#>
 */
-(void)setCellType:(CellType)type;

@end
