//
//  PopUpWindow.m
//  Demo
//
//  Created by fengbo on 2019/7/11.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "PopUpWindow.h"
#import "PopUpView.h"

#import "FBUtils.h"

@interface PopUpWindow ()

@property (nonatomic, strong) PopUpView *popUp;

@end

@implementation PopUpWindow

- (instancetype)initWithPopUpWindowRect:(CGRect)rect {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        [self addSubview:self.popUp];
        self.popUp.frame = rect;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    [self removeFromSuperview];
}

- (PopUpView *)popUp {
    if (_popUp == nil) {
        _popUp = [[PopUpView alloc] initWithFrame:CGRectZero];
        _popUp.backgroundColor = [UIColor clearColor];
    }
    return _popUp;
}

@end
