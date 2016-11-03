//
//  ShouHouDetailScrollView.m
//  BKaoPush
//
//  Created by njxh on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouDetailScrollView.h"
#import "Masonry.h"
#import "PhotoCollectionViewCell.h"
#import "ShowPhotoViewController.h"
@implementation ShouHouDetailScrollView
{
    UIImageView *lineIv1;
    UIImageView *lineIv2;
    UIImageView *lineIv3;
    UIImageView *lineIv4;
    UIImageView *lineIv5;
    NSArray     *collectionArray; //collectionView的数据源
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        collectionArray = [[NSArray alloc] init];
        [self createCustomUI];
    }
    return self;
}

- (void)createCustomUI
{
    _myScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _myScrollView.backgroundColor = [UIColor whiteColor];
    _myScrollView.bounces = YES;
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.contentSize = CGSizeMake(ScreenWidth, ScreenHeight);
    [self addSubview:_myScrollView];
    
    UIImageView *topLineIv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    topLineIv.backgroundColor = [UIColor grayColor];
    [self addSubview:topLineIv];
    _orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 130, 20)];
    _orderNumLabel.font = SS_FONT;
    [_myScrollView addSubview:_orderNumLabel];
    _applyTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, ScreenWidth - 150, 20)];
    _applyTimeLabel.textAlignment = NSTextAlignmentRight;
    _applyTimeLabel.font = SS_FONT;
    [_myScrollView addSubview:_applyTimeLabel];
    lineIv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, ScreenWidth, 1)];
    lineIv1.backgroundColor = [UIColor blackColor];
    [_myScrollView addSubview:lineIv1];
    
    _saleResultLabel = [[UILabel alloc] init];
    _saleResultLabel.font = LL_FONT;
    [_myScrollView addSubview:_saleResultLabel];
    [_saleResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(lineIv1.mas_bottom).offset(0);
        make.right.equalTo(self.mas_right).offset(-40);
    }];
    
    lineIv2 = [[UIImageView alloc] init];
    lineIv2.backgroundColor = [UIColor blackColor];
    [_myScrollView addSubview:lineIv2];
    [lineIv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(_saleResultLabel.mas_bottom).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@0);
    }];
    
    _tradeNameLabel = [[UILabel alloc] init];
    _tradeNameLabel.font = LL_FONT;
    [_myScrollView addSubview:_tradeNameLabel];
    [_tradeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(lineIv2.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _saleRequireLabel = [[UILabel alloc] init];
    _saleRequireLabel.font = LL_FONT;
    [_myScrollView addSubview:_saleRequireLabel];
    [_saleRequireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_tradeNameLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _deliveryMethodLabel = [[UILabel alloc] init];
    _deliveryMethodLabel.font = LL_FONT;
    [_myScrollView addSubview:_deliveryMethodLabel];
    [_deliveryMethodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_saleRequireLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _tradePriceLabel = [[UILabel alloc] init];
    _tradePriceLabel.font = LL_FONT;
    _tradePriceLabel.numberOfLines = 0;
    _tradePriceLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_myScrollView addSubview:_tradePriceLabel];
    [_tradePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_deliveryMethodLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
    }];
    _qualityReportLabel = [[UILabel alloc] init];
    _qualityReportLabel.font = LL_FONT;
    [_myScrollView addSubview:_qualityReportLabel];
    [_qualityReportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_tradePriceLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _billLabel = [[UILabel alloc] init];
    _billLabel.font = LL_FONT;
    [_myScrollView addSubview:_billLabel];
    [_billLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_qualityReportLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    lineIv3 = [[UIImageView alloc] init];
    lineIv3.backgroundColor = [UIColor blackColor];
    [_myScrollView addSubview:lineIv3];
    [lineIv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_billLabel.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    
    _buyerRemarksLabel = [[UILabel alloc] init];
    _buyerRemarksLabel.font = LL_FONT;
    _buyerRemarksLabel.numberOfLines = 0;
    _buyerRemarksLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_myScrollView addSubview:_buyerRemarksLabel];
    [_buyerRemarksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(lineIv3.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
    }];
    lineIv4 = [[UIImageView alloc] init];
    lineIv4.backgroundColor = [UIColor blackColor];
    [_myScrollView addSubview:lineIv4];
    [lineIv4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_buyerRemarksLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 10));
        make.height.equalTo(@1);
    }];
    
    _shProvePhotoLabel = [[UILabel alloc] init];
    _shProvePhotoLabel.font = LL_FONT;
    [_myScrollView addSubview:_shProvePhotoLabel];
    [_shProvePhotoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(lineIv4.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(60, 60);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    _photoCollectionView.backgroundColor = [UIColor whiteColor];
    _photoCollectionView.dataSource = self;
    _photoCollectionView.delegate = self;
    _photoCollectionView.showsHorizontalScrollIndicator = NO;
    [_photoCollectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_myScrollView addSubview:_photoCollectionView];
    [_photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_shProvePhotoLabel.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@0);
    }];
    
    lineIv5 = [[UIImageView alloc] init];
    lineIv5.backgroundColor = [UIColor blackColor];
    [_myScrollView addSubview:lineIv5];
    [lineIv5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_photoCollectionView.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    _buyerNameLabel = [[UILabel alloc] init];
    _buyerNameLabel.font = LL_FONT;
    [_myScrollView addSubview:_buyerNameLabel];
    [_buyerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(lineIv5.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _phoneLabel = [[UILabel alloc] init];
    _phoneLabel.font = LL_FONT;
    [_myScrollView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_buyerNameLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
        make.height.equalTo(@20);
    }];
    _addressLabel = [[UILabel alloc] init];
    _addressLabel.font = LL_FONT;
    _addressLabel.numberOfLines = 0;
    _addressLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_myScrollView addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_phoneLabel.mas_bottom).offset(10);
        make.width.equalTo(@(ScreenWidth - 20));
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionArray) {
        return collectionArray.count;
    }
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (collectionArray) {
        cell.photoImageView.backgroundColor = [UIColor redColor];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickPhotoBlock) {
        self.clickPhotoBlock(collectionArray, indexPath.row);
    }
}
- (void)setMarkString:(NSString *)markString
{
    _markString = markString;
    if ([_markString isEqualToString:@"waitProcess"]) {
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 64 - 44, ScreenWidth, 44)];
        bottomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bottomView];
        //待处理界面
        UIButton *linkSellerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        linkSellerBtn.frame = CGRectMake(10, ScreenHeight - 64 - 44, (ScreenWidth - 40)/3, 32);
        linkSellerBtn.layer.borderColor = [UIColor blackColor].CGColor;
        linkSellerBtn.layer.borderWidth = 1;
        linkSellerBtn.layer.cornerRadius = 5;
        linkSellerBtn.layer.masksToBounds = YES;
        [linkSellerBtn setTitle:@"联系卖家" forState:UIControlStateNormal];
        [linkSellerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:linkSellerBtn];
        
        UIButton *refuseSaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        refuseSaleBtn.frame = CGRectMake(20 + (ScreenWidth - 40)/3, ScreenHeight - 64 - 44, (ScreenWidth - 40)/3, 32);
        refuseSaleBtn.layer.borderColor = [UIColor blackColor].CGColor;
        refuseSaleBtn.layer.borderWidth = 1;
        refuseSaleBtn.layer.cornerRadius = 5;
        refuseSaleBtn.layer.masksToBounds = YES;
        refuseSaleBtn.backgroundColor = [UIColor grayColor];
        [refuseSaleBtn setTitle:@"拒绝售后" forState:UIControlStateNormal];
        [refuseSaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:refuseSaleBtn];
        
        UIButton *agreeSaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        agreeSaleBtn.frame = CGRectMake(30 + (ScreenWidth - 40)/3 * 2, ScreenHeight - 64 - 44, (ScreenWidth - 40)/3, 32);
        agreeSaleBtn.layer.borderColor = [UIColor blackColor].CGColor;
        agreeSaleBtn.layer.borderWidth = 1;
        agreeSaleBtn.layer.cornerRadius = 5;
        agreeSaleBtn.layer.masksToBounds = YES;
        agreeSaleBtn.backgroundColor = [UIColor orangeColor];
        [agreeSaleBtn setTitle:@"同意售后" forState:UIControlStateNormal];
        [agreeSaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:agreeSaleBtn];
    }
    else if ([_markString isEqualToString:@"issue"]) {
        //靠谱介入---退款按钮
        UIButton *refundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        refundBtn.frame = CGRectMake(0, ScreenHeight - 64 - 44, (ScreenWidth), 44);
        refundBtn.backgroundColor = [UIColor grayColor];
        [refundBtn setTitle:@"确认退款" forState:UIControlStateNormal];
        [refundBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:refundBtn];
    }
    else {

    }
}

- (void)setDict:(NSDictionary *)dict
{
    _orderNumLabel.text = dict[@"order"];
    _applyTimeLabel.text = dict[@"apply"];
    if (![dict[@"result"] isEqualToString:@""] && dict[@"result"] != nil) {
        _saleResultLabel.text = dict[@"result"];
        _saleResultLabel.textColor = [UIColor blueColor];
        [_saleResultLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.top.equalTo(lineIv1.mas_bottom).offset(10);
            make.right.equalTo(self.mas_right).offset(-40);
            
        }];
        [lineIv2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(_saleResultLabel.mas_bottom).offset(10);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.equalTo(@1);
        }];
    }
    if ([dict[@"resultImage"] containsString:@"http"]) {
        _saleResultImageView = [[UIImageView alloc] init];
        [_myScrollView addSubview:_saleResultImageView];
        _saleResultImageView.backgroundColor = [UIColor cyanColor];
        [_saleResultImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.top.equalTo(lineIv1.mas_bottom).offset(5);
            make.right.equalTo(self.mas_right).offset(-5);
        }];
    }
    
    _tradeNameLabel.text = dict[@"trade"];
    _saleRequireLabel.text = dict[@"require"];
    _deliveryMethodLabel.text = dict[@"delivery"];
    _tradePriceLabel.text = dict[@"price"];
    _qualityReportLabel.text = dict[@"quality"];
    _billLabel.text = dict[@"bill"];
    _buyerRemarksLabel.text = dict[@"remark"];
    _shProvePhotoLabel.text = dict[@"photo"];
    
    collectionArray = dict[@"photoArray"];
    if (collectionArray.count > 0) {
        [_photoCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.top.equalTo(_shProvePhotoLabel.mas_bottom).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.height.equalTo(@60);
        }];
    }
    
    _buyerNameLabel.text = dict[@"name"];
    _phoneLabel.text = dict[@"phone"];
    _addressLabel.text = dict[@"address"];
    
}
                                    

@end
