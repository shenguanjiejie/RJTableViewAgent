//
//  RJButtonCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJBaseCellInfo.h"

@class RJButtonCellInfo;

typedef void (^RJDidTapButtonBlock)(UIButton *button,__kindof RJButtonCellInfo *info);

@interface RJButtonCellInfo : RJBaseCellInfo

@property (nonatomic, copy) NSString *buttonText;

@property (nonatomic, strong) UIFont *buttonFont;

@property (nonatomic, strong) UIColor *buttonBackgroundColor;

@property (nonatomic, strong) UIColor *buttonTextColor;

@property (nonatomic, strong) UIColor *buttonSelectedTextColor;

@property (nonatomic, strong) UIImage *buttonImage;

@property (nonatomic, strong) NSURL *buttonImageUrl;

@property (nonatomic, strong) UIImage *buttonSelectedImage;

@property (nonatomic, assign) CGFloat buttonCornerRadius;

@property (nonatomic, assign) BOOL buttonSelected;

@property (nonatomic, assign) BOOL shouldRoundImage;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, strong) UIImage *buttonPlaceholderImage;

@property (nonatomic, assign) BOOL buttonUserinterfaceEnable;

@property (nonatomic, copy) RJDidTapButtonBlock didTapButtonBlock;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)backgroundColor;

@end
