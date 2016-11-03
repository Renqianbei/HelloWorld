//
//  KPTopHeader.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPTopHeaderDelegate <NSObject>

- (void) scrollTitleButtAction:(NSInteger)index;

@end

@interface KPTopHeader : UIView



@property (nonatomic, strong) UIView * bottomView;

@property (nonatomic, assign) id<KPTopHeaderDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)title;

- (void) scrollAnimation:(NSInteger)index;



@end
