//
//  HZXAboutController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/30.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXAboutController.h"
#import "HZXAboutHeaderView.h"

@interface HZXAboutController ()

@end

@implementation HZXAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建header
    self.tableView.tableHeaderView = [HZXAboutHeaderView aboutHeaderView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
