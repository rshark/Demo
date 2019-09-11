//
//  PlatformView.m
//  Demo
//
//  Created by fengbo on 2019/7/10.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "PlatformView.h"
#import "GradientView.h"
#import "FBUtils.h"

@interface PlatformView ()

@property (nonatomic, strong) GradientView *verticalGradientView;
@property (nonatomic, strong) GradientView *perspectiveGradientView;

@end

@implementation PlatformView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
        [self manualLayoutSubviews];
    }
    return self;
}

- (void)configureSubviews {
    [self addSubview:self.perspectiveGradientView];
    // 保证verticalGradientView 不被 perspectiveGradientView 遮挡
    [self addSubview:self.verticalGradientView];
    
    [self.perspectiveGradientView setGradientColors:@[[FBUtils fb_colorWithHex:0xFED458], [FBUtils fb_colorWithHex:0xFECE4A]]];
    [self.verticalGradientView setGradientColors:@[[FBUtils fb_colorWithHex:0xF8B818], [FBUtils fb_colorWithHex:0xFEDC42]]];
}

// 自动布局不太适合计算
- (void)manualLayoutSubviews {
    // 针对ph = 16.0 & transform.m24 = 1 / -100.0 计算出来的一个比值常量
    const CGFloat kRatio = 0.92000288;
    CGFloat px = 0.0;
    CGFloat py = 0.0;
    CGFloat pw = CGRectGetWidth(self.frame);
    const CGFloat ph = 16.0; // 高度固定为16.0
    CGFloat vx = 0.0;
    CGFloat vy = ph;
    CGFloat vw = CGRectGetWidth(self.frame);
    CGFloat vh = CGRectGetHeight(self.frame) - ph;
    pw = vw * kRatio;
    px = vx + (vw - pw) / 2.0;
    
    self.perspectiveGradientView.frame = CGRectMake(px, py, pw, ph);
    self.verticalGradientView.frame = CGRectMake(vx, vy, vw, vh);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m24 = 1 / -100.0; // 试出来的一个值
    self.perspectiveGradientView.layer.transform = transform;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self manualLayoutSubviews];
}

#pragma mark - IDGRankinglistPodiumPlatformView Override

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    // 重新布局
    [self manualLayoutSubviews];
}

#pragma mark - IDGRankinglistPodiumPlatformView Getter

- (GradientView *)verticalGradientView {
    if (_verticalGradientView == nil) {
        _verticalGradientView = [[GradientView alloc] initWithFrame:CGRectZero];
    }
    return _verticalGradientView;
}

- (GradientView *)perspectiveGradientView {
    if (_perspectiveGradientView == nil) {
        _perspectiveGradientView = [[GradientView alloc] initWithFrame:CGRectZero];
    }
    return _perspectiveGradientView;
}


@end
