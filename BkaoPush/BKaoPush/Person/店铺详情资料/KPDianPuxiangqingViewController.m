//
//  KPDianPuxiangqingViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPDianPuxiangqingViewController.h"
#import "KPDianPuXQTableViewCell.h"

@interface KPDianPuxiangqingViewController ()
{

    NSMutableArray        *dataSoucre;
    NSArray               *arrSoucre;
    
}

@end

@implementation KPDianPuxiangqingViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"店铺资料"];
    [self createRootTableView:YES];
    [self createLeftBarButtonItem];
    [self createDataSoucre];
    
}
-(void)createDataSoucre
{
    dataSoucre = [[NSMutableArray alloc] init];

    
      NSArray  *arr =@[@"品类",@"品类1",@"品类2",@"品类3",@"品类4",@"品类5",@"品类6",@"品类7",@"品类8",@"品类9",@"品类10",@"品类12",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13"];
    for (int i =0; i<10; i++) {
        [dataSoucre addObject:arr[i]];
    }
   
    [self.rootTableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    //NSArray *arr=dataSoucre[section];

    return 3;
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *arr =@[@"基本信息",@"经营信息",@"证照信息"];
    //NSArray  *arr1 =@[@[@"基本信息"],@[@"经营信息"],@[@"证件信息"]];
    return arr[section];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==2) {
        return ((ScreenWidth-120)/3.0*2)+62;
    }

    else{
            return 44;
    }


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    KPDianPuXQTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPDianPuXQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    [cell creatrui:nil NSindexPath:indexPath];
    return cell;

    
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
