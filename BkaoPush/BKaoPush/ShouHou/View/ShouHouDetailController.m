//
//  ShouHouDetailController.m
//  BKaoPush
//
//  Created by njxh on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouDetailController.h"
#import "ShouHouDetailScrollView.h"
#import "ShowPhotoViewController.h"
@interface ShouHouDetailController ()

@end

@implementation ShouHouDetailController
{
    NSDictionary *_myDataSource;   //数据源
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarStyle];
    
    [self requireMyDataSource];
    [self createCustomUI];
}
- (void)setNavigationBarStyle
{
    self.navigationItem.title = @"售后详情";
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn setImage:IMAGE(@"nav_back") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}
- (void)back
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createCustomUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    if ([_markString isEqualToString:@"waitProcess"] || [_markString isEqualToString:@"issue"])
    {
        ShouHouDetailScrollView *detailScrollView = [[ShouHouDetailScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 44)];
        [self.view addSubview:detailScrollView];
        detailScrollView.clickPhotoBlock = ^(NSArray *photoArray, NSInteger clickNum) {
            ShowPhotoViewController *showVc = [[ShowPhotoViewController alloc] init];
            showVc.myDataSource = photoArray;
            showVc.index = clickNum;
            [self.navigationController pushViewController:showVc animated:YES];
        };
        detailScrollView.dict = _myDataSource;
        detailScrollView.markString = _markString;
    }
    else {
        ShouHouDetailScrollView *detailScrollView = [[ShouHouDetailScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
        [self.view addSubview:detailScrollView];
        detailScrollView.clickPhotoBlock = ^(NSArray *photoArray, NSInteger clickNum) {
            ShowPhotoViewController *showVc = [[ShowPhotoViewController alloc] init];
            showVc.myDataSource = photoArray;
            showVc.index = clickNum;
            [self.navigationController pushViewController:showVc animated:YES];
        };
        detailScrollView.dict = _myDataSource;
        detailScrollView.markString = _markString;
    }
    
}

- (void)requireMyDataSource
{
    if ([_markString isEqualToString:@"waitProcess"]) {
        _myDataSource = @{@"order":@"订单号：654321354321", @"apply":@"申请时间：2016.09.27 11:25", @"result":@"等待买家退回商品（系统提示状态）", @"resultImage":@"https", @"trade":@"Apple iPhone 6 Plus (A1524) 64GB 深空灰色", @"require":@"售后要求：7天质量退货", @"delivery":@"配送方式：第三方配送", @"price":@"交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200", @"quality":@"质检报告：有", @"bill":@"发票：有", @"remark":@"买家备注：\n客服培训备注篇_销售/营销_经管营销_专", @"photo":@"售后证明照片", @"name":@"买家姓名：岑凌峰", @"phone":@"联系电话：13918668791", @"address":@"联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层"};
    }
    else if ([_markString isEqualToString:@"processing"]) {
        _myDataSource = @{@"order":@"订单号：654321354321", @"apply":@"申请时间：2016.09.27 11:25", @"result":@"已完成售后（售后结果展示）", @"resultImage":@"http://",  @"trade":@"Apple iPhone 6 Plus (A1524) 64GB 深空灰色", @"require":@"售后要求：7天质量退货", @"delivery":@"配送方式：第三方配送", @"price":@"交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200", @"quality":@"质检报告：有", @"bill":@"发票：有", @"remark":@"买家备注：\n客服培训备注篇_销售/营销_经管营销_专", @"photo":@"售后证明照片", @"name":@"买家姓名：岑凌峰", @"phone":@"联系电话：13918668791", @"address":@"联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层"};
    }
    else if ([_markString isEqualToString:@"issue"]) {
        _myDataSource = @{@"order":@"订单号：654321354321", @"apply":@"申请时间：2016.09.27 11:25", @"result":@"靠铺售后人员已介入，请耐心等待处理结果", @"resultImage":@"httphaha", @"trade":@"Apple iPhone 6 Plus (A1524) 64GB 深空灰色", @"require":@"售后要求：7天质量退货", @"delivery":@"配送方式：第三方配送", @"price":@"交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200", @"quality":@"质检报告：有", @"bill":@"发票：有", @"remark":@"买家备注：\n客服培训备注篇_销售/营销_经管营销_专", @"photo":@"售后证明照片", @"name":@"买家姓名：岑凌峰", @"phone":@"联系电话：13918668791", @"address":@"联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层"};
    }
    else if ([_markString isEqualToString:@"all"]) {
        _myDataSource = @{@"order":@"订单号：654321354321", @"apply":@"申请时间：2016.09.27 11:25", @"result":@"", @"trade":@"Apple iPhone 6 Plus (A1524) 64GB 深空灰色", @"require":@"售后要求：7天质量退货", @"delivery":@"配送方式：第三方配送", @"price":@"交易价格：￥6188.00 数量：1  运费：￥12.00  订单总价：￥6200", @"quality":@"质检报告：有", @"bill":@"发票：有", @"remark":@"买家备注：\n客服培训备注篇_销售/营销_经管营销_专", @"photo":@"售后证明照片", @"photoArray":@[@"111", @"222", @"111", @"222", @"111", @"222"], @"name":@"买家姓名：岑凌峰", @"phone":@"联系电话：13918668791", @"address":@"联系地址：中江路879弄天地软件园25号3层中江路879弄天地软件园25号3层"};
    }
    else {
        
    }
}

@end
