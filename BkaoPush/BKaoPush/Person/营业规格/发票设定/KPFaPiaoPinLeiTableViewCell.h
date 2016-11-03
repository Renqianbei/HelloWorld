//
//  KPFaPiaoPinLeiTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/27.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPFaPiaoPinLeiActionDelegate <NSObject>

-(void)KPFaPiaoPinLeiAction:(UIButton *)button;

@end

@interface KPFaPiaoPinLeiTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel   *titlePinLeiLab;//

@property (nonatomic, retain) UIButton  *pinLeiBtn; //选中按钮

@property (nonatomic, assign) id<KPFaPiaoPinLeiActionDelegate>delegates;

-(void)createDateSoucre:(NSDictionary *)dic: (NSIndexPath *) indexPath isSelect:(BOOL)isSelect;

@end
