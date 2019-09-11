//
//  PopUpView.h
//  Demo
//
//  Created by fengbo on 2019/7/12.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopUpView : UIView

// 起始点
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat arrowOffsetX;

// 箭头大小
@property (nonatomic, assign) CGSize arrowSize;
// 圆角半径
@property (nonatomic, assign) CGFloat cornerRadius;
// 填充色
@property (nonatomic, strong) UIColor *fillColor;

@end

NS_ASSUME_NONNULL_END
