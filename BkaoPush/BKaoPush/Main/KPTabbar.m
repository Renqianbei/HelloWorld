//
//  KPTabbar.m
//  KP
//
//  Created by Jincang Lu on 16/8/29.
//  Copyright © 2016年 LuJinCang. All rights reserved.
//

#import "KPTabbar.h"
#import "ShouYeVC.h"
#import "OrdersVC.h"
#import "GoodsVC.h"
#import "ShouHouVC.h"
#import "PersonVC.h"


@interface KPTabbar ()<UITabBarControllerDelegate>

@end

@implementation KPTabbar


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createSystemTabbar];
    
}


+(instancetype)shareTabBarController:(BOOL)reset
{
    
    static KPTabbar * tabbarC = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        tabbarC = [[KPTabbar alloc] init];
//    });
    if (tabbarC==nil||reset==YES) {
        
        tabbarC =[[KPTabbar alloc] init];
    }
    
    return tabbarC;
}



- (void) createSystemTabbar
{
    

     NSArray * array = @[@"ShouYeVC",@"OrdersVC",@"GoodsVC",@"ShouHouVC",@"PersonVC"];
//    NSArray * array = @[@"PersonVC",@"OrdersVC",@"GoodsVC",@"ShouHouVC",@"PersonVC"];
    NSArray * titleArr = [[NSArray alloc] initWithObjects:@"首页",@"订单管理",@"商品管理",@"售后服务",@"个人中心", nil];
    NSArray * imageArr = @[@"Tabbar_首页_未选中",@"Tabbar_订单管理_未选中",@"Tabbar_商品管理_未选中",@"Tabbar_售后服务_未选中",@"Tabbar_我的_未选中"];
    NSArray * seleImageArr = @[@"Tabbar_首页_选中",@"Tabbar_订单管理_选中",@"Tabbar_商品管理_选中",@"Tabbar_售后服务_选中",@"Tabbar_我的_选中"];
    

    NSMutableArray * vcArray = [[NSMutableArray alloc] init];
    
    NSInteger i=0;
    for (NSString * vcName in array) {
    Class vcClass = NSClassFromString(vcName);
        id obj = [[vcClass alloc] init];
    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:obj];
        nvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArr[i] image:[[UIImage imageNamed:imageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:seleImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vcArray addObject:nvc];
   
        i++;
    }
    

    self.viewControllers = vcArray;
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, nil] forState:UIControlStateNormal];

    
    
    
}






//---------------------------------------------------------------------------





-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.navigationController.navigationBarHidden =YES;
    
}







@end
