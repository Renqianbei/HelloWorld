//
//  ShouHouTableViewCell.m
//  BKaoPush
//
//  Created by njxh on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouTableViewCell.h"
#import "Masonry.h"
#import "ShouHouModel.h"
@implementation ShouHouTableViewCell
{
    UIImageView *lineIv;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createCustomUI];
    }
    return self;
}
- (void)createCustomUI
{
    UIImageView *topLineIv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    topLineIv.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:topLineIv];
    _orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 130, 20)];
    _orderNumLabel.font = SS_FONT;
    [self.contentView addSubview:_orderNumLabel];
    
    _applyTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, ScreenWidth - 150, 20)];
    _applyTimeLabel.textAlignment = NSTextAlignmentRight;
    _applyTimeLabel.font = SS_FONT;
    [self.contentView addSubview:_applyTimeLabel];
    
    lineIv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, ScreenWidth, 1)];
    lineIv.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:lineIv];

    _saleRequireLabel = [[UILabel alloc] init];
    _saleRequireLabel.font = MM_FONT;
    [self.contentView addSubview:_saleRequireLabel];
    [_saleRequireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(lineIv.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    
    _saleResultLabel = [[UILabel alloc] init];
    _saleResultLabel.font = MM_FONT;
    [self.contentView addSubview:_saleResultLabel];
    [_saleResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(_saleRequireLabel.mas_bottom).offset(0);
        make.width.equalTo(@(ScreenWidth - 20));
//        make.height.equalTo(@20);
    }];
    
//    _tradeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_saleResultLabel.frame) + 10, ScreenWidth - 20, 20)];
    _tradeNameLabel = [[UILabel alloc] init];
    _tradeNameLabel.font = MM_FONT;
    [self.contentView addSubview:_tradeNameLabel];
    [_tradeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(_saleResultLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    
    _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _checkButton = CGRectMake(10, CGRectGetMaxY(_tradeNameLabel.frame) + 10, ScreenWidth - 20, 40);
    _checkButton.backgroundColor = [UIColor orangeColor];
    [_checkButton setTitle:@"查看详情" forState:UIControlStateNormal];
    _checkButton.layer.borderColor = [UIColor blackColor].CGColor;
    _checkButton.layer.borderWidth = 0.5;
    _checkButton.layer.cornerRadius = 5;
    _checkButton.layer.masksToBounds = YES;
    [self.contentView addSubview:_checkButton];
    [_checkButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(_tradeNameLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@40);
    }];
    
}
- (void)clickButton:(UIButton *)button
{
    if (self.clickCheckButtonBlock) {
        self.clickCheckButtonBlock(@"111");
    }
}
- (void)setShouHouModel:(ShouHouModel *)shouHouModel
{
    _shouHouModel = shouHouModel;
    _orderNumLabel.text = shouHouModel.order;//@"订单号：654321354321";
    _applyTimeLabel.text = shouHouModel.apply;//@"申请时间：2016.09.27 11:25";
    _saleRequireLabel.text = shouHouModel.require;//@"售后要求：七天质量退货";
    if (![shouHouModel.result isEqualToString:@""]) {
        [_saleResultLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.top.equalTo(_saleRequireLabel.mas_bottom).offset(10);
            make.width.equalTo(@(ScreenWidth - 20));
            make.height.equalTo(@20);
        }];
        _saleResultLabel.text = shouHouModel.result;//@"售后结果：同意退款";
    }
    
    _tradeNameLabel.text = shouHouModel.trade;//@"Apple iPhone 6 Plus(A154)64G 深空灰色";
}

@end
