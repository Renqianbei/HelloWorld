//
//  KPZiJinHeaderView.h
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPRecgargeBtnActiondelegate <NSObject>

-(void)KPRecgargeBtnAction:(UIButton *)btn;

@end
@interface KPZiJinHeaderView : UIView

@property (nonatomic,assign)id<KPRecgargeBtnActiondelegate>delagates;
-(void) CreateUI :(NSDictionary *)dic;

@end
