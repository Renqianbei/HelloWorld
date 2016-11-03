//
//  TopScrollView.m
//  BKaoPush
//
//  Created by njxh on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//
#define TopViewHeight 44
#import "TopScrollView.h"
#import "SHWaitProcessController.h"
#import "SHProcessingController.h"
#import "SHIssueInterposeController.h"
#import "SHAllAfterSaleController.h"

@implementation TopScrollView
{
    UIView       *_topView;      //界面顶部含有四个按钮的View
    UIScrollView *_myScrollView; //界面下方的scrollView
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self createCustomUI];
    }
    return self;
}

- (void)createCustomUI
{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopViewHeight)];
    [self addSubview:_topView];
    NSArray *titleArray = @[@"待处理", @"处理中", @"纠纷介入", @"全部售后"];
    for (NSInteger i = 0; i < 4; i++) {
        CGFloat btnWidth = ScreenWidth/4;
        UIButton *myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        myBtn.frame = CGRectMake(btnWidth*i, 0, btnWidth, TopViewHeight);
        [myBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        myBtn.titleLabel.font =LL_FONT;
        [myBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [myBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [myBtn addTarget:self action:@selector(seleteCurrentButton:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            myBtn.selected = YES;
        }
        else {
            myBtn.selected = NO;
        }
        myBtn.tag = i + 100;
        [_topView addSubview:myBtn];
    }
    
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopViewHeight, ScreenWidth, ScreenHeight - 64 - TopViewHeight - 49)];
    [self addSubview:_myScrollView];
    _myScrollView.contentSize = CGSizeMake(ScreenWidth * 4, ScreenHeight - 64 - TopViewHeight - 49);
    _myScrollView.bounces = NO;
//    _myScrollView.pagingEnabled = YES;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.scrollEnabled = NO;
    SHWaitProcessController *waitVc = [[SHWaitProcessController alloc] init];
    SHProcessingController  *processingVc = [[SHProcessingController alloc] init];
    SHIssueInterposeController *issueVc = [[SHIssueInterposeController alloc] init];
    SHAllAfterSaleController *allVc = [[SHAllAfterSaleController alloc] init];
    
    waitVc.view.frame = CGRectMake(0, 0, ScreenWidth, _myScrollView.frame.size.height);
    processingVc.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, _myScrollView.frame.size.height);
    issueVc.view.frame = CGRectMake(ScreenWidth * 2, 0, ScreenWidth, _myScrollView.frame.size.height);
    allVc.view.frame = CGRectMake(ScreenWidth * 3, 0, ScreenWidth, _myScrollView.frame.size.height);
    
    [_myScrollView addSubview:waitVc.view];
    [_myScrollView addSubview:processingVc.view];
    [_myScrollView addSubview:issueVc.view];
    [_myScrollView addSubview:allVc.view];
    
    [[self getCurrentVC] addChildViewController:waitVc];
    [[self getCurrentVC] addChildViewController:processingVc];
    [[self getCurrentVC] addChildViewController:issueVc];
    [[self getCurrentVC] addChildViewController:allVc];
}
- (void)seleteCurrentButton:(UIButton *)btn
{
    _myScrollView.contentOffset = CGPointMake(ScreenWidth * (btn.tag - 100), 0);
    btn.selected = YES;
    for (NSInteger j = 0; j < 4; j++) {
        if (btn.tag - 100 == j) {
            
        }
        else {
            UIButton *customBtn = (UIButton *)[self viewWithTag:j+100];
            customBtn.selected = NO;
        }
    }
}
- (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
    result = nextResponder;
    else
    result = window.rootViewController;
    
    return result;
}

@end
