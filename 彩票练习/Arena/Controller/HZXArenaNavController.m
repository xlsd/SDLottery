//
//  HZXArenaNavController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXArenaNavController.h"

@interface HZXArenaNavController ()

@end

@implementation HZXArenaNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    //修改导航控制器导航栏的图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    //设置segmentControl
    
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
