//
//  HZXHelp.h
//  彩票练习
//
//  Created by 薛林 on 16/6/1.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZXHelp : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (instancetype)helpWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
