//
//  OrderHeadView.h
//  KP
//
//  Created by Jincang Lu on 16/9/19.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol orderDelegate <NSObject>

- (void) scrollTitleButtAction:(NSInteger)index;

@end

@interface OrderHeadView : UIView



@property (nonatomic, retain) UIView * bottomView;

@property (nonatomic, assign) id<orderDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)title;

- (void) scrollAnimation:(NSArray *)arr :(NSInteger)index;



@end
