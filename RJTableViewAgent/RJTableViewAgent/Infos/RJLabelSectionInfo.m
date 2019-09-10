//
//  RJLabelSectionInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 diling. All rights reserved.
//

#import "RJLabelSectionInfo.h"

@implementation RJLabelSectionInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font
{
    //    _bindingStringKVOPropertyName = @"text";
    self = [super initWithSectionType:RJSectionTypeLabel indexPath:indexPath];
    if (self) {
        _text = text;
        _textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        _font = font?font:kRJFontSize(12);
        self.layoutMargins = UIEdgeInsetsMake(5, 15, 5, 15);
        _attributeString = nil;
        _textAligment = NSTextAlignmentLeft;
        _yyLabelNeed = NO;
        _preferredMaxLayoutWidth = kRJScreenWidth - 30;
        _titleLabelWidth = NSNotFound;
        _labelBackgroundColor = [UIColor clearColor];
        _alignmentRectInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _autoLabelLine = YES;
        _labelHuggingPriority = UILayoutPriorityDefaultLow;
        _labelCompressionPriority = UILayoutPriorityDefaultHigh;
        _bindingEnable = NO;
    }
    return self;
}


@end
