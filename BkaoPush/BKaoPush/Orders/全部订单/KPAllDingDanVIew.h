//
//  KPAllDingDanVIew.h
//  BKaoPush
//
//  Created by LY on 16/11/2.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol KPAllDingDanDelegate <NSObject>

- (void) scrollTitleButtAction:(NSInteger)index;

@end

@interface KPAllDingDanVIew : UIView





@property (nonatomic, assign) id<KPAllDingDanDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame WithTitleArr:(NSArray *)titles;

- (void) ScrollAnimation:(NSArray *)arr :(NSInteger)index;



@end
