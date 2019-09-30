//
//  RJTextViewCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJTextViewCellInfo.h"

@implementation RJTextViewCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath placeholder:(NSString *)placeholder{
    _bindingStringKVOPropertyName = NSStringFromSelector(@selector(text));
    self = [super initWithCellType:CellTypeTextView indexPath:indexPath];
    if (self) {
        self.placeholder = placeholder;
        self.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        self.font = kRJFontSize(15);
        self.keyboardType = UIKeyboardTypeDefault;
        self.maxTextLength = 0;
        self.lineColor = [RJTableViewAgentConfig sharedConfig].separateColor;
        self.lineHeight = 1;
        self.topMargin = 0;
        self.lineViewBottomMargin = 15;
        self.bottomMargin = 0;
        self.numLabBottomMargin = 0;
        self.autoNumLabHidden = YES;
        self.textViewUserInteractionEnabled = YES;
        self.placeholderColor = [RJTableViewAgentConfig sharedConfig].placeholderColor;
        self.numLabTextColor = [RJTableViewAgentConfig sharedConfig].textColor;
        self.bindingStringMinLength = 1;
        self.textViewMaxHeight = NSNotFound;
        self.textViewCellCurrentHeight = NSNotFound;
        self.textViewScrollEnable = NO;
        self.textViewMaxHeight = NSNotFound;
        self.textViewCellType = RJTextViewCellTypeUnderLine;
    }
    
    return self;
}

- (void)setBindingString:(NSString *)bindingString{
    [super setBindingString:bindingString];
    self.text = self.bindingString;
}

- (void)setTextViewCellType:(RJTextViewCellType)textViewCellType{
    if (textViewCellType == _textViewCellType) {
        return;
    }
    _textViewCellType = textViewCellType;
    if (textViewCellType == RJTextViewCellTypeBorder) {
        self.lineHidden = YES;
    }else if (textViewCellType == RJTextViewCellTypeUnderLine){
        self.lineHidden = NO;
        self.textViewMaxHeight = 120;
    }
}

@end
