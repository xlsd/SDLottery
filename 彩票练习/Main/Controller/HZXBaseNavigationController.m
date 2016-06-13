//
//  HZXBaseNavigationController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXBaseNavigationController.h"

@interface HZXBaseNavigationController ()

@end

@implementation HZXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏的文字外观
    NSDictionary *attr = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:16],
                           NSForegroundColorAttributeName:[UIColor whiteColor],
                           };
    [self.navigationBar setTitleTextAttributes:attr];
    //设置navigationBar的item的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    //设置状态栏的字体为白色
    //有两种方式一
    //获取application对象
    UIApplication *application = [UIApplication sharedApplication];
    application.statusBarStyle = UIStatusBarStyleLightContent;
    //在程序启动后不隐藏
    application.statusBarHidden = NO;
}
//重写navigationController的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //隐藏系统的tabBar
    viewController.hidesBottomBarWhenPushed = YES;
    //执行父类的方法
    [super pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
