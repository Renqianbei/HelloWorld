//
//  KPJinZhangXQTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPJinZhangXQTableViewCell.h"

@implementation KPJinZhangXQTableViewCell
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
    
    self.nameLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, 100, 30)];
    self.nameLab.font = SS_FONT;
    
    
    self.nameLab.textAlignment =NSTextAlignmentLeft;
    [self.contentView addSubview:self.nameLab];
    
    
    //加载数据 把Frame 改了
    
    self.nameLabtext =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLab.frame), 0, ScreenWidth-100-24, 30)];
    self.nameLabtext.font = SS_FONT;
    self.nameLabtext.numberOfLines=0;
    self.nameLabtext.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:self.nameLabtext];
    
    
    
}
-(void)createUI:(NSDictionary *)dic
{
    self.nameLab.text =dic[@"用户名"];
    NSString *str=[NSString stringWithFormat:@"%@",dic];
    CGSize size =[KPTool stringCGSize:str font:S_FONT width:ScreenWidth-100-24 height:0];
//    /WithFrame:
    self.nameLabtext.frame =CGRectMake(CGRectGetMaxX(self.nameLab.frame), 0, ScreenWidth-100-24, size.height);
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
