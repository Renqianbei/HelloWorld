//
//  KPNewGoodsCellTypeModel.h
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPNewGoodsCellTypeModel : NSObject
//标题
@property(nonatomic,copy)NSString * title;
//内容
@property(nonatomic,copy)NSString * content;


//只跟使用cell样式相关
@property(nonatomic,copy)NSString * CellID;


//SelectCellID选中样式专用
@property(nonatomic,strong)NSArray *contents;//显示的可选内容
@property(nonatomic,strong)NSMutableSet * selectContents;//被选中的内容
@property(nonatomic,assign)BOOL  allowMutSelect;//是否允许多选 默认为NO 只有内存允许多选

//ImageShowCellID 专用
@property(nonatomic,strong)NSArray * imageUrls;

//EditCellID专用
@property(nonatomic,assign)BOOL showButton;//是否显示 分别设置按钮
@property(nonatomic,copy)NSString * placeHolder;
@property(nonatomic,assign)BOOL isOption; //是否是选填 默认是必填
@property(nonatomic,assign)UIKeyboardType  keyboardType;



+(instancetype)modelWithCellID:(NSString * )cellID title:(NSString*)title content:(NSString*)content;
+(instancetype)modelWithCellID:(NSString * )cellID title:(NSString*)title content:(NSString*)content placehHoderContent:(NSString *)placeHolder;

@end
