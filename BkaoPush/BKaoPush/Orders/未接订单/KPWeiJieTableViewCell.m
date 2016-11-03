//
//  KPWeiJieTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/31.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPWeiJieTableViewCell.h"

@implementation KPWeiJieTableViewCell
{

    UILabel * peilabel;
    UIView *linView3;
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self caeateUI];
        
        
    }
    
    return self;
}

-(void)caeateUI
{
    
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TAP)];
//    //lineView.backgroundColor =KPGrayColor;
//    [self.contentView addSubview:lineView];
    
//    self.bianhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP, 0, 60, 64)];
//    self.bianhaoLab.font =[UIFont systemFontOfSize:35];
//    self.bianhaoLab.textColor =[UIColor blackColor];
//    //self.bianhaoLab.text =@"编号";
//    [self.contentView addSubview:self.bianhaoLab];
//    
//    
//    self.timelab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP , TAP, ScreenWidth*0.5-TAP , 20)];
//    self.timelab.font =AA_FONT;
//    [self.contentView addSubview:self.timelab];
//    
//    self.juliLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-TAP-70 , TAP, 70 , 20)];
//    self.juliLab.font =AA_FONT;
//    self.juliLab.textAlignment =NSTextAlignmentRight;
//    [self.contentView addSubview:self.juliLab];
//    
//    self.dingdanhaoLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bianhaoLab.frame)+TAP  , CGRectGetMaxY(self.timelab.frame), ScreenWidth-CGRectGetMaxX(self.bianhaoLab.frame)-48 , 20)];
//    self.dingdanhaoLab.font =AA_FONT;
//    [self.contentView addSubview:self.dingdanhaoLab];

//    UIView *linView1 =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
//    linView1.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
//    [self.contentView addSubview:linView1];
    [self cateateDataSource:nil];
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , 0, ScreenWidth-24 , 25)];
    self.nameLab.font =AA_FONT;
    [self.contentView addSubview:self.nameLab];
    
//    CGSize  size1 =[KPTool stringCGSize:@"这是个地址中江路天地软件园25👌3层中江路879弄天地软件园612532165312告8层上打快点撒开了多久卡机都是卡就" font:A_FONT width:ScreenWidth-(2*TAP) height:0];
//
    self.dizhiLab = [[UILabel alloc] init];
    
   // self.dizhiLab.lineBreakMode = UILineBreakModeWordWrap;
    self.dizhiLab.font =AA_FONT;
    self.dizhiLab.numberOfLines = 0;
    [self.contentView addSubview:self.dizhiLab];
    
    
    UIView *linView2 =[[UIView alloc] init];
    linView2.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView2];
    
//-------------------------------华丽的分割线-----------------------------------------------------------
    for (int i=0; i<3; i++) {
        
        
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , CGRectGetMaxY(linView2.frame)+45*i+6*i, (ScreenWidth-24)/2.0+5 , 25)];
        self.titleLab.font =AA_FONT;
        self.titleLab.tag = 10021+i;
        [self.contentView addSubview:self.titleLab];
        
        self.countLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame)+12 , CGRectGetMaxY(linView2.frame)+45*i+6*i, 40, 25)];
        self.countLab.font =AA_FONT;
        self.countLab.tag = 11021+i;
        [self.contentView addSubview:self.countLab];
        
        
        self.jiageLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-TAP-(ScreenWidth*0.3) , CGRectGetMaxY(linView2.frame)+45*i+6*i, ScreenWidth*0.3, 25)];
        self.jiageLab.font =AA_FONT;
        self.jiageLab.tag = 12021+i;
        self.jiageLab.textAlignment =NSTextAlignmentRight;
        [self.contentView addSubview:self.jiageLab];
        
        
        self.colorLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , CGRectGetMaxY(self.titleLab.frame)-5, ScreenWidth-24, 20)];
        self.colorLab.font =AA_FONT;
        self.colorLab.tag = 13021+i;
        [self.contentView addSubview:self.colorLab];
        
        linView3 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.colorLab.frame)+6, ScreenWidth, 1)];
        linView3.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [self.contentView addSubview:linView3];
        
        
    }
    
//-------------------------------华丽的分割线-----------------------------------------------------------
    
 
    
    self.zongshuLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , CGRectGetMaxY(linView3.frame), (ScreenWidth-36)*0.5, 40)];
    self.zongshuLab.font =AA_FONT;
    [self.contentView addSubview:self.zongshuLab];
    
    
    self.yunfeiLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-TAP-(ScreenWidth-36)*0.5 , CGRectGetMaxY(linView3.frame),(ScreenWidth-36)*0.5, 40)];
    self.yunfeiLab.font =AA_FONT;
    self.yunfeiLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.yunfeiLab];
    
    
    UIView *linView4 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.zongshuLab.frame), ScreenWidth, 1)];
    linView4.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView4];
    
    CGSize  size2 = [KPTool stringCGSize:@"备注备注北湖北湖备备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注注" font:A_FONT width:ScreenWidth-2*TAP height:0];
    self.beizhuLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP , CGRectGetMaxY(linView4.frame)+TAP,ScreenWidth-24 , size2.height)];
    self.beizhuLab.font =AA_FONT;
    self.beizhuLab.numberOfLines =0;
    [self.contentView addSubview:self.beizhuLab];
    
    UIView *linView5 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.beizhuLab.frame)+TAP, ScreenWidth, 1)];
    linView5.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView5];
    
    NSArray * arr = @[@"第三方配送",@"店铺自行配送"];
    NSArray  *yunarr =@[@"需支付运费：21元",@"需支付运费：21元"];

    
    for (int i=0; i<2; i++) {
        
        peilabel = [[UILabel alloc] initWithFrame:CGRectMake(TAP,CGRectGetMaxY(linView5.frame)+TAP+25*i , (ScreenWidth-48-30)/2, 20)];
        peilabel.text = arr[i];
        peilabel.font=AA_FONT;
        [self.contentView addSubview:peilabel];
        
        UILabel * yunlabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(peilabel.frame)+TAP,CGRectGetMaxY(linView5.frame)+TAP+25*i , (ScreenWidth-48-30)/2, 20)];
        yunlabel.text = yunarr[i];
        yunlabel.font =AA_FONT;
        [self.contentView addSubview:yunlabel];
        
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(ScreenWidth-36, CGRectGetMaxY(linView5.frame)+TAP+25*i, 20, 20);
            [button setImage:IMAGE(@"ceshiSele") forState:UIControlStateNormal];
            [button setImage:IMAGE(@"ceshiNoSele") forState:UIControlStateSelected];
            button.tag = 808+i;
            [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
        
        
    }
    
    UIView *linView6 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(peilabel.frame)+TAP, ScreenWidth, 1)];
    linView6.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView6];
    

    
    
    CGSize size3 = [KPTool stringCGSize:@"128888.00元" font:S_FONT width:0 height:40];
    
    self.zongjiaLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-size3.width-TAP-5,CGRectGetMaxY(linView6.frame)+TAP, size3.width, 30)];
    
    _zongjiaLab.font = SS_FONT;
    self.zongjiaLab.textColor =[UIColor redColor];
    _zongjiaLab.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:_zongjiaLab];
    
 
        self.zongjiaLab1 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-size3.width-TAP-75, CGRectGetMaxY(linView6.frame)+TAP,70, 30)];
        _zongjiaLab1.font = AA_FONT;
        _zongjiaLab1.text =@"总价:";
        _zongjiaLab1.textAlignment =NSTextAlignmentRight;
        [self.contentView addSubview:_zongjiaLab1];
    

    UIView *linView7 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.zongjiaLab.frame)+TAP, ScreenWidth, 1)];
    linView7.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView7];
    
    
    NSArray *titleArr1 =@[@"拒绝订单",@"确认订单",@"接单打印"];
    for (int i=0; i<3; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth-245+70*i+i*TAP, CGRectGetMaxY(linView7.frame)+TAP, 70, 30);
        [button setBackgroundColor:[UIColor redColor]];
        button.titleLabel.font =SS_FONT;
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:5.0];
        
        [button setTitle:titleArr1[i] forState:UIControlStateNormal];
        button.tag = 810+i;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
    }


    self.frame =CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(linView7.frame)+50);
    
}

-(void)cateateDataSource :(NSDictionary *)dic
{
    
//      CGSize  size1 =[KPTool stringCGSize:@"这是个地址中江路天地软件园25👌3层中江路879弄天地软件园612532165312告8层上打快点撒开了多久卡机都是卡就" font:A_FONT width:ScreenWidth-(2*TAP) height:0];
//    self.dizhiLab.frame=CGRectMake(TAP, CGRectGetMaxY(self.nameLab.frame), ScreenWidth-24 , size1.height);
    
    
    for (int i =0; i<3; i++) {
        
        NSArray *titlearr =@[@"Apple iPione  7 Plus  dasdas",@"Apple iPione  7 Plus  dasdas1",@"Apple iPione  7 Plus  dasdas2"];
        NSArray *shuliangArr =@[@"X 1",@"X 1",@"X 1"];
        NSArray *jiageArr =@[@"💰1277.00",@"💰12727.00",@"💰12377.00"];
        
        UILabel *lab1 =[self viewWithTag:10021+i];
        lab1.text =titlearr[i];
        
        UILabel *lab2 =[self viewWithTag:11021+i];
        lab2.text =shuliangArr[i];
        
        UILabel *lab3 =[self viewWithTag:12021+i];
        lab3.text =jiageArr[i];
        
        UILabel *lab4 =[self viewWithTag:13021+i];
        lab4.text =@"亮黑 深空灰色";
    }
    
    
//    self.bianhaoLab.text = @"#01";
//    self.timelab.text = @"下单时间 : 2016.09.32  11：25";
//    
//    self.juliLab.text = @"距离 :750M";
//    self.dingdanhaoLab.text = @"订单号： 4221421412515124141";
    self.nameLab.text = @"林志玲";
    self.dizhiLab.text = @"这是个地址中江路天地软件园25👌3层中江路879弄天地软件园612532165312告8层上打快点撒开了多久卡机都是卡就";

     self.zongshuLab.text = @"商品总数  2";
     self.yunfeiLab.text = @"运费 ：12.00";
     self.beizhuLab.text = @"备注备注北湖北湖备备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注注";
     self.zongjiaLab.text = @"12837.00元";
     self.nameLab.text = @"林志玲";
    
    
}

- (void) selectAction:(UIButton *)button
{
    for (int i=0; i<2; i++) {
        UIButton * button = [self.contentView viewWithTag:808+i];
        button.selected = NO;
    }
    
    button.selected = YES;
    
    
    [self.delegates KPLYSelectAction:button];

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
