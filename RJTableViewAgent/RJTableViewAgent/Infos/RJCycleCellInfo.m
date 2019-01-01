//
//  RJCycleCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenruijie. All rights reserved.
//

#import "RJCycleCellInfo.h"

@implementation RJCycleCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath images:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage{
    self = [super initWithCellType:CellTypeCycle indexPath:indexPath];
    if (self) {
        self.cycleImages = images;
        self.placeholderImage = placeholderImage;
        self.cycleImageSize = CGSizeMake(kRJScreenWidth - self.leftMargin - self.rightMargin, 100);
    }
    
    return self;
}



@end
