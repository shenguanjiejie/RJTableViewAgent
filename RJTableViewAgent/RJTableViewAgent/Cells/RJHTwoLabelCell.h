//
//  RJHTwoLabelCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCell.h"

@interface RJHTwoLabelCell : RJLabelCell

@property (nonatomic, strong) UILabel *detailLab;

@property (nonatomic, strong) NSLayoutConstraint *twoLabelHIntervalCons;

- (void)setHTwoLabelRightLayout;
@end
