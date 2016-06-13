//
//  HZXTabBarController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXTabBarController.h"
#import "HZXBottomBar.h"
#import "HZXBottomBarButton.h"

@interface HZXTabBarController ()<HZXBottomBarDelegate>

@end

@implementation HZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子控制器
    [self loadSubControllers];
    //创建bottomBar
    HZXBottomBar *bottomBar = [[HZXBottomBar alloc]init];
    //设置frame
    bottomBar.frame = self.tabBar.bounds;
    //设置代理
    bottomBar.delegate = self;
    //添加到view上
    [self.tabBar addSubview:bottomBar];
    //移除系统的tabBar
//    [self.tabBar removeFromSuperview];
    //创建底部button按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        //拼接图片
        NSString *normalImageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selectedImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [bottomBar addBottomBarButomWithImageName:normalImageName selectImageName:selectedImageName];
    }
    
}
//实现代理方法
- (void)bottomBarDidClickBottomBarButtonWithIndex:(NSInteger)index {
    //tabBar有一个被选中属性
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 动态添加子控制器
- (void)loadSubControllers {
    //购彩大厅
    UINavigationController *hallNav = [self navControllerWithStoryBoardName:@"HZXHallNavController"];
    //竞技场
    UINavigationController *arenaNav = [self navControllerWithStoryBoardName:@"HZXArenaNavController"];
    //发现
    UINavigationController *discoverNav = [self navControllerWithStoryBoardName:@"HZXDiscoverNavController"];
    //开奖信息
    UINavigationController *historyNav = [self navControllerWithStoryBoardName:@"History"];
    //我的彩票
    UINavigationController *myLottery = [self navControllerWithStoryBoardName:@"MyLottery"];
    //添加控制器
    self.viewControllers = @[hallNav,arenaNav,discoverNav,historyNav,myLottery];
}
#pragma mark - 根据stroyboard文件名创建初始化控制器
- (UINavigationController *)navControllerWithStoryBoardName:(NSString *)name {
    //加载storyboard文件
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    //创建初始化控制器
    UINavigationController *nav = [storyboard instantiateInitialViewController];
    //返回创建好的初始化控制器
    return nav;
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
