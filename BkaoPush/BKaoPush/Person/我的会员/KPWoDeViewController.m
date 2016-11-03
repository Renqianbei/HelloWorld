//
//  KPWoDeViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWoDeViewController.h"
#import "KPWoDeHeardView.h"
#import "KPWoDeTableViewCell.h"
#import "KPChaKanViewController.h"
#import "KPHuiYuanXQViewController.h"

@interface KPWoDeViewController ()<KPKPWoDeHeardDelegate>
{

    NSMutableArray  *dataSoucre;
    KPWoDeHeardView  *heardView;
}

@end

@implementation KPWoDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self createLeftBarButtonItem];//   左按钮  共方法
    [self createRootTableView:NO];//  创建 table  NO  不分组
    [self setMyTitle:@"我的会员"];
    
    [self createUi];
}
-(void)createdatesoucre{

    dataSoucre =[[NSMutableArray alloc] init];

    
}
-(void)createUi{

    
    heardView = [[KPWoDeHeardView alloc] init];
    heardView.delegates =self;
    self.rootTableView.tableHeaderView =heardView;
    //self.rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KPWoDeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KPWoDeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic;
    [cell creareUI:dic];
    
    return cell;
}

-(void)KPAAquanbuaction:(UIButton *)button
{

    //查看会员详情
    KPChaKanViewController *chakan = [[KPChaKanViewController alloc] init];
    [self.navigationController pushViewController:chakan animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;

}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 54.0f;
//    
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // dataSoucre[indexPath.section][indexPath.row];
    
    KPHuiYuanXQViewController *huiyuan = [[KPHuiYuanXQViewController alloc] init];
    [self.navigationController pushViewController:huiyuan animated:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
