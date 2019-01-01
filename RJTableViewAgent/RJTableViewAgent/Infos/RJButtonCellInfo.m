//
//  RJButtonCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJButtonCellInfo.h"

@implementation RJButtonCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)backgroundColor{
    self = [super initWithCellType:CellTypeButton indexPath:indexPath];
    if (self) {
        self.buttonBackgroundColor = backgroundColor;
        self.buttonTextColor = [UIColor whiteColor];
        self.buttonFont = kRJFontSize(14);
        self.imageSize = CGSizeMake(40, 40);
        self.buttonPlaceholderImage = [RJTableViewAgentConfig sharedConfig].placeholderImage;
    }
    return self;
}

@end
