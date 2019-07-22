//
//  GradientView.m
//  Demo
//
//  Created by fengbo on 2019/7/10.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

+ (Class)layerClass {
    return [CAGradientLayer class];
}


- (void)setGradientColors:(NSArray <UIColor *>*)colors {
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    NSMutableArray *mColors = [@[] mutableCopy];
    for (UIColor *color in colors) {
        [mColors addObject:(id)color.CGColor];
    }
    layer.colors = [mColors copy];
}

- (void)setGradientDirectionWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
}

@end
