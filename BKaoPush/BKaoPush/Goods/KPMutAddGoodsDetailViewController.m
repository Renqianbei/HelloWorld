//
//  KPAddGoodsDetailViewController.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//
#import "KPAddGoodsEditCountAndPriceVC.h"
#import "KPMutAddGoodsDetailViewController.h"
#import "KPAddGoodsEditCell.h"
#import "KPAddGoodsSimpleCell.h"
#import "KPAddGoodsImageShowCell.h"
#import "KPAddGoodsSelectCell.h"
#import "KPAddGoodsRedNoticeCell.h"
#import "KPNewGoodsCellTypeModel.h"
#import "UIImage+KPColorToImage.h"

static  NSString * EditCellID = @"EditCellID";
static  NSString * SimpleCellID = @"SimpleCellID";
static  NSString * ImageShowCellID = @"ImageShowCellID";
static  NSString * SelectCellID = @"SelectCellID";
static NSString  * RedNoticeID = @"RedNoticeID";

@interface KPMutAddGoodsDetailViewController ()<UITableViewDelegate,UITableViewDataSource,NewAddGoodsCellDelegate,EditCountPriceVcSureDelegate>

@property(nonatomic,strong)UIButton * bigImageView;
@property(nonatomic,assign)CGRect startFrame;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray * cellModels;//自定义model;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation KPMutAddGoodsDetailViewController

- (UIButton *)bigImageView{
    
    if (_bigImageView == nil) {
        _bigImageView = [[UIButton alloc] initWithFrame:CGRectZero];
        //
        [_bigImageView addTarget:self action:@selector(hideImageView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bigImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftBarButtonItem];
    [self configureTableView];
    [self.submitButton setBackgroundImage:[UIImage imageWithColor:KPGrayColor] forState:UIControlStateDisabled];
    [self.submitButton setBackgroundImage:[UIImage imageWithColor:KPYellowColor] forState:UIControlStateNormal];
    self.submitButton.enabled = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)configureTableView{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPAddGoodsEditCell class]) bundle:nil] forCellReuseIdentifier:EditCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPAddGoodsSimpleCell class]) bundle:nil] forCellReuseIdentifier:SimpleCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPAddGoodsImageShowCell class]) bundle:nil] forCellReuseIdentifier:ImageShowCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPAddGoodsSelectCell class]) bundle:nil] forCellReuseIdentifier:SelectCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([KPAddGoodsRedNoticeCell class]) bundle:nil] forCellReuseIdentifier:RedNoticeID];

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    //构建必要数据 按UI样式 顺序添加
    _cellModels = [NSMutableArray array];
    
    //具体内容 由上一个页面传过来的model决定  或者 由上一个页面传过来的id来 进行请求获取具体数据 然后 按下面顺序 给每行添加数据
    
    
    //创建每行对应的cell 模型 包含cell的样式 以及数据
    KPNewGoodsCellTypeModel * row1 = [KPNewGoodsCellTypeModel modelWithCellID:SimpleCellID title:@"商品名称" content:self.model.title];

     KPNewGoodsCellTypeModel * row2 = [KPNewGoodsCellTypeModel modelWithCellID:ImageShowCellID title:@"商品图片" content:@""];
        row2.imageUrls = @[@"图片url1",@"图片url2",@"图片url2",@"图片url2",@"图片url2",@"图片url2",@"图片url2"];
    KPNewGoodsCellTypeModel * row3 = [KPNewGoodsCellTypeModel modelWithCellID:EditCellID title:@"描述" content:@"" placehHoderContent:@"请填写一句话描述(选填)"];
    row3.isOption = YES;//选填
    
    KPNewGoodsCellTypeModel * row4 = [KPNewGoodsCellTypeModel modelWithCellID:SelectCellID title:@"颜色" content:@""];
    row4.contents = @[@"金色",@"银色",@"黑色",@"升空会",@"玫瑰金",@"哈哈哈"];
    row4.allowMutSelect = YES;//允许多选
    row4.topToView = @"25";//因为这行距离顶部边界 效果要看起来多一点

    KPNewGoodsCellTypeModel * row5 = [KPNewGoodsCellTypeModel modelWithCellID:SelectCellID title:@"内存" content:@""];
    row5.allowMutSelect = YES;//允许多选
    row5.contents = @[@"16G",@"32G",@"64G"];
    
    
    KPNewGoodsCellTypeModel * row6 = [KPNewGoodsCellTypeModel modelWithCellID:SelectCellID title:@"网络" content:@""];
    row6.contents = @[@"连通4G",@"移动4G",@"电信4G"];
    row6.allowMutSelect = YES;//允许多选
    
    
    KPNewGoodsCellTypeModel * row7 = [KPNewGoodsCellTypeModel modelWithCellID:EditCellID title:@"价格" content:@"" placehHoderContent:@"请设置价格"];
    row7.keyboardType = UIKeyboardTypeNumberPad;
    row7.showButton = YES;//显示分别设置按钮
    
    KPNewGoodsCellTypeModel * row8 = [KPNewGoodsCellTypeModel modelWithCellID:EditCellID title:@"数量" content:@"" placehHoderContent:@"请设置数量"];
    row8.keyboardType = UIKeyboardTypeNumberPad;
    row8.showButton = YES;//显示分别设置按钮  //这是多选页

    KPNewGoodsCellTypeModel * row9 = [KPNewGoodsCellTypeModel modelWithCellID:SimpleCellID title:@"重量" content:@"500克"];
    
    
    KPNewGoodsCellTypeModel * row10 = [KPNewGoodsCellTypeModel modelWithCellID:SimpleCellID title:@"商品描述" content:@"pweihfpwpifipweqjfpo发文件反馈及问佛款未付金额外婆看附件为破解分配我看见风味咖啡"];

    
    KPNewGoodsCellTypeModel * redNoticeRow = [KPNewGoodsCellTypeModel modelWithCellID:RedNoticeID title:nil content:@"选择多个商品属性后请在价格，数量中点击分别设置，进行分别设置。如不进行设置商品将使用统一价格及数量。"];
    redNoticeRow.isOption = YES;//不影响 提交上架按钮可点判断
    
    [_cellModels addObject:row1];
    [_cellModels addObject:row2];
    [_cellModels addObject:row3];
    [_cellModels addObject:row4];
    [_cellModels addObject:row5];
    [_cellModels addObject:row6];
    
    [_cellModels addObject:redNoticeRow];
    
    [_cellModels addObject:row7];
    [_cellModels addObject:row8];
    [_cellModels addObject:row9];
    [_cellModels addObject:row10];

    
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellModels.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KPNewGoodsCellTypeModel * model = _cellModels[indexPath.row];
    
    KPNewGoodsBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:model.CellID forIndexPath:indexPath];
    if (indexPath.row < 2 || ( indexPath.row>2&&indexPath.row<6)) {
        cell.separatorInset = UIEdgeInsetsMake(0, tableView.frame.size.width, 0, 0);//隐藏分割线
    }else{
        cell.separatorInset = UIEdgeInsetsMake(0, 12, 0, 0);//显示
    }
    cell.model = model;
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}


#pragma mark    CellDelegate  编辑 选择发生改变时 代理
//需要判断是否有多选  来看是否显示 7 8 行的 分别设置按钮
-(void)mutSelectStatusChange{
    [self refreshSubmitButtonStatus];

}
//编辑页文字发生改变
- (void)editCelltextHasChanged{
    
    [self refreshSubmitButtonStatus];
}

//点击了小图片 放的显示
- (void)clickSmallImageWithModel:(KPNewGoodsCellTypeModel*)model andIndex:(NSInteger) index andview:(UIView*)smallview{
    
    NSString * imageurl =  model.imageUrls[index];
    self.startFrame  = [smallview.superview convertRect:smallview.frame toView:self.view]; //设置初始位置
    self.bigImageView.frame = self.startFrame;
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:imageurl] forState:UIControlStateNormal]; //设置图片
    self.bigImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bigImageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.bigImageView.frame = self.view.bounds;
    }];
}


/**
  因为没有多选 所以看不到分别设置按钮
 */
-(void)clickFenbieSheZhi{
    //进入分别设置页 先获取选中的信息
    KPNewGoodsCellTypeModel * row1 = _cellModels[1];
    NSString * chanping = row1.content;                 //产品名称
    
    KPNewGoodsCellTypeModel * row3 = _cellModels[2];
    NSString * miaoshu = row3.content;//描述
    KPNewGoodsCellTypeModel * row4 = _cellModels[3];  //选中的颜色集合
    NSSet *selectColors = row4.selectContents;
    
    KPNewGoodsCellTypeModel * row5 = _cellModels[4];//内存  选中的集合
    NSSet *selectStorage = row5.selectContents;//
    
    KPNewGoodsCellTypeModel * row6 = _cellModels[5];//网络 选中的集合
    NSSet *selectNet = row6.selectContents;
    
    /*=======多选vc 第7行 中间多了一行红色文字=======*/
    
    KPNewGoodsCellTypeModel * row7 = _cellModels[7];//价格
    NSString * price = row7.content;
    
    KPNewGoodsCellTypeModel * row8 = _cellModels[8];//数量
    NSString * count = row8.content;
    
    //数据如何显示 拼接自己处理  上面已经取出所有必要信息了
  
    for (int i = 3; i<6; i++) {//判断456行是否有未选中的  有未选中给出提示
        KPNewGoodsCellTypeModel * row456 = _cellModels[i];
        if (row456.selectContents.count == 0 ) {
            [KPProgress showResultText:[NSString stringWithFormat:@"请选择%@",row456.title ]];
            return;// 给出提示  并返回
        }
    }
    
    
    
    //假设 内存选中了2个  颜色选中了 2种   网络也选中了2种
    //结果 应该有 2*2*2 组合方式？？  8
    
    NSMutableArray * coutPriceSetingsModels = [NSMutableArray array];
    for (NSString * storage in selectStorage) {// 举个例子 拼接 进入分别设置页面
        
        for (NSString * color in selectColors) {
            
            for (NSString * net in selectNet) {
                NSString * name = [NSString stringWithFormat:@"%@ %@ %@ %@",chanping,color,storage,net];
                NSLog(@"%@'",name);
                KPEditNameCountPriceModel * model = [[KPEditNameCountPriceModel alloc] init];
                model.name = name;
                model.price = price;
                model.count = count;
                
                [coutPriceSetingsModels addObject:model];
            }
            
        }
      
    }
    
  
    
    
    //跳到分别设置页
    KPAddGoodsEditCountAndPriceVC * vc = [[KPAddGoodsEditCountAndPriceVC alloc] init];
    
    vc.cellModels = coutPriceSetingsModels;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}




//判断提交按钮是否可点

- (void)refreshSubmitButtonStatus{
    BOOL ret  = YES ;//
    
    for (KPNewGoodsCellTypeModel * model in _cellModels) {
        if ([model.CellID isEqualToString:EditCellID]) {
            //编辑样式 如果是必填项 需要判断 内容是否为空 如果为空  提交按钮不可点
            if (!model.isOption&&(model.content==nil || [model.content isEqualToString:@""])) {
                ret = NO;
                break;
            }
        }
        
        if ([model.CellID isEqualToString:SelectCellID]) {
            if (model.selectContents.count == 0) {
                ret = NO;//有一行没被选中 提交按钮不可点
                break;
            }
        }
        
    }
    
    self.submitButton.enabled = ret;
    
    
}




- (void)hideImageView{
    [UIView animateWithDuration:0.5 animations:^{
        self.bigImageView.frame = self.startFrame;
    } completion:^(BOOL finished) {
        [self.bigImageView removeFromSuperview];
    }];
}





//点击提交
- (IBAction)submitClick:(id)sender {
    
    KPNewGoodsCellTypeModel * row1 = _cellModels[1];
    NSString * chanping = row1.content;//产品名称

    KPNewGoodsCellTypeModel * row3 = _cellModels[2];
    NSString * miaoshu = row3.content;//描述
    KPNewGoodsCellTypeModel * row4 = _cellModels[3];  //颜色
    NSSet *selectColors = row4.selectContents;
    
    KPNewGoodsCellTypeModel * row5 = _cellModels[4];//内存
    NSSet *selectStorage = row5.selectContents;//
  
    KPNewGoodsCellTypeModel * row6 = _cellModels[5];//网络
    NSSet *selectNet = row6.selectContents;
    
    /*=======多选vc 第7行 中间多了一行红色文字=======*/
    
    KPNewGoodsCellTypeModel * row7 = _cellModels[7];//价格
    NSString * price = row7.content;
    
    KPNewGoodsCellTypeModel * row8 = _cellModels[8];//数量
    NSString * count = row8.content;
    
    
    for (NSString * storage in selectStorage) {
        NSString * name = [NSString stringWithFormat:@"%@ %@ %@ %@",chanping,selectColors.anyObject,storage,selectNet.anyObject];
        NSLog(@"%@'",name);
    }
}


#pragma mark  EditCountPriceVcSureDelegate 编辑页确定按钮 回调代理
-(void)sureButtonClick:(NSMutableArray *)models{
    //models  就是设置保存结束的所有值
    for (KPEditNameCountPriceModel * model in models) {
        NSLog(@"%@==%@==%@",model.name,model.count,model.price);
    }
    
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
