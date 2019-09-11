//
//  FBUtils.h
//  Demo
//
//  Created by fengbo on 18/01/2018.
//  Copyright © 2018 fengbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FBUtils : NSObject

+ (UIColor *)fb_randomColor;
+ (UIColor *)fb_colorWithHex:(NSUInteger)hex;
+ (UIColor *)fb_colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;
+ (NSString *)documentsDirectory;
+ (NSString *)stringWithUUID;

@end
