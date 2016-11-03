//
//  KPFaPiaoSheDingTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/28.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPFaPiaoSheDingTableViewCell.h"

@implementation KPFaPiaoSheDingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    self.titleIMG =[[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 70, 70)];
    
    [self.contentView addSubview:self.titleIMG];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, 0, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.titleLab.font = MM_FONT;
    [self.contentView addSubview:self.titleLab];
    
    self.YanseLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.titleLab.frame)-10, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.YanseLab.font = SS_FONT;
    [self.contentView addSubview:self.YanseLab];
    
    self.miaoShuLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.YanseLab.frame)-10, ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24, 30)];
    self.miaoShuLab.font = [UIFont systemFontOfSize:8];
    [self.contentView addSubview:self.miaoShuLab];
    
    self.shouJiaLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleIMG.frame)+12, CGRectGetMaxY(self.miaoShuLab.frame)-10, (ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24)/2.0, 30)];
    self.shouJiaLab.font = SS_FONT;
    self.shouJiaLab.textColor =[UIColor redColor];
    [self.contentView addSubview:self.shouJiaLab];
    
    
    //库存
    self.kuCunLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.shouJiaLab.frame), CGRectGetMaxY(self.miaoShuLab.frame)-10, (ScreenWidth-CGRectGetMaxX(self.titleIMG.frame)-24)/2.0, 30)];
    self.kuCunLab.font = SS_FONT;
    
    [self.contentView addSubview:self.kuCunLab];
    
    self.faPiaoBtn =[[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-42, 44-15, 30, 30)];
    [self.faPiaoBtn setImage:IMAGE(@"选框2") forState:UIControlStateNormal];
    [self.faPiaoBtn setImage:IMAGE(@"选框2_选中") forState:UIControlStateSelected];
    [self.faPiaoBtn setEnlargeEdgeWithTop:5 right:5 bottom:5 left:5];
    [self.faPiaoBtn addTarget:self action:@selector(KPFaPiaoPinLeiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.faPiaoBtn];
    
}
-(void)KPFaPiaoPinLeiAction:(UIButton *)button
{
    
    [self.delegates KPLYFaPiaoSheDingAction:button];
}


-(void)createDataSoucre:(NSDictionary *)dic NSindexPath:(NSIndexPath *)indexPath iSselect:(BOOL)isSelect
{
    
    [self.faPiaoBtn setKpIndexPath:indexPath];
    
    self.faPiaoBtn.selected =isSelect;
    
    self.titleIMG.image = [UIImage imageNamed:@"ceshi.jpeg"];
    self.titleLab.text =@"Apple iPhone 7 Plue (A1524)128GB";
    self.YanseLab.text =@"亮黑";
    self.miaoShuLab.text=@"这是一堆商品描述";
    self.shouJiaLab.text =[NSString stringWithFormat:@"售价: 8888.00"];
    self.kuCunLab.text =[NSString stringWithFormat:@"库存: 890"];
    
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
