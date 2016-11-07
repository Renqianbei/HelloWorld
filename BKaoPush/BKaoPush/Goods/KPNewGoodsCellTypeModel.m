//
//  KPNewGoodsCellTypeModel.m
//  BKaoPush
//
//  Created by 任前辈 on 2016/11/7.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "KPNewGoodsCellTypeModel.h"

@implementation KPNewGoodsCellTypeModel
+(instancetype)modelWithCellID:(NSString * )cellID title:(NSString*)title content:(NSString*)content{
    
    KPNewGoodsCellTypeModel * mm = [self modelWithCellID:cellID title:title content:content placehHoderContent:nil];
    return mm;
}

+(instancetype)modelWithCellID:(NSString * )cellID title:(NSString*)title content:(NSString*)content placehHoderContent:(NSString *)placeHolder{
    KPNewGoodsCellTypeModel * mm = [[KPNewGoodsCellTypeModel alloc] init];
    mm.CellID = cellID;
    mm.title = title;
    mm.content = content;
    mm.placeHolder = placeHolder;
    return mm;
}

-(NSMutableSet *)selectContents{
    
    if (_selectContents == nil) {
        _selectContents = [NSMutableSet set];
        
    }
    return  _selectContents;
}

-(NSString *)content{
    
    if (_content) {
        _content = [self qukongWith:_content];
    }
    return _content;
}

-(NSString *)qukongWith:(NSString*)string{
    
    if ([string hasPrefix:@" "]) {
        string = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        string =  [self qukongWith:string];
    }else{
        return string;
    }
    
    return string;
}


@end
