//
//  KPFaPiaoPinLeiTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/27.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoPinLeiTableViewCell.h"

@implementation KPFaPiaoPinLeiTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       [self createUI];
    }
    
    return self;
}

- (void) createUI
{
    self.titlePinLeiLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, ScreenWidth-24-42, 40)];
    self.titlePinLeiLab.font =MM_FONT;
    [self.contentView addSubview:self.titlePinLeiLab];
    
    self.pinLeiBtn =[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titlePinLeiLab.frame), 5, 30, 30)];
    [self.pinLeiBtn setImage:IMAGE(@"选框2") forState:UIControlStateNormal];
    [self.pinLeiBtn setImage:IMAGE(@"选框2_选中") forState:UIControlStateSelected];
    [self.pinLeiBtn setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-40];
    [self.pinLeiBtn addTarget:self action:@selector(KPFaPiaoPinLeiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.pinLeiBtn];
    
    

    
}
-(void)createDateSoucre:(NSDictionary *)dic: (NSIndexPath *) indexPath isSelect:(BOOL)isSelect
{
    [self.pinLeiBtn setKpIndexPath:indexPath];
    
    self.titlePinLeiLab.text = @"品类";
    
    self.pinLeiBtn.selected =isSelect;

}
-(void)KPFaPiaoPinLeiAction:(UIButton *)button
{
    [self.delegates KPFaPiaoPinLeiAction:button];
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
