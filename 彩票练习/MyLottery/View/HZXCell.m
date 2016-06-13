//
//  HZXCell.m
//  彩票练习
//
//  Created by 薛林 on 16/5/30.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXCell.h"

@implementation HZXCell
//给cell设置数据


- (void)setDictCell:(NSDictionary *)dictCell {
    _dictCell = dictCell;
    
    self.textLabel.text = dictCell[@"title"];
    
    //判断是否有图片
    if (dictCell[@"icon"]) {
        self.imageView.image = [UIImage imageNamed:dictCell[@"icon"]];
    }
    //判断是否有子标题
    if (dictCell[@"subTitle"]) {
        self.detailTextLabel.text = dictCell[@"subTitle"];
    }
    //判断子标题的字体颜色是不是红色
    if (dictCell[@"redColor"]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }

    NSString *accessoryType = dictCell[@"accessoryType"];
    //根据字符串实例化对象
    Class class = NSClassFromString(accessoryType);
    UIView *accessoryView = [[class alloc]init];
    //判断小附件是不是图片
    if ([accessoryView isKindOfClass:[UIImageView class]]) {
        //强转一下
        UIImageView *imageView = (UIImageView *)accessoryView;
        //设置ImageView的图片
        imageView.image = [UIImage imageNamed:@"arrow_right"];
        //自适应大小
        [imageView sizeToFit];
    }
    //判断小附件是不是开关
    if ([accessoryView isKindOfClass:[UISwitch class]]) {
        //强转为开关
        UISwitch *swith = (UISwitch *)accessoryView;
        //添加监听事件
        [swith addTarget:self action:@selector(switchChangeValue:) forControlEvents:UIControlEventTouchUpInside];
        //获取开关状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        swith.on = [defaults boolForKey:self.dictCell[@"title"]];
    }
    //设置图片
    self.accessoryView = accessoryView;
}

//保存用户偏好设置的方法
- (void)switchChangeValue:(UISwitch *)sender {
    //获取偏好设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //b保存偏好设置
    [defaults setBool:sender.on forKey:self.dictCell[@"title"]];
    
}

//返回cell
+ (UITableViewCell *)cellWithTableView:(UITableView *)tableView withDict:(NSDictionary *)dict {
    //获取内容
    //判断标识符
    static NSString *ID = nil;
    if (dict[@"key"]) {
        ID = dict[@"key"];
    }else{
        ID = @"settingID";
    }
    HZXCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        //创建cell
        cell = [[HZXCell alloc]initWithStyle:[self cellTypeWithString:dict[@"cellStyle"]] reuseIdentifier:ID];
    }
    return cell;
}
//返回cell样式的方法
+ (UITableViewCellStyle)cellTypeWithString:(NSString *)str {
    if ([str isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    }else if([str isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }else if([str isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    }else {
        return UITableViewCellStyleDefault;
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
