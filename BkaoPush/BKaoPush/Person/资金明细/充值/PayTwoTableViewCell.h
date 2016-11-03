//
//  PayTwoTableViewCell.h
//  KP
//
//  Created by Jincang Lu on 16/9/19.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayTwoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoIMV;
@property (weak, nonatomic) IBOutlet UIButton *seleBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;


- (void) prepareUI:(NSString *)title :(NSString *) detail;

@end
