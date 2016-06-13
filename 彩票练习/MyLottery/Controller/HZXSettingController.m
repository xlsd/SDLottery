//
//  HZXSettingController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/29.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXSettingController.h"
#import "HZXCell.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"


@interface HZXSettingController ()
@property (strong,nonatomic) NSArray *dataArray;

@end

@implementation HZXSettingController
- (void)viewDidLoad {
   //设置标题的返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
}
//返回按钮
- (void)backBtn {
    [self.navigationController popViewControllerAnimated:YES];
}

//重写本组的
- (instancetype)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

//通过plist文件加载页面内容
- (NSArray *)dataArray {
    if (_dataArray == nil) {
        //读取文件
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
        _dataArray = array;
    }
    return _dataArray;
}
#pragma mark - 数据源方法
//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //获取组
    NSDictionary *group = self.dataArray[section];
    //获取行
    NSArray *arr = group[@"cells"];
    return arr.count;
}
//确定cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取组
    NSDictionary *dict = self.dataArray[indexPath.section];
    //获取行
    NSArray *arr = dict[@"cells"];
    NSDictionary *dictCell = arr[indexPath.row];
    //获取内容
    HZXCell *cell = [HZXCell cellWithTableView:tableView withDict:dictCell];
    //赋值
    cell.dictCell = dictCell;
    return cell;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取组
    NSDictionary *group = self.dataArray[indexPath.section];
    //获取行
    NSArray *cellArr = group[@"cells"];
    NSDictionary *cellDict = cellArr[indexPath.row];
    //判断跳转到那个控制器
    if (cellDict[@"targetVC"]) {
        //获取跳转控制器的字符串
        NSString *targetVCStr = cellDict[@"targetVC"];
        //字符串转成类
        Class class = NSClassFromString(targetVCStr);
        //类创建对应的控制器
        UIViewController *viewController = [[class alloc]init];
        
        if ([viewController isKindOfClass:[HZXSettingController class]]) {
            //强转
            HZXSettingController *setViewController = (HZXSettingController *)viewController;
            setViewController.navigationItem.title = cellDict[@"title"];
            //确定跳转的控制器的内容
            setViewController.plistName = cellDict[@"plistName"];

        }
        [self.navigationController pushViewController:viewController animated:YES];
    }
    //判断是否有functionName方法
    if (cellDict[@"functionName"]) {
        //将funcion转换成对应的方法名
        SEL function = NSSelectorFromString(cellDict[@"functionName"]);
        //执行方法(宏取去除警告)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        // 执行方法
        [self performSelector:function];
#pragma clang diagnostic pop
    }
    
}
//蒙版效果的方法
- (void)updata {
    //创建
    // 显示弹窗
    [MBProgressHUD showMessage:@"正在检查新版本"];
    //延迟消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //消失
        [MBProgressHUD hideHUD];
        //提示已经是最新版本
        [MBProgressHUD showSuccess:@"已经是最新版本"];
    });
}

//返回头尾的方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //获取组
    NSDictionary *dict = self.dataArray[section];
    return dict[@"header"];
}
//返回尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    //获取组
    NSDictionary *dict = self.dataArray[section];
    return dict[@"footer"];
}

@end
