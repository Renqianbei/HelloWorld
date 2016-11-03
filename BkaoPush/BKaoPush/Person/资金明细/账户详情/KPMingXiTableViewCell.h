//
//  KPMingXiTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPMingXiTableViewCell : UITableViewCell


@property (nonatomic,retain) UILabel  *zhangHuLab;///  账户预存
@property (nonatomic,retain) UILabel  *timeLab;// 日期 时间
@property (nonatomic,retain) UILabel  *zongYuELab;//总余额
@property (nonatomic,retain) UILabel  *jinZhangLab;  //账户变动

-(void)createDataSoucre:(NSDictionary *)dic;
@end
