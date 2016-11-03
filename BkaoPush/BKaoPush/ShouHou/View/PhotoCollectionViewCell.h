//
//  PhotoCollectionViewCell.h
//  BKaoPush
//
//  Created by njxh on 16/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *photoImageView;  //图片
@property (nonatomic, strong) UILabel     *indexLabel;      //顺序
@end
