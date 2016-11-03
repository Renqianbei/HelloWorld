//
//  KPXuanZeKaViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPXuanZeKaViewController.h"
#import "KPTianJYHKViewController.h"
@interface KPXuanZeKaViewController ()

@end

@implementation KPXuanZeKaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"选择银行卡"];
    [self createUI];
    [self createLeftBarButtonItem];
    
    [self createRightBarButtonItem:RightItemTypeImage text:@"ceshiSele"];
    
    self.view.backgroundColor =[UIColor colorWithWhite:0.94 alpha:1];
}

-(void)rightBarButtonItemAction
{
    KPTianJYHKViewController *tianjia =[[KPTianJYHKViewController alloc] init];
    
    [self.navigationController pushViewController:tianjia animated:YES];

    
}

-(void)createUI
{
    NSArray * arr = @[@"银行卡名称"];
    
    NSArray  *arrTitle =@[@"尾号:1932储蓄卡",@"尾号:1234信用卡"];
    for (int i=0; i<2; i++) {
        
        UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, 10+64+67*i, ScreenWidth, 55)];
        bgView.backgroundColor = [UIColor whiteColor];
        UIImageView *titleIMG =[[UIImageView alloc] initWithFrame:CGRectMake(7, 5, 45, 45)];
        titleIMG.image = [UIImage imageNamed:@"提现.png"];
        [bgView addSubview:titleIMG];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+12, 0, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-24-30, 30)];
        titleLab.font =SS_FONT;
        //titleLab.text=arr[i];
        titleLab.text=@"银行卡名称";
        [bgView addSubview:titleLab];
        
        UILabel *smallLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+12, 20, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-24-30, 30)];
        smallLab.font =SS_FONT;
        smallLab.text =arrTitle[i];
        [bgView addSubview:smallLab];
       
        //选中按钮
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth-40-24, 10, 40, 40);
        [button setImage:IMAGE(@"选中2") forState:UIControlStateNormal];
        [button setImage:IMAGE(@"选框2_选中") forState:UIControlStateSelected];
        [button setEnlargeEdgeWithTop:0 right:0 bottom:0 left:ScreenWidth-60];
        button.tag = 838+i;
        [button addTarget:self action:@selector(KPLYselectAction:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
        
        [self.view addSubview:bgView];
        
    }
    
 
}
- (void) KPLYselectAction:(UIButton *)button
{
    
    NSLog(@"选中了银行卡的响应");
    for (int i=0; i<2; i++) {
        UIButton * button = [self.view viewWithTag:838+i];
        button.selected = NO;
    }
    
    button.selected = YES;
    
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
