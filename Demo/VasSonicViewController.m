//
//  VasSonicViewController.m
//  Demo
//
//  Created by fengbo on 2019/3/6.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "VasSonicViewController.h"
#import "PresentedViewController.h"

#import "FBUtils.h"
#import <Masonry.h>



@interface VasSonicViewController ()

@end

@implementation VasSonicViewController

- (void)viewDidLoad {
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(10.0, 100.0, 100.0, 40.0);
    [presentButton setTitle:@"present" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
}

- (void)presentVC:(UIButton *)btn {
    PresentedViewController *presentedVC = [[PresentedViewController alloc] init];
    
//    [self presentViewController:presentedVC animated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:presentedVC animated:YES completion:nil];
}

@end
