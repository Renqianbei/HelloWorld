//
//  KPFaPiaoViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoViewController.h"
#import "KPInvoiceHeader.h"
#import "KPFaPiaoTableViewCell.h"
#import "KPFaPiaoPinLeiViewController.h"
#import "KPFaPiaoSheDingViewController.h"
@interface KPFaPiaoViewController ()<KPInvoiceBtnActiondelegate>
{
    KPInvoiceHeader *header;

    NSMutableArray *dataSoucre;
    
    NSArray        *arr; //装组名
    
    
    KPFaPiaoPinLeiViewController *KPPinLei;
    KPFaPiaoSheDingViewController *sheDing;
    
}

@end

@implementation KPFaPiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.91 alpha:1];
    [self setMyTitle:@"发票设定"];
    [self createLeftBarButtonItem];
    
    [self createRootTableView:YES];
    
    [self createRightBarButtonItem:RightItemTypeTxt text:@"完成"];
    [self createDataSoucre];
}
-(void)rightBarButtonItemAction
{
    NSLog(@"点击完成");
}
-(void)createDataSoucre
{
    dataSoucre = [[NSMutableArray alloc] init];
  
    arr= @[@"不提供发票",@"全店提供发票",@"单类商品提供发票",@"单类商品提供发票"];
    self.rootTableView.frame = CGRectMake(0, 74, ScreenWidth, ScreenHeight-74);
    self.rootTableView.scrollEnabled =  NO;
    
    KPPinLei =[[KPFaPiaoPinLeiViewController alloc] init];
    sheDing =[[KPFaPiaoSheDingViewController alloc] init];
    

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    
    UIView  *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    bgview.backgroundColor = [UIColor whiteColor];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-24-30, 44)];
    self.titleLab.font = MM_FONT;
      self.titleLab.text = arr[section];
    [bgview addSubview:self.titleLab];
    
    self.imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame),6, 30, 30)];
    [self.imageBtn addTarget:self action:@selector(ImageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
   

    self.imageBtn.tag=10020+section;
    [bgview addSubview:self.imageBtn];
    
    if (section< 2) {
        
        [self.imageBtn setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
        [self.imageBtn setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
        
        [self.imageBtn setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-40];
      
    }else{
        [self.imageBtn setImage:IMAGE(@"前进") forState:UIControlStateNormal];
    
    [self.imageBtn setEnlargeEdgeWithTop:0 right:0 bottom:0 left:ScreenWidth-60];
    }
    
    return bgview;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    if (indexPath.section ==2) {
        
       cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            cell.textLabel.font = SS_FONT;
            cell.textLabel.text = @"分类1";
           
        }
        return cell;
       
    }else if (indexPath.section ==3){
        KPFaPiaoTableViewCell *cell1 =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (!cell1) {
            cell1 =[[KPFaPiaoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell1.selectionStyle =UITableViewCellSelectionStyleNone;
        
        NSDictionary *dic;
        [cell1 createDataSoucre:dic];
        return cell1;
    
    }
    
  
      return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    NSArray *array =@[@"不提供发票",@"全店提供发票",@"单类商品提供发票",@"单类商品提供发票"];
    return array.count;
}

//每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSArray *array =@[@"不提供发票",@"全店提供发票",@"单类商品提供发票",@"单类商品提供发票"];
    if (section<2) {
        return 0;
    }else if (section==3){
    
        return 1;
    }else {
        return 3;
    }
    
    
    
}

#pragma 点击行 跳页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        [self.navigationController pushViewController:KPPinLei animated:YES];
        
    }else if (indexPath.section==3){
        
        [self.navigationController pushViewController:sheDing animated:YES];
    }

    NSLog(@"点击了%ld  +++++%ld", indexPath.section,indexPath.row);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int i;

    if (indexPath.section ==2) {
        i=40;
    }else if (indexPath.section ==3){
    
       i=88;
    }
    
    return  i;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}




-(void)ImageBtnAction:(UIButton *)button
{
    
  
    
    for (int i=0; i<2; i++) {
        UIButton * button = [self.view viewWithTag:10020+i];
        button.selected = NO;
    }
    
    button.selected = YES;
    switch (button.tag ) {
        case 10022:
        {
 
            [self.navigationController pushViewController:KPPinLei animated:YES];
        
        }
            break;
        case 10023:
        {

            [self.navigationController pushViewController:sheDing animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
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
