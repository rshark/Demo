//
//  FBBannerLayout.h
//  Demo
//
//  Created by fengbo on 2019/9/11.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBBannerLayout : UICollectionViewLayout

@property (nonatomic) CGFloat minimumScale;
@property (nonatomic) CGFloat spacing;
@property (nonatomic) CGSize itemSize;

@end

NS_ASSUME_NONNULL_END
