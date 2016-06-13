//
//  HZXButton.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXButton.h"

@implementation HZXButton

- (void)layoutSubviews {
    [super layoutSubviews];
    //获取当前btn的按钮子控件的frame
    CGRect labelFrame = self.titleLabel.frame;
    CGRect imageViewFrame = self.imageView.frame;
    //修改frame的位置
    labelFrame.origin.x = 0;
    imageViewFrame.origin.x = labelFrame.size.width;
    //赋值回去
    self.titleLabel.frame = labelFrame;
    self.imageView.frame = imageViewFrame;
}

@end
