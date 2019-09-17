//
//  UIViewController+PresentViewController.m
//  Demo
//
//  Created by fengbo on 2019/9/17.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "UIViewController+PresentViewController.h"
#import "RSSwizzle.h"
#import <objc/runtime.h>

static void *kPresentMethodSwizzlingKey = &kPresentMethodSwizzlingKey;
static void *kDismissMethodSwizzlingkey = &kDismissMethodSwizzlingkey;

@implementation UIViewController (PresentViewController)

+ (void)load {
    SEL presentSel = @selector(presentViewController:animated:completion:);
    SEL dismissSel = @selector(dismissViewControllerAnimated:completion:);

    RSSwizzleInstanceMethod(UIViewController, presentSel, RSSWReturnType(void), RSSWArguments(UIViewController *vcToPresent, BOOL flags, void(^__nullable completion)(void)), RSSWReplacement({
        if ([self presentedViewController]) {
            NSMutableDictionary *vcInfo = @{@"vc": vcToPresent,
                                            @"flags": @(flags)
                                            }.mutableCopy;
            if (completion) {
                vcInfo[@"completion"] = completion;
            }
            [[self _fb_vcsToPresent] addObject:vcInfo];
        } else {
            RSSWCallOriginal(vcToPresent, flags, completion);
        }
    }), RSSwizzleModeOncePerClass, kPresentMethodSwizzlingKey);
    
    RSSwizzleInstanceMethod(UIViewController, dismissSel, RSSWReturnType(void), RSSWArguments(BOOL flags, void(^completoin)(void)), RSSWReplacement({
        __weak typeof(self) wself = self;
        void(^overridedCompletion)(void) = ^{
            __strong typeof(self) sself = wself;
            if (completoin) {
                completoin();
            }
            
            if (!sself) return ;
            NSMutableArray *vcsToPresent = [sself _fb_vcsToPresent];
            NSDictionary *vcInfo;
            if (vcsToPresent.count) {
                vcInfo = vcsToPresent.firstObject;
                [vcsToPresent removeObjectAtIndex:0];
            }
            if (vcInfo) {
                [self presentViewController:vcInfo[@"vc"] animated:[vcInfo[@"flags"] boolValue] completion:vcInfo[@"completion"]];
            }
        };
        RSSWCallOriginal(flags, overridedCompletion);
    }), RSSwizzleModeOncePerClass, kDismissMethodSwizzlingkey);
}


- (NSMutableArray *)_fb_vcsToPresent {
    NSMutableArray *vcsToPresent = objc_getAssociatedObject(self, @selector(_fb_vcsToPresent));
    if (vcsToPresent == nil) {
        vcsToPresent = @[].mutableCopy;
        objc_setAssociatedObject(self, @selector(_fb_vcsToPresent), vcsToPresent, OBJC_ASSOCIATION_RETAIN);
    }
    return vcsToPresent;
}



@end
