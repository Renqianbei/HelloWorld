//
//  KPProgress.h
//  KP
//
//  Created by Jincang Lu on 2016/10/12.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,KPProgressType) {
    KPProgressTypeLoading,
    KPProgressTypeResult,
    KPProgressTypeRefresh
};

@interface KPProgress : UIView

@property (nonatomic, retain) UIImageView *bgView;

@property (nonatomic, retain) UIImageView *progress;

@property (nonatomic, retain) UIActivityIndicatorView * aiv;

@property (nonatomic, retain) UILabel     *textLab;

@property (nonatomic, assign) KPProgressType progressType;

@property (nonatomic, assign) BOOL        KPProgressHidle;

@property (nonatomic, retain) UIImageView  *alphIMV;


+(id)shareKPProgress;



//[KPProgress showLoadingText:@"正在加载"];
+ (void)showLoadingText:(NSString *)text;


//[KPProgress showResultText:@"加载成功"];
+ (void)showResultText:(NSString *)text;

//[KPProgress showRefresh];
+ (void)showRefresh;

//隐藏progress  Loading需要  result不需要
+ (void)hidle;


+ (void) KPProgressUseEnable:(BOOL)enble;

@end
