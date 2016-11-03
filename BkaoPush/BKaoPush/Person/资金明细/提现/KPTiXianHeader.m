//
//  KPTiXianHeader.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPTiXianHeader.h"

@interface KPTiXianHeader()<UITextFieldDelegate>

@end

@implementation KPTiXianHeader
{
    UITextField *textField;
}
-(instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
        
    }

    return self;
}

-(void)createUI
{
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(0, 10+64, ScreenWidth, 55)];
    bgView.backgroundColor = [UIColor whiteColor];
    UIImageView *titleIMG =[[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 40, 40)];
    titleIMG.image = [UIImage imageNamed:@"提现.png"];
    [bgView addSubview:titleIMG];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+12, 0, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-24-30, 30)];
    titleLab.font =MM_FONT;
    titleLab.text=@"银行名称";
    [bgView addSubview:titleLab];
    
    UILabel *smallLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMG.frame)+12, 20, ScreenWidth-CGRectGetMaxX(titleIMG.frame)-24-30, 30)];
    smallLab.font =SS_FONT;
    smallLab.text =@"尾号：1233";
    [bgView addSubview:smallLab];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    [nextBtn addTarget:self action:@selector(XuanKaAction:) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.tag = 1489;
    [bgView addSubview:nextBtn];
    
    UIImageView *nextIMG = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-12-20, 20, 8, 16)];
    nextIMG.image =[UIImage imageNamed:@"前进.png"];
    
    [bgView addSubview:nextIMG];
    
    
    UIView *bgView1 = [[UIView alloc] init];
    bgView1.backgroundColor =[UIColor whiteColor];
    
    UILabel *tiXianLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, ScreenWidth-24, 30)];
    tiXianLab.text = @"提现金额";
    tiXianLab.font =SS_FONT;
    [bgView1 addSubview:tiXianLab];
    
    UILabel  *fuhao = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(tiXianLab.frame)+30, 20, 50)];
    fuhao.font =[UIFont systemFontOfSize:25];
    fuhao.text =@"￥";
    [bgView1 addSubview:fuhao];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(fuhao.frame), CGRectGetMaxY(tiXianLab.frame)+30, ScreenWidth-CGRectGetMaxX(fuhao.frame)-12, 50)];
    textField.borderStyle = UITextBorderStyleNone;
    textField.font = [UIFont systemFontOfSize:25];
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.keyboardType= UIKeyboardTypeDecimalPad;
    
    textField.delegate=self;
    [bgView1 addSubview:textField];
    
    
    UIView *linView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textField.frame)+5, ScreenWidth, 1)];
    linView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [bgView1 addSubview:linView];
    
    UILabel *keyongLab =[[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(linView.frame)+5, ScreenWidth-24, 30)];
    keyongLab.font =SS_FONT;
    keyongLab.text =@"可用提现资金10000.00";
    [bgView1 addSubview:keyongLab];
    
    
    
    bgView1.frame =CGRectMake(0, CGRectGetMaxY(bgView.frame)+10, ScreenWidth, CGRectGetMaxY(keyongLab.frame)+5);
    
    
    [self addSubview:bgView1];
    [self addSubview:bgView];
    
    
    UIButton *tiXianBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(bgView1.frame)+15, ScreenWidth-24, 40)];
    tiXianBtn.backgroundColor = KPYellowColor;
    [tiXianBtn setTitle:@"提现" forState:UIControlStateNormal];
    tiXianBtn.tag = 1490;
    tiXianBtn.titleLabel.font = MM_FONT;
    tiXianBtn.titleLabel.textColor =[UIColor blackColor];
    [tiXianBtn addTarget:self action:@selector(TiXianAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tiXianBtn];

    self.frame =CGRectMake(0, 0, ScreenWidth,CGRectGetMaxY(tiXianBtn.frame));

}
-(void)XuanKaAction:(UIButton *)btn
{
    [self.delegates KPLYTiXianAction:btn];
    
}
-(void)TiXianAction:(UIButton *)btn
{

    [self.delegates KPLYTiXianAction:btn];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
