//
//  PhotoCollectionViewCell.m
//  BKaoPush
//
//  Created by njxh on 16/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];
        
        _photoImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_photoImageView];
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _indexLabel.font = [UIFont systemFontOfSize:40];
        _indexLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_indexLabel];
        
    }
    return self;
}
@end
