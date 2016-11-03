//
//  KPZhuYingTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/24.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZhuYingTableViewCell.h"

@implementation KPZhuYingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self dataSoucre];
       
    }
    
    return self;
}
-(void)createUI:(NSDictionary *)dict Nsindex:(NSIndexPath *)indexPath iSelect:(BOOL)isSelect
{

   
    [self.feiLeiBtn setKpIndexPath:indexPath];
     self.feiLeiBtn.selected =isSelect;
    
    self.fenLeiLab.text = @"分类";
   
    
}
-(void)FenLeiAciton:(UIButton *)button
{
    button.selected = !button.selected;
    [self.delegates KPZhuYingGuiGeClick:button];
    
}
-(void)dataSoucre
{

    self.fenLeiLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, ScreenWidth-24-50, 30)];
    self.fenLeiLab.font =MM_FONT;
    //self.fenLeiLab.text = @"类别1";
    [self.contentView addSubview:self.fenLeiLab];
    
    self.feiLeiBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-24-20, 12, 30, 30)];
     [self.feiLeiBtn addTarget:self action:@selector(FenLeiAciton:) forControlEvents:UIControlEventTouchUpInside];
    [self.feiLeiBtn setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
    [self.feiLeiBtn setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
    [self.feiLeiBtn setEnlargeEdgeWithTop:5 right:5 bottom:5 left:ScreenWidth-40];
    [self.contentView addSubview:self.feiLeiBtn];
    
    
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
