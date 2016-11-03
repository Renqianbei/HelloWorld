//
//  AppDelegate+RootController.m
//  BKaoPush
//
//  Created by Jincang Lu on 2016/10/22.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "KPLoginVC.h"

@interface AppDelegate ()<UIScrollViewDelegate,KPLoginDelegate>

@end

@implementation AppDelegate (RootController)


- (void)setAppWindows{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
}




- (void)setRootViewController
{
    if ([KPUserDefault objectForKey:@"isOne"])
    {//不是第一次安装
        [self checkBlack];
        [self setLoginController];
        
    }
    else
    {
        UIViewController *emptyView = [[ UIViewController alloc ]init ];
        self. window .rootViewController = emptyView;
        //创建滚动图
        [self createLoadingScrollView];
    }
}

    

//主控制器
- (void) setRootController{
    
    KPTabbar * tabbar = [KPTabbar shareTabBarController:NO];
    
    UINavigationController * baseNVC = [[UINavigationController alloc] initWithRootViewController:tabbar];
    self.window.rootViewController = baseNVC;
    
    
}


//判断需不需要登录
- (void) setLoginController{

    NSDictionary *dict =[KPTool userInfo];
    
    if (1) {
        
        [self setRootController];
    }
    else{
        
        KPLoginVC *login =[[KPLoginVC alloc] init];
        login.delegate =self;
        UINavigationController *nvc =[[UINavigationController alloc] initWithRootViewController:login];
        self.window.rootViewController = nvc;
    }
}



- (void)KPLoginBAction{

    [self setRootController];
}


-(void) checkBlack{
    
}




#pragma mark - 引导页
- (void)createLoadingScrollView
{//引导页
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:self.window.bounds];
    sc.pagingEnabled = YES;
    sc.delegate = self;
    sc.showsHorizontalScrollIndicator = NO;
    sc.showsVerticalScrollIndicator = NO;
    [self.window.rootViewController.view addSubview:sc];
    
    NSArray *arr = @[@"ceshi.jpeg",@"ceshi2.jpeg",@"ceshi.jpeg",@"ceshi2.jpeg"];
    for (NSInteger i = 0; i<arr.count; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, self.window.frame.size.height)];
        img.image = [UIImage imageNamed:arr[i]];
        [sc addSubview:img];
        img.userInteractionEnabled = YES;
        if (i == arr.count - 1)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake((self.window.frame.size.width/2)-50, ScreenHeight-110, 100, 40);
            btn.backgroundColor = KPYellowColor;
            [btn setTitle:@"开始体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:btn];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [UIColor blackColor].CGColor;
        }
    }
    sc.contentSize = CGSizeMake(ScreenWidth*arr.count, self.window.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x>ScreenWidth *4+30)
    {
        [self goToMain];
    }
}

- (void)goToMain
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:@"isOne" forKey:@"isOne"];
    [user synchronize];
    [self setLoginController];
}





@end
