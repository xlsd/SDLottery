//
//  HZXBottomBar.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXBottomBar.h"
#import "HZXBottomBarButton.h"

@interface HZXBottomBar ()
@property (weak,nonatomic) UIButton *selectButton;
@end

@implementation HZXBottomBar

//写一个添加图片的方法
- (void)addBottomBarButomWithImageName:(NSString *)nomalImage selectImageName:(NSString *)selectImage {
    //创建按钮
    HZXBottomBarButton *button = [[HZXBottomBarButton alloc]init];
    //设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:nomalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    //添加点击事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //将按钮添加到view上
    [self addSubview:button];
}
//按钮点击
- (void)buttonClick:(UIButton *)btn {
    //选中的按钮选中状态置为NO
    self.selectButton.selected = NO;
    btn.selected = YES;
    self.selectButton = btn;
    //点击按钮需要切换控制器需要代理
    if ([self.delegate respondsToSelector:@selector(bottomBarDidClickBottomBarButtonWithIndex:)]) {
        [self.delegate bottomBarDidClickBottomBarButtonWithIndex:btn.tag];
    }
}
//计算按钮的frame
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat Y = 0;
    CGFloat W = self.frame.size.width / self.subviews.count;
    CGFloat H = self.frame.size.height;
    for (int i = 0; i < self.subviews.count; i++) {
        //获取按钮
        HZXBottomBarButton *btn = self.subviews[i];
        //设置按钮的tag值
        btn.tag = i;
        //计算a
        CGFloat X = i * W;
        btn.frame = CGRectMake(X, Y, W, H);
        //设置默认第一个被选中
        if (i == 0) {
            [self buttonClick:btn];
        }
    }
}

@end
