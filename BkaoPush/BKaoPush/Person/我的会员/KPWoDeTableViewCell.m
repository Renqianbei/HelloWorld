//
//  KPWoDeTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWoDeTableViewCell.h"

@implementation KPWoDeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createDateSoucre];
        
    }

    return self;

}
-(void)createDateSoucre
{

    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12,0, 100, 40)];
    self.titleLab.font = SS_FONT;
    [self.contentView addSubview:self.titleLab];
    
    self.contentLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLab.frame)+12, 0, ScreenWidth-100-36, 40)];
    self.contentLab.font = SS_FONT;
    self.contentLab.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:self.contentLab];

}

-(void)creareUI:(NSDictionary *)dic
{
    self.titleLab.text =@"林志玲";
    self.contentLab.text = [NSString stringWithFormat:@"绑定时间: 2015-12-01 11:32"];
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
