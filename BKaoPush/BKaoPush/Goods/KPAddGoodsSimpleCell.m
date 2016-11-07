//
//  KPAddGoodsSimpleCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddGoodsSimpleCell.h"

@implementation KPAddGoodsSimpleCell

-(void)setModel:(KPNewGoodsCellTypeModel *)model{
    [super setModel:model];
    self.title.text = model.title;
    self.content.text = model.content;
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
