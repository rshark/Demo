//
//  UIViewHierarchy.m
//  Demo
//
//  Created by fengbo on 2019/12/2.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "UIViewHierarchy.h"

@implementation UIViewHierarchy {
    NSTimer *_timer;
}

- (void)dealloc {
    NSLog(@"dealloced %@", self);
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview == nil) {
        if (_timer && [_timer isValid]) {
            [_timer invalidate];
            NSLog(@"invalidate timer %@", self);
        }
        NSLog(@"remove from superview");
    } else {
        if (!_timer || ![_timer isValid]) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSLog(@"timer task %@", self);
            }];
        }
        NSLog(@"add to superview");
    }
}

@end
