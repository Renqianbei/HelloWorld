//
//  KPAccountViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAccountViewController.h"
#import "KPMingXIHarder.h"
#import "KPMingXiTableViewCell.h"
#import "KPJinZhangXQViewController.h"

@interface KPAccountViewController ()
{

    NSMutableArray *dataSoucre;
    UIScrollView   *scrollView;
    KPMingXIHarder *head;
}

@end

@implementation KPAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"资金变动详情"];
    [self createLeftBarButtonItem];
    
    [self createRightBarButtonItem:RightItemTypeTxt text:@"全部"];
     [self  createRootTableView:NO];
    
    [self HeaderView];
      [self createDataSoucre];
   
    
}

-(void)rightBarButtonItemAction
{

    
    
    
    
}

-(void)createDataSoucre
{
    dataSoucre = [[NSMutableArray alloc] init];
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 64, ScreenWidth, 45);
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
   
   self.rootTableView.frame =CGRectMake(0, 45+64, ScreenWidth, ScreenHeight-45-64);
    
    
    NSArray *arr = @[@"你好dsaddsdd",@"这里是",@"IPHONE7 PLUS",@"华为P8",@"三星盖世8",@"红米Note",@"烟",@"酒",@"2016款 全新帕萨特(限购)",@"格力空调"];
    [self prepareUI:arr];
    
}

-(void)HeaderView
{
    head = [[KPMingXIHarder alloc] init];
    
    self.rootTableView.tableHeaderView = head;
    self.rootTableView.tableHeaderView.frame = CGRectMake(0, 0, ScreenWidth, 30);
    
    
 }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KPMingXiTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPMingXiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dic;
    [cell createDataSoucre:dic];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 60.0f;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    KPJinZhangXQViewController *shouzhi =[[KPJinZhangXQViewController alloc] init];
    [self.navigationController pushViewController:shouzhi animated:YES];
    
}

#pragma mark 头滚动条响应事件
- (void) hotButtonAction:(UIButton *)button
{
    NSLog(@"点击了第%ld个热词",button.tag-1010);
    
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
