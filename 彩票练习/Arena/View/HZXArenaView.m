//
//  HZXArenaView.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXArenaView.h"

@implementation HZXArenaView

- (void)drawRect:(CGRect)rect {
    //获得图片
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    //绘制图片
    [image drawInRect:rect];
}

@end
