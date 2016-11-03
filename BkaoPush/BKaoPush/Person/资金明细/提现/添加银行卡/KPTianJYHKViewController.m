//
//  KPTianJYHKViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPTianJYHKViewController.h"
#import "KPTJDuanXinViewController.h"
@interface KPTianJYHKViewController ()<UITextFieldDelegate>
{
 
    UITextField *textField;
    UIView *bgview;
}

@end

@implementation KPTianJYHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self setMyTitle:@"添加银行卡"];
    [self createLeftBarButtonItem];
    [self createUI];
    

}
-(void)createUI
{
    NSArray *arrPlaceloder =@[@"请输入持卡人姓名",@"请选择银行",@"请输入银行卡号",@"请输入手机号"];
    NSArray  *arrTitle =@[@"持卡人",@"银行",@"卡号",@"手机号"];
    for (int i=0; i<4; i++) {
        
        bgview =[[UIView alloc] initWithFrame:CGRectMake(0, 64+10+51*i, ScreenWidth, 50)];
        
        bgview.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bgview];
        
        
        UILabel *lable =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, 60, 50)];
        lable.font =MM_FONT;
        lable.text=arrTitle[i];
        [bgview addSubview:lable];
        
        UIView *linView =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lable.frame), ScreenWidth, 1)];
        linView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
        [bgview addSubview:linView];
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lable.frame)+20, 0, ScreenWidth-CGRectGetMaxX(lable.frame)-12-20, 50)];
        textField.borderStyle = UITextBorderStyleNone;
        textField.clearButtonMode = UITextFieldViewModeAlways;
        textField.tag = 1000+i;
        textField.placeholder = arrPlaceloder[i];
        textField.delegate=self;
        [bgview addSubview:textField];
        
        if (i==0) {
            textField.keyboardType =UIKeyboardTypeDefault;
            
        }else if (i==1){
            
            textField.enabled =NO;
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame =CGRectMake(CGRectGetMaxX(lable.frame)+20, 0, ScreenWidth-CGRectGetMaxX(lable.frame)-12-20, 50);
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [bgview addSubview:button];
        
        }else{
        textField.keyboardType =UIKeyboardTypeNumberPad;
            
        }
    }
    
    
    UIButton *tiJiao = [[UIButton alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(bgview.frame)+15, ScreenWidth-24, 40)];
    tiJiao.backgroundColor = KPYellowColor;
    [tiJiao setTitle:@"下一步" forState:UIControlStateNormal];
    tiJiao.titleLabel.font = MM_FONT;
    tiJiao.titleLabel.textColor = [UIColor blackColor];
    [tiJiao addTarget:self action:@selector(TiXianAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiJiao];

    
}
// 下一步 按钮
-(void)TiXianAction:(UIButton *)button
{
    KPTJDuanXinViewController *duanXin =[[KPTJDuanXinViewController alloc] init];
    [self.navigationController pushViewController:duanXin animated:YES];
}
// 选择银行按钮
-(void)buttonAction:(UIButton *)buton
{
    NSLog(@"选择银行");
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
