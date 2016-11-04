//
//  KPNearHotCell.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPGoodSellModel.h"
@interface KPNearHotCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headButton;

@property(nonatomic,strong)KPGoodSellModel * model;
@end
