//
//  KPInvoiceHeader.h
//  BKaoPush
//
//  Created by LY on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KPInvoiceBtnActiondelegate <NSObject>

-(void)KPInvoiceBtnAction:(UIButton *)btn;

@end

@interface KPInvoiceHeader : UIView

@property(nonatomic,assign)id<KPInvoiceBtnActiondelegate>delegates;

@property(nonatomic,retain)UILabel *titleLab;
@property(nonatomic,retain)UIButton *imageBtn;
@end
