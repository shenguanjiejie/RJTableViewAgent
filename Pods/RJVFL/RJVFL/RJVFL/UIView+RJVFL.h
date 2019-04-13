//
//  UIView+RJVFL.h
//  RJVFL
//
//  Created by ShenRuijie on 2017/5/5.
//  Copyright © 2017年 shenruijie. All rights reserved.
//

/**RJ 2018-12-29 19:23:57
 
 关于RJVFL参数及其他说明
 为了简单易用,RJVFL支持大多数常用约束,对比较特殊的约束没有进行封装,例如view1.top 与 view2.centerY进行约束,或者><和优先级之类的
 所以如果需求稍微特别一些的约束,可以将RJVFL和系统layout结合使用,不排除后续会拓展这些功能的可能性
 
 @param view 要进行约束的view,self则是参照物(可以是同level的view,也可以是fatherView)
 @param constants 为NSNumber或者NSNull组成的数组,*****正负号逻辑同VFL*****,正负号不再基于x和y轴作为位置基准线,而是基于相对位置(除了CenterX或者CenterY之间的约束外),如果为对齐约束(下方有对齐约束释义),则内部距离为"+",阔出外部冗余距离为"-",如果为一般约束,则外部距离为"+",陷入内部距离为"-". 得益于此,RJVFL几乎不需要使用"-"号,这使得约束也变得更加直观化、生活化.
 @return 生成的constraint
 
 方法名中的H : Horizontal
 方法名中的V : Vertical
 方法名中的Align : 对齐约束(例如 回 字形状就属于对齐约束),不加Align声明的方法为一般约束(例如 口-口 这种样式).
                            eg:view1.top和view2.bottom约束为一般约束,view1.top和view2.top约束为对齐约束,*****正负号逻辑同VFL*****

 ps:所有NSArray类形的参数,支持数组的嵌套,层数不限
 */

#import <UIKit/UIKit.h>

/**RJ 2018-12-29 15:25:31
    早期RJVFL开始封装的时候,就是以VFL为思路起手的
    随着封装变的越来越便捷,RJVFLOptions已经变的很少有使用的必要
 */
typedef NS_ENUM(NSUInteger, RJVFLOptions) {
    RJVFLAlignAllLeft = NSLayoutFormatAlignAllLeft,
    RJVFLAlignAllRight = NSLayoutFormatAlignAllRight,
    RJVFLAlignAllTop = NSLayoutFormatAlignAllTop,
    RJVFLAlignAllBottom = NSLayoutFormatAlignAllBottom,
    RJVFLAlignAllLeading = NSLayoutFormatAlignAllLeading,
    RJVFLAlignAllTrailing = NSLayoutFormatAlignAllTrailing,
    RJVFLAlignAllCenterX = NSLayoutFormatAlignAllCenterX,
    RJVFLAlignAllCenterY = NSLayoutFormatAlignAllCenterY,
    RJVFLAlignAllWidth = 1 << (NSLayoutAttributeCenterY+1),
    RJVFLAlignAllHeight = 1 << (NSLayoutAttributeCenterY+2),
    /**RJ 2019-02-28 22:43:02 bunch对齐,即约束为所有间距都为0的一个串*/
    RJVFLBunchAllLeft = 1 << (NSLayoutAttributeCenterY+3),
    RJVFLBunchAllRight = 1 << (NSLayoutAttributeCenterY+4),
    RJVFLBunchAllTop = 1 << (NSLayoutAttributeCenterY+5),
    RJVFLBunchAllBottom = 1 << (NSLayoutAttributeCenterY+6),
    /**RJ 2018-12-29 15:30:14
     默认self是不参与Options的约束的,如果需要self也参与其他Option,可以|上RJVFLSelf.
     另外RJVFLSelf不能和上面RJVFLBunch相关的项目进行搭配
     */
    RJVFLSelf = 1 << (NSLayoutAttributeCenterY+7),
};

typedef NS_ENUM(NSUInteger, RJDirection) {
    RJDirectionTop,
    RJDirectionLeft,
    RJDirectionBottom,
    RJDirectionRight,
};

@interface UIView (RJVFL)

#pragma mark - property 如果对应约束只有一条,则为该条约束;如果对应约束有多条,为一个数组,则属性为该数组中最后一条约束
/**RJ 2018-12-29 15:14:21
    为了方便使用,增加了以下属性
    如果对应约束只有一条,则为该条约束;
    如果对应约束有多条,为一个数组,则属性为该数组中最后一条约束
 */
@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) NSLayoutConstraint *leftConstraint;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *centerXConstraint;
@property (nonatomic, strong) NSLayoutConstraint *centerYConstraint;

#pragma mark - 对view自己本身的约束,宽高等
- (NSLayoutConstraint *)addWidthConstraintWithConstant:(CGFloat)constant;
- (NSLayoutConstraint *)addWidthConstraintToView:(UIView *)view constant:(CGFloat)constant;
+ (void)setWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
+ (void)setWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
+ (void)setWidthConstraintToViews:(NSArray *)views constants:(NSArray *)constants;
+ (void)setWidthConstraintToViews:(NSArray *)views constants:(NSArray *)constants options:(RJVFLOptions)options;
- (void)addWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

- (NSLayoutConstraint *)addHeightConstraintWithConstant:(CGFloat)constant;
- (NSLayoutConstraint *)addHeightConstraintToView:(UIView *)view constant:(CGFloat)constant;
+ (void)setHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
+ (void)setHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
+ (void)setHeightConstraintToViews:(NSArray *)views constants:(NSArray *)constants;
+ (void)setHeightConstraintToViews:(NSArray *)views constants:(NSArray *)constants options:(RJVFLOptions)options;
- (void)addHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

- (void)addWidthConstraintWithConstant:(CGFloat)widthConstant heightConstraintWithConstant:(CGFloat)heightConstant;
/**RJ 2018-12-29 15:37:37
    使View约束为一个方形,即width=height
 */
- (NSLayoutConstraint *)setSquareConstraint;

#pragma mark - NSLayoutAttribute***Margin类形约束,并不常用,默认与superView进行约束,可酌情使用
- (NSLayoutConstraint *)addTopMarginConstraintWithConstant:(CGFloat)constant;
- (NSLayoutConstraint *)addLeftMarginConstraintWithConstant:(CGFloat)constant;
- (NSLayoutConstraint *)addBottomMarginConstraintWithConstant:(CGFloat)constant;
- (NSLayoutConstraint *)addRightMarginConstraintWithConstant:(CGFloat)constant;
- (void)addHMarginConstraintWithLeftConstant:(CGFloat)leftConstant rightConstant:(CGFloat)rightConstant;
- (void)addVMarginConstraintWithTopConstant:(CGFloat)topConstant bottomConstant:(CGFloat)bottomConstant;
- (void)addMarginsConstraintWithEdgeInsets:(UIEdgeInsets)edgeInsets;

#pragma mark - 四周距离约束,其他View相对self的距离约束
- (NSLayoutConstraint *)addTopConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addLeftConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addRightConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant;

- (void)addTopConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addTopConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addBottomConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addBottomConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addLeftConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addLeftConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addRightConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addRightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

#pragma mark - 四周对齐约束,其他View相对于self进行对齐时的约束
- (NSLayoutConstraint *)addTopAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addLeftAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addRightAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)addBottomAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;

- (void)addTopAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addTopAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addBottomAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addBottomAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addLeftAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addLeftAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addRightAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addRightAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

- (void)addHAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (void)addHAlignConstraintToView:(UIView *)view constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addVAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (void)addVAlignConstraintToView:(UIView *)view constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addAllAlignConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (void)addAllAlignConstraintToView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset;

- (void)addHAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addHAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addVAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addVAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;
- (void)addAllAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant;

/**RJ 2019-02-24 23:23:02
    为对齐约束增加了一个可支持无限嵌套的高阶方法
 */
- (void)addAlignConstraintToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction;

#pragma mark - 中部约束
/**和self垂直同线*/
- (NSLayoutConstraint *)addCenterXConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (void)addCenterXConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addCenterXConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

/**和self水平同线*/
- (NSLayoutConstraint *)addCenterYConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (void)addCenterYConstraintToViews:(NSArray *)views constant:(CGFloat)constant;
- (void)addCenterYConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options;

/**x=0,y=0*/
- (void)addCenterConstraintToView:(UIView *)view;

- (void)addCenterXYConstraintToView:(UIView *)view constantX:(CGFloat)constantX constantY:(CGFloat)constantY;
- (void)addCenterXYConstraintToViews:(NSArray *)views constantX:(CGFloat)constantX constantY:(CGFloat)constantY;
- (void)addCenterXYConstraintToViews:(NSArray *)views constantX:(CGFloat)constantX constantY:(CGFloat)constantY options:(RJVFLOptions)options;

#pragma mark - 对齐约束
/**
 同VFL的options对齐逻辑
 @param views 要对其的views
 @param options 对齐选项
 */
+ (void)setConstraintToViews:(NSArray *)views options:(RJVFLOptions)options;

/**RJ 2019-02-24 12:57:43
    同上,只是该方法支持RJVFLSelf,如果不使用RJVFLSelf,则和上方方法作用完全相同
 */
- (void)addConstraintToViews:(NSArray *)views options:(RJVFLOptions)options;

#pragma mark - 串形约束
/**RJ 2018-12-29 15:50:26
    以下8个方法为核心方法.往往能配合+(void)setWidthConstraintToViews:constants:和+(void)setHeightConstraintToViews:constants:总共四个方法,约束完整个页面上的所有View的所有布局.
    bunch就是串的意思,这种layout类似糖葫芦,用来约束这一串糖葫芦之间每个山楂的之间的距离,direction用来标识从哪个方向开始进行约束,constants数组根据方向设置对应constant.(推荐优先考虑使用RJDirectionTop和RJDirectionLeft)
    如果是后面那四个实例方法,就类似于糖葫芦放在一张纸上面,constants中的距离,根据direction,从纸到第一个山楂开始取,直到用完所有constant或者已经约束最后一个山楂到纸的底部为止
    @param views views可以无限嵌套的,也就是说,不仅仅可以同时约束一串糖葫芦,其实可以同时约束一串葡萄的,具体见demo示例
 */
+ (void)setBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction;
+ (void)setBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction;
+ (void)setBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction options:(RJVFLOptions)options;
+ (void)setBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction options:(RJVFLOptions)options;

/**
 self:fatherView
 */
- (void)addBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction;
- (void)addBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction;
- (void)addBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction options:(RJVFLOptions)options;
- (void)addBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction options:(RJVFLOptions)options;

/**
 终极方法,一行搞定.该方案在实现过程中发现并不可行,现已搁置
 //括号内为数组的可传类形,多层嵌套不可行,因为嵌套的数组看做一个整体的话,就会使底部和右边约束都受影响
 @param views (UIView,NSArray,NULL) 要约束的views,,可以嵌套多层数组,
 @param points (RJConstantPoint,NSArray,NULL) 每一个view与上面view和左边view的约束值;如果RJConstantPoint.top或left为NSNotFound,则忽略对应的项;数组可以多层嵌套
 @param bottomMargin (NSNumber,NSArray,NULL) views数组中最底部的view和self的底部的约束constant,数组可以多层嵌套
 @param rightMargin (NSNumber,NSArray,NULL) views数组中最右边的view和self的右边的约束constant,数组可以多层嵌套
 */
//- (void)addMatrixConstraintsToViews:(NSArray *)views rjConstantPoints:(NSArray *)points bottomMargin:(id)bottomMargin rightMargin:(id)rightMargin __deprecated_msg("搁置");
//+ (void)setVBunchConstraintToViews:(NSArray *)views constant:(CGFloat)constant;

/**RJ
    可以用,但是没有public的必要,上面的方法比这个更好用
 */
//- (void)addConstraintToView:(UIView *)view constant:(CGFloat)constant direction:(RJDirection)direction;
//- (void)addAlignConstraintToView:(UIView *)view constant:(CGFloat)constant direction:(RJDirection)direction;


@end
