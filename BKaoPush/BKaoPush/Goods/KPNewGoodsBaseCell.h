//
//  KPNewGoodsBaseCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPNewGoodsCellTypeModel.h"
#import "KPGoodsCommonButton.h"
@protocol NewAddGoodsCellDelegate<NSObject>
@optional
//当多选状态可能发生改变的时候
- (void)mutSelectStatusChange;

//当编辑文字发生改变时
- (void)editCelltextHasChanged;
//点击图片看大图

- (void)clickSmallImageWithModel:(KPNewGoodsCellTypeModel*)model andIndex:(NSInteger) index andview:(UIView*)smallview;


//点击分别设置

- (void)clickFenbieSheZhi;

@end

@interface KPNewGoodsBaseCell : UITableViewCell

@property(nonatomic,strong)KPNewGoodsCellTypeModel * model;
@property(nonatomic,weak)id<NewAddGoodsCellDelegate>delegate;
@end
