//
//  KPFaPiaoTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPFaPiaoTableViewCell : UITableViewCell

@property (nonatomic,retain) UIImageView *titleIMG;
@property (nonatomic,retain) UILabel *titleLab;

@property (nonatomic,retain) UILabel *YanseLab;

@property (nonatomic,retain) UILabel *miaoShuLab;

@property (nonatomic,retain) UILabel *shouJiaLab;

@property (nonatomic,retain) UILabel *kuCunLab;

-(void)createDataSoucre:(NSDictionary *)dic;
@end
