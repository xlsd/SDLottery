//
//  UIView+Frame.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
//重写set和get方法
- (CGFloat)X {
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)X {
    CGRect rect = self.frame;
    rect.origin.x = X;
    self.frame = rect;
}
//y
- (CGFloat)Y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)Y {
    CGRect rect = self.frame;
    rect.origin.y = Y;
    self.frame = rect;
}
//W
- (CGFloat)W {
    return self.frame.size.width;
}
- (void)setW:(CGFloat)W {
    CGRect rect = self.frame;
    rect.size.width = W;
    self.frame = rect;
}
//Y
- (CGFloat)H {
    return self.frame.size.height;
}
- (void)setH:(CGFloat)H {
    CGRect rect = self.frame;
    rect.size.height = H;
    self.frame = rect;
}

@end
