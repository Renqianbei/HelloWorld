//
//  KPFaPiaoTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoTableViewCell.h"

@implementation KPFaPiaoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    self.titleIMG =[[UIImageView alloc] initWithFrame:CGRectMake(4, 4, 80, 80)];
    
    [self.contentView addSubview:self.titleIMG];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, 0, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.titleLab.font = MM_FONT;
    [self.contentView addSubview:self.titleLab];
    
    self.YanseLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.titleLab.frame)-10, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.YanseLab.font = SS_FONT;
    [self.contentView addSubview:self.YanseLab];
    
    self.miaoShuLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.YanseLab.frame)-10, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.miaoShuLab.font = [UIFont systemFontOfSize:8];
    [self.contentView addSubview:self.miaoShuLab];
    
    self.shouJiaLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.miaoShuLab.frame)-10, (ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24)/2.0, 30)];
    self.shouJiaLab.font = SS_FONT;
    self.shouJiaLab.textColor =[UIColor redColor];
    [self.contentView addSubview:self.shouJiaLab];
    
    
    //库存
    self.kuCunLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.shouJiaLab.frame), CGRectGetMaxY(self.miaoShuLab.frame)-10, (ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24)/2.0, 30)];
    self.kuCunLab.font = SS_FONT;
   
    [self.contentView addSubview:self.kuCunLab];
    
}

-(void)createDataSoucre:(NSDictionary *)dic
{
    self.titleIMG.image = [UIImage imageNamed:@"ceshi.jpeg"];
    self.titleLab.text =@"Apple iPhone 7 Plue (A1524)128GB";
    self.YanseLab.text =@"亮黑";
    self.miaoShuLab.text=@"这是一堆商品描述";
    self.shouJiaLab.text =[NSString stringWithFormat:@"售价: 8888.00"];
    self.kuCunLab.text =[NSString stringWithFormat:@"库存: 890"];
    
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
