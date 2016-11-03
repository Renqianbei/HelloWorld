//
//  KPInvoiceHeader.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPInvoiceHeader.h"

@implementation KPInvoiceHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self =[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}
-(void)createUI
{
    
    UIView  *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 44)];
    bgview.backgroundColor = [UIColor whiteColor];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-24-30, 44)];
    self.titleLab.font = MM_FONT;
    
    [bgview addSubview:self.titleLab];
    
    self.imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame), 5, 30, 30)];
    [self.imageBtn addTarget:self action:@selector(ImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgview addSubview:self.imageBtn];
    
    [self addSubview:bgview];

}

-(void)ImageBtnAction:(UIButton *)btn
{

    [self.delegates KPInvoiceBtnAction:btn];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
