//
//  UITextField+JKInputLimit.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "UITextField+RJInputLimit.h"
#import <objc/runtime.h>



static const void *JKTextFieldInputLimitMaxLength = &JKTextFieldInputLimitMaxLength;
//static void const *TextFieldTextTypeValidateKey = @"TextFieldTextTypeValidateKey";

@implementation UITextField (JKInputLimit)


//- (void)setTextFieldTextTypeValidate:(TextFieldTextTypeValidate)textFieldTextTypeValidate{
//    objc_setAssociatedObject(self, TextFieldTextTypeValidateKey, @(textFieldTextTypeValidate), OBJC_ASSOCIATION_ASSIGN);
//    [self addTarget:self action:@selector(rj_textFieldTextTypeValidate) forControlEvents:UIControlEventEditingChanged];
//}
//
//- (TextFieldTextTypeValidate)textFieldTextTypeValidate{
//    return [objc_getAssociatedObject(self, TextFieldTextTypeValidateKey) integerValue];
//}

+ (void)load {
    // is this the best solution?
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
}

- (void)swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSInteger length = [objc_getAssociatedObject(self, @selector(rj_maxLength)) integerValue];
    if (length) {
        @try {
            [[NSNotificationCenter defaultCenter] removeObserver:self];
        }
        @catch (NSException *exception) {
            // Do nothing
            
        }
    }
    
    [self swizzledDealloc];
}


- (NSInteger)rj_maxLength {
    return [objc_getAssociatedObject(self, JKTextFieldInputLimitMaxLength) integerValue];
}
- (void)setRj_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    if (maxLength) {
        [self addTarget:self action:@selector(jk_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
    }
}

- (void)jk_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.rj_maxLength > 0 && toBeString.length > self.rj_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.rj_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.rj_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.rj_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.rj_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
    
}

@end
