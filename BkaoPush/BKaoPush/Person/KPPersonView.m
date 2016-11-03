//
//  KPPersonView.m
//  BKaoPush
//
//  Created by LY on 16/10/20.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPPersonView.h"

@implementation KPPersonView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
//        self.backgroundColor =[UIColor redColor];
    }
    
    return self;
}


-(void)createUI
{
  
    //NSDictionary *dicDian = dic[@"shopBean"];
    
    UIView *bgView1 =[[UIView alloc] init];
    bgView1.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView1];
    
    // 图片;
    
    
    UIImageView *titleIMV = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, ScreenWidth*0.25, ScreenWidth*0.25)];
//    [titleIMV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@",class.webRoot,dict[@"prodPict"]]] placeholderImage:IMAGE(@"ceshi.jpeg")];
//    
    titleIMV.image = [UIImage imageNamed:@"ceshi2.jpeg"];
    titleIMV.layer.cornerRadius = (ScreenWidth*0.25)/2.0;
    titleIMV.layer.masksToBounds = YES;
    titleIMV.layer.borderWidth = 0;
    titleIMV.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [bgView1 addSubview:titleIMV];
    
//    _photoIMV =[[UIImageView alloc] initWithFrame:frame];
//    _photoIMV.frame = frame;
//    _photoIMV.layer.cornerRadius = (ScreenWidth*0.4-20)/4.0;
//    _photoIMV.layer.masksToBounds = YES;
//    _photoIMV.layer.borderWidth = 2;
//    _photoIMV.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //标题
    
    UILabel *titlelab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMV.frame)+12, 12, ScreenWidth-12-24-ViewWidth(titleIMV)-65, 25)];
    //titlelab.text = @"微软公司";
    titlelab.tag = 8284;
    [bgView1 addSubview:titlelab];
    
    //经销商 姓名
    
    UILabel *jinglab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMV.frame)+12, CGRectGetMaxY(titlelab.frame)-5, ScreenWidth-CGRectGetMaxX(titleIMV.frame)-12-12, 25)];
    //jinglab.text = @"经销商: 猴赛雷";
    jinglab.font =SS_FONT;
    jinglab.tag = 8285;
    [bgView1 addSubview:jinglab];
    
    
    UILabel *lianxilab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMV.frame)+12, CGRectGetMaxY(jinglab.frame)-3, ScreenWidth-12-24-ViewWidth(titleIMV), 25)];
  //  lianxilab.text = @"联系电话: 15888888888";
    lianxilab.tag = 8286;
    lianxilab.font =SS_FONT;
   
    [bgView1 addSubview:lianxilab];
    
    //地址
    
    CGSize size5 =[KPTool stringCGSize:@"联系地址：中江路879弄天地软件园25号3层" font:S_FONT width:ScreenWidth-24-ViewWidth(titleIMV)-12 height:25];
    UILabel *dizhilab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleIMV.frame)+12, CGRectGetMaxY(lianxilab.frame), ScreenWidth-24-ViewWidth(titleIMV)-12, size5.height)];
    //dizhilab.numberOfLines =0;
//    dizhilab.text = @"联系地址：中江路879弄天地软件园25号3层";
    dizhilab.tag = 8287;
    dizhilab.font =SS_FONT;
    bgView1.frame =CGRectMake(0, 0, ScreenWidth, 24+ViewHeight(titlelab)+ViewHeight(jinglab)+ViewHeight(lianxilab)+ViewHeight(dizhilab));
    [bgView1 addSubview:dizhilab];
  
    
    CGSize size =[KPTool stringCGSize:@"详细信息" font:S_FONT width:0 height:20];
    UIButton * changeZiLiao =[UIButton buttonWithType:UIButtonTypeCustom];
    [changeZiLiao setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changeZiLiao.frame =CGRectMake(ScreenWidth-12-8-5-size.width, 12, size.width, 20);
    [changeZiLiao setTitle:@"详细信息" forState:UIControlStateNormal];
    changeZiLiao.tag =1278;
    [changeZiLiao addTarget:self action:@selector(AAchangeZiLiao:) forControlEvents:UIControlEventTouchUpInside];
    changeZiLiao.titleLabel.font =SS_FONT;
    
    [changeZiLiao setEnlargeEdgeWithTop:0 right:20 bottom:0 left:0];
    
    [bgView1 addSubview:changeZiLiao];
    
    
    UIImageView *btnIMA = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(changeZiLiao.frame)+1, 16, 8, 12)];
    btnIMA.image = [UIImage imageNamed:@"前进.png"];
    [bgView1 addSubview:btnIMA];
 
    UIView *lineView1 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView1.frame), ScreenWidth, TAP)];
    lineView1.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    [self addSubview:lineView1];
    
    
    UIView *tongZhiView = [[UIView alloc] init];
    tongZhiView.frame =CGRectMake(0, CGRectGetMaxY(lineView1.frame), ScreenWidth, 30);
    tongZhiView.backgroundColor = [UIColor whiteColor];
    [self addSubview:tongZhiView];
    
    UIView *lineView12 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tongZhiView.frame), ScreenWidth, TAP)];
    lineView12.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    [self addSubview:lineView12];
    
    //我的资金
    CGSize zijin1 = [KPTool stringCGSize:@"我的账户" font:15 width:0 height:0];
    UIView *bgview2 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView12.frame)+TAP, ScreenWidth,zijin1.height+36)];
    bgview2.backgroundColor = [UIColor whiteColor];
    //我的资金
    
    UILabel *zijin =[[UILabel alloc] initWithFrame:CGRectMake(12, 18, zijin1.width, zijin1.height)];
    zijin.text = @"我的账户";
    zijin.font =MM_FONT;
    [bgview2 addSubview:zijin];
    //查看全部 资金按钮
    UIButton *quanbubtn =[[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-84, 18, zijin1.width, zijin1.height)];
    
    [quanbubtn setTitle:@"查看全部" forState:UIControlStateNormal];
    quanbubtn.titleLabel.font = SS_FONT;
    quanbubtn.tag =1279;
    [quanbubtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quanbubtn addTarget:self action:@selector(AAquanbuaction:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgview2 addSubview:quanbubtn];
    
    [self addSubview:bgview2];
    
    UIView *lineView2 =[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgview2.frame), ScreenWidth, 2)];
    lineView2.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self addSubview:lineView2];
    
    
    UIView *BGview3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView2.frame)+2, ScreenWidth, 90)];
    BGview3.backgroundColor = [UIColor whiteColor];
    
  //  NSDictionary *dicz =dic[@"accountBean"];
    NSArray *arr1 =@[@"未结算",@"可用",@"可提现",@"总余额"];
   // NSArray  *dataArr =@[dicz[@"unsettled"],dicz[@"usable"],dicz[@"cash"],dicz[@"total"]];
    
    for (int i=0; i<4; i++) {
        
        if (i==3) {
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*0.1+ScreenWidth/4.0*0.9*i, 22, (ScreenWidth-25)/4.0*0.9+20, 20)];
            //label1.text = [NSString stringWithFormat:@"1500"];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.font = SS_FONT;
            label1.tag = 8280+i;
            [BGview3 addSubview:label1];
    
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*0.1+ScreenWidth/4.0*0.9*i, CGRectGetMaxY(label1.frame)+6, (ScreenWidth-25)/4.0*0.9+20, 20)];
            label2.text = arr1[i];
            label2.textAlignment = NSTextAlignmentCenter;
            label2.font = SS_FONT;
            [BGview3 addSubview:label2];
            
        }else{
            
            UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*0.1+ScreenWidth/4.0*0.9*i, 22, (ScreenWidth-25)/4.0*0.9, 20)];
            label1.textAlignment = NSTextAlignmentCenter;
            label1.font = SS_FONT;
            label1.textColor =[UIColor redColor];
            label1.tag = 8280+i;
            [BGview3 addSubview:label1];
            
        
            UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*0.1+ScreenWidth/4.0*0.9*i, CGRectGetMaxY(label1.frame)+6, (ScreenWidth-25)/4.0*0.9, 20)];
            label2.text = arr1[i];
            label2.textAlignment = NSTextAlignmentCenter;
            label2.font = SS_FONT;
            [BGview3 addSubview:label2];
        }
        
        
    }
    ///线
    UIView *xianview = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*0.1+ScreenWidth/4.0*0.9*3, -2, 2, 92)];
    xianview.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [BGview3 addSubview:xianview];
    
    UIView *lineview3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(BGview3.frame), ScreenWidth, 12)];
    lineview3.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    
    [self addSubview:lineview3];
    
    UIView *bgview4 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineview3.frame)+12, ScreenWidth,15+15+((ScreenWidth-120)/4.0+50)*2)];
    NSArray * arr3 = @[@"店铺公告",@"营业规则",@"配送管理",@"我的会员",@"账号管理",@"关注二维码",@"帮助中心",@"联系客服"];
    NSArray *imgarr =@[@"个人中心_公告编辑",@"个人中心_营业规则",@"个人中心_配送管理",@"个人中心_会员",@"个人中心_账户管理",@"个人中心_关注二维码",@"个人中心_帮助中心",@"个人中心_帮助中心"];
    for (int i=0; i<arr3.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15+((ScreenWidth-120)/4.0+30)*(i%4), 15+((ScreenWidth-120)/4.0+50)*(i/4), (ScreenWidth-120)/4.0, (ScreenWidth-120)/4.0);
        button.tag = 1177+i;
//        button.backgroundColor = [UIColor redColor];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imgarr[i]]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(AAbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgview4 addSubview:button];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4.0*(i%4),CGRectGetMaxY(button.frame) , ScreenWidth/4.0, 40)];
        label.text = arr3[i];
        //  label.textColor =[UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = SS_FONT;
        

        [bgview4 addSubview:label];
        

    }
    
    
    [self addSubview:BGview3];
    [self addSubview:bgview4];
    
    
    
    
  
    self.frame =CGRectMake(0, 0, ScreenWidth,CGRectGetMaxY(bgview4.frame)+10);
    
}
-(void)creteDateSoucre:(NSDictionary *)dic
{
    for (int i=0; i<8; i++) {
        //@"未结算",@"可用",@"可提现",@"总余额"
        UILabel *lable =[self viewWithTag:8280+i];
        switch (lable.tag) {
            case 8280:{
//                lable.text =@"";
               
                NSDictionary *dictt = dic[@"accountBean"];
                NSString *str =[NSString stringWithFormat:@"%.2f",[dictt[@"unsettled"] floatValue]];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:15] range:NSMakeRange(0,str.length-2)];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:10] range:NSMakeRange(str.length-2,2)];
                [lable setAttributedText:attrString];
            }
                break;
            case 8281:{
                NSDictionary *dictt = dic[@"accountBean"];
                NSString *str =[NSString stringWithFormat:@"%.2f",[dictt[@"usable"] floatValue]];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:15] range:NSMakeRange(0,str.length-2)];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:10] range:NSMakeRange(str.length-2,2)];
                [lable setAttributedText:attrString];
            }
                break;
            case 8282:{
                NSDictionary *dictt = dic[@"accountBean"];
                NSString *str =[NSString stringWithFormat:@"%.2f",[dictt[@"cash"] floatValue]];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:15] range:NSMakeRange(0,str.length-2)];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:10] range:NSMakeRange(str.length-2,2)];
                [lable setAttributedText:attrString];
            }
                break;
            case 8283:{
                NSDictionary *dictt = dic[@"accountBean"];
                NSString *str =[NSString stringWithFormat:@"%.2f",[dictt[@"total"] floatValue]];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:15] range:NSMakeRange(0,str.length-2)];
                [attrString addAttribute:NSFontAttributeName value:[KPTool systemFontS:10] range:NSMakeRange(str.length-2,2)];
                [lable setAttributedText:attrString];
            }
                break;
            case 8284:{
                
                NSDictionary *dictt = dic[@"shopBean"];
                lable.text =[NSString stringWithFormat:@"%@",dictt[@"bossName"]];
            }
                break;
            case 8285:{
                NSDictionary *dictt = dic[@"shopBean"];
                lable.text =[NSString stringWithFormat:@"经销商 :%@",dictt[@"bossName"]];
            }
                break;
            case 8286:{
                NSDictionary *dictt = dic[@"shopBean"];
                lable.text =[NSString stringWithFormat:@"联系电话 :%@",dictt[@"phone"]];
            }
                break;
            case 8287:{
                
                NSDictionary *dictt = dic[@"shopBean"];
                lable.text =[NSString stringWithFormat:@"联系地址 :%@",dictt[@"busiAddr"]];
            }
                break;
                
            default:
                break;
        }
    }
    
   
    
    
}

-(void)AAbuttonClick:(UIButton *)button
{
   
    [self.delegates  KPPersonbuttonClick:button];
}

-(void)AAquanbuaction:(UIButton *)button
{
     [self.delegates  KPPersonbuttonClick:button];

}

- (void)AAchangeZiLiao:(UIButton *) button{

     [self.delegates  KPPersonbuttonClick:button];
   
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
