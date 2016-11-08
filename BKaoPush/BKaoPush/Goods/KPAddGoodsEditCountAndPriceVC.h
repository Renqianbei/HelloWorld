//
//  KPAddGoodsEditCountAndPriceVC.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/8.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBaseVC.h"
#import "KPEditNameCountPriceModel.h"

@protocol EditCountPriceVcSureDelegate <NSObject>

-(void)sureButtonClick:(NSMutableArray *)models;

@end
@interface KPAddGoodsEditCountAndPriceVC : KPBaseVC
@property(nonatomic,weak)id<EditCountPriceVcSureDelegate>delegate;
@property (nonatomic,strong)NSMutableArray * cellModels;//数组里是KPEditNameCountPriceModel
@end
