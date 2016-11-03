//
//  ShowPhotoViewController.m
//  BKaoPush
//
//  Created by njxh on 16/10/30.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShowPhotoViewController.h"
#import "PhotoCollectionViewCell.h"
@interface ShowPhotoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ShowPhotoViewController
{
    UICollectionView *_photoCollectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createCustomUI];
}

- (void)createCustomUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(ScreenWidth, ScreenWidth);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth) collectionViewLayout:flowLayout];
    _photoCollectionView.backgroundColor = [UIColor whiteColor];
    _photoCollectionView.dataSource = self;
    _photoCollectionView.delegate = self;
    _photoCollectionView.pagingEnabled = YES;
    _photoCollectionView.showsHorizontalScrollIndicator = NO;
    [_photoCollectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_photoCollectionView];
    
    _photoCollectionView.contentOffset = CGPointMake(ScreenWidth *_index, 0);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_myDataSource) {
        return _myDataSource.count;
    }
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (_myDataSource) {
        cell.photoImageView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        cell.indexLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    }
    return cell;
}

@end
