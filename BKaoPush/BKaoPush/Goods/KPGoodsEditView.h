//
//  KPGoodsEditView.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPGoodSellModel.h"
@interface KPGoodsEditView : UIView
@property(nonatomic,strong)KPGoodSellModel*model;

/**
 创建视图

 @param model 传入要显示的model
 @return 返回视图对象
 */
+(instancetype)editViewWithModel:(KPGoodSellModel*)model ;

/**
 展示视图

 @param view 要在哪个视图中展示
 @param clickSure <#clickSure description#>
 */
-(void)showinView:(UIView *)view Andcomplete:(void(^)())clickSure;
@end
