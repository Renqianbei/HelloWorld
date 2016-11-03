//
//  KPErWeiMaView.h
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPErWeiMaDelegate <NSObject>

- (void) closeView:(UIButton *)button;

@end

@interface KPErWeiMaView : UIView

- (instancetype)initWithFrame:(CGRect)frame info:(NSString *)info;
//代理关闭窗口
@property (nonatomic, assign) id<KPErWeiMaDelegate> delegate;


@property (nonatomic, retain) UIButton *closeBtn;

@end
