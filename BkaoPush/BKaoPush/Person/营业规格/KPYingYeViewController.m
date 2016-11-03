//
//  KPYingYeViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPYingYeViewController.h"
#import "KPYingYeGZTableViewCell.h"
#import "KPZhuYingViewController.h"
#import "KPDianPuViewController.h"
#import "KPFaPiaoViewController.h"

@interface KPYingYeViewController ()
{
    
    NSMutableArray *_dataSoucre;
    NSArray        *titleArr;
}
@end

@implementation KPYingYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    [self setMyTitle:@"营业规格"];
    [self createdateSoucre];
    [self createRootTableView:NO];
     [self createLeftBarButtonItem];
}
-(void)createdateSoucre;
{
    
    
    _dataSoucre = [[NSMutableArray alloc] initWithObjects:@[@"主营商品",@"营业时间设定",@"店铺公告",@"发票设定"], nil];
    titleArr  = [[NSArray alloc] init];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPYingYeGZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPYingYeGZTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell createUI:_dataSoucre[indexPath.section][indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0&&indexPath.row==0) {
        //                [self changePhotoAction];
      
        KPZhuYingViewController *kpZhuYing = [[KPZhuYingViewController alloc] init]
        ;
        [self.navigationController pushViewController:kpZhuYing animated:YES];
    }
    else if (indexPath.section==0&&indexPath.row==2){
        
               KPDianPuViewController * adress = [[KPDianPuViewController alloc] init];
               [self.navigationController pushViewController:adress animated:YES];
    }
    else if (indexPath.row ==3){
                KPFaPiaoViewController * safe = [[KPFaPiaoViewController alloc] init];
                [self.navigationController pushViewController:safe animated:YES];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dataSoucre[section];
    return arr.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
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
