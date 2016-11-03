//
//  KPBangZhuViewController.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPBangZhuViewController.h"
#import "KPBangZhuTableViewCell.h"


@interface KPBangZhuViewController ()
{

    NSMutableArray *_dataSoucre;
    NSArray        *titleArr;
}

@end

@implementation KPBangZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setMyTitle:@"帮助中心"];
    [self setMyTitle:@"帮助中心"];
    [self createLeftBarButtonItem];
    [self createdateSoucre];
    [self createRootTableView:NO];
}
-(void)createdateSoucre;
{
    //WithObjects:@[@"联系靠谱客服",@"常见问题"],@[@"联系靠谱客服",@"常见问题"],@[@"联系靠谱客服",@"常见问题"],@[@"联系靠谱客服",@"常见问题"], nil

    _dataSoucre = [[NSMutableArray alloc] initWithObjects:@[@"联系靠谱客服",@"常见问题"], nil];
    titleArr  = [[NSArray alloc] init];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPBangZhuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[KPBangZhuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
   
    [cell createUI:_dataSoucre[indexPath.section][indexPath.row]];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
//                [self changePhotoAction];
            }
            case 1:
            {
             
            }break;
            case 2:
            {
//                ChangeNameViewController * name = [[ChangeNameViewController alloc] init];
//                name.title =@"修改昵称";
//                name.placeLoder =_dataSource[indexPath.section][indexPath.row];
//                [self.navigationController pushViewController:name animated:YES];
            }break;
            case 3:
            {
//                ChangeGeaderViewController * geader = [[ChangeGeaderViewController alloc] init];
//                [self.navigationController pushViewController:geader animated:YES];
            }break;
            case 4:
            {
//                _birthdayView =[[BirthdayView alloc] init];
//                _birthdayView.delegate =self;
//                [self.view addSubview:_birthdayView];
            }break;
        }
    }
    else if (indexPath.section==1){
        
//        AdressListViewController * adress = [[AdressListViewController alloc] init];
//        [self.navigationController pushViewController:adress animated:YES];
    }
    else if (indexPath.section==2){
//        PersonSafeViewController * safe = [[PersonSafeViewController alloc] init];
//        [self.navigationController pushViewController:safe animated:YES];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dataSoucre[section];
    return arr.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
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
