//
//  RJChooseCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJChooseCell.h"

@implementation RJChooseCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rightImageView.contentMode = UIViewContentModeCenter;
        _rightImageView.clipsToBounds = YES;
        _rightImageView.image = [RJTableViewAgentConfig sharedConfig].rightArrow;
        [_rightImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh+1 forAxis:UILayoutConstraintAxisHorizontal];
        [self.contentView addSubview:_rightImageView];
        
        _detailLabImageViewIntervalCons = [_rightImageView.leadingAnchor constraintEqualToAnchor:self.detailLab.trailingAnchor constant:5];
        _detailLabImageViewIntervalCons.active = YES;
        
        [self setLabelImageLayout];
    }
    return self;
}


- (void)setHTwoLabelRightLayout{
    
}

- (void)setLabelImageLayout{
    [_rightImageView addRightMarginConstraintWithConstant:0];
    [self.detailLab addTopAlignConstraintToViews:@[_rightImageView] constant:0];
    [self.detailLab addBottomAlignConstraintToViews:@[_rightImageView] constant:0];
}


@end
