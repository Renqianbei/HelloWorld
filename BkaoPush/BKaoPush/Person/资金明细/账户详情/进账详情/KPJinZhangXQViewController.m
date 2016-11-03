//
//  KPJinZhangXQViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/25.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPJinZhangXQViewController.h"
#import "KPJinZhangXQTableViewCell.h"

@interface KPJinZhangXQViewController ()
{
    NSMutableArray *dateSoucre;
}

@end

@implementation KPJinZhangXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRootTableView:NO];
    [self createLeftBarButtonItem];
    [self setMyTitle:@"收支详情"];
    self.rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(void)dataSoucre
{
    
    dateSoucre = [[NSMutableArray alloc] init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 30.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KPJinZhangXQTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KPJinZhangXQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    //     NSDictionary *dic;
    //    [cell createUI:dic];
    [cell createDatasoucre];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row==0) {
        
        cell.nameLab.text = @"流水号";
        cell.nameLabtext.text =@"林志玲";
        //cell.nameLab.textColor = [UIColor redColor];
    }else if (indexPath.row==1){
        cell.nameLab.text = @"类型";
        cell.nameLabtext.text =@"1723-12-12 11:12";
        
    }else if (indexPath.row==2){
        
        cell.nameLab.text = @"收入";
        cell.nameLabtext.text =@"1723-12-12 11:12";
        
    }else if (indexPath.row==3){
        cell.nameLab.text = @"时间";
        cell.nameLabtext.text =@"12次";
        
    }else if (indexPath.row==4){
        cell.nameLab.text = @"总余额";
        cell.nameLabtext.text =@"7666.00元";
        
    }else if (indexPath.row==5){
        
        cell.nameLab.text = @"备注";
        cell.nameLabtext.text =@"靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱靠谱";
        
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
