//
//  KPBangZhuTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPBangZhuTableViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView   *titleIMV;
@property(nonatomic,retain)UILabel       *titleLab;
@property(nonatomic,retain)UIImageView   *buttonIMV;

-(void)createUI:(NSString *)bangzhustr;
@end
