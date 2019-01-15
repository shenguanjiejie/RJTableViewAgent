//
//  RJTextLimit.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 http://www.jianshu.com/p/26a9c1560d9c
 正则匹配约束字符输入
 
 - RJTextLimitNone: 默认值,无限制
 - RJTextLimitNumber: 0或者非0开头的数字:^(0|[1-9][0-9]*)$
 - RJTextLimitNumberAll: 数字:^[0-9]*$
 - RJTextLimitLetter: 字母:^[A-Za-z]+$
 - RJTextLimitChinese: 中文:^[\u4e00-\u9fa5]{0,}$
 - RJTextLimitEmoji: 表情:[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]
 - RJTextLimitSymbol: 特殊字符:((?=[\\x21-\\x7e]+)[^A-Za-z0-9])
 - RJTextLimitNumberLetter: 数字或字母
 - RJTextLimitNumberLetterSymbol: 数字字母或特殊字符
 - RJTextLimitNoEmoji: 除了表情之外的其他字符
 
 */
typedef NS_ENUM(NSUInteger, RJTextLimitType) {
    RJTextLimitNone = 0,
    RJTextLimitNumber = 1 << 0,
    RJTextLimitNumberAll = 1 << 1,
    RJTextLimitLetter = 1 << 2,
    RJTextLimitChinese = 1 << 3,
    RJTextLimitEmoji = 1 << 4,
    RJTextLimitSymbol = 1 << 5,
    RJTextLimitDecimal = 1 << 6,
    RJTextLimitDecimal2 = 1 << 7,
    RJTextLimitNumberLetter = RJTextLimitNumberAll | RJTextLimitLetter,
    RJTextLimitNumberLetterSymbol = RJTextLimitNumberAll | RJTextLimitLetter | RJTextLimitSymbol,
    RJTextLimitNoEmoji = RJTextLimitNumberAll | RJTextLimitLetter | RJTextLimitSymbol | RJTextLimitChinese,
};

static NSString * const RJTextLimitNumberRegex = @"^(0|[1-9][0-9]*)$";
static NSString * const RJTextLimitNumberAllRegex = @"^[0-9]*$";
//static NSString * const RJTextLimitDecimalRegex = @"^[0-9]+([.]{1}[0-9]+){0,1}$";
/**这里修改,使得如"2." 这样的形式也能通过验证,否则用户无法输入了*/
static NSString * const RJTextLimitDecimalRegex = @"^[0-9]+([.]{1}[0-9]*){0,1}$";
/**默认支持2位小数*/
static NSString * const RJTextLimitDecimal2Regex = @"^[0-9]+([.]{1}([0-9]{0,2})){0,1}$";
static NSString * const RJTextLimitLetterRegex = @"^[A-Za-z]+$";
static NSString * const RJTextLimitChineseRegex = @"^[\u4e00-\u9fa5]{0,}$";
static NSString * const RJTextLimitEmojiRegex = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";
static NSString * const RJTextLimitSymbolRegex = @"((?=[\\x21-\\x7e]+)[^A-Za-z0-9])";

@interface RJTextLimit : NSObject

/**
目前只支持
 RJTextLimitNumber | RJTextLimitDecimal
 RJTextLimitNumber | RJTextLimitDecimal2
 RJTextLimitNumberAll | RJTextLimitDecimal
 RJTextLimitNumberAll | RJTextLimitDecimal2
 四种合并检测
 TODO:可以使用一个字典进行匹配,则可支持所有合并检测,暂时未实现
 */
+ (BOOL)validateWithText:(NSString *)text limit:(RJTextLimitType)limit;

+ (BOOL)matchesRegex:(NSString *)regex withString:(NSString *)string options:(NSRegularExpressionOptions)options;

@end
