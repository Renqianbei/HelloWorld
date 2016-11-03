//
//  KPGoodModels.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodSellModel.h"

@implementation KPGoodSellModel

+(instancetype)jiashuju{
    KPGoodSellModel * model = [[self alloc] init];
    model.title = @[ @"和我佩服泡温泉饿哦发今晚起飞机起飞前彷佛气氛就欺负就去哦if就去哦if就title",@"而皮肤而无法IP无附件为皮肤我if微积分沃尔夫几位覅及title",@"哈哈哈哈哈哈title"][arc4random()%3];
    model.goodDescrip =@[  @"和我佩服泡温泉饿哦发今晚起飞机起飞前彷佛气氛就欺负就去哦if而服务哦if威风威风威风就描述",@"这是最简单的描述哦",@"哈哈哈哈哈哈t让我方违反描述"][arc4random()%3];

//    model.image = @"和我佩服泡温泉饿哦发今晚起飞机起飞前彷佛气氛就欺负就去哦if就去哦if就title";
    model.price = @[@"1000",@"200",@"9999"][arc4random()%3];
    model.totalCount = @"200";
    model.sellTotalPrice = @[@"4000",@"3400",@"2222"][arc4random()%3];

    model.sellCount = @[@"10",@"20",@"22"][arc4random()%3];

    return model;
}

@end
