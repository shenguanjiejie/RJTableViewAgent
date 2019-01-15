//
//  RJLabelTextFieldCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"
#import "RJTextLimit.h"

@class RJLabelTextFieldCellInfo;
typedef void(^RJTextFieldDidEndEditingBlock)(UITextField *textField,__kindof RJLabelTextFieldCellInfo *info);

@interface RJLabelTextFieldCellInfo : RJLabelCellInfo

@property (nonatomic, copy) NSString *textFieldText;

@property (nonatomic, strong) UIColor *textFieldTextColor;

@property (nonatomic, strong) UIFont *textFieldFont;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) CGFloat maxLength;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, assign) BOOL textFieldUserInteractionEnabled;

@property (nonatomic, assign) BOOL textFieldIsSecureTextEntry;

@property (nonatomic, assign) CGFloat titleLabTextFieldInterval;

/**
 目前只支持
 RJTextLimitNumber | RJTextLimitDecimal
 RJTextLimitNumber | RJTextLimitDecimal2
 RJTextLimitNumberAll | RJTextLimitDecimal
 RJTextLimitNumberAll | RJTextLimitDecimal2
 四种合并Limit
 */
@property (nonatomic, assign) RJTextLimitType textLimit;

@property (nonatomic, copy) NSString *subRegex;

/** default:249*/
@property (nonatomic, assign) UILayoutPriority textFieldHuggingPriority;
/** default:749*/
@property (nonatomic, assign) UILayoutPriority textFieldCompressionPriority;

@property (nonatomic, copy) RJTextFieldDidEndEditingBlock textFieldDidEndEditingBlock;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder;

@end
