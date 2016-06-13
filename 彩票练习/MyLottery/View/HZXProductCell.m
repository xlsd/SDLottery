//
//  HZXProductCell.m
//  彩票练习
//
//  Created by 薛林 on 16/5/31.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXProductCell.h"
#import "Product.h"
@interface HZXProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end


@implementation HZXProductCell
//声明属性属性，用模型给cell赋值

- (void)setProduct:(Product *)product{
    
    _product = product;
    
    self.iconView.image = [UIImage imageNamed:product.icon];
    
    self.nameLabel.text = product.title;
    
}

- (void)awakeFromNib {
    // 设置ImageView圆角
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}

@end
