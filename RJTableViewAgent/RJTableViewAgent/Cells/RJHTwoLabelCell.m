//
//  RJHTwoLabelCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJHTwoLabelCell.h"


@implementation RJHTwoLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _detailLab = [[UILabel alloc]init];
        _detailLab.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLab.font = kRJFontSize(14);
        _detailLab.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        [self.contentView addSubview:_detailLab];
        
        [self setHTwoLabelRightLayout];
        [self setHTwoLabelLayout];
    }
    return self;
}

- (void)setLabelLayout{
    [self.titleLab addLeftMarginConstraintWithConstant:0];
    [self.titleLab addTopMarginConstraintWithConstant:0];
    [self.titleLab addBottomMarginConstraintWithConstant:0];
}

- (void)setHTwoLabelRightLayout{
    [_detailLab addRightMarginConstraintWithConstant:0];
}

- (void)setHTwoLabelLayout{
    [self.titleLab addVAlignConstraintToViews:@[_detailLab] constant:0];
    _twoLabelHIntervalCons = [_detailLab.leadingAnchor constraintEqualToAnchor:self.titleLab.trailingAnchor constant:5];
    _twoLabelHIntervalCons.active = YES;
}

@end
