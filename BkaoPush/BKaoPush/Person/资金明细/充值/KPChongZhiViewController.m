//
//  KPChongZhiViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPChongZhiViewController.h"
#import "PayTwoTableViewCell.h"
#import "KPChongzhiHeaderView.h"
@interface KPChongZhiViewController ()<UITextFieldDelegate,KPChongZhiActiondelegate>
{
    NSMutableArray *dataSoucre;
    NSMutableArray *_signArr;
    UIView * line1;
    UIView * line;
    
    UITextField *textField;
}

@end

@implementation KPChongZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLeftBarButtonItem];
    self.view.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self setMyTitle:@"账户充值"];
    
   // [self createRootTableView:NO];
    [self createUI];
   
}
-(void)createUI
{
    KPChongzhiHeaderView *header =[[KPChongzhiHeaderView alloc]init];
    header.delegates=self;
    [self.view addSubview:header];
    
}



-(void)KPChongZhiAction:(UIButton *)button
{
   
    if (button.tag-808<=1) {
        
        for (int i=0; i<2; i++) {
            UIButton * button = [self.view viewWithTag:808+i];
            button.selected = NO;
        }
        
        button.selected = YES;
    }else if(button.tag ==810){
    
        NSLog(@"提现");
    
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
