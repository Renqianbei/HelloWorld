//
//  KPAllDingDanViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAllDingDanViewController.h"
#import "KPZiYouViewController.h"
#import "KPFenChengViewController.h"

#import "KPFenChengTableViewCell.h"
#import "KPZiYouTableViewCell.h"

#import "KPAllDingDanVIew.h"

@interface KPAllDingDanViewController ()<KPAllDingDanDelegate>
{
    KPFenChengTableViewCell *cell;
    KPZiYouTableViewCell  *cell1;
    NSArray  *arr;
    KPAllDingDanVIew     *orderHead;
    NSMutableArray    *dataSource;
    //记录哪些组展开，哪些组收拢
    NSMutableArray * _showSection;
    UIScrollView   *scrollViews;
}
@end

@implementation KPAllDingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //self.view.backgroundColor =KPGrayColor;
    
    [self createRootTableView:YES];
    
    [self createUI];
    
    [self createHeadView];
}

-(void)createUI{
    
    scrollViews = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight-64-50-40)];
    scrollViews.showsVerticalScrollIndicator = NO;
    scrollViews.showsHorizontalScrollIndicator = NO;
    scrollViews.delegate =self;
    scrollViews.scrollEnabled =NO;
    scrollViews.pagingEnabled = YES;
    [self.view addSubview:scrollViews];
    
    
    KPFenChengViewController  *fen =[[KPFenChengViewController alloc] init];
    KPZiYouViewController     *ziyou =[[KPZiYouViewController alloc] init];
    

    
    
    
    fen.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight-50-64-40);
    ziyou.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-50-64-40);
   
    
    [scrollViews addSubview:fen.view];
    [scrollViews addSubview:ziyou.view];

    
    [self addChildViewController:fen];
    [self addChildViewController:ziyou];

    
}



- (void)rightBarButtonItemAction
{
    NSLog(@"搜索");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float point = scrollView.contentOffset.x;
    NSInteger index = point/ScreenWidth;
    [orderHead ScrollAnimation:@[@"自有订单",@"分成订单"] :index];
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
    
    orderHead = [[KPAllDingDanVIew alloc ]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40) WithTitleArr:@[@"自有订单",@"分成订单"]];
    orderHead.delegate =self;
    UIView  *lineView =[[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/2.0, 7, 1, 27)];
    lineView.backgroundColor =KPGrayColor;
    
   
    [self.view addSubview:orderHead];
     [self.view addSubview:lineView];
    UIView *linView1 =[[UIView alloc]initWithFrame:CGRectMake(0, 39, ScreenWidth, 1)];
    linView1.backgroundColor = KPGrayColor;
    [self.view addSubview:linView1];
    
    
    
}





-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [KPTabbar shareTabBarController:NO].tabBar.hidden =NO;
    
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
