//
//  KPAddGoodsSelectCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPNewGoodsBaseCell.h"

@interface KPAddGoodsSelectCell : KPNewGoodsBaseCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ToTopConstrant;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toBottomConstrant;

@end
