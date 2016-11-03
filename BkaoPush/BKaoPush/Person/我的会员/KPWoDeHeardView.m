//
//  KPWoDeHeardView.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWoDeHeardView.h"

@implementation KPWoDeHeardView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self =[super initWithFrame:frame];
    if (self) {
        [self createUi];
    }
    
    return self;
}

-(void)createUi
{
    
    UIView *bgView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*0.16)];
    //bgView1.backgroundColor = [UIColor colorWithRed:0.41 green:0.36 blue:0.33 alpha:1];
       bgView1.backgroundColor = [UIColor colorWithRed:0.176 green:0.224 blue:0.2 alpha:1];
    UILabel *huiYuanLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 18, ScreenWidth-36, 30)];
    huiYuanLab.font = SS_FONT;
    huiYuanLab.text =@"会员总数";
    huiYuanLab.textColor = [UIColor whiteColor];
    [bgView1 addSubview:huiYuanLab];
    
    UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(huiYuanLab.frame)-5, ScreenWidth-36, 40)];
    moneyLab.font = [UIFont systemFontOfSize:28];
    moneyLab.text =@"200";
    moneyLab.textColor = [UIColor whiteColor];
    [bgView1 addSubview:moneyLab];
    
    
    
    UIView *bgView2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame), ScreenWidth, ScreenHeight*0.18)];
    bgView2.backgroundColor = [UIColor whiteColor];
    bgView2.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    NSArray *arr1 =@[@"今日新增",@"本月新增",@"本月流失",@"分成佣金(元)"];
    for (int i=0; i<2; i++) {
        
        
        //15+((ScreenWidth-120)/4.0+50)*(i/4
       //15+((ScreenWidth-120)/4.0+30)*(i%4), 15+((ScreenWidth-120)/4.0+50)*(i/4), (ScreenWidth-120)/4.0, (ScreenWidth-120)/4.0
        for (int j=0; j<2; j++) {
            
            if (j==1) {
                //竖线
                UIView *linView =[[UIView alloc] initWithFrame:CGRectMake(12+(ScreenWidth/2-24)*j, 12+i*57, 1, 30)];
                linView.backgroundColor =KPGrayColor;
                [bgView2 addSubview:linView];
                
                UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(linView.frame)+12, 12+i*50, ScreenWidth/2-24-30, 30)];
                // label1.textAlignment = NSTextAlignmentCenter;
                label1.text =arr1[i+j*2];
                label1.font = SS_FONT;
                [bgView2 addSubview:label1];
                
              
                
                
                UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(linView.frame)+12,CGRectGetMaxY(label1.frame)-15,ScreenWidth/2-24-30,30)];
                label2.text = @"10";
                label2.font = SS_FONT;
                [bgView2 addSubview:label2];
                if (i==1&&j==0) {
                    label2.textColor = [UIColor greenColor];
                    
                }else{
                    label2.textColor = [UIColor redColor];
                }
                
            }else{
                
                UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(12+(ScreenWidth/2-24)*j, 12+i*50, ScreenWidth/2-24, 30)];
                // label1.textAlignment = NSTextAlignmentCenter;
                label1.text =arr1[i+j*2];
                label1.font = SS_FONT;
                [bgView2 addSubview:label1];
                
                
                UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(12+(ScreenWidth/2-24)*j,CGRectGetMaxY(label1.frame)-15,ScreenWidth/2-24,30)];
                label2.text = @"10";
                label2.font = SS_FONT;
                [bgView2 addSubview:label2];
                //144
//              
//                144  238
                if (i==1&&j==0) {
                    label2.textColor = [UIColor greenColor];
                    
                }else{
                    label2.textColor = [UIColor redColor];
                }
            
            }
            

            
        }
        
     
        
        
    }

//    UIView *bgView3=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame), ScreenWidth, 5)];
//    bgView3.backgroundColor = KPGrayColor;
    
    UIView *bgView4=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView2.frame), ScreenWidth, 50)];
    bgView4.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *xinXiLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, ScreenWidth-36-100, 30)];
    xinXiLab.font = MM_FONT;
    xinXiLab.text =@"会员信息";
    [bgView4 addSubview:xinXiLab];
    
    
    UIButton *quanbubtn =[[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-80, 18, 88,30)];
    
    [quanbubtn setTitle:@"查看全部" forState:UIControlStateNormal];
    quanbubtn.titleLabel.font = SS_FONT;
    quanbubtn.tag =1279;
    [quanbubtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quanbubtn addTarget:self action:@selector(AAquanbuaction:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView4 addSubview:quanbubtn];
    
    UIView *bgView5 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView4.frame), ScreenWidth, 1)];
    bgView5.backgroundColor=[UIColor colorWithWhite:0.94 alpha:1];
    
    
    [self addSubview:bgView1];
    [self addSubview:bgView2];
   // [self addSubview:bgView3];
    [self addSubview:bgView4];
    [self addSubview:bgView5];
    
    self.frame =CGRectMake(0, 0, ScreenWidth,CGRectGetMaxY(bgView5.frame));
}

-(void)AAquanbuaction:(UIButton *)button
{
    [self.delegates KPAAquanbuaction:button];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
