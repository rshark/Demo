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
#import "PopAnimViews.h"


@interface VasSonicViewController ()


@end

@implementation VasSonicViewController

- (void)viewDidLoad {
 
    PopAnimViews *animViews = [[PopAnimViews alloc] initWithFrame:CGRectMake(50.0, 200.0, 300.0, 300.0)];
    animViews.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:animViews];
    
}

- (void)add:(UIButton *)button {

    
    
}

@end
