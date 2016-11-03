//
//  KPFaPiaoPinLeiViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoPinLeiViewController.h"
#import "KPFaPiaoPinLeiTableViewCell.h"

@interface KPFaPiaoPinLeiViewController ()<KPFaPiaoPinLeiActionDelegate>
{

    NSMutableArray   *dataSoucre;
    NSMutableArray   *seleMuArr;
}

@end

@implementation KPFaPiaoPinLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyTitle:@"选择开发票品类"];
    [self createLeftBarButtonItem];
    
    [self createRootTableView:NO];
    [self createRightBarButtonItem:RightItemTypeTxt text:@"全选"];
    
    [self createUI];
}
-(void)rightBarButtonItemAction
{

    NSLog(@"全选");
    
    
}
-(void)createUI
{
    dataSoucre = [[NSMutableArray alloc] init];
    seleMuArr  = [[NSMutableArray alloc] init];
    
    NSArray  *arr =@[@"品类",@"品类1",@"品类2",@"品类3",@"品类4",@"品类5",@"品类6",@"品类7",@"品类8",@"品类9",@"品类10",@"品类12",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13",@"品类13"];
    for (int i=0; i<40; i++) {
        
        [dataSoucre addObject:arr[i]];
        [seleMuArr addObject:@NO];
    }
    
    
    UIView *Headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    Headerview.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    UILabel * faPiaoLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 5, ScreenWidth-24, 30)];
    faPiaoLab.text = @"设置您开发票的商品品类";
    faPiaoLab.font =SS_FONT;
    faPiaoLab.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    [Headerview addSubview:faPiaoLab];
    self.rootTableView.tableHeaderView =Headerview;
    
    
    [self.rootTableView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSoucre.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KPFaPiaoPinLeiTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPFaPiaoPinLeiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.delegates=self;
    
    [cell  createDateSoucre:nil :indexPath isSelect:[seleMuArr[indexPath.row] boolValue]];
    
    cell.selectionStyle =UITableViewCellAccessoryNone;
    return cell;
    
}
-(void)KPFaPiaoPinLeiAction:(UIButton *)button
{

    // 1
//    NSLog(@"----%ld",[button kpIndexPath].row);
//    [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:[seleMuArr[[button kpIndexPath].row] boolValue]?@NO:@YES];
    
    
    // 2
    if ([seleMuArr[[button kpIndexPath].row] boolValue]) {
        
        [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@NO];
        
    }else{
     [seleMuArr replaceObjectAtIndex:[button kpIndexPath].row withObject:@YES];
        
    }
    
    [self.rootTableView reloadData];
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
