//
//  KPGoodsShowCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodsShowCell.h"

@implementation KPGoodsShowCell
-(void)setCellType:(CellType)type{
    switch (type) {
        case Selling:
            [self.leftButton setTitle:@"下架" forState:UIControlStateNormal];
            break;
        case HasDone:
            [self.leftButton setTitle:@"上架架" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

-(void)setModel:(KPGoodSellModel *)model{
    _model = model;
    self.titleName.text = _model.title;
    self.goodDescrip.text = _model.goodDescrip;
    self.price.text = [NSString stringWithFormat:@"售价: %@",_model.price];
    self.totalCount.text = [NSString stringWithFormat:@"库存: %@",_model.totalCount];
    self.sellTotalPrice.text =  [NSString stringWithFormat:@"销售额: %@",_model.sellTotalPrice];
    self.sellCount.text =  [NSString stringWithFormat:@"已售: %@",_model.sellCount];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.leftButton.layer.cornerRadius = self.leftButton.frame.size.height/2;
    self.leftButton.layer.masksToBounds = YES;
    self.rightButton.layer.cornerRadius = self.rightButton.frame.size.height/2;
    self.rightButton.layer.masksToBounds = YES;

    // Initialization code
}
- (IBAction)clickButton:(UIButton *)sender {
    if (self.clickBlock) {
        self.clickBlock(sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
