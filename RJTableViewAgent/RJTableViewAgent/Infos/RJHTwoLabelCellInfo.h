//
//  RJHTwoLabelCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"

@interface RJHTwoLabelCellInfo : RJLabelCellInfo

@property (nonatomic, copy) NSString *detailText;

/** 绑定一个字符串,当detailText变动之后,该字符串也会动态变动*/
//@property (nonatomic, strong) NSMutableString *detailLabelBindingString;

@property (nonatomic, strong) UIColor *detailTextColor;

@property (nonatomic, strong) UIFont *detailFont;

@property (nonatomic, strong) NSAttributedString *detailAttributeString;

@property (nonatomic, assign) NSTextAlignment detailTextAligment;

@property (nonatomic, assign) CGFloat twoLabelHInterval;

/** default:249*/
@property (nonatomic, assign) UILayoutPriority detailLabelHuggingPriority;
/** default:749*/
@property (nonatomic, assign) UILayoutPriority detailLabelCompressionPriority;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont;

@end
