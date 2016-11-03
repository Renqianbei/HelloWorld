//
//  KPBaseVC.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBaseVC.h"
#import "KPLoginVC.h"

@interface KPBaseVC ()

@end

@implementation KPBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    
  //  [self createLeftBarButtonItem];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self prepareDataSource];
    
}


- (void) prepareDataSource{

    self.rootDataSource = [[NSMutableArray alloc] init];
}



- (void) presentLogin{
    
    [KPTool outUserInfo];
    
    KPLoginVC *login =[[KPLoginVC alloc] init];
    UINavigationController *nLogin =[[UINavigationController alloc] initWithRootViewController:login];
    [self presentViewController:nLogin animated:YES completion:nil];
}


- (void)setRootRefresh
{
    
    self.rootTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshHeaderAction)];
    
    self.rootTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshFooterAction)];
    
    
    //self.rootTableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshFooterAction)];
    
    // self.rootTableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshHeaderAction)];
    //带动画的 刷新
//    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(rootRefreshHeaderAction)];
//    
//    NSArray * images = @[[UIImage imageNamed:@"refreshLogo1.png"],[UIImage imageNamed:@"refreshLogo2.png"]];
//    
//    [header setImages:images forState:MJRefreshStateIdle];
//    [header setImages:images forState:MJRefreshStatePulling];
//    [header setImages:images forState:MJRefreshStateNoMoreData];
//    [header setImages:images forState:MJRefreshStateRefreshing];
//    
//    self.rootTableView.mj_header = header;
    
    
}

-(void)rootRefreshHeaderAction
{
    
}


-(void)rootRefreshFooterAction
{
}


-(void)beginRootRefresh_header
{
    [self.rootTableView.mj_header beginRefreshing];
}

-(void)beginRootRefresh_footer
{
    [self.rootTableView.mj_footer beginRefreshing];
}



-(void)endRootRefresh_header
{
    [self.rootTableView.mj_header endRefreshing];
}

-(void)endRootRefresh_footer
{
    [self.rootTableView.mj_footer endRefreshing];
}

-(void)createRootTableView:(BOOL)isGroup
{
    
    if (isGroup) {
        
        _rootTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
    }
    else{
    
        _rootTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    }
    
    
    _rootTableView.delegate = self;
    
    _rootTableView.dataSource = self;
    
    _rootTableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_rootTableView];
    
   // _rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
 
    
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


-(void)setMyTitle:(NSString *)titleStr
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    label.text = titleStr;
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
}



//navBar（返回按钮的创建）
-(void)createLeftBarButtonItem
{
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30,30)];
    [self.leftButton setImage:IMAGE(@"nav_back") forState:UIControlStateNormal];
    self.leftButton.adjustsImageWhenHighlighted = NO;
    [self.leftButton addTarget:self action:@selector(leftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * leftBartem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftBartem;
}

//navBar（返回按钮的创建）
-(void)createMainLeftBarButtonItem
{
    
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30,30)];
    self.leftButton.adjustsImageWhenHighlighted = NO;
    [self.leftButton addTarget:self action:@selector(leftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * leftBartem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftBartem;
}




-(void)createRightBarButtonItem:(RightItemType)itemType text:(NSString *)text
{
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24,24)];
    
    if (itemType == RightItemTypeImage) {
        [self.rightButton setImage:[UIImage imageNamed:text] forState:UIControlStateNormal];
    }
    
    else if (itemType == RightItemTypeTxt){
        
        CGSize size =[KPTool stringCGSize:text font:13 width:0 height:30];
        self.rightButton.frame =CGRectMake(0, 0, size.width*1.5, 24);
        [self.rightButton setTitle:text forState:UIControlStateNormal];
        self.rightButton.titleLabel.font =[UIFont systemFontOfSize:13];
        [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    
    
    self.rightButton.adjustsImageWhenHighlighted = NO;
    [self.rightButton addTarget:self action:@selector(rightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * goBtnItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = goBtnItem;
}






-(void)leftBarButtonItemAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headNav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    
    [KPTabbar shareTabBarController:NO].tabBar.hidden =YES;
    
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
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
