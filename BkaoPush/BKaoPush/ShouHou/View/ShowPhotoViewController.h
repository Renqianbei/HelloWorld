//
//  ShowPhotoViewController.h
//  BKaoPush
//
//  Created by njxh on 16/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowPhotoViewController : UIViewController
@property (nonatomic, strong) NSArray *myDataSource; //数据源
@property (nonatomic, assign) NSInteger index;       //计算偏移量
@end
