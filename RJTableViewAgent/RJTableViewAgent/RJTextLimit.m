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
    
    if (limit == RJTextLimitNumber && ![self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitNumberAll && ![self matchesRegex:RJTextLimitNumberAllRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitLetter && ![self matchesRegex:RJTextLimitLetterRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitChinese && ![self matchesRegex:RJTextLimitChineseRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitSymbol && ![self matchesRegex:RJTextLimitSymbolRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitEmoji && ![self matchesRegex:RJTextLimitEmojiRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitDecimal && ![self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == RJTextLimitDecimal2 && ![self matchesRegex:RJTextLimitDecimal2Regex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if (limit == (RJTextLimitNumber | RJTextLimitDecimal) && !([self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators] && [self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators])) {
        return NO;
    }
    
    if (limit == (RJTextLimitNumber | RJTextLimitDecimal2) && !([self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators] && [self matchesRegex:RJTextLimitDecimal2Regex withString:text options:NSRegularExpressionDotMatchesLineSeparators])) {
        return NO;
    }
    
    if (limit == (RJTextLimitNumberAll | RJTextLimitDecimal) && !([self matchesRegex:RJTextLimitNumberAllRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators] && [self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators])) {
        return NO;
    }
    
    if (limit == (RJTextLimitAllNumber | RJTextLimitDecimal2) && !([self matchesRegex:RJTextLimitNumberAllRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators] && [self matchesRegex:RJTextLimitDecimal2Regex withString:text options:NSRegularExpressionDotMatchesLineSeparators])) {
        return NO;
    }
    return YES;
}

+ (BOOL)matchesRegex:(NSString *)regex withString:(NSString *)string options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)] > 0);
}

@end
