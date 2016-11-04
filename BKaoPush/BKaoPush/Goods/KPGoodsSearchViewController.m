//
//  KPGoodsSearchViewController.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//
#import "KPTopHeader.h"
#import "KPGoodsShowCell.h"
#import "KPGoodSellModel.h"
#import "KPGoodsEditView.h"
#import "KPGoodsNoDatasView.h"
#import "KPGoodsSearchViewController.h"

#define TableViewTag 100

static NSString * goodsSeacrhCellIdentifier = @"cellId";


@interface KPGoodsSearchViewController ()<KPTopHeaderDelegate>
{
    KPGoodsNoDatasView * _nodataView;
}
@property ( nonatomic,strong)   KPTopHeader * header;
@property ( nonatomic,strong)  UIScrollView * mainScrollview;
/**
 在售商品 和 已下架商品 数据源
 */
@property ( nonatomic,strong)  NSMutableArray * goodsShowDataSources;
@end

@implementation KPGoodsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建刷选
    [self initHeaderFliter];
    //创建 在售商品 和 已下架商品tableView 和无数据显示的视图
    [self initTableViews];
    
    [self createNavView];//创建搜索框
    // Do any additional setup after loading the view from its nib.
}


- (void)createNavView{
    [self createRightBarButtonItem:RightItemTypeTxt text:@"搜索"];
    [self createLeftBarButtonItem];
    //
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 100, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 24)];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = [UIImage imageNamed:@"搜索2"];
    textField.leftView = imageview;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.placeholder = @"请输入商品名称";
    self.navigationItem.titleView = textField;
    
}

//搜索数据  刷新tableview
- (void)searchData:(NSString *)keywords{
    
    //网络请求 刷新tableView
    _goodsShowDataSources = [NSMutableArray array];
    
    NSMutableArray * sells = [NSMutableArray array]; //获取 在售商品数据
    NSMutableArray * downs = [NSMutableArray array];//获取仓库商品或者说已下架商品数据
    
    int count = arc4random()%1;
    int count1 = arc4random()%3;
    
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
    

    [_goodsShowDataSources addObject:sells];
    [_goodsShowDataSources addObject:downs];
    
    //判断网络请求结果
    if (sells.count==0&&downs.count ==0) {
        _nodataView.hidden = NO;//没有搜到数据 显示无数据
        [self.view addSubview:_nodataView];
    }else{
        _nodataView.hidden = YES;
    }
    
    //刷新数据 刷新tableview
    [self reloadTabelView:Selling];
    [self reloadTabelView:HasDone];

}



-(void)rightBarButtonItemAction{
    NSLog(@"搜索");
    UITextField * textfield = (UITextField*)self.navigationItem.titleView;
    [self searchData:textfield.text];//搜索数据
}

//刷新tableView
-(void)reloadTabelView:(CellType)type{
    //找到tableView 进行刷新
    [[_mainScrollview viewWithTag:type+TableViewTag] reloadData];
}




- (void)initHeaderFliter{
    
    _header = [[KPTopHeader alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 50) withTitleArr:@[@"在售商品",@"已下架"]];
    _header.delegate  = self;
    [self.view addSubview:_header];
    
    
}

- (void)initTableViews{
    float originy = CGRectGetMaxY(_header.frame) ;
    _mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, originy, ScreenWidth, ScreenHeight - originy)];
    _mainScrollview.contentSize = CGSizeMake(_mainScrollview.frame.size.width*3, _mainScrollview.frame.size.height);
    _mainScrollview.pagingEnabled = YES;
    _mainScrollview.delegate = self;
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
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPGoodsShowCell class]) bundle:nil] forCellReuseIdentifier:goodsSeacrhCellIdentifier];
        
        [_mainScrollview addSubview:tableView];
        
    }
        [self.view addSubview:_mainScrollview];
    
//        //无内容 应该显示的提示图
        NSString * title =  @"抱歉，没有搜到您要的商品";
        _nodataView = [KPGoodsNoDatasView NoDataViewWithTitle:title];
        _nodataView.frame = CGRectMake(0, originy, ScreenWidth, ScreenHeight - originy);
        _nodataView.subTitle.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //找到对应tableview
    return [_goodsShowDataSources[tableView.tag - TableViewTag]  count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KPGoodsShowCell * cell = [tableView dequeueReusableCellWithIdentifier:goodsSeacrhCellIdentifier forIndexPath:indexPath];
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
