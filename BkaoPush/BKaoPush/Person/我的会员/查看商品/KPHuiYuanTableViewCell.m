//
//  KPHuiYuanTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPHuiYuanTableViewCell.h"

@implementation KPHuiYuanTableViewCell
-(instancetype)initWithFrame:(CGRect)frame
{

    self =[super initWithFrame:frame];
    if (self) {
       // [self createDatasoucre];
    }
    
    return self;

}
-(void)createDatasoucre
{

    self.nameLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth/2-12, 40)];
    self.nameLab.font = SS_FONT;
    
    
    self.nameLab.textAlignment =NSTextAlignmentLeft;
    [self.contentView addSubview:self.nameLab];
    
    self.nameLabtext =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLab.frame), 0, ScreenWidth/2-12, 40)];
    self.nameLabtext.font = SS_FONT;
   
    self.nameLabtext.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:self.nameLabtext];
    
    
    
}
-(void)createUI:(NSDictionary *)dic
{
    self.nameLab.text =dic[@"用户名"];
    
    self.nameLabtext.text =dic[@"用户名参数"];

    
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
