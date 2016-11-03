//
//  KPTopHeader.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//
#define ORDER_W    self.bounds.size.width
#define ORDER_H    self.bounds.size.height

#import "KPTopHeader.h"


@implementation KPTopHeader

{
    NSArray * titleArr;
    NSMutableArray * _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)title
{
    if ([super initWithFrame:frame]) {
        
        titleArr = [[NSArray alloc] initWithArray:title];
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, ORDER_H-1, ScreenWidth, 1)];
        line.backgroundColor = KP_GRAYCOLOR;
        [self addSubview:line];
        
        [self createUI:title];
    }
    
    return self;
}


- (void) createUI:(NSArray *)arr
{
    _buttons = [[NSMutableArray alloc] init];
    for (int i=0; i<arr.count; i++) {
        
        CGRect frame = CGRectMake(ORDER_W/arr.count*i, 0, ORDER_W/arr.count, ORDER_H);
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        
        [button setTitleColor:i==0?KP_RedColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:MM_FONT];
        [button addTarget:self action:@selector(scrollButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:button];
        [self addSubview:button];
    }
    
    CGSize  size = [KPTool stringCGSize:arr[0] font:M_FONT width:0 height:ORDER_H];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake((ORDER_W/arr.count-size.width*1.2)/2.0, ORDER_H-3, size.width*1.2, 2)];
    self.bottomView.backgroundColor = KP_RedColor;
    [self addSubview:self.bottomView];
    
}



- (void) scrollButtonAction:(UIButton *)button
{
 

    NSInteger i = button.frame.origin.x/(float)(ScreenWidth/titleArr.count);
    [self scrollAnimation:i];
    //self.block(i);
    [self.delegate scrollTitleButtAction:i];
    
}


- (void) scrollAnimation:(NSInteger)index
{
    for (UIButton * button in _buttons) {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [_buttons[index] setTitleColor:KP_RedColor forState:UIControlStateNormal];
    
    CGSize  size = [KPTool stringCGSize:titleArr[index] font:M_FONT width:0 height:ORDER_H];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomView.frame = CGRectMake((ORDER_W/titleArr.count-size.width*1.2)/2.0+index*(ORDER_W/titleArr.count), ORDER_H-3, size.width*1.2, 2);
    }];
}



@end
