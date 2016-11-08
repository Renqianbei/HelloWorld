//
//  KPAddGoodsEditCountAndPriceVC.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/8.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddGoodsEditCountAndPriceVC.h"
#import "KPNameCountPriceEditCell.h"
#import "KPAddResultViewController.h"
static NSString * cellID = @"cellIIIID";

@interface KPAddGoodsEditCountAndPriceVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation KPAddGoodsEditCountAndPriceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftBarButtonItem];
    [self configureTableView];
    [self setMyTitle:@"新增商品"];
    self.sureButton.backgroundColor = KPYellowColor;
    // Do any additional setup after loading the view from its nib.
}

- (void)configureTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPNameCountPriceEditCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight =182;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"您可以修改产品名称、价格、数量 或像左滑动删除不要的商品";
    label.font = [UIFont systemFontOfSize:15];
    CGSize size = [KPTool stringCGSize:label.text font:15. width:label.frame.size.width - 20 height:200];
    if (size.height > 50) {
        label.frame = CGRectMake(10, 0, ScreenWidth - 20, size.height);
    }
    
    UIView * view = [[UIView alloc] initWithFrame:label.frame];
    [view addSubview:label];
    
    
    self.tableView.tableHeaderView = view;
//    self.tableView.editing = YES;
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cellModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


//保存按钮点击事件
- (IBAction)clickButton:(id)sender {
    
    for (KPEditNameCountPriceModel * model in _cellModels) {
        if (!model.count  ||  [[self qukongWith:model.count] isEqualToString:@""] ||!model.price  ||  [[self qukongWith:model.price] isEqualToString:@""]) {
            [KPProgress showResultText:@"你还有商品未设置价格或数量"];
            return;
        }
    }
    //
    if ([self.delegate respondsToSelector:@selector(sureButtonClick:)]) {
        [self.delegate sureButtonClick:self.cellModels];
    }
    //
//    self.cellModels 中model 包含编辑所有信息
    //跳到结果页
    KPAddResultViewController *vc = [[KPAddResultViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSString *)qukongWith:(NSString*)string{
    
    if ([string hasPrefix:@" "]) {
        string = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        string =  [self qukongWith:string];
    }else{
        return string;
    }
    
    return string;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KPEditNameCountPriceModel * model = _cellModels[indexPath.section];
    
    KPNameCountPriceEditCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.cellModels removeObjectAtIndex:indexPath.section];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath{
    
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
