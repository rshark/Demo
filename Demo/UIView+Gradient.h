//
//  UIView+Gradient.h
//  Demo
//
//  Created by fengbo on 2019/1/7.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)

@property (nonatomic, copy) NSArray *colors;
@property (nonatomic, copy) NSArray<NSNumber *> *locations;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;

+ (UIView *)gradientViewWithColors:(NSArray <UIColor *> *)colors locations:(NSArray <NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
- (void)setGradientBackgroundWithColors:(NSArray <UIColor *> *)colors locations:(NSArray <NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
