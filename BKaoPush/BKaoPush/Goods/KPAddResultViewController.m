//
//  KPAddResultViewController.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/8.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddResultViewController.h"

@interface KPAddResultViewController ()
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation KPAddResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftBarButtonItem];
    [self setMyTitle:@"新增商品"];
    [self.leftButton setImage:IMAGE(@"48.png") forState:UIControlStateNormal];
    self.continueButton.layer.cornerRadius = 4;
    self.backButton.layer.cornerRadius = 4;
    self.continueButton.backgroundColor = KPYellowColor;
    self.backButton.backgroundColor = KPYellowColor;
    // Do any additional setup after loading the view from its nib.
}

-(void)leftBarButtonItemAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickContue:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


- (IBAction)clickBack:(id)sender {
   
    [self.navigationController popToRootViewControllerAnimated:YES];
    //找到你当前结构的 tabVC
    [self performSelector:@selector(gotoFirst) withObject:nil afterDelay:0.2];
}

- (void)gotoFirst{
    UITabBarController * tab  = ((UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[0];
    tab.selectedIndex = 0;
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
