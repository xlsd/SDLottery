//
//  HZXHallTableController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/27.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXHallTableController.h"

@interface HZXHallTableController ()
@property (weak,nonatomic) UIImageView *imageView;
@property (weak,nonatomic) UIView *coverView;
@end

@implementation HZXHallTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建左上角的活动按钮
    //更改图片渲染
    UIImage *image = [[UIImage imageNamed:@"CS50_activity_image"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction:)];
    
}
//活动按钮的点击事件
- (void)buttonAction:(UIButton *)button {
    //添加遮罩
    UIView *coverView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置背景
    coverView.backgroundColor = [UIColor blackColor];
    //设置透明度
    coverView.alpha = 0.5;
    self.coverView = coverView;
    //添加在window上
    //获取当前主window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:coverView];
    
    //添加活动图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    //设置位置
    imageView.center = self.view.center;
    self.imageView = imageView;
    self.imageView.userInteractionEnabled = YES;
    //添加
    [window addSubview:imageView];
    
    //添加小叉叉
    CGFloat closeBtnW = 20;
    CGFloat closeBtnH = closeBtnW;
    CGFloat closeBtnX = imageView.frame.size.width - closeBtnW;
    CGFloat closeBtnY = 0;
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(closeBtnX,closeBtnY, closeBtnW, closeBtnH)];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    //给小叉叉添加点击事件
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //添加
    [imageView addSubview:closeBtn];
}
//小叉叉的点击事件
- (void)closeBtnClick {
    //移除遮罩
    [self.imageView removeFromSuperview];
    //移除活动的view
    [self.coverView removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
