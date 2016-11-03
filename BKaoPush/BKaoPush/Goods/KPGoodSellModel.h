//
//  KPGoodModels.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPGoodSellModel : NSObject
@property(nonatomic,copy)NSString * image;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * goodDescrip;
@property(nonatomic,copy)NSString * price;

/**
 库存
 */
@property(nonatomic,copy)NSString * totalCount;

/**
 成交额
 */
@property(nonatomic,copy)NSString * sellTotalPrice;

/**
 已售
 */
@property(nonatomic,copy)NSString * sellCount;



/**


 @return  假数据模型
 */
+(instancetype)jiashuju;
@end
