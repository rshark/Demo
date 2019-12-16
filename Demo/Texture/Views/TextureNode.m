//
//  TextureNode.m
//  Demo
//
//  Created by fengbo on 2019/11/18.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "TextureNode.h"
#import "FBUtils.h"

@implementation TextureNode {
    ASDisplayNode *_subNode;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _subNode = [ASDisplayNode new];
        _subNode.backgroundColor = [FBUtils fb_randomColor];
        [self addSubnode:_subNode];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    _subNode.style.layoutPosition = CGPointMake(50.0, 200.0);
    _subNode.style.preferredSize = CGSizeMake(200.0, 100.0);
    return [ASAbsoluteLayoutSpec absoluteLayoutSpecWithChildren:@[_subNode]];
}

@end
