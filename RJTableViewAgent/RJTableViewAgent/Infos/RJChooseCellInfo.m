//
//  RJChooseCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJChooseCellInfo.h"

@implementation RJChooseCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont{
    self = [super initWithIndexPath:indexPath text:text font:font detailText:detailText detailFont:detailFont];
    if (self) {
        _cellType = CellTypeChoose;
        self.detailTextColor = [RJTableViewAgentConfig sharedConfig].textColor;
        self.detailPlaceholderTextColor = [RJTableViewAgentConfig sharedConfig].placeholderColor;
        self.detailPlaceholderTextAligment = NSTextAlignmentRight;
        self.detailPlaceholderText = placeholder;
        self.detailLabImageViewInterval = 5;
        self.rightArrowHidden = NO;
        self.bindingStringMinLength = 1;
        self.image = [RJTableViewAgentConfig sharedConfig].rightArrow;
    }
    
    return self;
}

@end
