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
#import <POP.h>


@interface VasSonicViewController ()


@end

@implementation VasSonicViewController

- (void)viewDidLoad {
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"add" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(200.0);
        make.left.equalTo(100.0);
        make.size.equalTo(CGSizeMake(60.0, 30.0));
    }];
    
    
}

- (void)add:(UIButton *)button {

    
    
}

@end
