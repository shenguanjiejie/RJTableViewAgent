//
//  RJLabelCell.h
//  RJTableViewAgent
//
//  Created by 申瑞杰 on 2017/10/3.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJBaseCell.h"

//#ifdef kSystemVersion
#import "YYText.h"
//#endif

@interface RJLabelCell : RJBaseCell

@property (nonatomic, strong) __kindof UIView *titleLab;

//@property (nonatomic, strong) UIView *lineView;

//@property (nonatomic, strong) NSLayoutConstraint *lineViewHeightCons;

@property (nonatomic, strong) NSLayoutConstraint *titleLabelWidthCons;

@property (nonatomic, strong) NSLayoutConstraint *titleLabelRightCons;


//@property (nonatomic, assign) CGFloat topMargin;
//@property (nonatomic, assign) CGFloat bottomMargin;
//@property (nonatomic, assign) CGFloat leftMargin;
//@property (nonatomic, assign) CGFloat rightMargin;


//@property (nonatomic, assign) UIEdgeInsets edgeInset;

/**
 该方法的重写,严格来说违背了里氏替换原则.
 不过前端组合View的继承很尴尬,由于布局的原因,所有控件都是固定死的,如果不打破这个原则,几乎无法使用继承复用代码.
 考虑到早期UINavigationController是继承的UIViewController,受navigationBar的影响,两者的View位置也是不同的.
 所以感觉苹果应该也认为Layout在继承过程中被重写是可行的吧
 */
- (void)setLabelLayout;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier yyLabelNeed:(BOOL)yyLabelNeed;

@end
