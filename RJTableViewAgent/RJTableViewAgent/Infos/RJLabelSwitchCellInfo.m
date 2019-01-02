//
//  SwitchCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelSwitchCellInfo.h"

@implementation RJLabelSwitchCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn{
    self = [super initWithIndexPath:indexPath text:text font:font];
    if (self) {
        _cellType = CellTypeLabelSwitch;
        self.on = isOn;
        self.layoutMargins = UIEdgeInsetsMake(5, 15, 5, 90);
    }
    
    return self;
}




@end
