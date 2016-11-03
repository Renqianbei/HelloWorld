//
//  KPFaPiaoSheDingTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPLYFaPiaoSheDingActiondelegate <NSObject>

-(void)KPLYFaPiaoSheDingAction:(UIButton *)button;

@end

@interface KPFaPiaoSheDingTableViewCell : UITableViewCell

@property (nonatomic ,assign)id<KPLYFaPiaoSheDingActiondelegate>delegates;
@property (nonatomic,retain) UIImageView *titleIMG;
@property (nonatomic,retain) UILabel *titleLab;

@property (nonatomic,retain) UILabel *YanseLab;

@property (nonatomic,retain) UILabel *miaoShuLab;

@property (nonatomic,retain) UILabel *shouJiaLab;

@property (nonatomic,retain) UILabel *kuCunLab;

@property (nonatomic ,retain) UIButton *faPiaoBtn;

-(void)createDataSoucre:(NSDictionary *)dic NSindexPath:(NSIndexPath *)indexPath iSselect:(BOOL)isSelect;
@end
