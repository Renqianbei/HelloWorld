//
//  KPTJDuanXinViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPTJDuanXinViewController.h"
#import "KPTianJiaSuccessViewController.h"
#import "KPBangDingKaViewController.h"
@interface KPTJDuanXinViewController ()<UITextFieldDelegate>
{

    UITextField *textField;
}

@end

@implementation KPTJDuanXinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //短信验证
    //背景颜色 不能动
    self.view.backgroundColor =[UIColor colorWithWhite:0.94 alpha:1];
    [self setMyTitle:@"添加银行卡"];
    [self createLeftBarButtonItem];
    
    
    
    [self createUI];
}

-(void)createUI
{
    NSInteger i = 45;  //View 高度
    
    UIView *bgView1= [[UIView alloc] initWithFrame:CGRectMake(0, 64+10, ScreenWidth, i)];
    bgView1.backgroundColor = [UIColor whiteColor];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-24,i)];
    titleLab.font =SS_FONT;
    NSString  *str =@"13622070716";
    titleLab.text =[NSString stringWithFormat:@"请输入手机%@收到的短信验证码",str];
    [bgView1 addSubview:titleLab];
    [self.view addSubview:bgView1];
    
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+1, ScreenWidth, i) ];
    
    UILabel  *yanZLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, 50, i)];
    yanZLab.font =SS_FONT;
    yanZLab.text = @"验证码";
    [bgView2 addSubview:yanZLab];
    
    
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(yanZLab.frame)+20, 0, ScreenWidth-CGRectGetMaxX(yanZLab.frame)-12-20-100, i)];
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.tag = 10023;
    textField.placeholder = @"输入短信验证码";
    textField.delegate=self;
    [bgView2 addSubview:textField];
    
    UIView  *linView =[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(textField.frame), 3, 1, i-6)];
    linView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [bgView2 addSubview:linView];
     bgView2.backgroundColor = [UIColor whiteColor];

    //重新发送按钮
    UIButton *chongXinbtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(linView.frame)+17, 0, 100-24, i)];
   [chongXinbtn setTitle:@"重新发送" forState:UIControlStateNormal];
    [chongXinbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    chongXinbtn.titleLabel.font =MM_FONT;
    [chongXinbtn addTarget:self action:@selector(ChongXinAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView2 addSubview:chongXinbtn];
    
    
    
    
    
    [self.view addSubview:bgView2];
    
    UIButton *tiJiao = [[UIButton alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(bgView2.frame)+15, ScreenWidth-24, 40)];
    tiJiao.backgroundColor = KPYellowColor;
    [tiJiao setTitle:@"提交" forState:UIControlStateNormal];
    tiJiao.titleLabel.font = MM_FONT;
    tiJiao.titleLabel.textColor = [UIColor blackColor];
    [tiJiao addTarget:self action:@selector(TiXianAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiJiao];
    
    
}
// 下一步 按钮
-(void)TiXianAction:(UIButton *)button
{
//    //成功
//    KPTianJiaSuccessViewController *success = [[KPTianJiaSuccessViewController alloc] init];
//    [self.navigationController pushViewController:success animated:YES];
//    

    KPBangDingKaViewController *bangding = [[KPBangDingKaViewController alloc] init];
    [self.navigationController pushViewController:bangding animated:YES];

    
}
-(void)ChongXinAction:(UIButton *)btn
{
    NSLog(@"重新发送");
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
