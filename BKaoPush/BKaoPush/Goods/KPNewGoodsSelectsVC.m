//
//  KPNewGoodsSelectsVC.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/6.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPNewGoodsSelectsVC.h"
#import "KPGoodsThirdCell.h"
#import "KPCollectionHeaderView.h"
#import "KPAddGoodsDetailViewController.h"
#import "KPMutAddGoodsDetailViewController.h"
static NSString * collectionCellID = @"cellID";
static NSString * collectionHeaderId = @"collectionHeaderId";
@interface KPNewGoodsSelectsVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation KPNewGoodsSelectsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftBarButtonItem];
    [self setMyTitle:@"新增商品"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"KPGoodsThirdCell" bundle:nil] forCellWithReuseIdentifier:collectionCellID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"KPCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderId];
    [self.collectionView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.model.nextModels.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(collectionView.frame.size.width, 60);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    KPCollectionHeaderView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionHeaderId forIndexPath:indexPath];
    
    return view;
    
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KPGoodsThirdCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    KPSelectModel * model = self.model.nextModels[indexPath.item];
    
    [cell.button setTitle:model.title forState:UIControlStateNormal];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float width = collectionView.frame.size.width - 2*10 ;
    float interval = 10;
    float itemWidth = (width - interval*4)/3;
    
    return CGSizeMake(itemWidth, 35);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KPSelectModel * model  = self.model.nextModels[indexPath.item];
    
//    KPAddGoodsDetailViewController * vc = [[KPAddGoodsDetailViewController alloc] init];
//    vc.model = model;
    KPMutAddGoodsDetailViewController * mutVC = [[KPMutAddGoodsDetailViewController alloc] init]; //可以多选的控制器
    mutVC.model = model;
    [self.navigationController pushViewController:mutVC animated:YES];
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
