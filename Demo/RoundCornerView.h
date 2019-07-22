//
//  RoundCornerView.h
//  Demo
//
//  Created by fengbo on 2019/7/16.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, RoundCorner) {
    RoundCornerTopLeft     = 1 << 0,
    RoundCornerTopRight    = 1 << 1,
    RoundCornerBottomLeft  = 1 << 2,
    RoundCornerBottomRight = 1 << 3,
    RoundCornerAllCorners  = ~0UL
};

@interface RoundCornerView : UIView

- (void)setRoundCorners:(RoundCorner)corners cornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
