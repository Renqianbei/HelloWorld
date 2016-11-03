//
//  ShouHouScrollViewModel.h
//  BKaoPush
//
//  Created by njxh on 16/10/29.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShouHouScrollViewModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@property (nonatomic, assign) CGFloat cellHeight;
//订单号-订单号：654321354321
@property (nonatomic, copy) NSString *orderNum;
//申请时间-申请时间：2016.09.27 11:25
@property (nonatomic, copy) NSString *applyTime;
//售后结果
@property (nonatomic, copy) NSString *saleResult;
//售后结果=右边的图片
@property (nonatomic, copy) NSString *saleResultImage;

//商品名称-Apple iPhone 6 Plus (A1524) 64GB 深空灰色
@property (nonatomic, copy) NSString *tradeName;
//售后要求-售后要求：7天质量退货
@property (nonatomic, copy) NSString *saleRequire;
//配送方式-配送方式：第三方配送
@property (nonatomic, copy) NSString *deliveryMethod;
//交易价格-交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200
@property (nonatomic, copy) NSString *tradePrice;
//质检报告-质检报告：有
@property (nonatomic, copy) NSString *qualityReport;
//发票-发票：有
@property (nonatomic, copy) NSString *bill;

//买家备注-买家备注：客服培训备注篇_销售/营销_经管营销_专
@property (nonatomic, copy) NSString *buyerRemarks;

//售后证明照片
@property (nonatomic, copy) NSString *shProvePhotoString;
//五张照片
@property (nonatomic, strong) NSArray *photoArray;

//买家姓名-买家姓名：岑凌峰
@property (nonatomic, copy) NSString *buyerName;
//联系电话-联系电话：13918668791
@property (nonatomic, copy) NSString *phone;
//联系地址-联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层
@property (nonatomic, copy) NSString *address;

@end
