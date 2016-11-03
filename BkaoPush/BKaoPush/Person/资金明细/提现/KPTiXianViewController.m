//
//  KPTiXianViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPTiXianViewController.h"
#import "KPXuanZeKaViewController.h"
#import "KPTiXianHeader.h"
@interface KPTiXianViewController ()<UITextFieldDelegate,KPLYTiXianActiondelegate>

@end

@implementation KPTiXianViewController
{

    UITextField *textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    [self setMyTitle:@"提现"];
    
    [self createLeftBarButtonItem];
    [self createUI];
    
}
-(void)createUI
{
    KPTiXianHeader *header =[[KPTiXianHeader alloc] init];
    header.delegates=self;
    [self.view addSubview:header];
    
    
}
-(void)KPLYTiXianAction:(UIButton *)button
{

    switch (button.tag) {
        case 1489:{
            
        //选卡
            KPXuanZeKaViewController *xuanze=[[KPXuanZeKaViewController alloc] init];
            [self.navigationController pushViewController:xuanze animated:YES];
        }
            break;
        case 1490:{
            
            //提现
            NSLog(@"您点击了提现按钮");
        }
            break;
        default:
            break;
    }
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
