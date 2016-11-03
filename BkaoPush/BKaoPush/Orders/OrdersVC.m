//
//  OrdersVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "OrdersVC.h"
#import "KPWeiJieViewController.h"
#import "KPYiJieViewController.h"
#import "KPDaiTuiViewController.h"
#import "OrderHeadView.h"
#import "KPAllDingDanViewController.h"


@interface OrdersVC ()<UIScrollViewDelegate,orderDelegate>
{
    UIScrollView  *scrollViews;
    
    OrderHeadView * orderHead;
}

@end

@implementation OrdersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareBarButton];
    
   // [self createLeftBarButtonItem];
    [self createRightBarButtonItem:RightItemTypeImage text:@"搜索"];
    
    [self createHeadView];
    [self createUI];
}


//修改一下基类的  navBar  状态
- (void) prepareBarButton{
    
    [self setMyTitle:@"订单管理"];
    
}

-(void)createUI{
    
    scrollViews = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+50, ScreenWidth, ScreenHeight-64-50-50)];
    scrollViews.contentSize = CGSizeMake(ScreenWidth*4, 0);
    scrollViews.showsVerticalScrollIndicator = NO;
    scrollViews.showsHorizontalScrollIndicator = NO;
    scrollViews.delegate =self;
    scrollViews.pagingEnabled = YES;
    [self.view addSubview:scrollViews];
    
    
    KPWeiJieViewController   *weiJie = [[KPWeiJieViewController alloc] init];
    KPYiJieViewController    *yiJie  = [[KPYiJieViewController alloc] init];
    KPDaiTuiViewController   *daiTui = [[KPDaiTuiViewController alloc] init];
    KPAllDingDanViewController *allDingdan = [[KPAllDingDanViewController alloc] init];
    
    
    
    weiJie.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-50-64);
     yiJie.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight-50-64);
    daiTui.view.frame = CGRectMake(ScreenWidth*2, 0, ScreenWidth, ScreenHeight-50-64);
    allDingdan.view.frame = CGRectMake(ScreenWidth*3, 0, ScreenWidth, ScreenHeight-50-64);
    
    [scrollViews addSubview:weiJie.view];
    [scrollViews addSubview:yiJie.view];
    [scrollViews addSubview:daiTui.view];
    [scrollViews addSubview:allDingdan.view];
    
    [self addChildViewController:weiJie];
    [self addChildViewController:yiJie];
    [self addChildViewController:daiTui];
    [self addChildViewController:allDingdan];
    
    
}



- (void)rightBarButtonItemAction
{
    NSLog(@"搜索");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float point = scrollView.contentOffset.x;
    NSInteger index = point/ScreenWidth;
    [orderHead scrollAnimation:@[@"未接单",@"已接单",@"已撤销",@"全部订单"] :index];
    // NSLog(@"+++++++++++++++++++++++++++++%ld",(long)index);
}


# pragma 透视图代理方法
//代理方法
- (void)scrollTitleButtAction:(NSInteger)index
{
    [UIView animateWithDuration:0.3 animations:^{
        scrollViews.contentOffset =CGPointMake(ScreenWidth*index, 0);
    }];
    
    
}

- (void) createHeadView{
    
    orderHead = [[OrderHeadView alloc ]initWithFrame:CGRectMake(0, 64, ScreenWidth, 50) withTitleArr:@[@"未接单",@"已接单",@"已撤销",@"全部订单"]];
    orderHead.delegate =self;
    [self.view addSubview:orderHead];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
