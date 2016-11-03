//
//  SHProcessingController.m
//  BKaoPush
//
//  Created by njxh on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "SHProcessingController.h"
#import "ShouHouTableViewCell.h"
#import "ShouHouDetailController.h"
#import "ShouHouModel.h"
@interface SHProcessingController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SHProcessingController
{
    UITableView    *_tableView;
    NSMutableArray *_myDataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self requireMyDataSource];
    [self createCustomUI];
}
- (void)requireMyDataSource
{
    _myDataSource = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 5; i++) {
        ShouHouModel *model = [[ShouHouModel alloc] initWithDictionary:@{@"order":@"订单号：654321354321", @"apply":@"申请时间：2016.09.27 11:25", @"require":@"售后要求：七天质量退货", @"result":@"售后结果：同意退款", @"trade":@"Apple iPhone 6 Plus(A154)64G 深空灰色"}];
        [_myDataSource addObject:model];
    }
}
- (void)createCustomUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - 49 - 44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsSelection = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_myDataSource) {
        return _myDataSource.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShouHouTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ShouHouTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (_myDataSource) {
        cell.shouHouModel = _myDataSource[indexPath.row];
        cell.saleRequireLabel.textColor = [UIColor redColor];
        cell.clickCheckButtonBlock = ^(NSString *string) {
            ShouHouDetailController *detailVc = [[ShouHouDetailController alloc] init];
            detailVc.markString = @"processing";
            UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:detailVc];
            [self presentViewController:navVc animated:YES completion:nil];
        };
        return cell;
    }
    else {
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_myDataSource) {
        return [self currentShouHouModelWithRow:indexPath.row].cellHeight;
    }
    return 0;
}
- (ShouHouModel *)currentShouHouModelWithRow:(NSInteger)row
{
    ShouHouModel *model = _myDataSource[row];
    return model;
}
@end
