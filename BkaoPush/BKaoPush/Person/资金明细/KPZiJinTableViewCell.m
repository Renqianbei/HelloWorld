//
//  KPZiJinTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZiJinTableViewCell.h"

@implementation KPZiJinTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createDataSourec];
    }
    return self;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)createDataSourec
{
    self.titleIMV = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 35, 35)];
    [self.contentView addSubview:self.titleIMV];
    
    self.buttonIMV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-12-20, 12+6, 8, 16)];
    [self.contentView addSubview:self.buttonIMV];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth, 35)];
    [nextBtn addTarget:self action:@selector(NextAction:) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.tag = 1488;
    [self.contentView addSubview:nextBtn];
    
    
    self.titleLab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMV.frame)+12, 10, ScreenWidth-150, 30)];
    self.titleLab.font =MM_FONT;
    [self.contentView addSubview:self.titleLab];

}
-(void)createUI:(NSString *)bangzhustr
{
      self.titleIMV.image = [UIImage imageNamed:@"ceshi.jpeg"];
    
      self.buttonIMV.image = [UIImage imageNamed:@"前进.png"];
    
      self.titleLab.text = bangzhustr;
    
    
}
-(void)NextAction:(UIButton *)button
{
    
    [self.delagates KPNextActionBtn:button];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
