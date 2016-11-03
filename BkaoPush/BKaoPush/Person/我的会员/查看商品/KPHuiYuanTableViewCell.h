//
//  KPHuiYuanTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPHuiYuanTableViewCell : UITableViewCell

@property(nonatomic,retain)UILabel   *nameLab;
@property(nonatomic,retain)UILabel   *timeLab;
@property(nonatomic,retain)UILabel   *lastLab;//最后消费
@property(nonatomic,retain)UILabel   *xiaoFeiLab;
@property(nonatomic,retain)UILabel   *jinELab;//总消费金额
@property(nonatomic,retain)UILabel   *fangShiLab;//

@property(nonatomic,retain)UILabel   *nameLabtext;
@property(nonatomic,retain)UILabel   *timeLabtext;
@property(nonatomic,retain)UILabel   *lastLabtext;//最后消费
@property(nonatomic,retain)UILabel   *xiaoFeiLabtext;
@property(nonatomic,retain)UILabel   *jinELabtext;//总消费金额
@property(nonatomic,retain)UILabel   *fangShiLabtext;//
-(void)createDatasoucre;
-(void)createUI:(NSDictionary *)dic;

@end
