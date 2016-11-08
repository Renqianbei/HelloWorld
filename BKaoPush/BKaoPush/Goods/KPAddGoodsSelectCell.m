//
//  KPAddGoodsSelectCell.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPAddGoodsSelectCell.h"
#define ButtonWidth  100
@implementation KPAddGoodsSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(KPNewGoodsCellTypeModel *)model{
    [super setModel:model];
    [self refreshView];
}
-(void)refreshView{
    self.title.text = self.model.title;
    self.ToTopConstrant.constant = self.model.topToView?[self.model.topToView floatValue]:10;
    //清除原来的图片
    NSArray * subViews = self.scrollView.subviews;
    for (UIView * sub in  subViews) {
        [sub removeFromSuperview];
    }
    
    //创建可选的button
    float height = 35;
    float interval = 10;
    self.scrollView.contentSize =  CGSizeMake((ButtonWidth+interval)*self.model.contents.count + interval ,height );
    int i = 0;
    for (NSString * contenttitle in self.model.contents) {
        KPGoodsCommonButton * button  = [[KPGoodsCommonButton alloc] initWithFrame:CGRectMake((ButtonWidth+interval)*i, 0, ButtonWidth, height)];
        [button configureSetings];
        [button setTitle:contenttitle forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.layer.borderWidth = 1;

        if ([self.model.selectContents containsObject:contenttitle]) {
            button.selected = YES;
            button.layer.borderColor = [UIColor clearColor].CGColor;

        }
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
          button.tag = i++;
        [self.scrollView addSubview:button];
    }
}

- (void)clickButton:(UIButton *)sender{
    

    //判断是否允许多选 不允许 需要把其它置为非选中状态
    if (!self.model.allowMutSelect) {//不允许多选
        for (UIButton  * sub in self.scrollView.subviews) {
            if ([sub isKindOfClass:[KPGoodsCommonButton class]]) {
                sub.layer.borderColor = [UIColor blackColor].CGColor;
                sub.selected = NO;
            }
        }
        [self.model.selectContents removeAllObjects];//清空选中数组
    }
    
    
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        sender.layer.borderColor = [UIColor clearColor].CGColor;

        [self.model.selectContents addObject:self.model.contents[sender.tag]];
    }else{
        sender.layer.borderColor = [UIColor blackColor].CGColor;
        [self.model.selectContents removeObject:self.model.contents[sender.tag]];
    }
    

    
    //让选中的button滚动中间
    CGRect scrollviewFrame = self.scrollView.frame;
    float buttonOriginx = sender.frame.origin.x;
    CGPoint point = CGPointMake(0, 0);
    if (buttonOriginx>scrollviewFrame.size.width/2) {
        
        point.x = buttonOriginx - scrollviewFrame.size.width/2 + sender.frame.size.width/2;
    }
    
    [self.scrollView setContentOffset:point animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(mutSelectStatusChange)] ) {
        [self.delegate mutSelectStatusChange];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
