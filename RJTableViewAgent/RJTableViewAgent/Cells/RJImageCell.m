//
//  RJImageCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJImageCell.h"
#import "UIView+RJVFL.h"

@implementation RJImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _rj_imageView = [[UIImageView alloc]init];
        _rj_imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rj_imageView.contentMode = UIViewContentModeScaleAspectFill;
        _rj_imageView.clipsToBounds = YES;
        [self.contentView addSubview:_rj_imageView];
        
//        _lineView = [[UIImageView alloc] init];
//        _lineView.translatesAutoresizingMaskIntoConstraints = NO;
//        _lineView.contentMode = UIViewContentModeScaleAspectFill;
//        _lineView.clipsToBounds = YES;
//        [self.contentView addSubview:_lineView];
        
        [_rj_imageView addBottomMarginConstraintWithConstant:0.5];
        [_rj_imageView addRightMarginConstraintWithConstant:0];
        [_rj_imageView addTopMarginConstraintWithConstant:0];
        [_rj_imageView addLeftMarginConstraintWithConstant:0];
        
//        _lineViewHeightCons = [_lineView addHeightConstraintWithConstant:0.5];
        
//        NSDictionary *views = @{@"_rj_imageView":_rj_imageView,@"_lineView":self.lineView};
//        NSDictionary *metrics = @{@"interval":@(self.layoutMargins.bottom)};
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_rj_imageView]|" options:0 metrics:nil views:views]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_rj_imageView]-interval-[_lineView]" options:0 metrics:metrics views:views]];
        
    }
    
    return self;
}

@end
