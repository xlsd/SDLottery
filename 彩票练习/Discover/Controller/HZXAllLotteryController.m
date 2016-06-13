//
//  HZXAllLotteryController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXAllLotteryController.h"
#import "HZXButton.h"
#import "UIView+Frame.h"

@interface HZXAllLotteryController ()
@property (weak,nonatomic) UIView *redView;



@end

@implementation HZXAllLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    //一开始就创建了
    [self redView];
}

//创建redView懒加载
- (UIView *)redView {
    if (!_redView) {
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0 , 64, self.view.bounds.size.width, 0);
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        _redView = view;
    }
    return _redView;
}


- (IBAction)buttonClick:(HZXButton *)sender {
    //添加动画
    [UIView animateWithDuration:0.2 animations:^{
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform , M_PI);
        //判断高度
        if (self.redView.H == 0) {
            self.redView.H = 150;
        }else{
            self.redView.H = 0;
        }
        
    }];
}
- (IBAction)backBtnClick:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
