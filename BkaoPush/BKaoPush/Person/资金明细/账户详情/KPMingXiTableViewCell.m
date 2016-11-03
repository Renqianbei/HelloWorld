//
//  KPMingXiTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPMingXiTableViewCell.h"

@implementation KPMingXiTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self dataSoucre];
    }
    return self;
}

-(void)dataSoucre
{
    self.zhangHuLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 6, ScreenWidth/2.0-12, 30)];
    _zhangHuLab.font =SS_FONT;
    [self addSubview:self.zhangHuLab];
    
    self.zongYuELab = [[UILabel alloc] initWithFrame:CGRectMake(12, 35-6, ScreenWidth/2.0-12, 30)];
     self.zongYuELab.font =SS_FONT;
    [self addSubview:self.zongYuELab];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_zhangHuLab.frame), 6, ScreenWidth/2.0-12, 30)];
    self.timeLab.font =SS_FONT;
    self.timeLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.timeLab];
    
    //进账
    self.jinZhangLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_zongYuELab.frame), 35-6, ScreenWidth/2.0-12, 30)];
    self.jinZhangLab.font =SS_FONT;
    self.jinZhangLab.textColor = [UIColor redColor];
    self.jinZhangLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.jinZhangLab];
    
}

-(void)createDataSoucre:(NSDictionary *)dic
{

    self.zhangHuLab.text =@"账户预存";
    self.zongYuELab.text =@"总余额";
    self.timeLab.text    =[NSString stringWithFormat:@"2016.9.9 11:11"];
    self.jinZhangLab.text=[NSString stringWithFormat:@"+1000.00"];

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
