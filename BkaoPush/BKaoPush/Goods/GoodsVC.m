//
//  GoodsVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "GoodsVC.h"
#import "KPTopHeader.h"
#import "KPGoodsShowCell.h"
#import "KPGoodSellModel.h"
#import "KPGoodsEditView.h"
#import "KPGoodsNoDatasView.h"
#import "KPGoodsSearchViewController.h"
#import "KPNewGoodsView.h"
#import "KPNewGoodsSelectsVC.h"

#define TableViewTag 100

static NSString * goodsCellIdentifier = @"cellId";

@interface GoodsVC ()<KPTopHeaderDelegate,UITableViewDelegate,UITableViewDataSource,NewGoodsSelectDelegate>
{
    
    NSMutableArray * _noDatasViews;
  }
@property ( nonatomic,strong)   KPTopHeader * header;
@property ( nonatomic,strong)  UIScrollView * mainScrollview;

/**
  在售商品 和 已下架商品 数据源
 */
@property ( nonatomic,strong)  NSMutableArray * goodsShowDataSources;


@end

@implementation GoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareBarButton];
    
    
    //创建刷选
    [self initHeaderFliter];
    //创建 在售商品 和 已下架商品
    [self initTableViews];
    
    [self loadData];//获取数据

}

/**
  模拟网络请求
 */
- (void)loadData{
    
    //网络请求 刷新tableView
    _goodsShowDataSources = [NSMutableArray array];
    
    NSMutableArray * sells = [NSMutableArray array]; //获取 在售商品数据
    NSMutableArray * downs = [NSMutableArray array];//获取仓库商品或者说已下架商品数据
   
    int count = arc4random()%2;
    int count1 = arc4random()%10;

    //在售
    for (int i = 0; i < count; i ++) {
        //
        KPGoodSellModel  * model = [KPGoodSellModel jiashuju];
        [sells addObject:model];
    
    }
    //已下架
    for (int i = 0; i <count1; i ++) {
        //
        KPGoodSellModel  * model = [KPGoodSellModel jiashuju];
        [downs addObject:model];
    }
    
     //如果 没有数据显示 无数据页

    [_goodsShowDataSources addObject:sells];
    [_goodsShowDataSources addObject:downs];
    
    //判断网络请求结果
    [self setNoDataAtIndex:Selling hidden:sells.count!=0];//是否隐藏无数据页
    [self setNoDataAtIndex:HasDone hidden:downs.count!=0];//是否隐藏无数据页

  
    //刷新数据
    [self reloadTabelView:Selling];
    [self reloadTabelView:HasDone];
    
}

//刷新tableView
-(void)reloadTabelView:(CellType)type{
    //找到tableView 进行刷新
    [[_mainScrollview viewWithTag:type+TableViewTag] reloadData];
}


- (void)setNoDataAtIndex:(CellType)type hidden:(BOOL) hidden{
   
    [_noDatasViews[type] setHidden:hidden];
}


- (void)initHeaderFliter{
    
    _header = [[KPTopHeader alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 50) withTitleArr:@[@"在售商品",@"仓库商品",@"新增商品"]];
    _header.delegate  = self;
    [self.view addSubview:_header];
    
    
}

- (void)initTableViews{
    float originy = CGRectGetMaxY(_header.frame) ;
    _mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, originy, ScreenWidth, ScreenHeight - originy - 44)];
    _mainScrollview.contentSize = CGSizeMake(_mainScrollview.frame.size.width*3, _mainScrollview.frame.size.height);
    _mainScrollview.pagingEnabled = YES;
    _mainScrollview.delegate = self;
   /*=======前两个视图=====*/
    for (int i = 0 ; i<2 ; i++) {
        CGRect frame = _mainScrollview.bounds;
        frame.origin.x  = _mainScrollview.frame.size.width * i;
        UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 50;
        tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        tableView.tag = TableViewTag + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
        tableView.backgroundColor = KP_GRAYCOLOR;

//        tableView.backgroundColor = @[[UIColor redColor],[UIColor blueColor],[UIColor blackColor]][i];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPGoodsShowCell class]) bundle:nil] forCellReuseIdentifier:goodsCellIdentifier];

        [_mainScrollview addSubview:tableView];
        
    }
    [self.view addSubview:_mainScrollview];
    /*=======第三个视图=====*/
    KPNewGoodsView * newGoodsView = [KPNewGoodsView NewGoodsViewWithDelegate:self];
    
    CGRect frame = _mainScrollview.bounds;
    frame.origin.x  = _mainScrollview.frame.size.width *2;
    newGoodsView.frame = frame;
    [_mainScrollview addSubview:newGoodsView];
    
    //无内容 应该显示的提示图
        _noDatasViews = [NSMutableArray array];
        NSArray * titles = @[@"您还没有在售商品\n去上架点新产品吧",@"您仓库没有商品"];
        int i = 0;
        for (NSString * title in titles) {
            KPGoodsNoDatasView * view = [KPGoodsNoDatasView NoDataViewWithTitle:title];
            view.frame = CGRectMake(i++*_mainScrollview.frame.size.width, 0, ScreenWidth, ScreenHeight - originy - 44);
            [_mainScrollview addSubview:view];
            [_noDatasViews addObject:view];
            view.hidden = YES;
        }
}




//修改一下基类的  navBar  状态
- (void) prepareBarButton{
    
    [self setMyTitle:@"商品管理"];
    [self createRightBarButtonItem:RightItemTypeImage text:@"搜索"];
    
//    [self.rightButton setImage:IMAGE(@"搜索") forState:UIControlStateNormal];
}


- (void)rightBarButtonItemAction
{
    NSLog(@"搜索");
    KPGoodsSearchViewController * vc = [[KPGoodsSearchViewController alloc] init];
//    KPAddGoodsDetailViewController * vc = [[KPAddGoodsDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
    //找到对应tableview
    return [_goodsShowDataSources[tableView.tag - TableViewTag]  count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KPGoodsShowCell * cell = [tableView dequeueReusableCellWithIdentifier:goodsCellIdentifier forIndexPath:indexPath];
    NSInteger tableIndex = tableView.tag - TableViewTag;
    KPGoodSellModel * model = _goodsShowDataSources[tableIndex][indexPath.row];
    cell.model = model;
    [cell setCellType:tableIndex];
    
    //点击回调
    __weak typeof(self) weakself = self;
    cell.clickBlock = ^(NSInteger clickIndex){
        if (clickIndex == 0) {
            [weakself shagnjiaAndxiaJiaModel:model type:tableIndex];//点击上架 或者 下架按钮
        }else{
            [self bianjiClick:model type:tableIndex]; //编辑按钮
        }
    };
    
    return  cell;
}
#pragma mark 
-(void)shagnjiaAndxiaJiaModel:(KPGoodSellModel*)model type:(CellType)type{
    if (type == Selling) {
        NSLog(@"下架按钮");
    }else{
        NSLog(@"上架按钮");
    }
     //走网络请求  然后刷新tableView
   
}

/**

 @param type 是在售 还是  下架页
 */
-(void)bianjiClick:(KPGoodSellModel *)model type:(CellType)type{
    //编辑数量价格
    KPGoodsEditView * view =  [KPGoodsEditView editViewWithModel:model];
    
    [view showinView:self.tabBarController.view  Andcomplete:^{//点击确定之后
        NSLog(@"修改之后的%@",view.model);
        
        //走网络请求  然后刷新tableView
        [[_mainScrollview viewWithTag:TableViewTag + type] reloadData];
    }];

}



#pragma mark 头部点击代理
- (void) scrollTitleButtAction:(NSInteger)index{
    [_mainScrollview setContentOffset:CGPointMake(_mainScrollview.frame.size.width*index, 0) animated:YES];
    
    //是否需要判断当前tableview有没有数据 进行刷新？？
//    [self loadData];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _mainScrollview) {
        [_header scrollAnimation:(_mainScrollview.contentOffset.x/_mainScrollview.frame.size.width) ];
    }
}


#pragma mark 第三页的点击 CollectionViewItem 的代理
-(void)didClickCollectionItemWithModel:(KPSelectModel *)model{
    KPNewGoodsSelectsVC * vc = [[KPNewGoodsSelectsVC alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
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
