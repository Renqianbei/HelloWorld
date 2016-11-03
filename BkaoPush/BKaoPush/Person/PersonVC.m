//
//  PersonVC.m
//  KaoPushB
//
//  Created by Jincang Lu on 2016/10/18.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "PersonVC.h"
#import "KPDistributionViewController.h"
#import "KPYingYeViewController.h"
#import "KPFenXiangViewController.h"
#import "KPDianPuViewController.h"
#import "KPXinYongViewController.h"
#import "KPZhangHaoViewController.h"
#import "KPPersonView.h"
#import "KPWoDeViewController.h"
#import "KPZiJinViewController.h"
#import "KPDianPuxiangqingViewController.h"
#import "KPBangZhuViewController.h"
#import "KPKeFuViewController.h"
#import "KPZiJinViewController.h"
#import "KPDianPuxiangqingViewController.h"
#import "KPErWeiMaView.h"
//#import "QRCodeGenerator.h"
//#import "ZBarSDK.h"




@interface PersonVC ()<UIScrollViewDelegate,KPPersonViewDelegate,KPErWeiMaDelegate>
{

    NSMutableArray *datasoucre;
    UIScrollView   *shouyeScroollview;
    
    KPPersonView * kpView;
    UIView         *bgView;
    KPErWeiMaView *erWeiView;
}

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
 
    NSDictionary *dict =[KPTool PersonInfo:PERSON_INFO];
    
    if (dict) {
        NSLog(@"这是缓存数据%@",dict);
        [kpView creteDateSoucre:dict];
        
//        [self dataSource];
    }
    else{
        NSLog(@"加载数据");
    [self dataSource];
    }
//    [self.rootTableView reloadData];

    
   [self dataSource];
    [self createUI];
}

- (void)leftBarButtonItemAction
{
    NSLog(@"进入易销接口");
}


-(void)rightBarButtonItemAction
{
    NSLog(@"营业状态改变");
}


//修改一下基类的  navBar  状态
- (void) prepareBarButton{
    
    [self setMyTitle:@"个人中心"];
    [self createMainLeftBarButtonItem];
    [self createRightBarButtonItem:RightItemTypeTxt text:@"营业中"];
    
    CGSize size =[KPTool stringCGSize:@"进入" font:13 width:0 height:44];
    self.leftButton.frame =CGRectMake(0, 0, size.width, 44);
    self.leftButton.titleLabel.numberOfLines =0;
    self.leftButton.titleLabel.font =[UIFont systemFontOfSize:13];
    [self.leftButton setTitle:@"进入易销" forState:UIControlStateNormal];
    
    self.rightButton.layer.cornerRadius =5;
    self.rightButton.clipsToBounds =YES;
    self.rightButton.layer.borderWidth =1;
    
}

- (void) createUI
{

    [self createRootTableView:NO];
    
    datasoucre = [[NSMutableArray alloc] init];
    kpView = [[KPPersonView alloc] init];
    kpView.delegates =self;
  
    self.rootTableView.tableHeaderView =kpView;

    self.rootTableView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49);
    self.rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(void)dataSource
{
    
    NSDictionary *dict =[KPTool userInfo];
    NSDictionary *dicc =dict[@"shopBean"];
    
    NSString *path =[NSString stringWithFormat:PERSON_URL,ROOT_URL,KP_STRING(dicc[@"userId"]),[KPTool Token],[KPTool UUID]];
   
    
    [KPDownload downloadDataWithType:KPDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        switch (KP_STATUS(dict[@"status"])) {
            case 0://错误
            {
                [KPProgress showResultText:dict[@"error"]];
            }break;
            case 1://正确
            {
                NSDictionary *dic =dict[@"data"];
                
                //往本地 存储一次 网络数据
                [KPTool writePersonInfo:dic filePath:PERSON_INFO];
                
                NSLog(@"这是网络加载数据");
                
                [kpView creteDateSoucre:dic];
                
          
            
                
                [self.rootTableView reloadData];
            }break;
            case 9://重新登录
            {
                [self presentLogin];
            }break;
            default://其他
            {
            }break;
        }
        
        
        
    } fail:^(NSError *error) {
        
    }];
    

}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KPTool length:20.0];
}

#pragma make 按钮响应集合
-(void)KPPersonbuttonClick:(UIButton *)button
{
    
   //@[@"店铺公告",@"营业规则",@"配送管理",@"我的会员",@"账号管理",@"关注二维码",@"帮助中心",@"联系客服"]
    
    switch (button.tag) {

        case 1177:
        {
         //店铺公告
            KPDianPuViewController *dianpu =[[KPDianPuViewController alloc] init];
            [self.navigationController pushViewController:dianpu animated:YES];
            
        
        }
            break;
        case 1178:
        {
            //营业规则
            KPYingYeViewController *yingye = [[KPYingYeViewController alloc] init];
            [self.navigationController pushViewController:yingye animated:YES];
            
            
        }
            break;
        case 1179:
        {
            //配送管理
            KPDistributionViewController *dis = [[KPDistributionViewController alloc] init];
            [self.navigationController pushViewController:dis animated:YES];

            
            
        }
            break;
        case 1180:
        {
            //我的会员
            KPWoDeViewController *wode =[[KPWoDeViewController alloc] init];
            [self.navigationController pushViewController:wode animated:YES];
            
//            KPFenXiangViewController *fenxiang = [[KPFenXiangViewController alloc]init];
//               [self.navigationController pushViewController:fenxiang animated:YES];
            
        }
            break;
        case 1181:
        {
            //账号管理
            KPZhangHaoViewController *zhanghao =[[KPZhangHaoViewController alloc] init];
            [self.navigationController pushViewController:zhanghao animated:YES];
            
            //信用
//            KPXinYongViewController *xinyong =[[KPXinYongViewController alloc] init];
//            [self.navigationController pushViewController:xinyong animated:YES];
            
        }
            break;
        case 1182://制作二维码的
        {
            
            erWeiView =[[KPErWeiMaView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) info:@"erWeiMa"];
            erWeiView.delegate =self;
            
            
            UIWindow *window=SharedApplication.keyWindow;
            [window addSubview:erWeiView];
          
            
        }
            break;
        case 1183:
        {
            //帮助中心
            KPBangZhuViewController   *bangzhu =[[KPBangZhuViewController alloc] init];
            [self.navigationController pushViewController:bangzhu animated:YES];
            
            
        }
            break;
        case 1184:
        {
            //联系客服
            
            KPKeFuViewController *kefu =[[KPKeFuViewController alloc]init];
            [self.navigationController pushViewController:kefu animated:YES];
            
//          KPZiJinViewController   *zijin =[[KPZiJinViewController alloc] init];
//            [self.navigationController pushViewController:zijin animated:YES];
            
        }
            break;
        case 1185:
        {
            KPDianPuxiangqingViewController   *xiangqing =[[KPDianPuxiangqingViewController alloc] init];
            [self.navigationController pushViewController:xiangqing animated:YES];
            
        }
            break;
        case 1186:
        {
            
            
        }
            break;
        case 1279:
        {
            KPZiJinViewController *zijin =[[KPZiJinViewController alloc] init];
            [self.navigationController pushViewController:zijin animated:YES];
            
        }
            break;
        case 1278:
        {
            KPDianPuxiangqingViewController *xiangq=[[KPDianPuxiangqingViewController alloc] init];
            [self.navigationController pushViewController:xiangq animated:YES];
            
        }
            break;
        default:
            break;
    }
    
}

//关闭二维码
- (void)closeView:(UIButton *)button
{
    [erWeiView removeFromSuperview];
}


#pragma make 单机修改资料

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headNav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    
    [KPTabbar shareTabBarController:NO].tabBar.hidden =NO;
    [self prepareBarButton];
    
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
