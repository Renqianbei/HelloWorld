//
//  KPSelectModels.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/6.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPSelectModel : NSObject
@property(nonatomic,copy)NSString * title;
//具体数据需要加入其它属性
    
@property(nonatomic,strong)NSMutableArray * nextModels;//里面是 KPSelectModel

@property(nonatomic,assign)BOOL isSelect;//第一级的时候需要自己初始化状态
    
    
@end
