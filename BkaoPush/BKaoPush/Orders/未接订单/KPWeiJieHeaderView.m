//
//  KPWeiJieHeaderView.m
//  BKaoPush
//
//  Created by LY on 16/11/1.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWeiJieHeaderView.h"

@implementation KPWeiJieHeaderView

-(instancetype) initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

-(void) createUI :(NSInteger)section
{
    UIView  *bglinView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 72)];
    
    bglinView.backgroundColor =KP_GRAYCOLOR;
    
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, TAP, ScreenWidth, 60)];
    headerView.backgroundColor =[UIColor whiteColor];
    
    
    UIView *linView1 =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    linView1.backgroundColor =KPLineColor;
    [headerView addSubview:linView1];
    
    UIView *linView2 =[[UIView alloc] initWithFrame:CGRectMake(0, 60, ScreenWidth, 1)];
    linView2.backgroundColor =KPLineColor;
    [headerView addSubview:linView2];
    
    self.bianhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP, TAP, 60, 45)];
    self.bianhaoLab.font =[UIFont systemFontOfSize:32];
    self.bianhaoLab.textColor =[UIColor blackColor];
    //self.bianhaoLab.text =@"编号";
    [headerView addSubview:self.bianhaoLab];
    
    self.timelab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP , TAP, ScreenWidth*0.5-TAP , 20)];
    self.timelab.font =AA_FONT;
    [headerView addSubview:self.timelab];
    
    self.juliLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-TAP-102 , TAP, 70 , 20)];
    self.juliLab.font =AA_FONT;
    self.juliLab.textColor = [UIColor redColor];
    self.juliLab.textAlignment =NSTextAlignmentRight;
    [headerView addSubview:self.juliLab];
    
    self.dingdanhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP  , CGRectGetMaxY(self.timelab.frame), ScreenWidth-CGRectGetMaxX(self.bianhaoLab.frame)-48 , 20)];
    self.dingdanhaoLab.font =AA_FONT;
    [headerView addSubview:self.dingdanhaoLab];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-TAP-20, 21, 8, 16);
    [button setImage:[UIImage imageNamed:@"前进.png"] forState:UIControlStateNormal];
    
    [button setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-60];
    
    //设置tag值，为了区分是哪个组
    button.tag = 100+section;
    [button addTarget:self action:@selector(headButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    
    
    self.bianhaoLab.text = @"#01";
    self.timelab.text = @"下单时间 : 2016.09.32  11：25";
    
    self.juliLab.text = @"距离 :750M";
    self.dingdanhaoLab.text = @"订单号： 4221421412515124141";
    
    
//    //设置旋转的角度
//    CGFloat rotation;
//    if ([_showSection[section] boolValue]==NO) {
//        rotation = 0;
//    }else{
//        rotation = M_PI_2;
//    }
//    //旋转角度
//    button.transform = CGAffineTransformMakeRotation(rotation);
    
    
    [bglinView addSubview:headerView];
    
    
}
-(void)headButtonOnclick:(UIButton *)button
{
    NSLog(@"打印");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
