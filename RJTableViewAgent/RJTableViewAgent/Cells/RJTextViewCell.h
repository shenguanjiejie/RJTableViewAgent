//
//  RJTextViewCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJBaseCell.h"


@interface RJTextViewCell : RJBaseCell

@property (nonatomic, strong) UITextView *textView;

//@property (nonatomic, strong) UIImageView *lineView;

@property (nonatomic, strong) UILabel *numLab;

@property (nonatomic, assign) CGFloat topMargin;

@property (nonatomic, assign) CGFloat bottomMargin;

@property (nonatomic, assign) CGFloat minHeight;
@property (nonatomic, assign) CGFloat textViewMaxHeight;

//@property (nonatomic, assign) CGFloat lineHeight;

@end
