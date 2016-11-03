//
//  PayTwoTableViewCell.m
//  KP
//
//  Created by Jincang Lu on 16/9/19.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import "PayTwoTableViewCell.h"

@implementation PayTwoTableViewCell


- (void) prepareUI:(NSString *)title :(NSString *) detail
{
    self.titleLab.font = [KPTool systemFontS:M_FONT];
    self.detailLab.font = [KPTool systemFontS:S_FONT];
    self.titleLab.text = title;
    self.detailLab.text = detail;
    self.logoIMV.image = [UIImage imageNamed:title];
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
