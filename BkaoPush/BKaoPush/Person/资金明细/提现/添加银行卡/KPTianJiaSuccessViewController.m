//
//  KPTianJiaSuccessViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPTianJiaSuccessViewController.h"

@interface KPTianJiaSuccessViewController ()

@end

@implementation KPTianJiaSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"添加银行卡"];
    self.view.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self createDataSoucre];
    
    [self createRightBarButtonItem:RightItemTypeTxt text:@"完成"];
}

-(void)createDataSoucre
{
    UIImageView *successIMG =[[UIImageView alloc] init];
    successIMG.frame = CGRectMake(ScreenWidth/2.0-64/2, ScreenHeight*0.2, 64, 64);
    successIMG.image =[UIImage imageNamed:@"绑定成功"];
    [self.view addSubview:successIMG];
    
    UILabel  *successLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2.0-40, CGRectGetMaxY(successIMG.frame), 80, 40)];
    successLab.font =MM_FONT;
    successLab.text =@"添加成功";
    successLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:successLab];
    
    
}
-(void)rightBarButtonItemAction
{

    NSLog(@"这是完成按钮");
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
