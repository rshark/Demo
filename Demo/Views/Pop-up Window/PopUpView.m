//
//  PopUpView.m
//  Demo
//
//  Created by fengbo on 2019/7/12.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "PopUpView.h"

#import "FBUtils.h"

@implementation PopUpView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.arrowOffsetX = 60.0;
        self.arrowSize = CGSizeMake(12.0, 6.0);
        self.cornerRadius = 12.0;
        self.fillColor = [[FBUtils fb_colorWithHex:0x2C2A40] colorWithAlphaComponent:0.94];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (self.arrowOffsetX + self.arrowSize.width / 2.0 < CGRectGetMaxX(rect) &&
        self.arrowOffsetX - self.arrowSize.width / 2.0 > CGRectGetMinX(rect)) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
        CGContextFillRect(ctx, rect);
        
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, self.arrowOffsetX, CGRectGetMinY(rect));
        // 顺时针绘制
        CGPoint nextPoint = CGPointMake(self.arrowOffsetX + self.arrowSize.width / 2.0, CGRectGetMinY(rect) + self.arrowSize.height);
        CGContextAddLineToPoint(ctx, nextPoint.x, nextPoint.y);
        CGPoint tangentPoint1 = CGPointMake(CGRectGetMaxX(rect), nextPoint.y);
        CGPoint tangentPoint2 = CGPointMake(tangentPoint1.x, tangentPoint1.y + self.cornerRadius);
        CGContextAddArcToPoint(ctx, tangentPoint1.x, tangentPoint1.y, tangentPoint2.x, tangentPoint2.y, self.cornerRadius);
        tangentPoint1 = CGPointMake(tangentPoint1.x, CGRectGetMaxY(rect));
        tangentPoint2 = CGPointMake(tangentPoint1.x - self.cornerRadius, tangentPoint1.y);
        CGContextAddArcToPoint(ctx, tangentPoint1.x, tangentPoint1.y, tangentPoint2.x, tangentPoint2.y, self.cornerRadius);
        tangentPoint1 = CGPointMake(CGRectGetMinX(rect), tangentPoint1.y);
        tangentPoint2 = CGPointMake(tangentPoint1.x, tangentPoint1.y - self.cornerRadius);
        CGContextAddArcToPoint(ctx, tangentPoint1.x, tangentPoint1.y, tangentPoint2.x, tangentPoint2.y, self.cornerRadius);
        tangentPoint1 = CGPointMake(tangentPoint1.x, CGRectGetMinY(rect) + self.arrowSize.height);
        tangentPoint2 = CGPointMake(tangentPoint1.x + self.cornerRadius, tangentPoint1.y);
        CGContextAddArcToPoint(ctx, tangentPoint1.x, tangentPoint1.y, tangentPoint2.x, tangentPoint2.y, self.cornerRadius);
        nextPoint = CGPointMake(self.arrowOffsetX - self.arrowSize.width / 2.0, CGRectGetMinY(rect) + self.arrowSize.height);
        CGContextAddLineToPoint(ctx, nextPoint.x, nextPoint.y);
        CGContextClosePath(ctx);
        CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
       
        CGContextFillPath(ctx);
        
    }
}


@end
