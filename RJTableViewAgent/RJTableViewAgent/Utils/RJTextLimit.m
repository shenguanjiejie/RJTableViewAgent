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
    if ((limit & RJTextLimitNone) == RJTextLimitNone) {
        return YES;
    }
    
    if ((limit & RJTextLimitNumber) == 0 && (limit & RJTextLimitNumberAll) == 0 && [self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    /**RJ 2019-09-17 22:16:32
     如果不包含RJTextLimitNumberAll, 而且验证通过了,而且包含RJTextLimitNumber,验证又未通过,那么就说明是类似0\d类型的数字, 所以return NO
     */
    if ((limit & RJTextLimitNumberAll) == 0 && [self matchesRegex:RJTextLimitNumberAllRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        if ((limit & RJTextLimitNumber) == RJTextLimitNumber) {
            if (![self matchesRegex:RJTextLimitNumberRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
                return NO;
            }
        }else{
            return NO;
        }
    }
    
    if ((limit & RJTextLimitLetter) == 0 && [self matchesRegex:RJTextLimitLetterRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if ((limit & RJTextLimitChinese) == 0 && [self matchesRegex:RJTextLimitChineseRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if ((limit & RJTextLimitSymbol) == 0 && [self matchesRegex:RJTextLimitSymbolRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    if ((limit & RJTextLimitEmoji) == 0 && [self matchesRegex:RJTextLimitEmojiRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    /**RJ 2019-09-17 22:10:35 如果既不包含RJTextLimitDecimal也不包含RJTextLimitDecimal2, 却又是一个小数,return NO*/
    if ((limit & RJTextLimitDecimal) == 0 && (limit & RJTextLimitDecimal2) == 0 && [self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        return NO;
    }
    
    /**RJ 2019-09-17 22:14:24 与上方RJTextLimitNumber和RJTextLimitNumberAll逻辑相同*/
    if ((limit & RJTextLimitDecimal2) == 0 && [self matchesRegex:RJTextLimitDecimal2Regex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
        if ((limit & RJTextLimitDecimal) == RJTextLimitDecimal) {
            if (![self matchesRegex:RJTextLimitDecimalRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators]) {
                return NO;
            }
        }else{
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)matchesRegex:(NSString *)regex withString:(NSString *)string options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)] > 0);
}

@end
