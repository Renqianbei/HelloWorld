//
//  KPFaPiaoSheDingViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/27.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoSheDingViewController.h"
#import "KPFaPiaoSheDingTableViewCell.h"

@interface KPFaPiaoSheDingViewController ()<KPLYFaPiaoSheDingActiondelegate>
{
    NSMutableArray      *dataSoucre;
    NSMutableArray       *seleMuArr;
    UIScrollView         *scrollView;
}

@end

@implementation KPFaPiaoSheDingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"发票设定"];
    
    [self createLeftBarButtonItem];
    
    [self createRightBarButtonItem:RightItemTypeTxt text:@"完成"];
    
    [self createUI];
    [self createRootTableView:NO];
    
    [self createDataSoucre];
   
}
-(void)rightBarButtonItemAction
{

    NSLog(@"完成 跳转");
}

-(void)createUI
{
    dataSoucre = [[NSMutableArray alloc] init];
    seleMuArr  = [[NSMutableArray alloc] init];
    
    NSArray  *arr =@[@"品类",@"品类1",@"品类2",@"品类3",@"品类4",@"品类5",@"品类6",@"品类7",@"品类8",@"品类9",@"品类10",@"品类12",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13"];
    for (int i=0; i<40; i++) {
        
        [dataSoucre addObject:arr[i]];
        [seleMuArr addObject:@NO];
    }
    
        [self.rootTableView reloadData];
    
}


-(void)createDataSoucre
{
//    dataSoucre = [[NSMutableArray alloc] init];
//    seleMuArr  = [[NSMutableArray alloc] init];
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 64, ScreenWidth, 45);
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    self.rootTableView.frame =CGRectMake(0, 45+64, ScreenWidth, ScreenHeight-45-64);
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    headerView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    self.rootTableView.tableHeaderView=headerView;
    
    NSArray *arr = @[@"类型1",@"字可以很长很长",@"类型1",@"类型1",@"类型1",@"类型1",@"类型1",@"这里是"];
    [self prepareUI:arr];
    
}

- (void)prepareUI:(NSArray *)searchArr
{
    float labWidth = 12;
    
    for (int i=0; i<searchArr.count; i++) {
        
        CGSize size = [KPTool stringCGSize:searchArr[i] font:14 width:0 height:23];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(labWidth, 11, size.width+20, 23)];
        button.backgroundColor = [UIColor colorWithRed:0.910 green:0.918 blue:0.922 alpha:1.000];
        [button setTitle:searchArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.149 green:0.149 blue:0.153 alpha:1.000] forState:UIControlStateNormal];
        button.layer.cornerRadius = 5;
        button.clipsToBounds = YES;
        button.tag = 1010+i;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:searchArr action:@selector(hotButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
        
        labWidth +=size.width+20.0+10;
        scrollView.contentSize = CGSizeMake(labWidth, 0);
        
    }
    
}



#pragma mark 头滚动条响应事件
- (void) hotButtonAction:(UIButton *)button
{
    NSLog(@"点击了第%ld个热词",button.tag-1010);
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSoucre.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KPFaPiaoSheDingTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPFaPiaoSheDingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.delegates=self;
    
    //[cell  createDateSoucre:nil :indexPath isSelect:[seleMuArr[indexPath.row] boolValue]];
    [cell createDataSoucre:nil NSindexPath:indexPath iSselect:[seleMuArr[indexPath.row] boolValue]];
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)KPLYFaPiaoSheDingAction:(UIButton *)button
{
    
    // 1
    //    NSLog(@"----%ld",[button kpIndexPath].row);
    //    [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:[seleMuArr[[button kpIndexPath].row] boolValue]?@NO:@YES];
    
    
    // 2
    if ([seleMuArr[[button kpIndexPath].row] boolValue]) {
        
        [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@NO];
        
    }else{
        [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@YES];
        
    }
    
    [self.rootTableView reloadData];
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
