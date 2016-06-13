//
//  Product.m
//  彩票练习
//
//  Created by 薛林 on 16/5/31.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "Product.h"

@implementation Product
//字典转模型中的属性
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.icon = dict[@"icon"];
        self.url = dict[@"url"];
        self.customUrl = dict[@"customUrl"];
        self.ID = dict[@"id"];
    }
    return self;
}

//提供类方法
+ (instancetype) productWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

@end
