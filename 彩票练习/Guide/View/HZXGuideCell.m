//
//  HZXGuideCell.m
//  彩票练习
//
//  Created by 薛林 on 16/5/31.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXGuideCell.h"
#import "HZXTabBarController.h"
@interface HZXGuideCell ()

@property(nonatomic,weak)UIImageView *imageView;
@property (weak,nonatomic) UIImageView *bgImageView;
@property (weak,nonatomic) UIButton *startButton;
@end
@implementation HZXGuideCell
- (void)setCurrentPage:(NSInteger)index WithCount:(NSInteger)count {
    if (count - 1 == index) {
        if (self.startButton == nil) {
            //创建按钮
            UIButton *button = [[UIButton alloc]init];
            //设置背景图片
            [button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
            //添加点击事件
            [button addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
            //添加到cell上
            [self addSubview:button];
            self.startButton = button;
        }else{
            self.startButton.hidden = NO;
        }
    }else{
        self.startButton.hidden = YES;
    }
    
}

- (void)startButtonClick {
    //创建tabBarController
    HZXTabBarController *tabBar = [[HZXTabBarController alloc]init];
    self.window.rootViewController = tabBar;
    
}

//创建cell方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //创建ImageView
        UIImageView *bgImageView = [[UIImageView alloc]init];
        //添加到cell上
        [self.contentView addSubview:bgImageView];
        self.bgImageView = bgImageView;
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //设置imageView的frame
    self.bgImageView.frame = self.bounds;
    //设置立即体验的按钮
    self.startButton.frame = CGRectMake((self.frame.size.width - 160) * 0.5, self.frame.size.height * 0.9, 160, 40);
    
}
//重写set方法
- (void)setImage:(UIImage *)image {
    _image = image;
    self.bgImageView.image = image;
    
}



@end
