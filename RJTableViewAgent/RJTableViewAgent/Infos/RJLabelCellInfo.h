//
//  RJLabelCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RJBaseCellInfo.h"
#import <YYText/YYText.h>

@interface RJLabelCellInfo : RJBaseCellInfo

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *labelBackgroundColor;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) UIEdgeInsets alignmentRectInsets;

@property (nonatomic, strong) NSAttributedString *attributeString;

@property (nonatomic, assign) NSTextAlignment textAligment;

@property (nonatomic, assign) CGFloat titleLabelWidth;

@property (nonatomic, assign) BOOL yyLabelNeed;

/**YYLabel专用*/
@property (nonatomic, assign) CGFloat preferredMaxLayoutWidth;

@property (nonatomic, assign) CGFloat labelCornerRadius;

/**是否自动计算label高度,默认YES*/
@property (nonatomic, assign) BOOL autoLabelLine;

/**
 是否需要用到绑定Label的text,默认NO
 */
@property (nonatomic, assign) BOOL bindingEnable;

/**
 https://www.jianshu.com/p/e38157d7b828
 Content Hugging Priority: 该优先级表示一个控件抗被拉伸的优先级。优先级越高，越不容易被拉伸，默认是UILayoutPriorityDefaultLow = 250。
 Content Compression Resistance Priority: 该优先级和上面那个优先级相对应，表示一个控件抗压缩的优先级。优先级越高，越不容易被压缩，默认是UILayoutPriorityDefaultHigh = 750
 */
@property (nonatomic, assign) UILayoutPriority labelHuggingPriority;
@property (nonatomic, assign) UILayoutPriority labelCompressionPriority;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

@end
