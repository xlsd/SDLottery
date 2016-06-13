//
//  HZXHelpController.m
//  彩票练习
//
//  Created by 薛林 on 16/6/1.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXHelpController.h"
#import "HZXHelp.h"
#import "HZXHtmlController.h"
#import "HZXBaseNavigationController.h"

@interface HZXHelpController ()
@property (strong,nonatomic) NSArray *helps;
@end

@implementation HZXHelpController
//懒加载数据
- (NSArray *)helps {
    if (_helps == nil) {
        //将数据加载成NSData
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil]];
        //将data转成数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempArray = [NSMutableArray array];
        //字典转模型
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //创建模型
            HZXHelp *help = [HZXHelp helpWithDict:obj];
            //将模型加入到临时数组
            [tempArray addObject:help];
        }];
        _helps = tempArray;
    }
    return _helps;
}
#pragma mark - 数据源方法
//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.helps.count;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取数据
    HZXHelp *help = self.helps[indexPath.row];
    //创建
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //赋值
    cell.textLabel.text = help.title;
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    //返回
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //加载数据
    HZXHelp *help = self.helps[indexPath.row];
    //创建html控制器
    HZXHtmlController *htmlVC = [[HZXHtmlController alloc]init];
    htmlVC.help = help;
    //包装一个导航控制器
    HZXBaseNavigationController *baseNav = [[HZXBaseNavigationController alloc]initWithRootViewController:htmlVC];
    //模态弹出控制器
    [self presentViewController:baseNav animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
