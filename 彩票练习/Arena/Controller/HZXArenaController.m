//
//  HZXArenaController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXArenaController.h"

@interface HZXArenaController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentConttrol;


@end

@implementation HZXArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置segmentControl
    //边框颜色
    self.segmentConttrol.tintColor = [UIColor colorWithRed:0.0 green:156/255.0 blue:160/255.0 alpha:1];
    //字体颜色
    NSDictionary *attr = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14],
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           };
    [self.segmentConttrol setTitleTextAttributes:attr forState:UIControlStateNormal];
    [self.segmentConttrol setTitleTextAttributes:attr forState:UIControlStateSelected];
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
