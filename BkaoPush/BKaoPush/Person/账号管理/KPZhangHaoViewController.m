//
//  KPZhangHaoViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZhangHaoViewController.h"
#import "KPZhangHGLTableViewCell.h"
#import "KPTianJYHKViewController.h"
#import "KPAccountSafeViewController.h"
#import "KPLoginVC.h"


@interface KPZhangHaoViewController ()<KPLYNextActiondelagate,KPLoginDelegate>
{
    NSMutableArray *_dataSoucre;
    NSArray        *titleArr;

}

@end

@implementation KPZhangHaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"账号管理"];
    [self createRootTableView:YES];
    self.rootTableView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-60);
    [self createLeftBarButtonItem];
    
    [self createdateSoucre];
    [self createFootView];
}

-(void)createdateSoucre;
{
    
    _dataSoucre = [[NSMutableArray alloc] initWithObjects:@[@"绑定其他银行卡"], @[@"账户安全",@"清除缓存"],nil];
    titleArr  = [[NSArray alloc] init];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPZhangHGLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPZhangHGLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.delegates=self;
    
    [cell createUI:_dataSoucre[indexPath.section][indexPath.row]];
    
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
        
        KPTianJYHKViewController *tianjia =[[KPTianJYHKViewController alloc] init];
        [self.navigationController pushViewController:tianjia animated:YES];
    
    }
    else if (indexPath.section==1 && indexPath.row==0){
        
        KPAccountSafeViewController *account = [[KPAccountSafeViewController alloc] init];
        
        [self.navigationController pushViewController:account animated:YES];
        
      
    }
    else if (indexPath.section==1 && indexPath.row==1){
        
        
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dataSoucre[section];
    return arr.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return _dataSoucre.count;
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




//------------------------底部视图退出登录-------------------------------

- (void) createFootView
{
    CGRect frame = CGRectMake(0, ScreenHeight-60, ScreenWidth, 60);
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[KPTool readImage:@"buton_2" type:@".png"] forState:UIControlStateNormal];
    [button setImage:[KPTool readImage:@"buton_2_highlighted" type:@".png"] forState:UIControlStateHighlighted];
    [button setImage:IMAGE(@"disenbles") forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(outLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * loginTitle = [[UILabel alloc] initWithFrame:button.bounds];
    loginTitle.text = @"退出登录";
    loginTitle.textAlignment = NSTextAlignmentCenter;
    [button addSubview:loginTitle];
    
    
    
    NSDictionary *user =[KPTool userInfo];
    if (user) {
        button.enabled =YES;
    }
    else{
        button.enabled =NO;
    }
    
    [self.view addSubview:button];
    
}


- (void) outLoginAction:(UIButton *)button
{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:USER_INFO object:nil];

    [KPTool outUserInfo];
    KPLoginVC *login =[[KPLoginVC alloc] init];
    login.delegate =self;
    
    UINavigationController *nvc =[[UINavigationController alloc] initWithRootViewController:login];
    
    
    UIWindow *window =SharedApplication.keyWindow;
    window.rootViewController = nvc;

}

- (void)KPLoginBAction
{
    KPTabbar * tabbar = [KPTabbar shareTabBarController:YES];
    
    UINavigationController * baseNVC = [[UINavigationController alloc] initWithRootViewController:tabbar];
    UIWindow *window =SharedApplication.keyWindow;
    window.rootViewController = baseNVC;
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
