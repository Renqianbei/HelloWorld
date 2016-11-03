//
//  KPWeiJieViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWeiJieViewController.h"
#import "KPWeiJieTableViewCell.h"


@interface KPWeiJieViewController ()
{

    NSMutableArray    *dataSource;
    //记录哪些组展开，哪些组收拢
    NSMutableArray * _showSection;
    KPWeiJieTableViewCell  *cell;
    
}

@end

@implementation KPWeiJieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLeftBarButtonItem];
   // [self setMyTitle:@""]
    
    [self createRootTableView:YES];
    
    self.rootTableView.frame = CGRectMake(0, -1, ScreenWidth, ScreenHeight-64-50-49);
    self.rootTableView.tag =10;
    [self createDataSource];

  //  self.view.backgroundColor = [UIColor yellowColor];
}
-(void)createDataSource
{
    
    dataSource =[[NSMutableArray alloc] init];
    _showSection = [[NSMutableArray alloc] init];
    
    for (int i=0; i<2; i++) {
        
        [_showSection addObject:@NO];
        
    }
 
    
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

    return 2;

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
    UIView  *bglinView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 72)];
    
    bglinView.backgroundColor =KP_GRAYCOLOR;
    
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, TAP, ScreenWidth, 60)];
    headerView.backgroundColor =[UIColor whiteColor];
    
    
    UIView *linView1 =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    linView1.backgroundColor =KPLineColor;
    [headerView addSubview:linView1];
    
    UIView *linView2 =[[UIView alloc] initWithFrame:CGRectMake(0, 60, ScreenWidth, 1)];
    linView2.backgroundColor =KPLineColor;
    [headerView addSubview:linView2];
    
    self.bianhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP, TAP, 60, 45)];
    self.bianhaoLab.font =[UIFont systemFontOfSize:32];
    self.bianhaoLab.textColor =[UIColor blackColor];
    //self.bianhaoLab.text =@"编号";
    [headerView addSubview:self.bianhaoLab];
    
    self.timelab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP , TAP, ScreenWidth*0.5-TAP , 20)];
    self.timelab.font =AA_FONT;
    [headerView addSubview:self.timelab];
    
    self.juliLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-TAP-102 , TAP, 70 , 20)];
    self.juliLab.font =AA_FONT;
    self.juliLab.textColor = [UIColor redColor];
    self.juliLab.textAlignment =NSTextAlignmentRight;
    [headerView addSubview:self.juliLab];
    
    self.dingdanhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP  , CGRectGetMaxY(self.timelab.frame), ScreenWidth-CGRectGetMaxX(self.bianhaoLab.frame)-48 , 20)];
    self.dingdanhaoLab.font =AA_FONT;
    [headerView addSubview:self.dingdanhaoLab];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-TAP-20, 21, 8, 16);
    [button setImage:[UIImage imageNamed:@"前进.png"] forState:UIControlStateNormal];
    
    [button setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-60];
    
    //设置tag值，为了区分是哪个组
    button.tag = 100+section;
    [button addTarget:self action:@selector(headButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    
    
        self.bianhaoLab.text = @"#01";
        self.timelab.text = @"下单时间 : 2016.09.32  11：25";
    
        self.juliLab.text = @"距离 :750M";
        self.dingdanhaoLab.text = @"订单号： 4221421412515124141";
    
    
    //设置旋转的角度
    CGFloat rotation;
    if ([_showSection[section] boolValue]==NO) {
        rotation = 0;
    }else{
        rotation = M_PI_2;
    }
    //旋转角度
    button.transform = CGAffineTransformMakeRotation(rotation);
    
    
    [bglinView addSubview:headerView];
    return bglinView;
    
}

-(void)headButtonOnclick:(UIButton *)button
{
    

    //获取组的值
    NSInteger section = button.tag - 100;
    //获取到当前的tableview
    UITableView * tv = (id)[self.view viewWithTag:10];
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
        cell = [[KPWeiJieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle= UITableViewCellAccessoryNone;
    [cell cateateDataSource:nil];
    
    
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
