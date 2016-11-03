//
//  ShouHouModel.h
//  BKaoPush
//
//  Created by njxh on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>
//售后cell数据
@interface ShouHouModel : NSObject

//@"订单号：654321354321";
@property (nonatomic, copy) NSString *order;
//@"申请时间：2016.09.27 11:25";
@property (nonatomic, copy) NSString *apply;
//@"售后要求：七天质量退货";
@property (nonatomic, copy) NSString *require;
//@"售后结果：同意退款";
@property (nonatomic, copy) NSString *result;
//@"Apple iPhone 6 Plus(A154)64G 深空灰色";
@property (nonatomic, copy) NSString *trade;

@property (nonatomic, assign) CGFloat cellHeight; //计算cell高度

//初始化方法
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
