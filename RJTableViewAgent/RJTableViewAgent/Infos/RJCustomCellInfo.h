//
//  RJCustomCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJBaseCellInfo.h"

@interface RJCustomCellInfo : RJBaseCellInfo

@property (nonatomic, assign) Class cellClass;

//@property (nonatomic, copy) NSString *identifier;

//@property (nonatomic, copy) RJCellInitBlock cellInitBlock;

@property (nonatomic, strong) __kindof UITableViewCell *cell;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath cell:(__kindof UITableViewCell *)cell cellHeight:(CGFloat)cellHeight;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock;

@end
