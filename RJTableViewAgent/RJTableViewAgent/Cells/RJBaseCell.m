//
//  RJBaseCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//



#import "RJBaseCell.h"

@interface RJBaseCell()
{
    NSLayoutConstraint *_lineLeftCons;
    NSLayoutConstraint *_lineRightCons;
}
@end

@implementation RJBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.preservesSuperviewLayoutMargins = NO;
        self.contentView.layer.masksToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.layoutMargins = UIEdgeInsetsMake(10, 15, 10, 15);
        
//        _lineViewLeftMargin = NSNotFound;
//        _lineViewRightMargin = NSNotFound;
        
        _lineView = [[UIView alloc]init];
        _lineView.hidden = YES;
        _lineView.translatesAutoresizingMaskIntoConstraints = NO;
        _lineView.backgroundColor = [RJTableViewAgentConfig sharedConfig].separateColor;
        [self.contentView addSubview:_lineView];
        
        [self setLineViewBottomLayout];
        [self setLineViewLayout];
    }
    return self;
}

- (void)setLineViewLayout{
    _lineLeftCons = [_lineView addLeftMarginConstraintWithConstant:0];
    _lineRightCons = [_lineView addRightMarginConstraintWithConstant:0];
    _lineViewHeightCons = [_lineView.heightAnchor constraintEqualToConstant:0.5];
    _lineViewHeightCons.active = YES;
}

- (void)setLineViewBottomLayout{
     [_lineView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
}

- (void)setLineViewLeftMargin:(CGFloat)lineViewLeftMargin{
    _lineViewLeftMargin = lineViewLeftMargin;
    
    if (_lineLeftCons) {
        _lineLeftCons.constant = -self.contentView.layoutMargins.left + lineViewLeftMargin;
    }
}

- (void)setLineViewRightMargin:(CGFloat)lineViewRightMargin{
    _lineViewRightMargin = lineViewRightMargin;
    if (_lineRightCons) {
        _lineRightCons.constant = self.contentView.layoutMargins.right - lineViewRightMargin;
    }
}




@end
