//
//  HZXCell.h
//  彩票练习
//
//  Created by 薛林 on 16/5/30.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZXCell : UITableViewCell
//声明一个字典属性
@property (strong,nonatomic) NSDictionary *dictCell;
//类方法创建cell
+ (HZXCell *)cellWithTableView:(UITableView *)tableView withDict:(NSDictionary *)dict;

@end
