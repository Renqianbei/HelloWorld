//
//  ShouYeVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouYeVC.h"

#import "KPBangZhuViewController.h"

@interface ShouYeVC ()

@end

@implementation ShouYeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


- (void)leftBarButtonItemAction
{
    NSLog(@"进入易销接口");
}

-(void)rightBarButtonItemAction
{
    NSLog(@"营业状态改变");
    self.rightButton.enabled =NO;
    [self yingYeType:self.rightButton.selected?0:1];
}



//修改一下基类的  navBar  状态
- (void) prepareBarButton{
    
    [self setMyTitle:@"靠铺商家版"];
    [self createMainLeftBarButtonItem];
//    休息中  营业中
    [self createRightBarButtonItem:RightItemTypeImage text:@"休息中"];
    [self.rightButton setImage:IMAGE(@"营业中") forState:UIControlStateSelected];
    
    //判断  营业状态
    NSDictionary *dict =[KPTool userInfo];
    NSDictionary *shopBean =dict[@"shopBean"];
    if (KP_STATUS(shopBean[@"status"])==1) {
        self.rightButton.selected =YES;
    }
    else{
        self.rightButton.selected =NO;
    }
        
    
    
    
    [self.leftButton setImage:IMAGE(@"易销入口") forState:UIControlStateNormal];
    self.leftButton.frame =CGRectMake(0, 0, 30, 30);
    self.rightButton.frame =CGRectMake(0, 0, 60, 30);
    
    [self.rightButton setTitle:@"休息中" forState:UIControlStateNormal];
    [self.rightButton setTitle:@"营业中" forState:UIControlStateSelected];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font =[UIFont systemFontOfSize:12];

    self.rightButton.imageEdgeInsets = UIEdgeInsetsMake( -10,25,10,5);
    self.rightButton.titleEdgeInsets = UIEdgeInsetsMake( 10,-50,-10,-10);
    
    
}



#pragma mark 设置营业状态的

- (void) yingYeType:(NSInteger)type{

    NSDictionary *dict =[KPTool userInfo];
    NSDictionary *shopBean =dict[@"shopBean"];
    [KPProgress showRefresh];
    NSString *path =[NSString stringWithFormat:SY_TIME_URL,ROOT_URL,KP_STRING(shopBean[@"id"]),type,[KPTool Token],[KPTool UUID]];
    [KPDownload downloadDataWithType:KPDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        
        [KPProgress hidle];
        self.rightButton.enabled =YES;
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        switch (KP_STATUS(dict[@"status"])) {
            case 0:
            {[KPProgress showResultText:dict[@"error"]];
            }break;
            case 1:
            {
                self.rightButton.selected =!self.rightButton.selected;
                NSMutableDictionary *muDic =[[NSMutableDictionary alloc] initWithDictionary:[KPTool userInfo]];
                NSMutableDictionary *muDicc =[[NSMutableDictionary alloc] initWithDictionary:muDic[@"shopBean"]];
                [muDicc setObject:[NSString stringWithFormat:@"%ld",type] forKey:@"status"];
                [muDic setObject:muDicc forKey:@"shopBean"];
                [KPTool writeUserinfo:muDic];
                
                [self navBarStatus:self.rightButton.selected];
                
            }break;
            case 9:
            {[self presentLogin];
            }break;
            default:
                break;
        }
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDictionary *dict =[KPTool userInfo];
    NSDictionary *shopBean =dict[@"shopBean"];

    [self navBarStatus:KP_STATUS(shopBean[@"status"])];
    

    KPTabbar *tabbar =[KPTabbar shareTabBarController:NO];
    tabbar.tabBar.hidden =NO;
    
    [self prepareBarButton];

}


- (void) navBarStatus:(NSInteger)status{

    NSLog(@"-->%ld",status);
    
    if (status==1) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headNav"] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.translucent = YES;
    }
    else{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headNav_Gray"] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.translucent = YES;
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
