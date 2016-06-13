//
//  HZXBottomBar.h
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZXBottomBarDelegate <NSObject>

- (void)bottomBarDidClickBottomBarButtonWithIndex:(NSInteger)index;

@end

@interface HZXBottomBar : UIView
//设置按钮的方法
- (void)addBottomBarButomWithImageName:(NSString *)nomalImage selectImageName:(NSString *)selectImage;
//代理属性
@property (weak,nonatomic) id<HZXBottomBarDelegate> delegate;
@end
