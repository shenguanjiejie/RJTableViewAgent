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
typedef BOOL(^RJTextFieldShouldChangeCharactersBlock)(UITextField *textField,__kindof RJLabelTextFieldCellInfo *info,NSRange range,NSString *replacementString);
@interface RJLabelTextFieldCellInfo : RJLabelCellInfo

@property (nonatomic, copy) NSString *textFieldText;

@property (nonatomic, strong) UIColor *textFieldTextColor;

@property (nonatomic, strong) UIFont *textFieldFont;

@property (nonatomic, copy) NSString *placeholder;

/**RJ 2019-09-10 20:59:15 会同步设置bindingStringMaxLength属性*/
@property (nonatomic, assign) CGFloat maxTextLength;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, assign) BOOL textFieldUserInteractionEnabled;

@property (nonatomic, assign) BOOL textFieldIsSecureTextEntry;

@property (nonatomic, assign) CGFloat titleLabTextFieldInterval;

/**RJ 2019-09-10 15:19:11 正则校验*/
@property (nonatomic, assign) RJTextLimitType textLimit;

/**RJ 2019-09-10 15:57:35 自定义附加正则校验*/
@property (nonatomic, copy) NSString *subRegex;

/** default:249*/
@property (nonatomic, assign) UILayoutPriority textFieldHuggingPriority;
/** default:749*/
@property (nonatomic, assign) UILayoutPriority textFieldCompressionPriority;

/**RJ 2019-01-17 14:56:56
 只添加了常用代理方法的监听,如果需要监听其他代理方法,可以在infoCellInitBlock中将该textField的代理改为自定义对象.
 */
@property (nonatomic, copy) RJTextFieldDidEndEditingBlock textFieldDidEndEditingBlock;
@property (nonatomic, copy) RJTextFieldShouldChangeCharactersBlock textFieldShouldChangeCharactersBlock;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder;

@end
