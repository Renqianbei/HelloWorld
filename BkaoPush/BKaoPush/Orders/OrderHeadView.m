//
//  OrderHeadView.m
//  KP
//
//  Created by Jincang Lu on 16/9/19.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//
#define ORDER_W    self.bounds.size.width
#define ORDER_H    self.bounds.size.height

#import "OrderHeadView.h"

@implementation OrderHeadView
{
    NSArray * titleArr;
}

- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)title
{
    if ([super initWithFrame:frame]) {
        
        titleArr = [[NSArray alloc] initWithArray:title];
        
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, ORDER_H-1, ScreenWidth, 1)];
        line.backgroundColor = KPGrayColor;
        [self addSubview:line];
        
        [self createUI:title];
    }
    
    return self;
}


- (void) createUI:(NSArray *)arr
{
    for (int i=0; i<arr.count; i++) {
        
        CGRect frame = CGRectMake(ORDER_W/arr.count*i, 0, ORDER_W/arr.count, ORDER_H);
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:MM_FONT];
        [button addTarget:self action:@selector(scrollButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    CGSize  size = [KPTool stringCGSize:arr[0] font:M_FONT width:0 height:ORDER_H];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake((ORDER_W/arr.count-size.width*1.2)/2.0, ORDER_H-3, size.width*1.2, 2)];
    self.bottomView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.bottomView];
    
}



- (void) scrollButtonAction:(UIButton *)button
{
    
    
    NSInteger i = button.frame.origin.x/(float)(ScreenWidth/titleArr.count);
    [self scrollAnimation:titleArr :i];
    //self.block(i);
    [self.delegate scrollTitleButtAction:i];
    
}


- (void) scrollAnimation:(NSArray *)arr :(NSInteger)index
{
    CGSize  size = [KPTool stringCGSize:arr[index] font:M_FONT width:0 height:ORDER_H];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomView.frame = CGRectMake((ORDER_W/arr.count-size.width*1.2)/2.0+index*(ORDER_W/titleArr.count), ORDER_H-3, size.width*1.2, 2);
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
