//
//  RJLabelButtonCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJLabelCell.h"

@interface RJLabelButtonCell : RJLabelCell

@property (nonatomic, strong) UIButton *button;

- (void)setLabelButtonLayout;

@end
