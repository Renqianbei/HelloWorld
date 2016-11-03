//
//  KPBangDingKaViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBangDingKaViewController.h"

@interface KPBangDingKaViewController ()

@end

@implementation KPBangDingKaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setMyTitle:@"选择银行卡"];
    [self createLeftBarButtonItem];
    
    [self createDataSoucre];
}

-(void)createDataSoucre
{
    UIImageView *successIMG =[[UIImageView alloc] init];
    successIMG.frame = CGRectMake(ScreenWidth/2.0-64/2, ScreenHeight*0.2, 64, 64);
    successIMG.image =[UIImage imageNamed:@"未绑定银行卡"];
    [self.view addSubview:successIMG];
      CGSize size =[KPTool stringCGSize:@"未绑定银行卡" font:12  width:0 height:30];
    UILabel  *successLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2.0-50, CGRectGetMaxY(successIMG.frame), 100 , 30)];
    successLab.font =MM_FONT;
    successLab.text =@"未绑定银行卡";
    successLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:successLab];
    
    
    UILabel  *weiBangDingLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2.0-50, CGRectGetMaxY(successLab.frame), size.width+30 , 60)];
    weiBangDingLab.font =SS_FONT;
    weiBangDingLab.numberOfLines=0;
    weiBangDingLab.textColor = KPGrayColor;
    weiBangDingLab.text =@"您还未绑定银行卡请尽快操作绑定";
    weiBangDingLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:weiBangDingLab];
  
    
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
