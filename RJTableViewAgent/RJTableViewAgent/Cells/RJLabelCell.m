//
//  RJLabelCell.m
//  RJTableViewAgent
//
//  Created by 申瑞杰 on 2017/10/3.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//


#import "RJLabelCell.h"

@interface RJLabelCell()
{
//    NSLayoutConstraint *_topConstraint;
//    NSLayoutConstraint *_bottomConstraint;
//    NSLayoutConstraint *_leftConstraint;
//    NSLayoutConstraint *_rightConstraint;
}
@end

@implementation RJLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    return [self initWithStyle:style reuseIdentifier:reuseIdentifier yyLabelNeed:NO];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier yyLabelNeed:(BOOL)yyLabelNeed{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        if (yyLabelNeed) {
            _titleLab =  [[YYLabel alloc] init];
           YYLabel *yyLabel = _titleLab;
            yyLabel.layer.masksToBounds = YES;
            yyLabel.translatesAutoresizingMaskIntoConstraints = NO;
            yyLabel.font = kRJFontSize(14);
            yyLabel.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
            yyLabel.numberOfLines = 0;
            yyLabel.lineBreakMode = NSLineBreakByCharWrapping;
        }else{
            _titleLab = [[UILabel alloc]init];
            UILabel *label = _titleLab;
            label.layer.masksToBounds = YES;
            label.translatesAutoresizingMaskIntoConstraints = NO;
            label.font = kRJFontSize(14);
            label.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
            label.numberOfLines = 0;
            label.lineBreakMode = NSLineBreakByCharWrapping;
        }
        
        [self.contentView addSubview:_titleLab];
        
        _titleLabelWidthCons = [_titleLab.widthAnchor constraintEqualToConstant:0];
        self.minHeightCons = [_titleLab.heightAnchor constraintGreaterThanOrEqualToConstant:0];
        
        [self setLabelLayout];
    }
    return self;
}

- (void)setLabelLayout{
    [_titleLab addLeftMarginConstraintWithConstant:0];
    _titleLabelRightCons = [_titleLab addRightMarginConstraintWithConstant:0];
    [_titleLab addTopMarginConstraintWithConstant:0];
    [_titleLab addBottomMarginConstraintWithConstant:0];
}



@end
