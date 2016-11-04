//
//  KPNewGoodsView.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/4.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPNewGoodsView.h"
#import "KPGoodsThirdCell.h"
static NSString * tableCellID = @"cellID";
static NSString * collectionCellID = @"cellID";

@interface KPNewGoodsView()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation KPNewGoodsView

+(instancetype)NewGoodsView{
    KPNewGoodsView * view = [[NSBundle mainBundle]  loadNibNamed:@"KPNewGoodsView"owner:nil options:nil].firstObject;
    [view viewDidLoad];
    return view;
}

-(void)viewDidLoad{
    
    [self configureView];
    [self loadData];
    
}
-(void)loadData{
    
}

-(void)configureView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableCellID];
    [self.tableView reloadData];
    self.tableView.rowHeight = 35;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"KPGoodsThirdCell" bundle:nil] forCellWithReuseIdentifier:collectionCellID];
    self.collectionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);

    [self.tableView reloadData];
    [self.collectionView reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, [self tableView:tableView heightForHeaderInSection:section])];
    [button setTitle:@"哈哈哈" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    return  button;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  5;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableCellID forIndexPath:indexPath];
    
    cell.textLabel.text = @"123";
    return  cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KPGoodsThirdCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    [cell.button setTitle:@"helo" forState:UIControlStateNormal];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float width = collectionView.frame.size.width;
    float interval = 10;
    float itemWidth = (width - interval*4)/3;
    
    return CGSizeMake(itemWidth, 35);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
