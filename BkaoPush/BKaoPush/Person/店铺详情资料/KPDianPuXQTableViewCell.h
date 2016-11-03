//
//  KPDianPuXQTableViewCell.h
//  BKaoPush
//
//  Created by LY on 16/10/22.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPDianPuXQTableViewCell : UITableViewCell

-(void)creatrui:(NSDictionary *)dic NSindexPath :(NSIndexPath *)indexPath;
@property(nonatomic,retain)UILabel  *titelLab1;
@property(nonatomic,retain)UILabel *titleLab2;

@property (nonatomic ,retain) UIImageView  *zhengMinIMG;

@property (nonatomic ,retain) UILabel      *zhengMinLab;
@end
