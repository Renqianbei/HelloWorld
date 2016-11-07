//
//  KPAddGoodsImageShowCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddGoodsImageShowCell.h"
#define ImageWidth 60
#define  ButtonTag 20
@implementation KPAddGoodsImageShowCell
-(void)setModel:(KPNewGoodsCellTypeModel *)model{
    [super setModel:model];
    [self refreshView];
}
-(void)refreshView{
    
    //清楚原来的图片
    NSArray * subViews = self.scrollView.subviews;
    for (UIView * sub in  subViews) {
        [sub removeFromSuperview];
    }
    
    float height = self.scrollView.frame.size.height;
    float interval = 10;
    self.scrollView.contentSize =  CGSizeMake((ImageWidth+interval)*self.model.imageUrls.count + interval ,height );
    int i = 0;
    for (NSString * imageUrl in self.model.imageUrls) {
        UIButton * button  = [[UIButton alloc] initWithFrame:CGRectMake((ImageWidth+interval)*i, 0, ImageWidth, 70)];
        button.tag = i++;
        [button sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal]; //设置图片
        [button addTarget:self action:@selector(clickimage:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor redColor]];
        [self.scrollView addSubview:button];
    }
}

- (void)clickimage:(UIButton *)sender{
    NSInteger index = sender.tag ;

    
    if ([self.delegate respondsToSelector:@selector(clickSmallImageWithModel:andIndex:andview:)]) {
        [self.delegate clickSmallImageWithModel:self.model andIndex:index andview:sender];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
