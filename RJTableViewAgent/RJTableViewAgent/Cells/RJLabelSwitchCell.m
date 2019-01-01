//
//  SwitchTableViewCell.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelSwitchCell.h"

@implementation RJLabelSwitchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        self.contentView.preservesSuperviewLayoutMargins = NO;
//        self.contentView.layoutMargins = UIEdgeInsetsMake(self.layoutMargins.top, self.layoutMargins.left, self.layoutMargins.bottom, 90);
//        self.rightMargin = 90;
        _switchView = [[UISwitch alloc]init];
        [self.contentView addSubview:_switchView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    [self layoutIfNeeded];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.switchView.center = CGPointMake(self.bounds.size.width - 35, self.titleLab.center.y);
    });
}

@end
