//
//  KPProgress.m
//  KP
//
//  Created by Jincang Lu on 2016/10/12.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//
#define BGVIEW_WIDTH 100.0f

#import "KPProgress.h"

@implementation KPProgress

+(instancetype)shareKPProgress
{
    
    static KPProgress * progress = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        progress = [[KPProgress alloc] init];
    });
 
    return progress;
}


-(instancetype)init
{
    if ([super init]) {
        
        UIWindow *widow =[UIApplication sharedApplication].keyWindow;
        
        self.alphIMV =[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
        self.alphIMV.userInteractionEnabled =YES;
        [widow addSubview:self.alphIMV];
        
        self.bgView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BGVIEW_WIDTH, BGVIEW_WIDTH)];
        self.bgView.userInteractionEnabled =NO;
        self.bgView.center =widow.center;
        [widow addSubview:self.bgView];
        
        self.progress =[[UIImageView alloc] initWithFrame:self.bgView.bounds];
        self.progress.layer.cornerRadius =8;
        self.progress.clipsToBounds      =YES;
        //self.progress.backgroundColor =[UIColor colorWithWhite:0.2 alpha:1.000];
        self.progress.backgroundColor =[UIColor blackColor];
        self.progress.alpha =0.8;
        [self.bgView addSubview:self.progress];
        
        self.aiv = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
        [self.aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.aiv startAnimating];
        [self.bgView addSubview:self.aiv];
        
        self.textLab =[[UILabel alloc] initWithFrame:CGRectMake(0, 60, self.bgView.bounds.size.width, 30)];
        self.textLab.font =[UIFont systemFontOfSize:15];
        self.textLab.textAlignment =NSTextAlignmentCenter;
        self.textLab.textColor =[UIColor whiteColor];
        [self.bgView addSubview:self.textLab];
        
        
    }
    
    return self;
}




+ (void)showLoadingText:(NSString *)text{

    
    
    KPProgress *progressView =[KPProgress shareKPProgress];
    progressView.progressType  =KPProgressTypeLoading;
    progressView.bgView.hidden =NO;
    progressView.textLab.text =text;
    
    progressView.alphIMV.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight);
    
    CGSize size =[KPTool stringCGSize:text font:15 width:0 height:30];
    
    UIWindow *widow =[UIApplication sharedApplication].keyWindow;
    progressView.aiv.hidden =NO;
    progressView.progress.hidden =NO;
    progressView.textLab.hidden  =NO;
    [progressView.aiv startAnimating];
    
    
    float wid = size.width*1.5;
    if (size.width*1.5>100) {
        
        wid =size.width*1.5;
    }
    else{
        
        wid =100;
    }
    
    [progressView.aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    progressView.bgView.frame =CGRectMake(0, 0, wid, 100);
    progressView.bgView.center =widow.center;
    progressView.progress.frame =progressView.bgView.bounds;
    progressView.aiv.frame      =CGRectMake((wid-60)/2.0, 10, 60, 60);
    progressView.textLab.frame  =CGRectMake(0, 60, wid, 30);
    
}

+ (void)showResultText:(NSString *)text{
    
    
    KPProgress *progressView =[KPProgress shareKPProgress];
    progressView.bgView.hidden =NO;
    progressView.textLab.text =text;
    progressView.progressType  =KPProgressTypeResult;
    
    progressView.alphIMV.frame =CGRectMake(ScreenWidth, 64, ScreenWidth, ScreenHeight);

    CGSize size =[KPTool stringCGSize:text font:15 width:0 height:30];
    
    UIWindow *widow =[UIApplication sharedApplication].keyWindow;
    progressView.aiv.hidden =YES;
    progressView.progress.hidden =NO;
    progressView.textLab.hidden  =NO;
    
    float wid = size.width*1.5;
    if (size.width*1.5>100) {
        
        wid =size.width*1.5;
    }
    else{
    
        wid =100;
    }
    
    progressView.bgView.frame =CGRectMake(0, 0, wid, 50);
    progressView.bgView.center =widow.center;
    progressView.progress.frame =progressView.bgView.bounds;
    progressView.textLab.frame  =CGRectMake(0, 0, wid, 50);
    
    
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
 
         KPProgress *progressView =[KPProgress shareKPProgress];
         [progressView.aiv stopAnimating];
         progressView.bgView.hidden =YES;
         
     });
    
    
}


+ (void)showRefresh{
    
    
    KPProgress *progressView =[KPProgress shareKPProgress];
    progressView.bgView.hidden =NO;

    progressView.progressType  =KPProgressTypeRefresh;
    
    progressView.alphIMV.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight);
    
    UIWindow *widow =[UIApplication sharedApplication].keyWindow;
    progressView.aiv.hidden =NO;
    progressView.progress.hidden =YES;
    progressView.textLab.hidden  =YES;
    [progressView.aiv startAnimating];
    
    [progressView.aiv setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    progressView.bgView.frame =CGRectMake(0, 0, 50, 50);
    progressView.bgView.center =widow.center;
    progressView.aiv.frame     =CGRectMake(0, 0, 50, 50);
    
}



+ (void)hidle
{
    KPProgress *progressView =[KPProgress shareKPProgress];
    if (progressView.progressType ==KPProgressTypeLoading||progressView.progressType ==KPProgressTypeRefresh) {
        
        [progressView.aiv stopAnimating];
        progressView.bgView.hidden =YES;
    }
    
    progressView.alphIMV.frame =CGRectMake(ScreenWidth, 64, ScreenWidth, ScreenHeight);
}


+ (void) KPProgressUseEnable:(BOOL)enble
{
    KPProgress *progressView =[KPProgress shareKPProgress];
    if (enble) {
        progressView.alphIMV.frame =CGRectMake(ScreenWidth, 64, ScreenWidth, ScreenHeight);
    }
    else{
        progressView.alphIMV.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight);
    }
    
}


@end
