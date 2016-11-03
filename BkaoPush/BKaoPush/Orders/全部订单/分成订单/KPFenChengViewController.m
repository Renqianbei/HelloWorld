//
//  KPFenChengViewController.m
//  BKaoPush
//
//  Created by LY on 16/11/2.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFenChengViewController.h"
#import "KPFenChengTableViewCell.h"
@interface KPFenChengViewController ()
{
    NSMutableArray          *dataSource;
    NSMutableArray          *ziYouDataSource;
    NSMutableArray          *fenChengDataSource;
    NSInteger                index;
    //记录哪些组展开，哪些组收拢
    NSMutableArray * _showSection;
    KPFenChengTableViewCell *cell;
}
@end

@implementation KPFenChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRootTableView:YES];
    
    
    self.rootTableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-50-49-40);
    self.rootTableView.tag =1082;
    [self createDataSource];
    
     // self.view.backgroundColor = [UIColor yellowColor];
}
-(void)createDataSource
{
    
    dataSource =[[NSMutableArray alloc] init];
    _showSection = [[NSMutableArray alloc] init];
    
    

    
    
}

//返回每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_showSection[section] boolValue] == YES) {
        return 1;
    }else{
        return 0;
    }
}

///多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    for (int i=0; i<5; i++) {
        
        [_showSection addObject:@NO];
        
    }
    //组数 和 _showSection 有关的
    return 5;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    //NSLog(@"fdskfdsjklsdjsdlkjsdkljsdl+++++++%ld",(long)section);
    return 72;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    return ScreenHeight-64-50-30-49;
    return cell.frame.size.height;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgview1 =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 72)];
    bgview1.backgroundColor =[UIColor colorWithWhite:0.94 alpha:1];
    
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, TAP, ScreenWidth, 60)];
    bgView.backgroundColor =[UIColor whiteColor];
    self.timeLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, 6, ScreenWidth-2*TAP-30, 30)];
    
    self.timeLab.font = MM_FONT;
    
    [bgView addSubview:self.timeLab];
    
    UIView *linView1 =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    linView1.backgroundColor =KPLineColor;
    [bgView addSubview:linView1];
    
    UIView *linView2 =[[UIView alloc] initWithFrame:CGRectMake(0, 59, ScreenWidth, 1)];
    linView2.backgroundColor =KPLineColor;
    [bgView addSubview:linView2];
    
    
    
    self.titleLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, CGRectGetMaxY(self.timeLab.frame), ScreenWidth-2*TAP-30, 20)];
    
    self.titleLab.font = SS_FONT;
    self.titleLab.textColor= [UIColor colorWithWhite:0.7 alpha:1];
    [bgView addSubview:self.titleLab];
    
    self.titleLab.text = @"Apple iPhone 7 Plus 金色64G 公开版";
    
    self.timeLab.text  =@"交易时间: 2016.09.23  11:25";
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-TAP-20, 22, 8, 16);
    [button setImage:[UIImage imageNamed:@"前进.png"] forState:UIControlStateNormal];
    
    [button setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-60];
    
    //设置tag值，为了区分是哪个组
    button.tag = 111123+section;
    [button addTarget:self action:@selector(headButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
    
    
    //设置旋转的角度
    CGFloat rotation;
    if ([_showSection[section] boolValue]==NO) {
        rotation = 0;
    }else{
        rotation = M_PI_2;
    }
    //旋转角度
    button.transform = CGAffineTransformMakeRotation(rotation);
    
    [bgview1 addSubview:bgView];
    
    return bgview1;
}

-(void)headButtonOnclick:(UIButton *)button
{
    
    
    //获取组的值
    NSInteger section = button.tag - 111123;
    //获取到当前的tableview
    UITableView * tv = (id)[self.view viewWithTag:1082];
    if ([_showSection[section] boolValue]==NO) {
        [_showSection removeObjectAtIndex:section];
        [_showSection insertObject:@YES atIndex:section];
    }else{
        [_showSection removeObjectAtIndex:section];
        [_showSection insertObject:@NO atIndex:section];
    }
    //刷新数据，会读取组数和每组元素个数，cell会重建
    //    [tv reloadData];
    //带动画的刷新方法，刷新某一组
    //将数字放入到集合中
    NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:section];
    //刷新一组
    [tv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPFenChengTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle= UITableViewCellAccessoryNone;
    [cell createDataSource:nil];
    
    
    
    return cell;
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
