//
//  KPBianJiViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBianJiViewController.h"

@interface KPBianJiViewController ()<UITextViewDelegate>
{
    UILabel *textLab;
    UITextView *textview;
    
}

@end

@implementation KPBianJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLeftBarButtonItem];
    self.view.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self setMyTitle:@"编辑公告"];
    
    
    [self  createUI];
}
-(void)createUI
{
   
    
    textview = [[UITextView alloc] initWithFrame:CGRectMake(12, 64+12, ScreenWidth-24, ScreenHeight*0.3)];
    textview.delegate=self;
 
    textview.layer.masksToBounds = YES;
    textview.layer.cornerRadius =5.0;
    textview.hidden = NO;
    UIButton *BaocunBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(textview.frame)+12, ScreenWidth-24, 40)];
    [BaocunBtn setTitle:@"保存" forState:UIControlStateNormal];
    [BaocunBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    BaocunBtn.backgroundColor = KPYellowColor;
    
    [BaocunBtn addTarget:self action:@selector(BaocunAction:) forControlEvents:UIControlEventTouchUpInside];
    
    textLab =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 30)];
    textLab.text = @"公告最多不能超过50字";
    textLab.font =SS_FONT;
    textLab.enabled = NO;//lable必须设置为不可用
    textLab.textColor = [UIColor colorWithWhite:0.94 alpha:1];
    [textview addSubview:textLab];
    
    
    
    
    [self.view addSubview:BaocunBtn];
    
    [self.view addSubview:textview];
}
-(void)textViewDidChange:(UITextView *)textView
{
   // self.examineText =  textView.text;
    
    if (textView.text.length == 0) {
        textLab.text = @"请输入您要编辑的公告";
    }else{
        textLab.text = @"";
    }
    
    
    
}
-(void)BaocunAction:(UIButton *)button
{
   self.block(textview.text);
    [self.navigationController popViewControllerAnimated:YES];

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
