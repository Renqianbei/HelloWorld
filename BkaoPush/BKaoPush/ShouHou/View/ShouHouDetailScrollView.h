//
//  ShouHouDetailScrollView.h
//  BKaoPush
//
//  Created by njxh on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

//售后详情的scrollView界面
@interface ShouHouDetailScrollView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

//scrollView
@property (nonatomic, strong) UIScrollView *myScrollView;
//mark-标示，区分self的控制器有那个vc-push过来的
@property (nonatomic, strong) NSString *markString;
//测试数据
@property (nonatomic, strong) NSDictionary *dict;

//订单号-订单号：654321354321
@property (nonatomic, strong) UILabel *orderNumLabel;
//申请时间-申请时间：2016.09.27 11:25
@property (nonatomic, strong) UILabel *applyTimeLabel;

//售后结果
@property (nonatomic, strong) UILabel *saleResultLabel;
//售后结果=右边的图片
@property (nonatomic, strong) UIImageView *saleResultImageView;

//商品名称-Apple iPhone 6 Plus (A1524) 64GB 深空灰色
@property (nonatomic, strong) UILabel *tradeNameLabel;
//售后要求-售后要求：7天质量退货
@property (nonatomic, strong) UILabel *saleRequireLabel;
//配送方式-配送方式：第三方配送
@property (nonatomic, strong) UILabel *deliveryMethodLabel;
//交易价格-交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200
@property (nonatomic, strong) UILabel *tradePriceLabel;
//质检报告-质检报告：有
@property (nonatomic, strong) UILabel *qualityReportLabel;
//发票-发票：有
@property (nonatomic, strong) UILabel *billLabel;

//买家备注-买家备注：客服培训备注篇_销售/营销_经管营销_专
@property (nonatomic, strong) UILabel *buyerRemarksLabel;

//售后证明照片
@property (nonatomic, strong) UILabel *shProvePhotoLabel;
 //五张照片
@property (nonatomic, strong) UICollectionView *photoCollectionView;

//买家姓名-买家姓名：岑凌峰
@property (nonatomic, strong) UILabel *buyerNameLabel;
//联系电话-联系电话：13918668791
@property (nonatomic, strong) UILabel *phoneLabel;
//联系地址-联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层
@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, copy) void (^clickPhotoBlock) (NSArray *photoArray, NSInteger clickNum);

@end
