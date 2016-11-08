//
//  KPNameCountPriceEditCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/8.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPNameCountPriceEditCell.h"

@implementation KPNameCountPriceEditCell
-(void)setModel:(KPEditNameCountPriceModel *)model{
   
    _model = model;
    self.title.text = _model.name;
    self.countTextField.text = _model.count;
    self.priceTextField.text = _model.price;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.countTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;

    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];//文字发生改变时
    // Initialization code
}

-(void)textFieldChange:(NSNotification * )notification{
    
    //文字发生改变时 修改模型对应的值
    if (notification.object == self.countTextField) {
        self.model.count = self.countTextField.text;
    }
    if (notification.object == self.priceTextField) {
        self.model.price = self.priceTextField.text;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
