//
//  KPZiJinHeaderView.m
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZiJinHeaderView.h"

@implementation KPZiJinHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        [self createdate];
    }
    return self;
}
-(void)createdate
{
    
    
}
-(void) CreateUI :(NSDictionary *)dic
{
    UIView *BGview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*0.4)];
    BGview.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
   // BGview.backgroundColor = [UIColor redColor];
    [self addSubview:BGview];
    
    UIView *BGview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*0.4*0.5)];
    //BGview1.backgroundColor = [UIColor blackColor];
    //176
//    224
//    230
    BGview1.backgroundColor = [UIColor colorWithRed:0.176 green:0.224 blue:0.2 alpha:1];
    
    //账户总余额
    UILabel *zhanghu =[[UILabel alloc] initWithFrame:CGRectMake(12, 35, ScreenWidth-12-12, 30)];
    zhanghu.font =SS_FONT;
    zhanghu.text =@"账户总余额 (元)";
    zhanghu.textColor =[UIColor whiteColor];
    [BGview1 addSubview:zhanghu];
    
    //多少钱
    UILabel *qianshu =[[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(zhanghu.frame)-12, ScreenWidth-12-12, 60)];
    qianshu.font =[UIFont systemFontOfSize:27];
    qianshu.text =@"20000.00";
    qianshu.textColor =[UIColor whiteColor];
    [BGview1 addSubview:qianshu];
    
 
    //去充值
    UIButton *RechargeBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-70,ScreenHeight*0.4*0.5/2.0-15 , 60, 40)];
    [RechargeBtn setTitle:@"去充值" forState:UIControlStateNormal];
    RechargeBtn.titleLabel.font =MM_FONT;
    [RechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RechargeBtn addTarget:self action:@selector(RecgargeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [BGview1 addSubview:RechargeBtn];
    
    
    
    
    UIView *BGview2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BGview1.frame)+1, ScreenWidth, ScreenHeight*0.4*0.46)];
    BGview2.backgroundColor =[UIColor whiteColor];
    
    UILabel *keyong =[[UILabel alloc] initWithFrame:CGRectMake(12, 12, 100, 30)];
    keyong.font =SS_FONT;
    keyong.text =@"可用资金";
    [BGview2 addSubview:keyong];
    
    UILabel *KYqian =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(keyong.frame)+12 , 12, ScreenWidth-24-120, 30)];
    KYqian.font =SS_FONT;
    KYqian.textAlignment = NSTextAlignmentRight;
    KYqian.text =@"￥10000.00";
    [BGview2 addSubview:KYqian];
    
    
    UILabel *weijie =[[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(keyong.frame), 100, 30)];
    weijie.font =SS_FONT;
    weijie.text =@"未结算资金";
    [BGview2 addSubview:weijie];
    
    UILabel *WJqian =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(weijie.frame)+12 , CGRectGetMaxY(KYqian.frame), ScreenWidth-24-120, 30)];
    WJqian.font =SS_FONT;
    WJqian.textAlignment = NSTextAlignmentRight;
    WJqian.text =@"￥5000.00";
    [BGview2 addSubview:WJqian];
    
    //可提现在资金
    UILabel *keti =[[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(weijie.frame), 100, 30)];
    keti.font =SS_FONT;
    keti.text =@"可提现资金";
    [BGview2 addSubview:keti];
    
    
    UILabel *KTqian =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(keti.frame)+12 , CGRectGetMaxY(WJqian.frame), ScreenWidth-24-120, 30)];
    KTqian.font =SS_FONT;
    KTqian.textAlignment = NSTextAlignmentRight;
    KTqian.text =@"￥5000.00";
    [BGview2 addSubview:KTqian];
    
    
    
    [BGview addSubview:BGview2];
    [BGview  addSubview:BGview1];
    
}
-(void)RecgargeBtnAction:(UIButton *)button
{
    [self.delagates KPRecgargeBtnAction:button];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
