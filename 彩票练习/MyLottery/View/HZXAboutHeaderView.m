//
//  HZXAboutHeaderView.m
//  彩票练习
//
//  Created by 薛林 on 16/5/30.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXAboutHeaderView.h"

@implementation HZXAboutHeaderView
//类方法加载xib
+ (instancetype)aboutHeaderView {
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HZXAboutHeaderView" owner:nil options:nil]lastObject];
}

@end
