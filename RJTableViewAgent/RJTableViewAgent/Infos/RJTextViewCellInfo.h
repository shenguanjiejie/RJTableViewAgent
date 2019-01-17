//
//  RJTextViewCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RJBaseCellInfo.h"
#import "RJTextLimit.h"

@class RJTextViewCellInfo;
typedef void(^RJTextViewDidChangeBlock)(UITextView *textView,__kindof RJTextViewCellInfo *info);
typedef BOOL(^RJTextViewShouldChangeTextBlock)(UITextView *textView,__kindof RJTextViewCellInfo *info,NSRange range,NSString *replacementText);

typedef NS_ENUM(NSUInteger, RJTextViewCellType) {
    RJTextViewCellType_UnderLine,
    RJTextViewCellType_Border
};

@interface RJTextViewCellInfo : RJBaseCellInfo

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

//@property (nonatomic, assign) CGFloat minHeight;
@property (nonatomic, strong) UIColor *numLabTextColor;

@property (nonatomic, assign) CGFloat textViewTopMargin;

@property (nonatomic, assign) CGFloat textViewBottomMargin;

@property (nonatomic, assign) CGFloat textViewCellCurrentHeight;

@property (nonatomic, assign) CGFloat textViewMaxHeight;

@property (nonatomic, assign) NSInteger maxLength;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, assign) BOOL textViewUserInteractionEnabled;

@property (nonatomic, assign) BOOL autoNumLabHidden;

/** 没有用上*/
@property (nonatomic, assign) BOOL textViewScrollEnable;

@property (nonatomic, assign) RJTextLimitType textLimit;

@property (nonatomic, copy) NSString *subRegex;

/**样式*/
@property (nonatomic, assign) RJTextViewCellType textViewCellType;

/**RJ 2019-01-17 15:00:43
 只添加了常用代理方法的监听,如果需要监听其他代理方法,可以在infoCellInitBlock中将该textView的代理改为自定义对象.
 不过届时textLimit和subRegex属性将失效,另外RJTextViewCellInfo也不能够再根据文本自适应高度,一切由你来自行处理.
 */
@property (nonatomic, copy) RJTextViewDidChangeBlock textViewDidChangeBlock;
@property (nonatomic, copy) RJTextViewShouldChangeTextBlock textViewShouldChangeTextBlock;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath placeholder:(NSString *)placeholder;

@end
