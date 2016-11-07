//
//  KPAddGoodsEditCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddGoodsEditCell.h"

@implementation KPAddGoodsEditCell
-(void)setModel:(KPNewGoodsCellTypeModel *)model{
    
    [super setModel: model];
    self.buttonWidth.constant = model.showButton?70:0;
    self.title.text = model.title;
    self.contentTextField.text = model.content;
    self.contentTextField.placeholder = model.placeHolder;
    self.contentTextField.keyboardType = model.keyboardType;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification object:self.contentTextField];
}

- (void)textFieldChange{
    self.model.content = self.contentTextField.text;
    if ([self.delegate respondsToSelector:@selector(editCelltextHasChanged)]) {
        [self.delegate editCelltextHasChanged];
    }
}

- (IBAction)clickButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(clickFenbieSheZhi)]) {
        [self.delegate clickFenbieSheZhi];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.SetingButton configureSetings];
    self.SetingButton.selected = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
