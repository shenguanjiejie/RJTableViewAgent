//
//  RJHTwoLabelCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJHTwoLabelCellInfo.h"

@implementation RJHTwoLabelCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont{
    _bindingStringKVOPropertyName = NSStringFromSelector(@selector(detailText));
    self = [super initWithIndexPath:indexPath text:text font:font];
    if (self) {
        _cellType = CellTypeHTwoLabel;
        self.detailTextColor = [RJTableViewAgentConfig sharedConfig].subTextColor;
//        self.detailPlaceholderTextColor = [RJTableViewAgentConfig sharedConfig].placeholderColor;
        self.detailFont = detailFont;
        self.detailText = detailText;
//        self.detail = NSTextAlignmentRight;
        self.detailTextAligment = NSTextAlignmentLeft;
        self.twoLabelHInterval = 5;
        self.detailLabelHuggingPriority = UILayoutPriorityDefaultLow - 1;
        self.detailLabelCompressionPriority = UILayoutPriorityDefaultHigh - 1;
    }
    
    return self;
}

- (void)setBindingString:(NSString *)bindingString{
    [super setBindingString:bindingString];
    self.detailText = self.bindingString;
}

@end
