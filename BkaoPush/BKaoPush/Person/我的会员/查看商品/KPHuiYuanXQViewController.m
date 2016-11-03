//
//  KPHuiYuanXQViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPHuiYuanXQViewController.h"
#import "KPHuiYuanTableViewCell.h"
@interface KPHuiYuanXQViewController ()
{

    NSMutableArray   *dateSoucre;

}

@end

@implementation KPHuiYuanXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRootTableView:NO];
    [self createLeftBarButtonItem];
    [self setMyTitle:@"我的会员"];
     //self.rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(void)dataSoucre
{

    dateSoucre = [[NSMutableArray alloc] init];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KPHuiYuanTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KPHuiYuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

//     NSDictionary *dic;
//    [cell createUI:dic];
    [cell createDatasoucre];
  
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
 
    if (indexPath.row==0) {
        
        cell.nameLab.text = @"会员用户名(昵称)";
        cell.nameLabtext.text =@"林志玲";
        cell.nameLab.textColor = [UIColor redColor];
    }else if (indexPath.row==1){
        cell.nameLab.text = @"绑定时间";
        cell.nameLabtext.text =@"1723-12-12 11:12";
    
    }else if (indexPath.row==2){
        
        cell.nameLab.text = @"最后消费时间";
        cell.nameLabtext.text =@"1723-12-12 11:12";
        
    }else if (indexPath.row==3){
        cell.nameLab.text = @"消费次数";
        cell.nameLabtext.text =@"12次";
        
    }else if (indexPath.row==4){
        cell.nameLab.text = @"总消费金额";
        cell.nameLabtext.text =@"7666.00元";
        
    }else if (indexPath.row==5){
        
        cell.nameLab.text = @"绑定方式";
        cell.nameLabtext.text =@"扫码";
        
    }
    

    
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return  50;
//
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 6;
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
