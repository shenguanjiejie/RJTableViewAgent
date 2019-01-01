//
//  RJBaseCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+RJVFL.h"
#import "RJBaseCellInfo.h"

@interface RJBaseCell : UITableViewCell

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) CGFloat lineViewLeftMargin;

@property (nonatomic, assign) CGFloat lineViewRightMargin;

@property (nonatomic, strong) NSLayoutConstraint *lineViewHeightCons;

@property (nonatomic, strong) NSLayoutConstraint *minHeightCons;

- (void)setLineViewBottomLayout;

@end
