//
//  KPNearHotCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPNearHotCell.h"
@interface KPNearHotCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *goodDesp;

@end
@implementation KPNearHotCell

-(void)setModel:(KPGoodSellModel *)model{
    _model = model;
    self.title.text = _model.title;
    NSString * show = [NSString stringWithFormat:@"销售额：       已售：%@",_model.sellCount];
    NSMutableAttributedString * string = [[NSMutableAttributedString  alloc] initWithString:show attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] , NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    [string insertAttributedString:[[NSAttributedString alloc ] initWithString:[NSString stringWithFormat:@"¥%@",_model.price] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] , NSForegroundColorAttributeName : [UIColor redColor]}] atIndex:4];
    
    self.goodDesp.attributedText = string;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.headButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
