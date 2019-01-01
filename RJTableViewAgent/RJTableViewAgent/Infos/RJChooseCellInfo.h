//
//  RJChooseCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJHTwoLabelCellInfo.h"

@interface RJChooseCellInfo : RJHTwoLabelCellInfo

@property (nonatomic, copy) NSString *detailPlaceholderText;

@property (nonatomic, strong) UIColor *detailPlaceholderTextColor;

@property (nonatomic, assign) NSTextAlignment detailPlaceholderTextAligment;

@property (nonatomic, assign) CGFloat detailLabImageViewInterval;

@property (nonatomic, assign) BOOL rightArrowHidden;

@property (nonatomic, assign) BOOL rightImageViewUserInterfaceEnable;

/** 右边图片*/
@property (nonatomic, strong) id image;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont;


@end
