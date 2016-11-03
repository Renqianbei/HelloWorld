//
//  KPChaKanViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPChaKanViewController.h"
#import "KPWoDeTableViewCell.h"
#import "KPHuiYuanXQViewController.h"

@interface KPChaKanViewController ()
{

    NSMutableArray *dataSoucre;
}

@end

@implementation KPChaKanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRootTableView:NO];
    [self setMyTitle:@"查看会员"];
    [self createLeftBarButtonItem];
    [self createUi];
    [self createdatesoucre];
    
}
-(void)createdatesoucre{
    
    dataSoucre =[[NSMutableArray alloc] init];
    
    
}
-(void)createUi{
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 12)];
    view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];

    self.rootTableView.tableHeaderView=view;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KPWoDeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KPWoDeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dic;
    [cell creareUI:dic];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSLog(@"点击了 ++++%ld行++r的++%ld++一个",indexPath.section, (long)indexPath.row);
    KPHuiYuanXQViewController *XQ = [[KPHuiYuanXQViewController alloc] init];
    
    [self.navigationController pushViewController:XQ animated:YES];
    
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 54.0f;
//}

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
