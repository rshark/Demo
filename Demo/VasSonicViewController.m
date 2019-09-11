//
//  VasSonicViewController.m
//  Demo
//
//  Created by fengbo on 2019/3/6.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "VasSonicViewController.h"

#import "FBUtils.h"
#import <Masonry.h>
#import "FBBannerLayout.h"



@interface VasSonicViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation VasSonicViewController {
    UILabel *_textLabel;
    UIView *_bgView;
}

- (void)viewDidLoad {
    CGFloat scale = 375.0 / self.view.bounds.size.width;
    CGFloat itemWidth = 240.0 / scale;
    CGFloat itemHeight = 250.0 / scale;
    FBBannerLayout *layout = [[FBBannerLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.spacing = 12.0;
    layout.minimumScale = 0.9;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 200.0, self.view.bounds.size.width, 400.0) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [FBUtils fb_randomColor];
    return cell;
}

@end
