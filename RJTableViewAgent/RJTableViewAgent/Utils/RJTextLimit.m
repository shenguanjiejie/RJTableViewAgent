//
//  RJTextLimit.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJTextLimit.h"

@interface RJTextLimit()
@end

@implementation RJTextLimit



+ (BOOL)validateWithText:(NSString *)text limit:(RJTextLimitType)limit{
    if (limit == RJTextLimitNone) {
        return YES;
    }
    
    if ((limit & RJTextLimitNumber) == RJTextLimitNumber && [self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitNumberAll) == RJTextLimitNumberAll && [self matchesRegex:RJTextLimitNumberAllRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitLetter) == RJTextLimitLetter && [self matchesRegex:RJTextLimitLetterRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitChinese) == RJTextLimitChinese && [self matchesRegex:RJTextLimitChineseRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitSymbol) == RJTextLimitSymbol && [self matchesRegex:RJTextLimitSymbolRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitEmoji) == RJTextLimitEmoji && [self matchesRegex:RJTextLimitEmojiRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitDecimal) == RJTextLimitDecimal && [self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    if ((limit & RJTextLimitDecimal2) == RJTextLimitDecimal2 && [self matchesRegex:RJTextLimitDecimal2Regex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)matchesRegex:(NSString *)regex withString:(NSString *)string options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)] > 0);
}

@end
