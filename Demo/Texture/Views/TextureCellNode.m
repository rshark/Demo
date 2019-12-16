//
//  TextureCellNode.m
//  Demo
//
//  Created by fengbo on 2019/11/14.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "TextureCellNode.h"

@implementation TextureCellNode {
    ASTextNode *_titleNode;
    ASTextNode *_subtitleNode;
}

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    
    self = [super init];
    if (self) {
        _titleNode = [[ASTextNode alloc] init];
        NSDictionary *titleAttr = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0], NSForegroundColorAttributeName: [UIColor cyanColor]};
        NSDictionary *subtitleAttr = @{NSFontAttributeName: [UIFont systemFontOfSize:12.0], NSForegroundColorAttributeName: [UIColor lightGrayColor]};
        _titleNode.attributedText = [[NSAttributedString alloc] initWithString:title attributes:titleAttr];
        _subtitleNode = [[ASTextNode alloc] init];
        _subtitleNode.attributedText = [[NSAttributedString alloc] initWithString:subtitle attributes:subtitleAttr];
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:10.0 justifyContent:ASStackLayoutJustifyContentSpaceAround alignItems:ASStackLayoutAlignItemsStart children:@[_titleNode, _subtitleNode]];
    stackSpec.style.minHeight = ASDimensionMakeWithPoints(60.0);
    return stackSpec;
}

@end
