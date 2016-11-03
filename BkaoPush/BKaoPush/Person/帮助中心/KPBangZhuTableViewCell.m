//
//  KPBangZhuTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBangZhuTableViewCell.h"

@implementation KPBangZhuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createDataSourec];
    }
    return self;
    
}

-(void)createDataSourec
{
    self.titleIMV = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 31, 31)];
    [self.contentView addSubview:self.titleIMV];
    
    self.buttonIMV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-12-20, 12+6, 8, 16)];
    [self.contentView addSubview:self.buttonIMV];
    
    
    self.titleLab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMV.frame)+12, 12, ScreenWidth-150, 30)];
    self.titleLab.font =MM_FONT;
    [self.contentView addSubview:self.titleLab];
    
}
-(void)createUI:(NSString *)bangzhustr
{
    self.titleIMV.image = [UIImage imageNamed:@"ceshi.jpeg"];
    
    self.buttonIMV.image = [UIImage imageNamed:@"前进.png"];
    
    self.titleLab.text = bangzhustr;
    
    
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
