//
//  HZXProductsController.m
//  彩票练习
//
//  Created by 薛林 on 16/6/1.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXProductsController.h"
#import "Product.h"
#import "HZXProductCell.h"
@interface HZXProductsController ()
@property (strong,nonatomic) NSArray *dataArrayy;

@end

@implementation HZXProductsController

static NSString * const reuseIdentifier = @"Cell";
//懒加载JSON文件
- (NSArray *)dataArrayy {
    if (_dataArrayy == nil) {
        //获取路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
        //转成NSData
        NSData *data = [NSData dataWithContentsOfFile:path];
        //把data数据转换成数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //创建可变数组，字典转模型
        NSMutableArray *tempArray = [NSMutableArray array];
        //字典转模型
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //创建模型
            Product *product = [Product productWithDict:obj];
            //将模型添加到数组 中
            [tempArray addObject:product];
        }];
        _dataArrayy = [tempArray copy];
    }
    return _dataArrayy;
}
//创建布局对象
- (instancetype)init {
    //创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //确定cell的大小
    layout.itemSize = CGSizeMake(75, 80);
    //设置行、水平间距
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    //设置组四周间距
    layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //注册xib
    [self.collectionView registerNib:[UINib nibWithNibName:@"HZXProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //背景色
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArrayy.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //获取数据
    Product *prodct =self.dataArrayy[indexPath.item];
    //创建
    HZXProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[HZXProductCell alloc]init];
    }
    //赋值
    cell.product = prodct;
    //返回
    return cell;
}
//点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //获取点击的哪一个
    Product *product = self.dataArrayy[indexPath.item];
    //AppStoreURL
    NSURL *url = [NSURL URLWithString:product.url];
    //本地程序的URL
    NSURL *localUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",product.customUrl,product.ID]];
    //application
    UIApplication *application = [UIApplication sharedApplication];
    //判断能否打开本应用程序
    if ([application canOpenURL:localUrl]) {
        [application openURL:localUrl];
    }else{
        [application openURL:url];
    }
}

@end
