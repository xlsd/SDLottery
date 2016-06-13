//
//  HZXLuckCotroller.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXLuckCotroller.h"

@interface HZXLuckCotroller ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation HZXLuckCotroller
//视图加载后执行
- (void)viewDidLoad {
    UIImage *image0 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    //设置需要执行动画的图片数组
    self.imageView.animationImages = @[image0,image1];
    //设置时间
    self.imageView.animationDuration = 1;
    self.imageView.animationRepeatCount = 0;
    //开始动画
    [self.imageView startAnimating];
}


@end
