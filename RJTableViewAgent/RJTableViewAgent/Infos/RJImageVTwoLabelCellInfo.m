//
//  RJImageVTwoLabelCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJImageVTwoLabelCellInfo.h"

@implementation RJImageVTwoLabelCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize{
    self = [super initWithIndexPath:indexPath text:text font:font image:image imageSize:imageSize];
    if (self) {
        _cellType = CellTypeImageVTwoLabel;
        self.detailText = detailText;
        self.detailFont = detailFont;
        self.twoLabelVInterval = 0;
    }
    return self;
}

@end
