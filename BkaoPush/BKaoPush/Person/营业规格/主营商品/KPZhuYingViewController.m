//
//  KPZhuYingViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZhuYingViewController.h"
#import "KPZhuYingTableViewCell.h"

@interface KPZhuYingViewController ()<KPZhuYingGuiGeDelegate>
{
    NSMutableArray *dataSoucre;
    NSMutableArray *seleArr;
    
}


@end

@implementation KPZhuYingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRootTableView:NO];
    [self createLeftBarButtonItem];
    [self setMyTitle:@"主营商品"];
    [self createUI];
   
    [self  createRightBarButtonItem:RightItemTypeTxt text:@"全选"];
}
-(void)rightBarButtonItemAction
{

    NSLog(@"全选");
}
-(void) createUI
{

    dataSoucre = [[NSMutableArray alloc] init];
    seleArr    = [[NSMutableArray alloc] init];
    
    
     NSArray  *arr =@[@"品类",@"品类1",@"品类2",@"品类3",@"品类4",@"品类5",@"品类6",@"品类7",@"品类8",@"品类9",@"品类10",@"品类12",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13"];
    
    for (int i=0; i<40; i++) {
        
        [dataSoucre addObject:arr[i]];
        
        [seleArr addObject:@NO];
        
    }
    
    [self.rootTableView reloadData];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ;
    KPZhuYingTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[KPZhuYingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
    }
    cell.delegates=self;
   
  //  [cell createUI:nil Nsindex:indexPath[] iSelect:<#(BOOL)#>];
    [cell createUI:nil Nsindex:indexPath iSelect:[seleArr[indexPath.row] boolValue]];
    

    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return dataSoucre.count;
    
}
//选中按钮点击事件
-(void)KPZhuYingGuiGeClick:(UIButton *)button
{
    NSLog(@"   选中按钮响应事件");
    // 2
    if ([seleArr[[button kpIndexPath].row] boolValue]) {
        
        [seleArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@NO];
    }else
    {
    
    
     [seleArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@YES];
    }
    
  
    

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"选中了%ld  %ld",indexPath.section,indexPath.row);
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 54.0f;
//}

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
