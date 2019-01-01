//
//  UITableView+CellInit.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "UITableView+RJCellInit.h"

@implementation UITableView (RJCellInit)


- (__kindof UITableViewCell *)cellWithIdentifier:(NSString *)identifier cellClass:(Class)cellClass initBlock:(void (^)(__kindof UITableViewCell *initCell))initBlock{
    
    if (!cellClass) {
        cellClass = [UITableViewCell class];
    }
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        @try {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (initBlock) {
                initBlock(cell);
            }
        }@catch (NSException* exception){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            NSLog(@"☠️☠️☠️☠️☠️☠️☠️☠️:Exception=%@\nStack Trace:%@,reason:%@,name:%@", exception, [exception callStackSymbols],[exception reason],[exception name]);
        }
    }
    
    return cell;
}


@end
