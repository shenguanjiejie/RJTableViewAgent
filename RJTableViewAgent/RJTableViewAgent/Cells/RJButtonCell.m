//
//  RJButtonCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJButtonCell.h"

@implementation RJButtonCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _button = [[UIButton alloc]init];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.titleLabel.font = kRJFontSize(14);
        _button.adjustsImageWhenHighlighted = NO;
        [_button setTitle:@"" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_button addTarget:self action:@selector(<#selector#>) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        [_button addBottomMarginConstraintWithConstant:0.5];
        [_button addRightMarginConstraintWithConstant:0];
        [_button addTopMarginConstraintWithConstant:0];
        [_button addLeftMarginConstraintWithConstant:0];
        
    }
    
    return self;
}
@end
