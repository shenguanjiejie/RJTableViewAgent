//
//  RJSectionInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 diling. All rights reserved.
//

#import "RJBaseSectionInfo.h"

@implementation RJBaseSectionInfo

- (instancetype)initWithSectionType:(RJSectionType)sectionType indexPath:(NSIndexPath *)indexPath{
    self = [super init];
    if (self) {
        self.sectionType = sectionType;
        self.indexPath = indexPath;
        self.backgroundColor = [UIColor clearColor];
        self.cellInfos = [NSMutableArray array];
        self.layoutMargins = UIEdgeInsetsMake(10, 15, 10, 15);
        self.open = YES;
    }
    return self;
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    _layoutMargins = UIEdgeInsetsMake(topMargin, _layoutMargins.left, _layoutMargins.bottom, _layoutMargins.right);
}

- (void)setLeftMargin:(CGFloat)leftMargin{
    _leftMargin = leftMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, leftMargin, _layoutMargins.bottom, _layoutMargins.right);
}

- (void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, _layoutMargins.left, bottomMargin, _layoutMargins.right);
}

- (void)setRightMargin:(CGFloat)rightMargin{
    _rightMargin = rightMargin;
    _layoutMargins = UIEdgeInsetsMake(_layoutMargins.top, _layoutMargins.left, _layoutMargins.bottom, rightMargin);
}

@end
