//
//  UITableView+CellInit.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableView (RJCellInit)

- (__kindof UITableViewCell *)cellWithIdentifier:(NSString *)identifier cellClass:(Class)cellClass initBlock:(void (^)(__kindof UITableViewCell *initCell))initBlock;
@end
