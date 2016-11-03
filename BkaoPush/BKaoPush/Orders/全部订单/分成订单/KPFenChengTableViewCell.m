//
//  KPFenChengTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/11/1.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFenChengTableViewCell.h"

@implementation KPFenChengTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    
    UIView *linView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    linView1.backgroundColor =[UIColor colorWithWhite:0.94 alpha:1];
    [self.contentView addSubview:linView1];
    
    self.dizhiLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, CGRectGetMaxY(linView1.frame), ScreenWidth-2*TAP, 30)];
    self.dizhiLab.font =SS_FONT;
    [self.contentView addSubview:self.dizhiLab];
    
    self.shouhuoLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, CGRectGetMaxY(self.dizhiLab.frame), ScreenWidth-2*TAP, 30)];
    self.shouhuoLab.font =SS_FONT;
    [self.contentView addSubview:self.shouhuoLab];
    
    self.jiaoyiLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, CGRectGetMaxY(self.shouhuoLab.frame), ScreenWidth-2*TAP, 30)];
    self.jiaoyiLab.font =SS_FONT;
    [self.contentView addSubview:self.jiaoyiLab];
    
    UIView *linView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.jiaoyiLab.frame), ScreenWidth, 1)];
    linView.backgroundColor =KPGrayColor;
    [self.contentView addSubview:linView];
    
    self.yongjinLab =[[UILabel alloc] initWithFrame:CGRectMake(TAP, CGRectGetMaxY(linView.frame)+6, (ScreenWidth-TAP*3)/2.0, 30)];
    self.yongjinLab.font =MM_FONT;

    [self.contentView addSubview:self.yongjinLab];
    
    
    
    
    self.moneyLab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.yongjinLab.frame)+TAP, CGRectGetMaxY(linView.frame)+6, (ScreenWidth-TAP*3)/2.0, 30)];
    self.moneyLab.font =MM_FONT;
    self.moneyLab.textAlignment =NSTextAlignmentRight;
    self.moneyLab.textColor =[UIColor redColor];
    [self.contentView addSubview:self.moneyLab];
    

    
    self.frame =CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(self.moneyLab.frame)+6);
    
    
}

-(void) createDataSource:(NSDictionary *)dic
{
    
 
        
        self.dizhiLab.text = @"收货地址:    上海市 杨浦区";
        self.shouhuoLab.text = @"收货人:     林志玲";
        self.jiaoyiLab.text = @"交易额:      10002.00元";
        
        self.yongjinLab.text =@"佣金";
        self.moneyLab.text  = @"103.00元";
        
    

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
