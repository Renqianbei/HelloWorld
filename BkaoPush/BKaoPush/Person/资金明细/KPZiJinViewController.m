//
//  KPZiJinViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZiJinViewController.h"
#import "KPZiJinHeaderView.h"
#import "KPZiJinTableViewCell.h"
#import "KPChongZhiViewController.h"
#import "KPAccountViewController.h"//账户详情
#import "KPTiXianViewController.h" //提现

@interface KPZiJinViewController ()<KPRecgargeBtnActiondelegate,KPNextActionBtndelegate>
{
    NSMutableArray *_dataSoucre;
    NSArray        *titleArr;

    KPZiJinHeaderView *headview;
}

@end

@implementation KPZiJinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"我的账户"];
    
    [self createRootTableView:NO];
    [self createLeftBarButtonItem];
    [self createdateSoucre];
    NSDictionary *dic;
    [headview CreateUI:dic];
     [self createRightBarButtonItem:RightItemTypeTxt text:@"明细"];
   
}
-(void)rightBarButtonItemAction
{
    KPAccountViewController *account = [[KPAccountViewController alloc] init];
    [self.navigationController pushViewController:account animated:YES];
    
    
}
-(void)createdateSoucre;
{
    headview =[[KPZiJinHeaderView alloc] init];
    
    self.rootTableView.tableHeaderView =headview;
    headview.delagates=self;
    self.rootTableView.tableHeaderView.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight*0.4);
    
    _dataSoucre = [[NSMutableArray alloc] initWithObjects:@[@"提现"], nil];
    titleArr  = [[NSArray alloc] init];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPZiJinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    

    if (!cell) {
        cell = [[KPZiJinTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
  
    [cell createUI:_dataSoucre[indexPath.section][indexPath.row]];
     cell.delagates=self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
//代理 按钮响应
-(void)KPNextActionBtn:(UIButton *)btn
{
    KPTiXianViewController *tixian =[[KPTiXianViewController alloc] init];
    [self.navigationController pushViewController:tixian animated:YES];

}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    
//    return ScreenHeight*0.4;
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                //                [self changePhotoAction];
            }
            case 1:
            {
                
            }break;
            case 2:
            {
                //                ChangeNameViewController * name = [[ChangeNameViewController alloc] init];
                //                name.title =@"修改昵称";
                //                name.placeLoder =_dataSource[indexPath.section][indexPath.row];
                //                [self.navigationController pushViewController:name animated:YES];
            }break;
            case 3:
            {
                //                ChangeGeaderViewController * geader = [[ChangeGeaderViewController alloc] init];
                //                [self.navigationController pushViewController:geader animated:YES];
            }break;
            case 4:
            {
                //                _birthdayView =[[BirthdayView alloc] init];
                //                _birthdayView.delegate =self;
                //                [self.view addSubview:_birthdayView];
            }break;
        }
    }
    else if (indexPath.section==1){
        
        //        AdressListViewController * adress = [[AdressListViewController alloc] init];
        //        [self.navigationController pushViewController:adress animated:YES];
    }
    else if (indexPath.section==2){
        //        PersonSafeViewController * safe = [[PersonSafeViewController alloc] init];
        //        [self.navigationController pushViewController:safe animated:YES];
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

-(void)KPRecgargeBtnAction:(UIButton *)btn
{
    KPChongZhiViewController *chongzhi =[[KPChongZhiViewController alloc] init];
    [self.navigationController pushViewController:chongzhi animated:YES];
        
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
