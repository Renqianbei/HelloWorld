//
//  KPGoodsThirdCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodsThirdCell.h"

@implementation KPGoodsThirdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.button.layer.cornerRadius = 4;
    self.button.layer.borderColor = KPGrayColor.CGColor;
    self.button.layer.borderWidth = 1;
    self.button.userInteractionEnabled = NO;
    // Initialization code
    
    UIView * view = [[UIView alloc] initWithFrame:self.button.bounds];
    view.layer.cornerRadius = 4;
    view.backgroundColor = KPYellowColor;
    self.selectedBackgroundView = view;

}
- (IBAction)buttonClick:(id)sender {
    
    
}

@end
