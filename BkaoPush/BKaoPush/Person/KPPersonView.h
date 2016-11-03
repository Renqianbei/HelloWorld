//
//  KPPersonView.h
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol KPPersonViewDelegate <NSObject>
//
//
//-(void)KPPersonbuttonClick:(UIButton *)button;
//
//@end

@protocol  KPPersonViewDelegate <NSObject>

-(void)KPPersonbuttonClick:(UIButton *)button;


@end

@interface KPPersonView : UIView

@property(nonatomic, assign)id<KPPersonViewDelegate>delegates;

@property (nonatomic  ,retain) UILabel *titlelab;


-(void)creteDateSoucre:(NSDictionary *)dic;

@end
