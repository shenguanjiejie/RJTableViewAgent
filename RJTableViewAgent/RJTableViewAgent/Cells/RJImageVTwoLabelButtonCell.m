//
//  RJImageVTwoLabelButtonCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 美约秀. All rights reserved.
//

#import "RJImageVTwoLabelButtonCell.h"

@implementation RJImageVTwoLabelButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _detailLab = [[UILabel alloc]init];
        _detailLab.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLab.font = kRJFontSize(14);
        _detailLab.textColor = [RJTableViewAgentConfig sharedConfig].subTextColor;
        _detailLab.numberOfLines = 0;
        [self.contentView addSubview:_detailLab];
        
        [self setVTwoLabelLayout];
    }
    return self;
}


- (void)setLabelLayout{
    [self.titleLab addTopMarginConstraintWithConstant:0];
}

- (void)setVTwoLabelLayout{
    [self.titleLab addLeftAlignConstraintToView:_detailLab constant:0];
    [_detailLab addRightMarginConstraintWithConstant:0];
    [self.titleLab addBottomConstraintToView:_detailLab constant:0];
    [_detailLab addBottomMarginConstraintWithConstant:0];
}

@end
