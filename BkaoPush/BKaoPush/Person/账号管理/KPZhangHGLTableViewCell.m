//
//  KPZhangHGLTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZhangHGLTableViewCell.h"

@implementation KPZhangHGLTableViewCell


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
//    self.titleIMV = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 35, 35)];
//    [self.contentView addSubview:self.titleIMV];
//
    self.titleIMV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-12-20, 14, 8, 16)];
    
//    [self.buttonIMV setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-24];
//    [self.buttonIMV addTarget:self action:@selector(NextAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.buttonIMV.tag =10201;
  [self.contentView addSubview:self.titleIMV];
//
    
    self.titleLab =[[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-36-10, 44)];
    self.titleLab.font =MM_FONT;
    [self.contentView addSubview:self.titleLab];
    
}
-(void)createUI:(NSString *)bangzhustr
{
   self.titleIMV.image = [UIImage imageNamed:@"前进.png"];
    
  //  [self.buttonIMV setImage:[UIImage imageNamed:@"前进.png"] forState:UIControlStateNormal];
    
    self.titleLab.text = bangzhustr;
    
    
}

-(void)NextAction:(UIButton *)btn
{
    [self.delegates KPLYNextAction:btn];
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
