//
//  MIBaoViewController.m
//  KP
//
//  Created by Jincang Lu on 16/9/17.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import "MIBaoViewController.h"

@interface MIBaoViewController ()
{
    //数据源
    NSMutableArray * _dataSource;
    NSMutableArray * _showSection;
    NSString       * _titleStr;
    UITextView     * textView;
    UIButton       * sureButton;
}
@end

@implementation MIBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor =[UIColor colorWithWhite:0.94 alpha:1];
    //self.view.backgroundColor =[UIColor redColor];
    [self setMyTitle:@"设置密保"];
    [self createLeftBarButtonItem];
    [self createDataSource];
    [self createTableVeiw];
}

- (void) createDataSource
{
    _dataSource = [[NSMutableArray alloc] initWithObjects:@[@"你爸爸是谁",@"你妈妈是谁",@"你爷爷是谁"], nil];
    _showSection = [[NSMutableArray alloc] init];
    _titleStr    =  @"请选择密保问题";
    
    [_showSection addObject:@NO];
}

- (void) createTableVeiw
{
    [self createRootTableView:YES];
}



//返回每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_showSection[section] boolValue]==YES)
    {
        return [_dataSource[section] count];
    }
    else
    {
        return 0;
    }
    
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, 60)];
    view1.backgroundColor = [UIColor whiteColor];
    [view addSubview:view1];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-36-30, 60)];
    label.text = _titleStr;
    label.font = LL_FONT;
    [view1 addSubview:label];
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(ScreenWidth-12-22, 6, 12, 48);
    [button setEnlargeEdgeWithTop:12 right:12 bottom:12 left:12];
    [button setImage:IMAGE(@"前进") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(headButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:button];
    //设置旋转角度
    CGFloat rotation;
    if ([_showSection[section] boolValue]==NO)
    {
        rotation=0;
    }
    else
    {
        rotation=M_PI_2;
    }
    //旋转角度
    button.transform=CGAffineTransformMakeRotation(rotation);
    
    return view;
    
}

-(void)headButtonClick:(UIButton *)button
{


    if ([_showSection[0] boolValue]==NO )
    {
        [_showSection replaceObjectAtIndex:0 withObject:@YES];
    }
    else
    {
        [_showSection replaceObjectAtIndex:0 withObject:@NO];
    }
    [textView resignFirstResponder];
    [self.rootTableView reloadData];
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = MM_FONT;
    cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
    return cell;
}


- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 270)];
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, 150)];
    textView.font = [UIFont systemFontOfSize:15];
    [view addSubview:textView];
    
    
    sureButton = [[UIButton alloc] initWithFrame:CGRectMake(20,190 , ScreenWidth-40, 60)];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.layer.cornerRadius = 5;
    sureButton.clipsToBounds = YES;
    [sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sureButton setBackgroundColor:[UIColor colorWithRed:0.969 green:0.753 blue:0.157 alpha:1.000]];
    [view addSubview:sureButton];
    
    
    return view;
}


- (void) sureButtonClick:(UIButton *) button
{
    [textView resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [textView resignFirstResponder];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_showSection replaceObjectAtIndex:0 withObject:@NO];
    _titleStr = _dataSource[indexPath.section][indexPath.row];
    [self.rootTableView reloadData];
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.0f;
}


- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 270.0f;
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
