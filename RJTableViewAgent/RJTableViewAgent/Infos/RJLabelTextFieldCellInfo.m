//
//  RJLabelTextFieldCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelTextFieldCellInfo.h"

@implementation RJLabelTextFieldCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder{
    _bindingStringKVOPropertyName = NSStringFromSelector(@selector(textFieldText));
    self = [super initWithIndexPath:indexPath text:text font:font];
    if (self) {
        _cellType = CellTypeLabelTextField;
        self.placeholder = placeholder;
        self.textFieldText = textFieldText;
        self.textFieldFont = textFieldFont;
        self.textFieldTextColor = [RJTableViewAgentConfig sharedConfig].textColor;
        self.keyboardType = UIKeyboardTypeDefault;
        self.maxTextLength = 0;
        self.textFieldUserInteractionEnabled = YES;
        self.titleLabTextFieldInterval = 5;
        self.textLimit = RJTextLimitNone;
        self.textFieldHuggingPriority = UILayoutPriorityDefaultLow - 1;
        self.textFieldCompressionPriority = UILayoutPriorityDefaultHigh - 1;
        self.bindingStringMinLength = 1;
    }
    
    return self;
}

- (void)setBindingString:(NSString *)bindingString{
    [super setBindingString:bindingString];
    
    self.textFieldText = self.bindingString;
}

@end
