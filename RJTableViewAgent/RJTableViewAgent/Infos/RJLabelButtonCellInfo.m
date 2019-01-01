//
//  RJLabelButtonCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelButtonCellInfo.h"

@implementation RJLabelButtonCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font{
    self = [super initWithIndexPath:indexPath text:text font:font];
    if (self) {
        _cellType = CellTypeLabelButton;
//        self.buttonAction = buttonAction;
//        self.backgroundColor = [UIColor clearColor];
        self.buttonWidth = 40;
        self.buttonFont = kRJFontSize(12);
        self.buttonColor = [UIColor clearColor];
        self.buttonTitleColor = [RJTableViewAgentConfig sharedConfig].subTextColor;
        self.titleLabButtonInterval = 5;
        self.buttonUserInteractionEnabled = YES;
        self.buttonWidth = 0;
        self.buttonHuggingPriority = UILayoutPriorityDefaultLow + 1;
        self.buttonCompressionPriority = UILayoutPriorityDefaultHigh;
    }
    return self;
}

@end
