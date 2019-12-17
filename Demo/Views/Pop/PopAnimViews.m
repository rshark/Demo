//
//  PopAnimViews.m
//  Demo
//
//  Created by fengbo on 2019/12/16.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "PopAnimViews.h"
#import <POP.h>

@interface PopAnimViews ()

@property (nonatomic, strong) UIButton *interactionButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *bullyButton;
@property (nonatomic, strong) UIButton *comfortButton;

@end

@implementation PopAnimViews {
    BOOL _animating;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    
    [self addSubview:self.closeButton];
    [self addSubview:self.bullyButton];
    [self addSubview:self.comfortButton];
    [self addSubview:self.interactionButton];
    
    const CGFloat width = 300.0; const CGFloat height = 300.0;
    const CGFloat interactionButtonWidth = 65.0; const CGFloat closeButtonWidth = 46.0;
    const CGFloat bullyButtonWidth = 60.0; const CGFloat comfortButtonWidth = 60.0;
    
    self.interactionButton.frame = CGRectMake(width - interactionButtonWidth, height - interactionButtonWidth, interactionButtonWidth, interactionButtonWidth);
    self.closeButton.frame = CGRectMake(0.0, 0.0, closeButtonWidth, closeButtonWidth);
    self.closeButton.center = self.interactionButton.center;
    self.bullyButton.frame = CGRectMake(0.0, 0.0, bullyButtonWidth, bullyButtonWidth);
    self.bullyButton.center = self.interactionButton.center;
    self.comfortButton.frame = CGRectMake(0.0, 0.0, comfortButtonWidth, comfortButtonWidth);
    self.comfortButton.center = self.interactionButton.center;
    
    self.closeButton.alpha = 0.0;
//    self.bullyButton.alpha = 0.0;
//    self.comfortButton.alpha = 0.0;
}

#pragma mark - Events

- (void)interacts:(UIButton *)btn {
    if (_animating) {
        return;
    }
    _animating = YES;
    // interactionButton
    POPBasicAnimation *anim1 = [POPBasicAnimation linearAnimation];
    anim1.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    anim1.fromValue = @(1.0);
    anim1.toValue = @(0.0);
    anim1.duration = 0.25;
    anim1.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        _animating = NO;
    };
    [self.interactionButton pop_addAnimation:anim1 forKey:@"alpha"];
    // closeButton
    POPBasicAnimation *anim3 = [POPBasicAnimation linearAnimation];
    anim3.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    anim3.fromValue = @(0.0);
    anim3.toValue = @(1.0);
    anim3.duration = 0.25;
    [self.closeButton pop_addAnimation:anim3 forKey:@"alpha"];
    // bullyButton
    CGPoint oldPoint = self.bullyButton.center;
    CGPoint newPoint = CGPointMake(CGRectGetMidX(self.bullyButton.bounds), 230.0);
    POPBasicAnimation *anim4 = [POPBasicAnimation linearAnimation];
    anim4.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    anim4.fromValue = [NSValue valueWithCGPoint:oldPoint];
    anim4.toValue = [NSValue valueWithCGPoint:newPoint];
    anim4.duration = 0.25;
    [self.bullyButton pop_addAnimation:anim4 forKey:@"center"];
    // comfortButton
    oldPoint = self.comfortButton.center;
    newPoint = CGPointMake(200.0, 100.0);
    POPBasicAnimation *anim5 = [POPBasicAnimation linearAnimation];
    anim5.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    anim5.fromValue = [NSValue valueWithCGPoint:oldPoint];
    anim5.toValue = [NSValue valueWithCGPoint:newPoint];
    anim5.duration = 0.25;
    [self.comfortButton pop_addAnimation:anim5 forKey:@"center"];
}

- (void)close:(UIButton *)btn {
    if (_animating) {
        return;
    }
    _animating = YES;
    [self animateKeyframe:self.closeButton completion:^(BOOL finished) {
        POPBasicAnimation *anim1 = [POPBasicAnimation linearAnimation];
        anim1.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
        anim1.fromValue = @(0.0);
        anim1.toValue = @(1.0);
        anim1.duration = 0.25;
        anim1.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            _animating = NO;
        };
        [self.interactionButton pop_addAnimation:anim1 forKey:@"alpha"];
        
        // closeButton
        POPBasicAnimation *anim3 = [POPBasicAnimation linearAnimation];
        anim3.fromValue = @(1.0);
        anim3.toValue = @(0.0);
        anim3.duration = 0.25;
        [self.closeButton pop_addAnimation:anim3 forKey:@"alpha"];
        // bullyButton
        CGPoint oldPoint = self.bullyButton.center;
        CGPoint newPoint = self.interactionButton.center;
        POPBasicAnimation *anim4 = [POPBasicAnimation linearAnimation];
        anim4.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        anim4.fromValue = [NSValue valueWithCGPoint:oldPoint];
        anim4.toValue = [NSValue valueWithCGPoint:newPoint];
        anim4.duration = 0.25;
        [self.bullyButton pop_addAnimation:anim4 forKey:@"center"];
        // comfortButton
        oldPoint = self.comfortButton.center;
        newPoint = self.interactionButton.center;
        POPBasicAnimation *anim5 = [POPBasicAnimation linearAnimation];
        anim5.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        anim5.fromValue = [NSValue valueWithCGPoint:oldPoint];
        anim5.toValue = [NSValue valueWithCGPoint:newPoint];
        anim5.duration = 0.25;
        [self.comfortButton pop_addAnimation:anim5 forKey:@"center"];
    }];
    
    // interactionButton
//    self.interactionButton.alpha = 1.0;

    
}

- (void)bully:(UIButton *)btn {
    if (_animating) {
        return;
    }
    _animating = YES;
    [self animateKeyframe:btn completion:^(BOOL finished) {
        _animating = NO;
    }];
}

- (void)comfort:(UIButton *)btn {
    if (_animating) {
        return;
    }
    _animating = YES;
    [self animateKeyframe:btn completion:^(BOOL finished) {
        _animating = NO;
    }];
}

#pragma mark - Privates

- (void)animateKeyframe:(UIView *)view completion:(void(^)(BOOL finished))completion{
    const NSTimeInterval duration = 0.25;
    CGRect originnalFrame = view.frame;
    CGFloat dx = CGRectGetWidth(view.frame) * 0.08;
    CGFloat dy = CGRectGetHeight(view.frame) * 0.08;
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            view.frame = CGRectInset(originnalFrame, dx, dy);
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 relativeDuration:0.5 animations:^{
            view.frame = originnalFrame;
        }];
    } completion:completion];
}

#pragma mark - Getter

- (UIButton *)interactionButton {
    if (_interactionButton == nil) {
        _interactionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_interactionButton setImage:[UIImage imageNamed:@"interaction_button_image"] forState:UIControlStateNormal];
        [_interactionButton setImage:[UIImage imageNamed:@"interaction_button_image"] forState:UIControlStateHighlighted];
        [_interactionButton addTarget:self action:@selector(interacts:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _interactionButton;
}

- (UIButton *)closeButton {
    if (_closeButton == nil) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"close_button_image"] forState:UIControlStateNormal];
        [_closeButton setImage:[UIImage imageNamed:@"close_button_image"] forState:UIControlStateHighlighted];
        [_closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchDown];
    }
    return _closeButton;
}

- (UIButton *)bullyButton {
    if (_bullyButton == nil) {
        _bullyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bullyButton setImage:[UIImage imageNamed:@"bully_button_image"] forState:UIControlStateNormal];
        [_bullyButton setImage:[UIImage imageNamed:@"bully_button_image"] forState:UIControlStateHighlighted];
        [_bullyButton addTarget:self action:@selector(bully:) forControlEvents:UIControlEventTouchDown];
    }
    return _bullyButton;
}

- (UIButton *)comfortButton {
    if (_comfortButton == nil) {
        _comfortButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_comfortButton setImage:[UIImage imageNamed:@"comfort_button_image"] forState:UIControlStateNormal];
        [_comfortButton setImage:[UIImage imageNamed:@"comfort_button_image"] forState:UIControlStateHighlighted];
        [_comfortButton addTarget:self action:@selector(comfort:) forControlEvents:UIControlEventTouchDown];
    }
    return _comfortButton;
}

@end
