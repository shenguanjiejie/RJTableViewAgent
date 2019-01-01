//
//  RJLabelButtonCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJLabelCellInfo.h"

@class RJLabelButtonCellInfo;

typedef void (^RJDidTapLabelButtonBlock)(UIButton *button,__kindof RJLabelButtonCellInfo *info);

@interface RJLabelButtonCellInfo : RJLabelCellInfo

@property (nonatomic, strong) UIFont *buttonFont;

@property (nonatomic, strong) UIColor *buttonColor;

@property (nonatomic, strong) UIColor *buttonTitleColor;

@property (nonatomic, strong) UIColor *buttonTitleSelectColor;

@property (nonatomic, copy) NSString *buttonTitle;

@property (nonatomic, strong) UIImage *buttonImage;

@property (nonatomic, strong) UIImage *buttonSelectImage;

@property (nonatomic, assign) BOOL buttonSelected;

@property (nonatomic, assign) BOOL buttonUserInteractionEnabled;

//@property (nonatomic, assign) SEL buttonAction;

@property (nonatomic, assign) CGFloat titleLabButtonInterval;

/**RJ 2019-01-01 18:15:42 default:40*/
@property (nonatomic, assign) CGFloat buttonWidth;

/** default:251*/
@property (nonatomic, assign) UILayoutPriority buttonHuggingPriority;
@property (nonatomic, assign) UILayoutPriority buttonCompressionPriority;

@property (nonatomic, copy) RJDidTapLabelButtonBlock didTapButtonBlock;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

@end
