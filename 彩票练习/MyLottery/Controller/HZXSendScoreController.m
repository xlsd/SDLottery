//
//  HZXSendScoreController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/30.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXSendScoreController.h"

@interface HZXSendScoreController ()
@property (strong,nonatomic) UIDatePicker *datepicker;
@property (strong,nonatomic) UIToolbar *toolBar;
@end

@implementation HZXSendScoreController
//重写父类didselect方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建textFiled
    UITextField *textFiled = [[UITextField alloc]init];
    //获取当前点击的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //设置textFiled为第一响应者
    [textFiled becomeFirstResponder];
    //赋值
    textFiled.inputView = self.datepicker;
    //工具条
    textFiled.inputAccessoryView = self.toolBar;
    //添加
    [cell.contentView addSubview:textFiled];
    
}
//创建datePicker(懒加载)
- (UIDatePicker *)datepicker {
    if (_datepicker == nil) {
        //创建
        _datepicker = [[UIDatePicker alloc]init];
        //设置语言
        _datepicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        //设置显示格式
        _datepicker.datePickerMode = UIDatePickerModeTime;

    }
    return _datepicker;
}
//创建toolBar
- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        //创建
        _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        //创建取消item
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        //创建完成
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
        //创建弹簧
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        //添加
        _toolBar.items = @[cancelItem,flexibleItem,doneItem];
    }
    return _toolBar;
}
//取消
- (void)cancel {
    //结束编辑收回键盘
    [self.view endEditing:YES];
    
    
}
//完成
- (void)done {
    //收回键盘
    [self cancel];
    //赋值
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
