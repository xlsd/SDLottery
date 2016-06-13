//
//  AppDelegate.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "AppDelegate.h"
#import "HZXTabBarController.h"
#import "HZXGuideController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建控制器
//    HZXTabBarController *tabBar = [[HZXTabBarController alloc]init];
    //选择要启动的控制器
    [self chooseController];
//    self.window.rootViewController = tabBar;
    //显示
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)chooseController {
    //读取系统版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //读取偏好设置的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:@"version"];
    
    //对比两个版本号
    if ([currentVersion isEqualToString:lastVersion]) {
        //相同显示首页
        HZXTabBarController *tabBar = [[HZXTabBarController alloc]init];
        self.window.rootViewController = tabBar;
    }else{
        //显示引导页
        
        HZXGuideController *guide = [[HZXGuideController alloc]init];
        self.window.rootViewController = guide;
    }
    //将系统版本号保存到偏好设置
    [defaults setObject:currentVersion forKey:@"version"];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
