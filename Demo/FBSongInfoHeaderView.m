//
//  FBSongInfoHeaderView.m
//  Demo
//
//  Created by fengbo on 2019/3/12.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "FBSongInfoHeaderView.h"
#import <Masonry.h>

@interface FBSongInfoHeaderView ()

@property (nonatomic, strong) UIView *songInfoView;
@property (nonatomic, strong) UIView *bannerView;
@property (nonatomic, strong) UIView *tabBarView;

@end

@implementation FBSongInfoHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutSongInfoHeaderSubviews];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSongInfoHeaderSubviews {
    [self addSubview:self.songInfoView];
    [self addSubview:self.bannerView];
    [self addSubview:self.tabBarView];
    
    [self.songInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0.0);
        make.left.right.equalTo(0.0);
        make.height.equalTo(100.0);
    }];
    
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songInfoView.mas_bottom);
        make.left.right.equalTo(0.0);
        make.height.equalTo(64.0);
    }];
    
    [self.tabBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songInfoView.mas_bottom).offset(32.0 + 64.0);
        make.left.right.equalTo(0.0);
        make.height.equalTo(44.0);
        make.bottom.equalTo(0.0);
    }];
}

- (void)updateSubviewsContraints:(BOOL)isShowBannerView {
    

    CGFloat segmentOffset = 16.0;
    CGFloat bannerHeight = 64.0;
    if (isShowBannerView) {
        [self.bannerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(bannerHeight);
        }];
        
        segmentOffset = bannerHeight + 32.0;
    } else {
        [self.bannerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0.0);
        }];
    }
    
    [self.tabBarView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songInfoView.mas_bottom).offset(segmentOffset);
    }];
    
    [self updateConstraintsIfNeeded];
}

- (UIView *)songInfoView {
    if (_songInfoView == nil) {
        _songInfoView = [[UIView alloc] initWithFrame:CGRectZero];
        _songInfoView.backgroundColor = [UIColor orangeColor];
    }
    return _songInfoView;
}

- (UIView *)bannerView {
    if (_bannerView == nil) {
        _bannerView = [[UIView alloc] initWithFrame:CGRectZero];
        _bannerView.backgroundColor = [UIColor greenColor];
    }
    return _bannerView;
}

- (UIView *)tabBarView {
    if (_tabBarView == nil) {
        _tabBarView = [[UIView alloc] initWithFrame:CGRectZero];
        _tabBarView.backgroundColor = [UIColor cyanColor];
    }
    return _tabBarView;
}

@end
