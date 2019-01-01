//
//  RJImageLabelCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJImageLabelCell.h"
#import "UIView+RJVFL.h"

@interface RJImageLabelCell()
{
    NSLayoutConstraint *_imageHConstraint;
    NSLayoutConstraint *_imageWConstraint;
}
@end

@implementation RJImageLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _rj_imageView = [[UIImageView alloc]init];
        _rj_imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rj_imageView.contentMode = UIViewContentModeScaleAspectFill;
        _rj_imageView.clipsToBounds = YES;
        [self.contentView addSubview:_rj_imageView];
        
        [self setImageLabelLayout];
        
    }
    return self;
}

- (void)setLabelLayout{
    [self.titleLab addTopMarginConstraintWithConstant:0];
    [self.titleLab addRightMarginConstraintWithConstant:0];
    [self.titleLab addBottomMarginConstraintWithConstant:0];
}

- (void)setImageLabelLayout{
    [_rj_imageView addLeftMarginConstraintWithConstant:0];
    [_rj_imageView addTopMarginConstraintWithConstant:0];
    [_rj_imageView addWidthConstraintWithConstant:40 heightConstraintWithConstant:40];
    [self.rj_imageView addRightConstraintToView:self.titleLab constant:10];
//    _imageLabelIntervalCons = [self.titleLab.leadingAnchor constraintEqualToAnchor:_rj_imageView.trailingAnchor constant:10];
//    _imageLabelIntervalCons.active = YES;
}

- (void)setImageSize:(CGSize)imageSize{
    _imageSize = imageSize;
    _rj_imageView.widthConstraint.constant = imageSize.width;
    _rj_imageView.heightConstraint.constant = imageSize.height;
}
@end
