//
//  RJLabelButtonCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelButtonCell.h"
#import "UIView+RJVFL.h"


@implementation RJLabelButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _button = [[UIButton alloc]init];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.titleLabel.font = kRJFontSize(14);
        _button.adjustsImageWhenHighlighted = NO;
        [_button setTitleColor:[RJTableViewAgentConfig sharedConfig].textColor forState:UIControlStateNormal];
//        [_button addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];

        [self.contentView addSubview:_button];
        
        [self setLabelButtonLayout];
        [self setButtonLayout];
    }
    return self;
}

- (void)setLabelLayout{
    [self.titleLab addLeftMarginConstraintWithConstant:0];
    [self.titleLab addTopMarginConstraintWithConstant:0];
    [self.titleLab addBottomMarginConstraintWithConstant:0];
}

/**<#你猜😜#>*/
- (void)setLabelButtonLayout{
    self.titleLabelRightCons = [self.titleLab addRightConstraintToView:self.button constant:5];
//    _titleLabButtonIntervalCons = [_button.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.titleLab.trailingAnchor constant:5];
//    _titleLabButtonIntervalCons.active = YES;
    
    [_button addWidthConstraintWithConstant:20].active = NO;
//    _buttonWidthCons = [_button addWidthConstraintWithConstant:20];
//    _buttonWidthCons.active = NO;
}

- (void)setButtonLayout{
    [_button addRightMarginConstraintWithConstant:0];
    [_button addTopMarginConstraintWithConstant:0];
    [_button addBottomMarginConstraintWithConstant:0];
}

@end
