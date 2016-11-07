//
//  KPNewGoodsView.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPSelectModel.h"

@protocol NewGoodsSelectDelegate<NSObject>

-(void)didClickCollectionItemWithModel:(KPSelectModel*)model;
@end

@interface KPNewGoodsView : UIView
@property(nonatomic,weak)id<NewGoodsSelectDelegate>delegate;
+(instancetype)NewGoodsViewWithDelegate:(id<NewGoodsSelectDelegate>)delegate;


@end
