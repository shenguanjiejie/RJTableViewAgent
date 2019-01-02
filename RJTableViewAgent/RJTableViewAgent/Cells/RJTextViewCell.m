//
//  RJTextViewCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJTextViewCell.h"
#import "UITextView+RJPlaceholder.h"


@interface RJTextViewCell()
{
    NSLayoutConstraint *_topConstraint;
    NSLayoutConstraint *_minHeightConstraint;
    NSLayoutConstraint *_maxHeightConstraint;
    NSLayoutConstraint *_bottomConstraint;
    NSLayoutConstraint *_lineHeightConstraint;
}
@end

@implementation RJTextViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.preservesSuperviewLayoutMargins = NO;
        
        _textView = [[UITextView alloc] init];
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        _textView.textColor = [RJTableViewAgentConfig sharedConfig].textColor;
        _textView.font = kRJFontSize(16);
        _textView.scrollEnabled = NO;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.placeholderColor = [RJTableViewAgentConfig sharedConfig].placeholderColor;
        [self.contentView addSubview:_textView];
        
//        _lineView = [[UIImageView alloc] init];
//        _lineView.translatesAutoresizingMaskIntoConstraints = NO;
//        _lineView.backgroundColor = [RJTableViewAgentConfig sharedConfig].separateColor;
//        [self.contentView addSubview:_lineView];
        
        _numLab = [[UILabel alloc]init];
        _numLab.translatesAutoresizingMaskIntoConstraints = NO;
        _numLab.font = kRJFontSize(13);
#ifdef kLightBlackColor
        _numLab.textColor = kLightBlackColor;
#endif
        _numLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_numLab];
        
        NSDictionary *views = @{@"_textView":_textView,@"_lineView":self.lineView,@"_numLab":_numLab};
        NSDictionary *metrics = @{@"margin":@15,@"labelH":@20};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_textView]-margin-|" options:0 metrics:metrics views:views]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_lineView]-margin-|" options:0 metrics:metrics views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lineView]-5-[_numLab(10)]|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:metrics views:views]];
        
        _topConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:_topMargin];
        _minHeightConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        _maxHeightConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:120];
        _bottomConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.lineView attribute:NSLayoutAttributeTop multiplier:1.0 constant:-_bottomMargin];
//        _lineHeightConstraint = [NSLayoutConstraint constraintWithItem:_lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1];
        [self.contentView addConstraints:@[_topConstraint,_minHeightConstraint,_bottomConstraint]];
//        [self setLineViewLeftMargin:15];
//        [self setLineViewRightMargin:15];
        
    }
    return self;
}

- (void)setLineViewBottomLayout{
    
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    _topConstraint.constant = topMargin;
}

- (void)setMinHeight:(CGFloat)minHeight{
    _minHeight = minHeight;
    _minHeightConstraint.constant = minHeight;
}

- (void)setTextViewMaxHeight:(CGFloat)textViewMaxHeight{
    _textViewMaxHeight = textViewMaxHeight;
    _maxHeightConstraint.constant = textViewMaxHeight;
}

- (void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    _bottomConstraint.constant = -bottomMargin;
}

@end
