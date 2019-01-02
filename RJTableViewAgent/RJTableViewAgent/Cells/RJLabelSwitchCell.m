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
        _switchView = [[UISwitch alloc]init];
        [self.contentView addSubview:_switchView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.switchView.center = CGPointMake(self.contentView.bounds.size.width - 41, self.titleLab.center.y);
    });
}

@end
