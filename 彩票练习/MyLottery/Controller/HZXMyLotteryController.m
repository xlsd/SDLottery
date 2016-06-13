//
//  HZXMyLotteryController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/28.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXMyLotteryController.h"
#import "HZXSettingController.h"
#import "HZXHelpController.h"


@interface HZXMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation HZXMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取背景图片
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    UIImage *imageHL = [UIImage imageNamed:@"RedButtonPressed"];
    //拉伸背景图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    imageHL = [imageHL stretchableImageWithLeftCapWidth:imageHL.size.width * 0.5 topCapHeight:imageHL.size.height * 0.5];
    //设为按钮的背景图片
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:imageHL forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushSettingBtn:(UIBarButtonItem *)sender {
    //创建页面
    HZXSettingController *settingController = [[HZXSettingController alloc]initWithStyle:UITableViewStyleGrouped];
    settingController.plistName = @"setting";
    [self.navigationController pushViewController:settingController animated:YES];
    //设置标题
    settingController.navigationItem.title = @"设置";
    settingController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(help)];
}
- (void)help {
    //创建帮助控制器
    HZXHelpController *helpVC = [[HZXHelpController alloc]init];
    [self.navigationController pushViewController:helpVC animated:YES];
    
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
