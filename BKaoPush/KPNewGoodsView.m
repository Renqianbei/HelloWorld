//
//  KPNewGoodsView.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//
#define ImageViewTag  100
#import "KPNewGoodsView.h"
#import "KPGoodsThirdCell.h"
static NSString * tableCellID = @"cellID";
static NSString * collectionCellID = @"cellID";

@interface KPNewGoodsView()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property(nonatomic,strong)NSMutableArray * datas;//这个模型包含三级

@property(nonatomic,strong)NSArray * collectionDatas;//
@end

@implementation KPNewGoodsView

+(instancetype)NewGoodsViewWithDelegate:(id<NewGoodsSelectDelegate>)delegate{
    KPNewGoodsView * view = [[NSBundle mainBundle]  loadNibNamed:@"KPNewGoodsView"owner:nil options:nil].firstObject;
    view.delegate = delegate;
    [view viewDidLoad];
    return view;
}

-(void)viewDidLoad{
    
    [self configureView];
    [self loadData];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
-(void)loadData{
    _datas = [NSMutableArray array];
    //创造假数据
    NSArray * titles = @[@"手机数码",@"商品分类1",@"商品分类2",@"商品分类3",@"商品分类4"];
    int i = 0;
    for (NSString * title in titles) {
        KPSelectModel * firstModel = [[KPSelectModel alloc] init];
        //1级
        [_datas addObject:firstModel];
        firstModel.title = title;
        firstModel.nextModels = [NSMutableArray array];
        
        NSArray * subTitles = @[@"智能设备",@"通讯设备",@"手机",@"智能穿戴",@"呵呵"];
        for (NSString * subtitle in subTitles) {
          //2级
            KPSelectModel * secondModel = [[KPSelectModel alloc] init];
            [firstModel.nextModels addObject:secondModel];
            secondModel.title =  [NSString stringWithFormat:@"%d%@",i,subtitle];
            secondModel.nextModels = [NSMutableArray array];
            
            NSArray * thirdTitles = @[@"iPhone",@"三星",@"小米",@"魅族",@"乐视",@"摩托"];
           
            for (NSString * thirdTitle in thirdTitles) {
                //3级
                KPSelectModel * thirdModel = [[KPSelectModel alloc] init];
                [secondModel.nextModels addObject:thirdModel];
                thirdModel.title = [NSString stringWithFormat:@"%d%@",i,thirdTitle];
                thirdModel.nextModels = [NSMutableArray array];
                
                NSArray * fourTitles = @[@"iPhone7",@"iPhone7s",@"iPhone6s",@"iPhone6",@"iPhone5",@"iPhone5s"];
               
                for (NSString * fourTitle in fourTitles) {
                    //4级
                    KPSelectModel * fourthModel = [[KPSelectModel alloc] init];
                    [thirdModel.nextModels addObject:fourthModel];
                    fourthModel.title = [NSString stringWithFormat:@"%d%@",i,fourTitle];
//                    thirdModel.nextModels = [NSMutableArray array];
                    
                }
                i++;
                
            }
             i++;
        }
        
    }
    KPSelectModel * modle1 = _datas[0];
    modle1.isSelect = YES;//默认选中第一个section
    [self.tableView reloadData];
    //默认选中第一行 这个前提必须是数组有值
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    //collectionView 默认显示 第一个section中第一行的 modeld 数据
    NSArray *  rowModels = modle1.nextModels;
    KPSelectModel * rowModel = rowModels.firstObject;
    self.collectionDatas = rowModel.nextModels;
    [self.collectionView reloadData];

}



-(void)configureView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableCellID];
    [self.tableView reloadData];
    self.tableView.rowHeight = 40;
//    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"KPGoodsThirdCell" bundle:nil] forCellWithReuseIdentifier:collectionCellID];
//    self.collectionView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);

    [self.tableView reloadData];
    [self.collectionView reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    KPSelectModel * model = _datas[section];
    UIView * view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,[self tableView: tableView heightForHeaderInSection:section])];
    
    float leftinterval = 8;//button距离父视图左边距
    float rightinterval = 8;//imageView距离父视图右边距

    float imagewidth = 20;//图片宽
    float imageHeight = 16;//图片高
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(leftinterval, 0, view.frame.size.width - 2*leftinterval - imagewidth - rightinterval, view.frame.size.height)];
    [button setTitle:model.title forState:UIControlStateNormal];
    button.titleLabel.textAlignment =  NSTextAlignmentLeft;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [button addTarget:self action:@selector(clickSection:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame)+ leftinterval, view.frame.size.height/2 - imageHeight/2, imagewidth, imageHeight)];
    [imageView setImage:[UIImage imageNamed:@"前进"]];
//    imageView.backgroundColor = [UIColor redColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
    
    if (!model.isSelect) {
        imageView.hidden = YES;//如果没被选中就隐藏
    }
    [view addSubview: button];
    [view addSubview:imageView];
    button.tag = section;
    imageView.tag = ImageViewTag;
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-0.5, view.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    [view addSubview:lineView];
    view.backgroundColor = [UIColor whiteColor];
    return  view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   //tableView 有多少行取决于 是否展开和有多少二级model
    KPSelectModel * selectModel = _datas[section];
    if (selectModel.isSelect) {
        return  selectModel.nextModels.count;
    }
    return  0;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableCellID forIndexPath:indexPath];
    KPSelectModel * selectModel = _datas[indexPath.section];
    KPSelectModel * rowModel = selectModel.nextModels[indexPath.row];
    cell.textLabel.text = rowModel.title;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //选中某一行  要更新collectionview
    KPSelectModel * Sectionmodel = _datas[indexPath.section];//对应section
    KPSelectModel * rowModel = Sectionmodel.nextModels[indexPath.row];//对应row
    NSArray * models = rowModel.nextModels;//row 中子模型就是collectionview 显示的内容
    
    self.collectionDatas = models;
    [self.collectionView reloadData];
}


#pragma mark  CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.collectionDatas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KPGoodsThirdCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    KPSelectModel * model = self.collectionDatas[indexPath.item];
    
    [cell.button setTitle:model.title forState:UIControlStateNormal];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float width = collectionView.frame.size.width;
    float interval = 10;
    float itemWidth = (width - interval*4)/3;
    
    return CGSizeMake(itemWidth, 35);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KPSelectModel * model  = self.collectionDatas[indexPath.item];
    //跳转到下一页
    if ([self.delegate respondsToSelector:@selector(didClickCollectionItemWithModel:)]) {
        [self.delegate didClickCollectionItemWithModel:model];
    }
}



#pragma  mark  点击Tableview 的section方法
-(void)clickSection:(UIButton *)button{
    NSInteger section = button.tag;
//    UIImageView * imageview = [button.superview viewWithTag:ImageViewTag];
    KPSelectModel * model = _datas[section];
    model.isSelect = !model.isSelect;//修改选中状态 刷新tableview
    
    [self.tableView reloadData];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
