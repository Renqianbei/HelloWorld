//
//  KPChongzhiHeaderView.m
//  BKaoPush
//
//  Created by LY on 16/10/27.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPChongzhiHeaderView.h"

@interface KPChongzhiHeaderView ()<UITextFieldDelegate>
{

    UITextField *textField;
}
@end

@implementation KPChongzhiHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void) createUI
{
    
    NSUInteger BGHeight =70;
    
    UIView *bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64+10, ScreenWidth, BGHeight)];
    bgView1.backgroundColor = [UIColor whiteColor];
    
    UILabel  *jinELab =[[UILabel alloc] initWithFrame:CGRectMake(12, BGHeight/2-20, 45, 40)];
    jinELab.font =SS_FONT;
    jinELab.text =@"金额";
    [bgView1 addSubview:jinELab];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(jinELab.frame), BGHeight/4.0, ScreenWidth-CGRectGetMaxX(jinELab.frame)-12, BGHeight/2.0)];
    textField.borderStyle = UITextBorderStyleNone;
    textField.font = SS_FONT;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.placeholder = @"请输入充值金额";
    textField.keyboardType= UIKeyboardTypeDecimalPad;
    
    textField.delegate=self;
    [bgView1 addSubview:textField];
    
    
    NSInteger BGHeight2=50;
    
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame)+10, ScreenWidth, BGHeight2)];
    bgView2.backgroundColor = [UIColor whiteColor];
    
    UILabel  *fangShiLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth, BGHeight2)];
    fangShiLab.font =SS_FONT;
    fangShiLab.text =@"选择支付方式";
    [bgView2 addSubview:fangShiLab];
    
    
    NSInteger BGHeight3=60;
    UIView *bgView3 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame)+1, ScreenWidth, BGHeight3)];
    bgView3.backgroundColor =[UIColor whiteColor];
    
    UIImageView  *titleIMG = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 40, 40)];
    titleIMG.image = [UIImage imageNamed:@"支付宝支付"];
    [bgView3 addSubview:titleIMG];
    
    UILabel  *zhiFuBao =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+20, 0, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-70, BGHeight3)];
    zhiFuBao.font =MM_FONT;
    zhiFuBao.text =@"支付宝支付";
    [bgView3 addSubview:zhiFuBao];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-30-12, 23, 24, 24);
    [button setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
    [button setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
    [button setEnlargeEdgeWithTop:23 right:0 bottom:23 left:ScreenWidth-30-12-24];
    //    [button setEnlargeEdgeWithTop:0 right:0 bottom:0 left:ScreenWidth-60];
    button.tag = 808;
    [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView3 addSubview:button];
    
    
    //微信
    
    NSInteger BGHeight4=60;
    UIView *bgView4 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView3.frame)+1, ScreenWidth, BGHeight4)];
    bgView4.backgroundColor =[UIColor whiteColor];
    
    UIImageView  *titleIMG1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 40, 40)];
    titleIMG1.image = [UIImage imageNamed:@"微信支付"];
    [bgView4 addSubview:titleIMG1];
    
    UILabel  *weixinLab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+20, 0, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-70, BGHeight4)];
    weixinLab.font =MM_FONT;
    weixinLab.text =@"微信支付";
    [bgView4 addSubview:weixinLab];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(ScreenWidth-30-12, 23, 24, 24);
    [button1 setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
    [button1 setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
    [button1 setEnlargeEdgeWithTop:23 right:0 bottom:23 left:ScreenWidth-30-12-24];
    button1.tag = 809;
    [button1 addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView4 addSubview:button1];
    
    
    
    
    
    [self addSubview:bgView4];
    
    [self addSubview:bgView3];
    
    [self addSubview:bgView2];
    
    [self addSubview:bgView1];
    
    
    //    NSLog(@"%f",100.0/ScreenHeight);
    
    UIButton *tiXianBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(bgView4.frame)+15, ScreenWidth-24, 40)];
    tiXianBtn.backgroundColor = KPYellowColor;
    [tiXianBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    tiXianBtn.titleLabel.font = MM_FONT;
    tiXianBtn.tag =810;
    tiXianBtn.titleLabel.textColor =[UIColor blackColor];
    [tiXianBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tiXianBtn];
    
    self.frame =CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(tiXianBtn.frame));
    
}

- (void) selectAction:(UIButton *)button
{
    
    [self.delegates KPChongZhiAction:button];
//    for (int i=0; i<2; i++) {
//        UIButton * button = [self viewWithTag:808+i];
//        button.selected = NO;
//    }
//    
//    button.selected = YES;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
