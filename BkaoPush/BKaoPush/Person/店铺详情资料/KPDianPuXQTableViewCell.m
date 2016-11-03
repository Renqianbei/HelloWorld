//
//  KPDianPuXQTableViewCell.m
//  BKaoPush
//
//  Created by LY on 16/10/22.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPDianPuXQTableViewCell.h"

@implementation KPDianPuXQTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
      
        [self createDataSoucre];
        
    }
    return self;
}

-(void)createDataSoucre
{
    self.titelLab1 =[[UILabel alloc] initWithFrame:CGRectMake(12, 12, (ScreenWidth-36)/2, 30)];
    self.titelLab1.font =SS_FONT;
    [self.contentView addSubview:self.titelLab1];
  
    
    self.titleLab2 =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titelLab1.frame)+12, 12,(ScreenWidth-36)/2 , 30)];
    self.titleLab2.font =SS_FONT;
    self.titleLab2.textAlignment =NSTextAlignmentRight;
    [self.contentView addSubview:self.titleLab2];
    
  
    for (int i=0; i<2; i++) {
        
        for (int j =0; j<3; j++) {
            
            self.zhengMinIMG = [[UIImageView alloc] init];
            self.zhengMinLab = [[UILabel alloc] init];
            
            self.zhengMinIMG.frame = CGRectMake(30+(ScreenWidth-120)/3.0*j+30*j, 12+(ScreenWidth-120)/3.0*i+25*i, (ScreenWidth-120)/3.0, (ScreenWidth-120)/3.0);
            
            self.zhengMinLab.frame = CGRectMake(30+(ScreenWidth-120)/3.0*j+30*j, CGRectGetMaxY(self.zhengMinIMG.frame)-5,(ScreenWidth-120)/3.0 , 30);
            self.zhengMinLab.font =SS_FONT;
            self.zhengMinLab.textAlignment =NSTextAlignmentCenter;
            
            [self.contentView addSubview:self.zhengMinLab];
            [self.contentView addSubview:self.zhengMinIMG];
            
     
            
        }
        
    }
 
    
}
-(void)creatrui:(NSDictionary *)dic NSindexPath :(NSIndexPath *)indexPath
{
    self.zhengMinLab.hidden =YES;
    self.zhengMinIMG.hidden =YES;
    self.titelLab1.hidden   =YES;
    self.titleLab2.hidden   =YES;
    
    if (indexPath.section ==2) {

        self.zhengMinLab.hidden =NO;
        self.zhengMinIMG.hidden =NO;
        self.zhengMinLab.text=@"营业执照";
      
        self.zhengMinIMG.image =[UIImage imageNamed:@"ceshi.jpeg"];
    }else{
    
        self.titelLab1.hidden   =NO;
        self.titleLab2.hidden   =NO;
        self.titelLab1.text = @"姓名";
        self.titleLab2.text = @"林志玲";
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
