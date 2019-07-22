//
//  UIImage+ColorFromPixel.h
//  Demo
//
//  Created by 冯波 on 2017/5/12.
//  Copyright © 2017年 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorFromPixel)

- (UIColor *)colorAtPixel:(CGPoint)point;

@end
