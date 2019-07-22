//
//  FBUtils.m
//  Demo
//
//  Created by fengbo on 18/01/2018.
//  Copyright © 2018 fengbo. All rights reserved.
//

#import "FBUtils.h"

@implementation FBUtils

+ (UIColor *)fb_randomColor {
    CGFloat redComponentValue = arc4random() % 255;
    CGFloat greenComponentValue = arc4random() % 255;
    CGFloat blueComponentValue = arc4random() % 255;
    UIColor * randColor = [UIColor colorWithRed:redComponentValue / 255.0 green:greenComponentValue / 255.0 blue:blueComponentValue / 255.0 alpha:1.0];
    return randColor;
}

+ (UIColor *)fb_colorWithHex:(NSUInteger)hex {
    return [self fb_colorWithHex:hex alpha:1.0];
}

+ (UIColor *)fb_colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha {
    CGFloat red = (CGFloat)((hex & 0xFF0000) >> 16) / 255.0;
    CGFloat green = (CGFloat)((hex & 0xFF00) >> 8) / 255.0;
    CGFloat blue = (CGFloat)(hex & 0xFF) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (NSString *)documentsDirectory {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)stringWithUUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return uuidString;
}


@end
