//
//  VasSonicViewController.m
//  Demo
//
//  Created by fengbo on 2019/3/6.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "VasSonicViewController.h"

#import "FBUtils.h"
#import <Masonry.h>

#import "RoundCornerView.h"

@interface VasSonicViewController ()

@end

@implementation VasSonicViewController

- (void)viewDidLoad {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 40.0)];
    label.font = [UIFont fontWithName:@"Oswald-Bold" size:16.0];
    label.text = @"16423";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

}

@end
