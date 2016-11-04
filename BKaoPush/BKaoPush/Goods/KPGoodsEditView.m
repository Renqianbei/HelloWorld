//
//  KPGoodsEditView.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/3.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPGoodsEditView.h"
#define  SubViewImageHeight 60    //去xib上看

@interface KPGoodsEditView()<UITextFieldDelegate>
@property(nonatomic,strong)void(^clickSure)();
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *goodsDesc;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextField *count;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (strong, nonatomic)UIView * view;

@end

@implementation KPGoodsEditView

+(instancetype)editViewWithModel:(KPGoodSellModel*)model {
    
    KPGoodsEditView * editowner = [[KPGoodsEditView alloc] init];
    editowner.model = model;
    editowner.frame = ScreenRect;
    
    UIButton  * grayView = [[UIButton alloc] initWithFrame:ScreenRect];//黑色背景
    [grayView addTarget:editowner action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
    grayView.backgroundColor = [UIColor blackColor];
    grayView.alpha  = 0.7;
    [editowner addSubview:grayView];
    
    editowner.view  = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:editowner options:nil].firstObject;
    editowner.sureButton.layer.cornerRadius = 4;
    editowner.sureButton.backgroundColor = KPYellowColor;
    editowner.sureButton.layer.masksToBounds = YES;
    [editowner refreshView];//给视图添加文字
    
    //计算可变行的高度 如果超过图片高度以图片为准
    CGSize size = [KPTool stringCGSize:model.title font:L_FONT width:editowner.frame.size.width - 70 - 10 height:500];
    if (size.height > SubViewImageHeight) {
        CGRect frame = editowner.view.frame;
        frame.size.height  += size.height - SubViewImageHeight + 10;
        editowner.view.frame = frame;
    }
    
    
    [editowner addSubview:editowner.view];
    return editowner;
}


//确认修改
- (IBAction)clickButton:(id)sender {
    if (_clickSure) {
        self.clickSure();
    }
    //更改修改后的信息
    self.model.goodDescrip = self.goodsDesc.text;
    self.model.price = self.price.text;
    self.model.totalCount = self.count.text;
    
    [self hideView];
}

-(void)refreshView{
    self.title.text = _model.title;
    self.goodsDesc.text = _model.goodDescrip;
    self.price.text =_model.price;
    self.count.text = _model.totalCount;
    
}

-(void)showinView:(UIView *)view Andcomplete:(void(^)())clickSure {
    self.clickSure = clickSure;

//    UIView * view = [UIApplication sharedApplication].keyWindow;
    float height = self.view.frame.size.height;
    
    CGRect frame = self.view.frame;
    frame.origin.y = view.bounds.size.height - height;
    
    CGRect startFrame = frame;
    startFrame.origin.y = view.bounds.size.height + 10;
    
    self.view.frame = startFrame;
    
    [view addSubview:self];

    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = frame;
    }];
    
}

- (IBAction)hideView{
//    UIView * view = [UIApplication sharedApplication].keyWindow;
    CGRect frame = self.view.frame;
    frame.origin.y += frame.size.height + 10;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma  mark TextFieldDelegate


@end
