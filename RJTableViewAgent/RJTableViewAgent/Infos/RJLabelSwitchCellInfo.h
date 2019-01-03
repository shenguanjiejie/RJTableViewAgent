//
//  SwitchCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"

@class RJLabelSwitchCellInfo;

typedef void (^RJSwitchActionBlock)(UISwitch *switchView,__kindof RJLabelSwitchCellInfo *info);

@interface RJLabelSwitchCellInfo : RJLabelCellInfo

@property(nullable, nonatomic, strong) UIColor *onTintColor ;
@property(nonatomic, strong) UIColor *tintColor ;
@property(nullable, nonatomic, strong) UIColor *thumbTintColor;

@property(nullable, nonatomic, strong) UIImage *onImage;
@property(nullable, nonatomic, strong) UIImage *offImage;

@property(nonatomic,getter=isOn) BOOL on;

@property (nonatomic, copy) RJSwitchActionBlock switchActionBlock;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn;

@end
