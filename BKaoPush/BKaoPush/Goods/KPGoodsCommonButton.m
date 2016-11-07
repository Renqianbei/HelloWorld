//
//  KPGoodsCommonButton.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodsCommonButton.h"
#import "UIImage+KPColorToImage.h"
@implementation KPGoodsCommonButton

-(void)configureSetings{

        self.layer.cornerRadius = 4;
        self.clipsToBounds = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:KPYellowColor] forState:UIControlStateSelected];

}


/*
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
