//
//  ShouHouModel.m
//  BKaoPush
//
//  Created by njxh on 16/10/26.
//  Copyright © 2016年 shanghai kaoPush. All rights reserved.
//

#import "ShouHouModel.h"

@implementation ShouHouModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.order = dictionary[@"order"];
        self.apply = dictionary[@"apply"];
        self.require = dictionary[@"require"];
        self.trade = dictionary[@"trade"];
        //判断cell的高度，通过看字段里面是否含有result字段
        self.cellHeight = [self calculateCellHeightWithHaveResult:[self judgeHaveKeyWithDictionary:dictionary]];
        
    }
    return self;
}

- (CGFloat)calculateCellHeightWithHaveResult:(BOOL)haveResult
{
    if (haveResult) {
        return 200;
    }
    else {
        return 160;
    }
}
- (BOOL)judgeHaveKeyWithDictionary:(NSDictionary *)dictionary
{
    self.result = @"";
    for (NSString *string in dictionary) {
        if ([string isEqualToString:@"result"]) {
            if (dictionary[string] == nil && [dictionary[string] isEqualToString:@""]) {
                return NO;
            }
            self.result = dictionary[string];
            return YES;
        }
    }
    return NO;
}

@end
