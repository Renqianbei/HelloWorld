//
//  KPAccountSafeViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAccountSafeViewController.h"
#import "KPZhangHGLTableViewCell.h"
#import "MIBaoViewController.h"
@interface KPAccountSafeViewController ()
{
    NSMutableArray *_dateSoucre;
    NSArray        *titleArr;
    
}

@end

@implementation KPAccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"账号安全"];
    [self createLeftBarButtonItem];
    [self createdateSoucre];
    [self createRootTableView:YES];
}

-(void)createdateSoucre;
{
    
    _dateSoucre = [[NSMutableArray alloc] initWithObjects:@[@"密码修改",@"密保设置"], @[@"设备管理"],nil];
    titleArr  = [[NSArray alloc] init];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPZhangHGLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPZhangHGLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
   // cell.delegates=self;
    
    [cell createUI:_dateSoucre[indexPath.section][indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}
-(void)KPLYNextAction:(UIButton *)button
{
    NSLog(@"这是点击按钮");
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        

        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                MIBaoViewController *M =[[MIBaoViewController alloc] init];
                [self.navigationController pushViewController:M animated:YES];
                
            }
                break;
                
            default:
                break;
        }
        
        
    }
    else if (indexPath.section==1){
        
  
        
        
    }
    else if (indexPath.section==2){
        
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dateSoucre[section];
    return arr.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _dateSoucre.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
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
