//
//  HZXGuideController.m
//  彩票练习
//
//  Created by 薛林 on 16/5/31.
//  Copyright © 2016年 薛林. All rights reserved.
//

#import "HZXGuideController.h"
#import "HZXGuideCell.h"
#import "UIView+Frame.h"
#define KNUM 4
@interface HZXGuideController ()
@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UIImageView *largeTextImageView;
@property(nonatomic,weak)UIImageView *smallTextImageView;
@end

@implementation HZXGuideController

static NSString * const reuseIdentifier = @"Cell";
//创建流水布局
- (instancetype)init {
    
    //创建流水布局
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    //设置cell的尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    //设置行、水平间距
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    //设置水平滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
    
}


- (void)viewDidLoad {
    //注册cell
    [self.collectionView registerClass:[HZXGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //允许分页
    self.collectionView.pagingEnabled = YES;
    //取出探航效果
    self.collectionView.bounces = NO;
    //取出水平 滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    //创建大图图片
    UIImageView *iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    self.iconImageView = iconImageView;
    
    //添加
    [self.collectionView addSubview:iconImageView];
    
    
    //创建线条图片
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    lineImageView.X = -self.collectionView.W * 0.63;
    //添加
    [self.collectionView addSubview:lineImageView];
    
    //创建大文本图片框
    UIImageView *largerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.largeTextImageView = largerImageView;
    largerImageView.Y = self.collectionView.H * 0.7;
    [self.collectionView addSubview:largerImageView];
    
    //创建小文本图片框
    UIImageView *smallImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallImageView.Y = self.collectionView.H * 0.85;
    self.smallTextImageView = smallImageView;
    [self.collectionView addSubview:smallImageView];
    
}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return KNUM;
    
}
//确定cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //从缓存池中取出cell
    HZXGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //拼接图片名称
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.row + 1];
    cell.image = [UIImage imageNamed:imageName];
    //调用创建cell的 方法
    [cell setCurrentPage:indexPath.item WithCount:KNUM];
    return cell;
}
//滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取偏移量X
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    //获取屏幕的宽度
    CGFloat scrollViewW = self.collectionView.W;
    //计算滚动结束时的索引
    int index = contentOffsetX / scrollViewW;
    //拼接图片名称
    NSString *iconName = [NSString stringWithFormat:@"guide%d",index + 1];
    NSString *lagerTextName = [NSString stringWithFormat:@"guideLargeText%d",index+1];
    NSString *smllTextName = [NSString stringWithFormat:@"guideSmallText%d",index+1];
    self.iconImageView.image = [UIImage imageNamed:iconName];
    self.largeTextImageView.image = [UIImage imageNamed:lagerTextName];
    self.smallTextImageView.image = [UIImage imageNamed:smllTextName];
    
    //判断
    if (self.iconImageView.X < contentOffsetX) {//右滚动
        self.iconImageView.X = contentOffsetX + scrollViewW;
        self.largeTextImageView.X = contentOffsetX + scrollViewW;
        self.smallTextImageView.X = contentOffsetX + scrollViewW;
    }else{//向左滚动
        self.iconImageView.X = contentOffsetX - scrollViewW;
        self.largeTextImageView.X = contentOffsetX - scrollViewW;
        self.smallTextImageView.X = contentOffsetX - scrollViewW;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.iconImageView.X = contentOffsetX;
        self.largeTextImageView.X = contentOffsetX;
        self.smallTextImageView.X = contentOffsetX;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
