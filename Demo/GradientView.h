//
//  GradientView.h
//  Demo
//
//  Created by fengbo on 2019/7/10.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientView : UIView

- (void)setGradientColors:(NSArray <UIColor *>*)colors;
- (void)setGradientDirectionWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
