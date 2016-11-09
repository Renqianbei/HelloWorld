//
//  KPNameCountPriceEditCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/8.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPEditNameCountPriceModel.h"
@interface KPNameCountPriceEditCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *deleteViewHeight;
@property(nonatomic,strong)KPEditNameCountPriceModel * model;
@property(nonatomic,strong)void(^clickHander)();
@end
