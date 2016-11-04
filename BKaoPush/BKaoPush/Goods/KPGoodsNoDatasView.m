//
//  KPGoodsNoDatasView.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodsNoDatasView.h"
#import "KPNearHotCell.h"
#import "KPGoodSellModel.h"
static NSString * cellID = @"cellID";
@interface KPGoodsNoDatasView()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray  * nearDatas;

@end

@implementation KPGoodsNoDatasView

+(instancetype)NoDataViewWithTitle:(NSString *)title{

    KPGoodsNoDatasView * nodataView = [[NSBundle mainBundle] loadNibNamed:@"KPGoodsNoDatasView" owner:nil options:nil].firstObject;
    nodataView.label.text = title;
    [nodataView viewdidLoad];
    return  nodataView;
}


-(void)viewdidLoad{
    
    [self initView];
    //获取数据
    [self loadData];
    
}

-(void)initView{
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPNearHotCell class]) bundle:nil]
                                  forCellReuseIdentifier:cellID];
    _tableView.tableFooterView = [UIView new];

    [self.tableView reloadData];
}

-(void)reloaData{
    [self.tableView reloadData];
}

- (void)loadData{
       //网络请求 周边热销商品
//    请求之后 刷新tableview;
    _nearDatas = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        [_nearDatas addObject:[KPGoodSellModel jiashuju]];
    }
    [self.tableView reloadData];
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, [self tableView:tableView heightForHeaderInSection:section])];
    label.text = @"    周边热销商品";
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];

    return  label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _nearDatas.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KPNearHotCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    NSArray  * images = @[@"首页_冠军商品",@"首页_铜牌商品",@"首页_银牌商品"];
    if (indexPath.row<images.count) {
        [cell.headButton setImage:[UIImage imageNamed:images[indexPath.row]] forState:UIControlStateNormal];
        [cell.headButton setTitle:@"" forState:UIControlStateNormal];
    }else{
        [cell.headButton setImage:nil forState:UIControlStateNormal];
        [cell.headButton setTitle:[NSString stringWithFormat:@"%ld",indexPath.row+1] forState:UIControlStateNormal];
    }
    
    KPGoodSellModel * model = _nearDatas[indexPath.row];
    cell.model = model;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:indexPath];
    NSLog(@"点击了某一行");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
