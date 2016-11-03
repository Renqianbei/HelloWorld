//
//  ShouHouScrollViewModel.m
//  BKaoPush
//
//  Created by njxh on 16/10/29.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouScrollViewModel.h"

@implementation ShouHouScrollViewModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.orderNum = dict[@"orderNum"];
        self.applyTime = dict[@"applyTime"];
        
        self.saleResult = dict[@"saleResult"]; //
        self.saleResultImage = dict[@"saleResultImage"];
        
        self.tradeName = dict[@"tradeName"];
        self.saleRequire = dict[@"saleRequire"];
        self.deliveryMethod = dict[@"deliveryMethod"];
        self.tradePrice = dict[@"tradePrice"];//
        self.qualityReport = dict[@"qualityReport"];
        self.bill = dict[@"bill"];
        
        self.buyerRemarks = dict[@"buyerRemarks"];//
        self.shProvePhotoString = dict[@"shProvePhotoString"];
        self.photoArray = dict[@"photoArray"];
        
        self.buyerName = dict[@"buyerName"];
        self.phone = dict[@"phone"];
        self.address = dict[@"address"];
        
        self.cellHeight = [self caculateCellHeight];
    }
    return self;
}
- (CGFloat)caculateCellHeight
{
    CGFloat height = 400;
    if (self.photoArray.count > 0) {
        height += 60;
    }
    height += [self.saleResult boundingRectWithSize:CGSizeMake(ScreenWidth - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:LL_FONT} context:nil].size.height;
    height += [self.tradePrice boundingRectWithSize:CGSizeMake(ScreenWidth - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:LL_FONT} context:nil].size.height;
    height += [self.buyerRemarks boundingRectWithSize:CGSizeMake(ScreenWidth - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:LL_FONT} context:nil].size.height;
    
    return height;
}
@end
