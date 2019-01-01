//
//  RJCustomCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJCustomCellInfo.h"

@implementation RJCustomCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight{
    
    self = [super initWithCellType:CellTypeCustom indexPath:indexPath];
    if (self) {
        self.cell = cell;
        self.cellHeight = cellHeight;
    }
    return self;
}

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock{
    self = [super initWithCellType:CellTypeCustom indexPath:indexPath];
    if (self) {
        self.identifier = identifier;
        self.cellClass = cellClass;
        if (cellInitBlock) {
            self.infoCellInitBlock = ^(__kindof UITableViewCell *cell, __kindof RJBaseCellInfo *info) {
                cellInitBlock(cell);
            };
        }
    }
    return self;
}

@end
