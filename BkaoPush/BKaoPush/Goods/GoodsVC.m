//
//  GoodsVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "GoodsVC.h"
#import "KPTopHeader.h"
#define TableViewTag 100
@interface GoodsVC ()<KPTopHeaderDelegate,UITableViewDelegate,UITableViewDataSource>
{
  }
@property ( nonatomic,strong)   KPTopHeader * header;
@property ( nonatomic,strong)  UIScrollView * mainScrollview;


@end

@implementation GoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareBarButton];
    
    //创建刷选
    [self initHeaderFliter];
    //
    [self initTableViews];
}

- (void)initHeaderFliter{
    
    _header = [[KPTopHeader alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 60) withTitleArr:@[@"在售商品",@"仓库商品",@"新增商品"]];
    _header.delegate  = self;
    [self.view addSubview:_header];
    
    
}

- (void)initTableViews{
    float originy = CGRectGetMaxY(_header.frame) + 10;
    _mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, originy, ScreenWidth, ScreenHeight - originy )];
    _mainScrollview.contentSize = CGSizeMake(_mainScrollview.frame.size.width*3, _mainScrollview.frame.size.height);
    _mainScrollview.pagingEnabled = YES;
    _mainScrollview.delegate = self;
    for (int i = 0 ; i<3 ; i++) {
        CGRect frame = _mainScrollview.bounds;
        frame.origin.x  = _mainScrollview.frame.size.width * i;
        UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        tableView.tag = TableViewTag + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = @[[UIColor redColor],[UIColor blueColor],[UIColor blackColor]][i];
        [_mainScrollview addSubview:tableView];
    }
    [self.view addSubview:_mainScrollview];
   
}




//修改一下基类的  navBar  状态
- (void) prepareBarButton{
    
    [self setMyTitle:@"商品管理"];
    [self createLeftBarButtonItem];
    
    [self.leftButton setImage:IMAGE(@"搜索") forState:UIControlStateNormal];
}


- (void)leftBarButtonItemAction
{
    NSLog(@"搜索");
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

#pragma mark tableViewDelegate DataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  nil;
}


#pragma 头部点击代理
- (void) scrollTitleButtAction:(NSInteger)index{
    [_mainScrollview setContentOffset:CGPointMake(_mainScrollview.frame.size.width*index, 0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _mainScrollview) {
        [_header scrollAnimation:(_mainScrollview.contentOffset.x/_mainScrollview.frame.size.width) ];
    }
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
