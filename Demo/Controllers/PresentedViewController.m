//
//  PresentedViewController.m
//  Demo
//
//  Created by fengbo on 2019/9/16.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.frame = CGRectMake(10.0, 100.0, 100.0, 40.0);
    [dismissButton setTitle:@"dimiss" forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismissVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(150.0, 100.0, 100.0, 40.0);
    [presentButton setTitle:@"present" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
}

- (void)dealloc {
    NSLog(@"dealloc PresentedViewController");
}

- (void)dismissVC:(UIButton *)btn {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentVC:(UIButton *)btn {
    
    PresentedViewController *presentedVC = [[PresentedViewController alloc] init];
//
//    [self presentViewController:presentedVC animated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:presentedVC animated:YES completion:nil];
}

@end
