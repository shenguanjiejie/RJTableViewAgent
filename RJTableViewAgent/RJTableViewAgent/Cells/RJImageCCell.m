//
//  RJImageCCell.m
//  deyue
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 mikeshen. All rights reserved.
//

#import "RJImageCCell.h"


@implementation RJImageCCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self.contentView addSubview:_imageView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_imageView);
//        NSDictionary *metrics = @{@"<#margin#>":<#value#>};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageView]|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageView]|" options:0 metrics:nil views:views]];
    }
    return self;
}

@end
