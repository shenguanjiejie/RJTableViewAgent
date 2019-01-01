//
//  RJLabelTextFieldCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelTextFieldCell.h"
#import "UIView+RJVFL.h"

@implementation RJLabelTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        _textField.font = kRJFontSize(15);
//        _textField.contentMode = UIViewContentModeCenter;
        _textField.keyboardType = UIKeyboardTypeDefault;
        [self.contentView addSubview:_textField];
        
        [self setLabelTextFieldLayout];
    }
    return self;
}

- (void)setLabelLayout{
    [self.titleLab addLeftMarginConstraintWithConstant:0];
    [self.titleLab addTopMarginConstraintWithConstant:0];
    [self.titleLab addBottomMarginConstraintWithConstant:0];
}

- (void)setLabelTextFieldLayout{
    [_textField addRightMarginConstraintWithConstant:0];
    
    /** 不适用margin方式约束,是因为textField太矮的话,会点不到*/
    [self.contentView addVAlignConstraintToView:_textField constant:0];
    [self.titleLab addRightConstraintToView:self.textField constant:5];
}

@end
