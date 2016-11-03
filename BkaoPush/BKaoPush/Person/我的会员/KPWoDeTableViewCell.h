//
//  KPWoDeTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPWoDeTableViewCell : UITableViewCell

@property(nonatomic,retain) UILabel *titleLab;//会员信息  姓名
@property(nonatomic,retain) UILabel *contentLab;// 绑定时间内容
-(void)creareUI:(NSDictionary *)dic;

@end
