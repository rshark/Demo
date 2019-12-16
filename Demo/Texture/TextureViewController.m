//
//  TextureViewController.m
//  Demo
//
//  Created by fengbo on 2019/11/13.
//  Copyright © 2019 fengbo. All rights reserved.
//

#import "TextureViewController.h"
#import "TextureCellNode.h"
#import "FBUtils.h"

@interface TextureViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation TextureViewController

- (instancetype)init {
    ASDisplayNode *node = [ASDisplayNode new];
    self = [super initWithNode:node];
    if (self) {
        node.backgroundColor = [UIColor whiteColor];
        
        ASDisplayNode *subNode = [ASDisplayNode new];
        subNode.backgroundColor = [UIColor lightGrayColor];
        [node addSubnode:subNode];
        
        ASDisplayNode *subNode1 = [ASDisplayNode new];
        subNode1.backgroundColor = [UIColor cyanColor];
        subNode1.style.preferredSize = CGSizeMake(100.0, 200.0);
        [subNode addSubnode:subNode1];
    
        node.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionMinimumXY child:subNode];
        };
        
        subNode.layoutSpecBlock = ^ASLayoutSpec * _Nonnull(__kindof ASDisplayNode * _Nonnull node, ASSizeRange constrainedSize) {
            return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:[ASRatioLayoutSpec ratioLayoutSpecWithRatio:0.5 child:subNode1]];
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

#pragma mark - ASTableDelegate


#pragma mark - ASTableDataSource


- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ^ASCellNode *{
        TextureCellNode *cellNode = [[TextureCellNode alloc] init];
        return cellNode;
    };
}

@end
