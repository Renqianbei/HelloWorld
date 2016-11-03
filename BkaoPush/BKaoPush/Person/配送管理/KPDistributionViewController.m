//
//  KPDistributionViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPDistributionViewController.h"

@interface KPDistributionViewController ()

@end

@implementation KPDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self createLeftBarButtonItem];
    [self setMyTitle:@"配送管理"];
    [self createUI];
    //self.view.backgroundColor = KPGrayColor;
}


- (void) createUI
{
    NSArray * arr = @[@"默认配送方式",@"第三方配送",@"店铺自行配送"];
    
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 12)];
    line1.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self.view addSubview:line1];
    for (int i=0; i<3; i++) {
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(18, 64+12+50*i+6, ScreenWidth-70, 60)];
        label.text = arr[i];
        //label.font = MM_FONT;
        [self.view addSubview:label];
        if (i==0) {
            label.font=MM_FONT;
        }else
        {
            label.font=SS_FONT;
        
        }
        
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 64+12+60+50*i, ScreenWidth, 1)];
        line.backgroundColor = KPGrayColor;
        [self.view addSubview:line];
        if (i>0) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(ScreenWidth-30-12, 64+12+18+50*i+6, 24, 24);
            [button setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
            [button setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
            button.tag = 808+i;
            [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
      
        
    }
}




- (void) selectAction:(UIButton *)button
{
    for (int i=1; i<3; i++) {
        UIButton * button = [self.view viewWithTag:808+i];
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
