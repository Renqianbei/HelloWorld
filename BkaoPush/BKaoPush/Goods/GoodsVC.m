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
#define TableViewTag 100
#import "KPGoodSellModel.h"
#import "KPGoodsEditView.h"
static NSString * goodsCellIdentifier = @"cellId";

@interface GoodsVC ()<KPTopHeaderDelegate,UITableViewDelegate,UITableViewDataSource>
{
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
    
    [self initDatas];
    
    //创建刷选
    [self initHeaderFliter];
    //
    [self initTableViews];
}

- (void)initDatas{
    _goodsShowDataSources = [NSMutableArray array];
    
    NSMutableArray * sells = [NSMutableArray array];
    NSMutableArray * downs = [NSMutableArray array];
    //假数据
    for (int i = 0; i < 20; i ++) {
        //
        KPGoodSellModel  * model = [KPGoodSellModel jiashuju];
        [sells addObject:model];
    
    }
    for (int i = 0; i < 8; i ++) {
        //
        KPGoodSellModel  * model = [KPGoodSellModel jiashuju];
        [downs addObject:model];
    }
    
    [_goodsShowDataSources addObject:sells];
    [_goodsShowDataSources addObject:downs];

    
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
    for (int i = 0 ; i<2 ; i++) {
        CGRect frame = _mainScrollview.bounds;
        frame.origin.x  = _mainScrollview.frame.size.width * i;
        UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 50;
        tableView.tag = TableViewTag + i;
        tableView.delegate = self;
        tableView.dataSource = self;
//        tableView.backgroundColor = @[[UIColor redColor],[UIColor blueColor],[UIColor blackColor]][i];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPGoodsShowCell class]) bundle:nil] forCellReuseIdentifier:goodsCellIdentifier];

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
