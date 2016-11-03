//
//  UIButton+EnlargeEdge.h
//  KP
//
//  Created by Jincang Lu on 16/9/20.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (EnlargeEdge)

//@property (nonatomic, copy) NSIndexPath *kpIndexPath;

- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setKpIndexPath:(NSIndexPath *)kpIndexPath;
- (NSIndexPath *)kpIndexPath;

- (void)setKpFlag:(NSInteger) flag;
- (NSInteger)kpFlag;


@end
