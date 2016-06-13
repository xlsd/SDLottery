//
//  HZXHelp.m
//  彩票练习
//
//  Created by 薛林 on 16/6/1.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXHelp.h"

@implementation HZXHelp
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}


+ (instancetype)helpWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
@end
