//
//  KPZhangHGLTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/21.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPLYNextActiondelagate <NSObject>

-(void)KPLYNextAction:(UIButton *)button;

@end


@interface KPZhangHGLTableViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView   *titleIMV;
@property(nonatomic,retain)UILabel       *titleLab;
@property(nonatomic,retain)UIButton   *buttonIMV;

@property (nonatomic ,assign)id<KPLYNextActiondelagate>delegates;
-(void)createUI:(NSString *)bangzhustr;
@end
