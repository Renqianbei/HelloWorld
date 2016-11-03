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
+(instancetype)editViewWithModel:(KPGoodSellModel*)model ;
-(void)showinView:(UIView *)view Andcomplete:(void(^)())clickSure;
@end
