//
//  FBBannerLayout.m
//  Demo
//
//  Created by fengbo on 2019/9/11.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "FBBannerLayout.h"

@implementation FBBannerLayout {
    CGFloat _marginInset;
    CGFloat _itemsCenterSpacing;
    CGSize _contentSize;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    UICollectionView *collectionView = self.collectionView;
    NSUInteger numOfItems = [collectionView numberOfItemsInSection:0];
    CGRect collectionBounds = collectionView.bounds;
    CGFloat marginInset = CGRectGetWidth(collectionBounds) / 2.0 - self.itemSize.width / 2.0;
    _marginInset = marginInset;
    CGFloat itemsWidth = numOfItems * self.itemSize.width;
    CGFloat spacingsWidth = (numOfItems - 1) * self.spacing;
    CGSize contentSize = CGSizeMake(marginInset * 2 + itemsWidth + spacingsWidth, CGRectGetHeight(collectionBounds));
    _itemsCenterSpacing = self.itemSize.width + self.spacing;
    _contentSize = contentSize;
}

- (CGSize)collectionViewContentSize {
    return _contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat x = _marginInset + indexPath.item * self.itemSize.width + indexPath.item * self.spacing;
    CGFloat y = CGRectGetHeight(self.collectionView.bounds) / 2.0 - self.itemSize.height / 2.0;
    attributes.frame = CGRectMake(x, y, self.itemSize.width, self.itemSize.height);
    CGFloat itemCenterX = CGRectGetMidX(attributes.frame);
    CGFloat centerX = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.bounds) / 2.0;
    CGFloat ratio = fabs(itemCenterX - centerX) / _itemsCenterSpacing;
    CGFloat scale = 1.0 - (1.0 - self.minimumScale) * ratio;
    attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1.0);
    attributes.zIndex = ratio < 0.5 ? 1 : 0;
    
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGFloat minItemOffsetX = self.collectionView.contentOffset.x - _marginInset;
    CGFloat maxItemOffsetX = MIN(self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.bounds), _contentSize.width) - 2 * _marginInset;
    NSInteger numOfItems = [self.collectionView numberOfItemsInSection:0];
    NSInteger minIdx = floor((minItemOffsetX + self.spacing) / (self.itemSize.width + self.spacing));
    NSInteger maxIdx = ceil((maxItemOffsetX + self.spacing) / (self.itemSize.width + self.spacing));
    minIdx = MAX(0, minIdx);
    maxIdx = MIN(numOfItems - 1, maxIdx);
    
    NSMutableArray *attributes = @[].mutableCopy;
    for (NSInteger i = minIdx; i <= maxIdx; i++) {
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [attributes addObject:attr];
    }
    return [attributes copy];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat proposedCenterX = proposedContentOffset.x - _marginInset + CGRectGetWidth(self.collectionView.bounds) / 2.0;
    NSInteger idx = floor((proposedCenterX + self.spacing) / (self.itemSize.width + self.spacing));
    NSInteger numOfItems = [self.collectionView numberOfItemsInSection:0];
    idx = MAX(0, MIN(numOfItems - 1, idx));
    CGFloat targetOffsetX = idx * (self.itemSize.width + self.spacing) - self.spacing + _marginInset + self.itemSize.width / 2.0 - CGRectGetWidth(self.collectionView.bounds) / 2.0;
    return CGPointMake(targetOffsetX, 0.0);
}

@end
