//
//  UIImage+KPColorToImage.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "UIImage+KPColorToImage.h"

@implementation UIImage (KPColorToImage)

+(UIImage *)imageWithColor:(UIColor *)color{
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context
                      , CGRectMake(0, 0, 1, 1));
    CGContextFillPath(context);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}
@end
