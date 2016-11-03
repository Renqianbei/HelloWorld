//
//  KPZhuYingTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  KPZhuYingGuiGeDelegate <NSObject>

-(void)KPZhuYingGuiGeClick:(UIButton *)button;


@end

@interface KPZhuYingTableViewCell : UITableViewCell

@property (nonatomic,retain)UILabel  *fenLeiLab;
@property (nonatomic,retain)UIButton *feiLeiBtn;

@property(nonatomic,assign)id<KPZhuYingGuiGeDelegate>delegates;

-(void)createUI:(NSDictionary *)dict Nsindex:(NSIndexPath *)indexPath iSelect:(BOOL)isSelect;

@end
