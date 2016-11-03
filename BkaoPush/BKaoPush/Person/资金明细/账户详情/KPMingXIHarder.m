//
//  KPMingXIHarder.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPMingXIHarder.h"

@implementation KPMingXIHarder

-(instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUi];
    }
    return self;
}

-(void)createUi
{
    
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    bgview.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    [self addSubview:bgview];
    
    UILabel * tetleLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth/2.0-24, 30)];
    tetleLab.text =@"2016/2";
    //tetleLab.textColor =[UIColor redColor];
    tetleLab.font =SS_FONT;
    [bgview addSubview:tetleLab];
    
    //self.frame =CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(tetleLab.frame));
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
