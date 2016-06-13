//
//  Product.h
//  彩票练习
//
//  Created by 薛林 on 16/5/31.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "title": "有道词典",
 "stitle":"最好用的免费全能翻译软件",
 "id": "youdaoPro",
 "url": "http://itunes.apple.com/app/id353115739?mt=8",
 "icon": "youdao",
 "customUrl": "yddictProapp"
 */

@interface Product : NSObject
//声明和json文件中同名的属性

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *stitle;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *url;
@property (copy,nonatomic) NSString *icon;
@property (copy,nonatomic) NSString *customUrl;

//声明类方法和对象方法

+ (instancetype)productWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
