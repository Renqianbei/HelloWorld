//
//  KPDianPuViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPDianPuViewController.h"
#import "KPBianJiViewController.h"

@interface KPDianPuViewController ()
{
    KPBianJiViewController *bianji;
    NSString               *strData;
    UILabel                *titlelab;


}

@property (nonatomic, strong) UILabel * titleLab;

@end

@implementation KPDianPuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"店铺公告"];
    [self createui];
    [self createLeftBarButtonItem];
    
    [self createRightBarButtonItem:RightItemTypeTxt text:@"编辑"];
    
}
-(void)rightBarButtonItemAction
{
    bianji =[[KPBianJiViewController alloc] init];
    
    __weak typeof (self) Self = self;
    
    bianji.block =^(NSString *str){
        CGSize size =[KPTool stringCGSize:str font:M_FONT width:ScreenWidth-24 height:0];
        Self.titleLab.text =str;
        Self.titleLab.frame =CGRectMake(12, 12+64, ScreenWidth-24, size.height);
        
    };
 
    [self.navigationController pushViewController:bianji animated:YES];
    
    
}



-(void) createui
{
    //@"本店公告： 今天林志玲，要来！ 今天林志玲，要来！ 今天林志玲，要来！ 今天林志玲，要来！ 今天林志玲，要来！"
    
    CGSize size =[KPTool stringCGSize:strData font:M_FONT width:ScreenWidth-24 height:0];
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12+64, ScreenWidth-24, size.height)];
//    titlelab.text = @"要来天林志玲要来天林志玲要来要来天林志玲要来天林志玲要来要来天林志玲要来天林志玲要来要来天林志玲要来天林志玲要来！";
    
    self.titleLab.font =MM_FONT;
    self.titleLab.numberOfLines =0;
    [self.view addSubview:self.titleLab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
