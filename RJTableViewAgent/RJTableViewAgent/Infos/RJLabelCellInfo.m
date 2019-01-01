//
//  RJLabelCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"
#import "NSObject+RJObject.h"
@implementation RJLabelCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font
{
//    _bindingStringKVOPropertyName = @"text";
    self = [super initWithCellType:CellTypeLabel indexPath:indexPath];
    if (self) {
        _text = text;
        _textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        _font = font?font:kRJFontSize(12);
        _attributeString = nil;
        _textAligment = NSTextAlignmentLeft;
        self.yyLabelNeed = NO;
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

- (void)setBindingEnable:(BOOL)bindingEnable{
    _bindingEnable = bindingEnable;
    if (bindingEnable) {
        _bindingStringKVOPropertyName = NSStringFromSelector(@selector(text));
        [self addObserver:self forKeyPath:_bindingStringKVOPropertyName options:NSKeyValueObservingOptionNew context:nil];
    }else{
        [self removeRJCellObserver];
    }
}

- (void)setBindingString:(NSString *)bindingString{
    [super setBindingString:bindingString];
    
    if (_bindingEnable) {
        self.text = self.bindingString;
    }
}

- (void)setYyLabelNeed:(BOOL)yyLabelNeed{
    _yyLabelNeed = yyLabelNeed;
    
    self.identifier = [[self className] stringByAppendingString:[@(yyLabelNeed) stringValue]];
}


@end
