//
//  KPZiYouTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/11/1.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPZiYouTableViewCell.h"

@implementation KPZiYouTableViewCell
{
    
    UILabel * peilabel;
    UIView  *linView3;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self caeateUI1];
        
        
    }
    
    return self;
}

-(void)caeateUI1
{
    
    
    
    
    self.zhuangtaiLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , TAP, ScreenWidth-2*TAP , 20)];
    self.zhuangtaiLab.font =SS_FONT;
    self.zhuangtaiLab.textColor = [UIColor blueColor];
    [self.contentView addSubview:self.zhuangtaiLab];
    
    UIView *linView111 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.zhuangtaiLab.frame)+TAP, ScreenWidth, 1)];
    
    linView111.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView111];
    
    
    
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , CGRectGetMaxY(linView111.frame), ScreenWidth-24 , 25)];
    self.nameLab.font =AA_FONT;
    [self.contentView addSubview:self.nameLab];
    
    CGSize  size1 =[KPTool stringCGSize:@"这是个地址中江路天地软件园25👌3层中江路879弄天地软件园612532165312告8层上打快点撒开了多久卡机都是卡就" font:A_FONT width:ScreenWidth-(2*TAP) height:0];
    
    self.dizhiLab = [[UILabel alloc] initWithFrame:CGRectMake(TAP  , CGRectGetMaxY(self.nameLab.frame), ScreenWidth-24 , size1.height)];
    // self.dizhiLab.lineBreakMode = UILineBreakModeWordWrap;
    self.dizhiLab.font =AA_FONT;
    self.dizhiLab.numberOfLines = 0;
    [self.contentView addSubview:self.dizhiLab];
    
    
    UIView *linView2 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dizhiLab.frame)+TAP, ScreenWidth, 1)];
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
    
    /////这必须计算Lab宽度
    CGSize size3 = [KPTool stringCGSize:@"128888.00元" font:M_FONT width:0 height:40];
    
    //第三方运费价钱
    
    self.disanjiaqian = [[UILabel alloc] initWithFrame:CGRectMake(TAP , CGRectGetMaxY(linView4.frame),ScreenWidth-2*TAP, 20)];
    self.disanjiaqian.font =AA_FONT;
    self.disanjiaqian.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.disanjiaqian];
    
    //快递详情
    self.disanfang = [[UILabel alloc] initWithFrame:CGRectMake(TAP , CGRectGetMaxY(self.disanjiaqian.frame),ScreenWidth-2*TAP, 20)];
    self.disanfang.font =AA_FONT;
    self.disanfang.textColor =[UIColor blueColor];
    self.disanfang.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.disanfang];
    
    
    
    UIView *linView5 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.disanfang.frame), ScreenWidth, 1)];
    linView5.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.contentView addSubview:linView5];
    
    
    
    
    self.zongjiaLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-size3.width-TAP-5,CGRectGetMaxY(linView5.frame), size3.width, 40)];
    _zongjiaLab.font = MM_FONT;
    self.zongjiaLab.textColor =[UIColor redColor];
    _zongjiaLab.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:_zongjiaLab];
    
    
    self.zongjiaLab1 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-size3.width-TAP-50, CGRectGetMaxY(linView5.frame),50, 40)];
    _zongjiaLab1.font = SS_FONT;
    _zongjiaLab1.text =@"总价:";
    _zongjiaLab1.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:_zongjiaLab1];
    
    
    
    
    self.frame =CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(self.zongjiaLab.frame)+10);
    
}

-(void) createDataSource:(NSDictionary *)dic
{
    
        
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
        
        
        self.bianhaoLab.text = @"#01";
        self.timelab.text = @"下单时间 : 2016.09.32  11：25";
        
        self.juliLab.text = @"距离 :750M";
        self.dingdanhaoLab.text = @"订单号： 4221421412515124141";
        self.nameLab.text = @"林志玲";
        self.dizhiLab.text = @"这是个地址中江路天地软件园25👌3层中江路879弄天地软件园612532165312告8层上打快点撒开了多久卡机都是卡就";
        
        self.zongshuLab.text = @"商品总数  2";
        self.yunfeiLab.text = @"运费 ：12.00";
        self.beizhuLab.text = @"备注备注北湖北湖备备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注备注备注北湖北湖备注注";
        self.zongjiaLab.text = @"12837.00元";
        self.nameLab.text = @"林志玲";
        
        self.zhuangtaiLab.text = @"正在退货中(这是一个状态)";
        
        self.disanfang.text =@"人人快递   配送员: 林志玲    联系方式:18888888888";
        
        self.disanjiaqian.text =[NSString stringWithFormat:@"需要支付运费: 💰12.00"];
        

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
