//
//  ShouHouVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouVC.h"
#import "TopScrollView.h"
@interface ShouHouVC ()

@end

@implementation ShouHouVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"售后服务"];
    
    [self createCustomUI];
}

- (void)createCustomUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    TopScrollView *_topScrollView = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 49)];
    [self.view addSubview:_topScrollView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headNav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    
    [KPTabbar shareTabBarController:NO].tabBar.hidden =NO;
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
