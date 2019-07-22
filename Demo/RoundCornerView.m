//
//  RoundCornerView.m
//  Demo
//
//  Created by fengbo on 2019/7/16.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "RoundCornerView.h"

@interface RoundCornerView ()

@property (nonatomic, assign) RoundCorner roundCorners;
@property (nonatomic, assign) CGSize cornerRadii;

@end

@implementation RoundCornerView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    // Drawing code
//
////    [self.songInfoHeadContainerView.layer.mask removeFromSuperlayer];
    [self.layer.mask removeFromSuperlayer];
//    //绘制圆角 要设置的圆角 使用“|”来组合
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCorner)self.roundCorners cornerRadii:self.cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    //设置大小
    maskLayer.frame = rect;
//    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
////    self.songInfoHeadContainerView.layer.mask = maskLayer;
}


//+ (Class)layerClass {
//    return [CAShapeLayer class];
//}

- (void)setRoundCorners:(RoundCorner)corners cornerRadii:(CGSize)cornerRadii {
//
//    [self.layer.mask removeFromSuperlayer];
//    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCorner)corners cornerRadii:cornerRadii];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = cornerPath.CGPath;
//    self.layer.mask = maskLayer;
    
    self.roundCorners = corners;
    self.cornerRadii = cornerRadii;
    
}

@end
