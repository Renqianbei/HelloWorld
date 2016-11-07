//
//  KPAddGoodsEditCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPGoodsCommonButton.h"
#import "KPNewGoodsBaseCell.h"

@interface KPAddGoodsEditCell : KPNewGoodsBaseCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet KPGoodsCommonButton *SetingButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidth;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@end
