//
//  UIView+RJVFL.h
//  RJVFL
//
//  Created by ShenRuijie on 2017/5/5.
//  Copyright © 2017年 shenruijie. All rights reserved.
//

#import "UIView+RJVFL.h"
#import <objc/message.h>
#import <objc/runtime.h>

static void const *kWidthConstraintKey = @"WidthConstraintKey";
static void const *kHeightConstraintKey = @"HeightConstraintKey";
static void const *kTopConstraintKey = @"TopConstraintKey";
static void const *kLeftConstraintKey = @"LeftConstraintKey";
static void const *kBottomConstraintKey = @"BottomConstraintKey";
static void const *kRightConstraintKey = @"RightConstraintKey";
static void const *kCenterXConstraintKey = @"CenterXConstraintKey";
static void const *kCenterYConstraintKey = @"CenterYConstraintKey";

#define reverseDirection(direction) (direction/2?direction-2:direction+2)

@implementation UIView (RJVFL)

#pragma mark - property 如果对应约束只有一条,则为该条约束;如果对应约束有多条,为一个数组,则属性为该数组中最后一条约束

-(void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint{
    objc_setAssociatedObject(self, kWidthConstraintKey, widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint{
    objc_setAssociatedObject(self, kHeightConstraintKey, heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint{
    objc_setAssociatedObject(self, kTopConstraintKey, topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint{
    objc_setAssociatedObject(self, kLeftConstraintKey, leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint{
    objc_setAssociatedObject(self, kBottomConstraintKey, bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint{
    objc_setAssociatedObject(self, kRightConstraintKey, rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint{
    objc_setAssociatedObject(self, kCenterXConstraintKey, centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint{
        objc_setAssociatedObject(self, kCenterYConstraintKey, centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthConstraint{
    return objc_getAssociatedObject(self, kWidthConstraintKey);
}

- (NSLayoutConstraint *)heightConstraint{
    return objc_getAssociatedObject(self, kHeightConstraintKey);
}

-(NSLayoutConstraint *)topConstraint{
    return objc_getAssociatedObject(self, kTopConstraintKey);
}

- (NSLayoutConstraint *)leftConstraint{
    return objc_getAssociatedObject(self, kLeftConstraintKey);
}

- (NSLayoutConstraint *)bottomConstraint{
    return objc_getAssociatedObject(self, kBottomConstraintKey);
}

- (NSLayoutConstraint *)rightConstraint{
    return objc_getAssociatedObject(self, kRightConstraintKey);
}

- (NSLayoutConstraint *)centerXConstraint{
    return objc_getAssociatedObject(self, kCenterXConstraintKey);
}

- (NSLayoutConstraint *)centerYConstraint{
    return objc_getAssociatedObject(self, kCenterYConstraintKey);
}

#pragma mark - 对view自己本身的约束,宽高等

- (NSLayoutConstraint *)addWidthConstraintWithConstant:(CGFloat)constant{
    if (self.widthConstraint && !self.widthConstraint.secondItem) {
        self.widthConstraint.constant = constant;
        return self.widthConstraint;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:constant];
    [self addConstraint:constraint];
    self.widthConstraint = constraint;
    
    return constraint;
}

+ (void)setWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [UIView setWidthConstraintToViews:views constant:constant options:0];
}

+ (void)setWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]]) {
            [item addWidthConstraintWithConstant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [UIView  setWidthConstraintToViews:item constant:constant];
        }
    }
    [UIView setConstraintToViews:views options:options];
}

+ (void)setWidthConstraintToViews:(NSArray *)views constants:(NSArray *)constants{
    [UIView setWidthConstraintToViews:views constants:constants options:0];
}

+ (void)setWidthConstraintToViews:(NSArray *)views constants:(NSArray *)constants options:(RJVFLOptions)options{
    NSInteger min = MIN(views.count, constants.count);
    if (min == 0) {
        return;
    }
    
    for (NSInteger i = 0; i < min; i++) {
        id item = views[i];
        id constant = constants[i];
        if ([item isKindOfClass:[UIView class]]) {
            if ([constant isKindOfClass:[NSNumber class]]) {
                [item addWidthConstraintWithConstant:[constant floatValue]];
            }
        }else if ([item isKindOfClass:[NSArray class]]){
            if ([constant isKindOfClass:[NSNumber class]]) {
                [UIView setWidthConstraintToViews:item constant:[constant floatValue]];
            }else if ([constant isKindOfClass:[NSArray class]]){
                [UIView setWidthConstraintToViews:item constants:constant];
            }
        }
    }

    [UIView setConstraintToViews:views options:options];
}

- (NSLayoutConstraint *)addWidthConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    view.widthConstraint = constraint;
    
    return constraint;
}

- (void)addWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addWidthConstraintToViews:views constant:constant options:0];
}

- (void)addWidthConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addWidthConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addConstraintToViews:item options:options];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (NSLayoutConstraint *)addHeightConstraintWithConstant:(CGFloat)constant{
    if (self.heightConstraint && !self.heightConstraint.secondItem) {
        self.heightConstraint.constant = constant;
        return self.heightConstraint;
    }
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:constant];
    [self addConstraint:constraint];
    self.heightConstraint = constraint;
    
    return constraint;
}

+ (void)setHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [UIView setHeightConstraintToViews:views constant:constant options:0];
}

+ (void)setHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]]) {
            [item addHeightConstraintWithConstant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [UIView  setHeightConstraintToViews:item constant:constant];
        }
    }
    [UIView setConstraintToViews:views options:options];
}

+(void)setHeightConstraintToViews:(NSArray *)views constants:(NSArray *)constants{
    [UIView setHeightConstraintToViews:views constants:constants options:0];
}

+(void)setHeightConstraintToViews:(NSArray *)views constants:(NSArray *)constants options:(RJVFLOptions)options{
    NSInteger min = MIN(views.count, constants.count);
    if (min == 0) {
        return;
    }
    
    for (NSInteger i = 0; i < min; i++) {
        id item = views[i];
        id constant = constants[i];
        if ([item isKindOfClass:[UIView class]]) {
            if ([constant isKindOfClass:[NSNumber class]]) {
                [item addHeightConstraintWithConstant:[constant floatValue]];
            }
        }else if ([item isKindOfClass:[NSArray class]]){
            if ([constant isKindOfClass:[NSNumber class]]) {
                [UIView setHeightConstraintToViews:item constant:[constant floatValue]];
            }else if ([constant isKindOfClass:[NSArray class]]){
                [UIView setHeightConstraintToViews:item constants:constant];
            }
        }
    }
    
    [UIView setConstraintToViews:views options:options];
}

- (NSLayoutConstraint *)addHeightConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    view.heightConstraint = constraint;
    
    return constraint;
}

- (void)addHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addHeightConstraintToViews:views constant:constant options:0];
}

- (void)addHeightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addHeightConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addConstraintToViews:item options:options];
        }
    }
}

- (void)addWidthConstraintWithConstant:(CGFloat)widthConstant heightConstraintWithConstant:(CGFloat)heightConstant{
    [self addWidthConstraintWithConstant:widthConstant];
    [self addHeightConstraintWithConstant:heightConstant];
}

- (NSLayoutConstraint *)setSquareConstraint{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.superview addConstraint:constraint];
    self.widthConstraint = constraint;
    self.heightConstraint = constraint;
    return constraint;
}

#pragma mark - NSLayoutAttribute***Margin 类形约束,并不常用,默认与superView进行约束,可酌情使用

- (NSLayoutConstraint *)addTopMarginConstraintWithConstant:(CGFloat)constant{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:constant];
    [self.superview addConstraint:constraint];
    self.topConstraint = constraint;
    
    return constraint;
}
- (NSLayoutConstraint *)addLeftMarginConstraintWithConstant:(CGFloat)constant{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:constant];
    [self.superview addConstraint:constraint];
    self.leftConstraint = constraint;
    
    return constraint;
}
- (NSLayoutConstraint *)addBottomMarginConstraintWithConstant:(CGFloat)constant{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:-constant];
    [self.superview addConstraint:constraint];
    self.bottomConstraint = constraint;
    
    return constraint;
}
- (NSLayoutConstraint *)addRightMarginConstraintWithConstant:(CGFloat)constant{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:-constant];
    [self.superview addConstraint:constraint];
    self.rightConstraint = constraint;
    
    return constraint;
}

- (void)addHMarginConstraintWithLeftConstant:(CGFloat)leftConstant rightConstant:(CGFloat)rightConstant{
    [self addLeftMarginConstraintWithConstant:leftConstant];
    [self addRightMarginConstraintWithConstant:leftConstant];
}

- (void)addVMarginConstraintWithTopConstant:(CGFloat)topConstant bottomConstant:(CGFloat)bottomConstant{
    [self addTopMarginConstraintWithConstant:topConstant];
    [self addBottomMarginConstraintWithConstant:bottomConstant];
}

- (void)addMarginsConstraintWithEdgeInsets:(UIEdgeInsets)edgeInsets{
    [self addTopMarginConstraintWithConstant:edgeInsets.top];
    [self addLeftMarginConstraintWithConstant:edgeInsets.left];
    [self addBottomMarginConstraintWithConstant:edgeInsets.bottom];
    [self addRightMarginConstraintWithConstant:edgeInsets.right];
}

#pragma mark - 四周距离约束,其他View相对self的距离约束
- (NSLayoutConstraint *)addTopConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:constant];

    [view.superview addConstraint:constraint];
    self.topConstraint = constraint;
    view.bottomConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addLeftConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    self.leftConstraint = constraint;
    view.rightConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0 constant:-constant];
    [view.superview addConstraint:constraint];
    self.bottomConstraint = constraint;
    view.topConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addRightConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-constant];
    [view.superview addConstraint:constraint];
    self.rightConstraint = constraint;
    view.leftConstraint = constraint;
    
    return constraint;
}

- (void)addTopConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addTopConstraintToViews:views constant:constant options:0];
}

- (void)addTopConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addTopConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addTopConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addBottomConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addBottomConstraintToViews:views constant:constant options:0];
}

- (void)addBottomConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addBottomConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addBottomConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addLeftConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addLeftConstraintToViews:views constant:constant options:0];
}

- (void)addLeftConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addLeftConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addLeftConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addRightConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addRightConstraintToViews:views constant:constant options:0];
}

- (void)addRightConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addRightConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addRightConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

#pragma mark - 四周对齐约束,其他View相对于self进行对齐时的约束
- (NSLayoutConstraint *)addTopAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    self.topConstraint = constraint;
    view.topConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addLeftAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    self.leftConstraint = constraint;
    view.leftConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addBottomAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-constant];
    [view.superview addConstraint:constraint];
    self.bottomConstraint = constraint;
    view.bottomConstraint = constraint;
    
    return constraint;
}

- (NSLayoutConstraint *)addRightAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-constant];
    [view.superview addConstraint:constraint];
    self.rightConstraint = constraint;
    view.rightConstraint = constraint;
    
    return constraint;
}

- (void)addTopAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addTopAlignConstraintToViews:views constant:constant options:0];
}

- (void)addTopAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addTopAlignConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addTopAlignConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addBottomAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addBottomAlignConstraintToViews:views constant:constant options:0];
}

- (void)addBottomAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addBottomAlignConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addBottomAlignConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addLeftAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addLeftAlignConstraintToViews:views constant:constant options:0];
}

- (void)addLeftAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addLeftAlignConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addLeftAlignConstraintToViews:item constant:constant];
        }
    }
    [UIView setConstraintToViews:views options:options];
}

- (void)addRightAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addRightAlignConstraintToViews:views constant:constant options:0];
}

- (void)addRightAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addRightAlignConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addRightAlignConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (void)addHAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    [self addHAlignConstraintToViews:@[view] constant:constant];
}
- (void)addHAlignConstraintToView:(UIView *)view constant:(CGFloat)constant options:(RJVFLOptions)options{
    [self addHAlignConstraintToViews:@[view] constant:constant options:options];
}
- (void)addVAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    [self addVAlignConstraintToViews:@[view] constant:constant];
}
- (void)addVAlignConstraintToView:(UIView *)view constant:(CGFloat)constant options:(RJVFLOptions)options{
    [self addVAlignConstraintToViews:@[view] constant:constant options:options];
}
- (void)addAllAlignConstraintToView:(UIView *)view constant:(CGFloat)constant{
    [self addAllAlignConstraintToViews:@[view] constant:constant];
}

- (void)addAllAlignConstraintToView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset{
    [self addTopAlignConstraintToView:view constant:edgeInset.top];
    [self addLeftAlignConstraintToView:view constant:edgeInset.left];
    [self addBottomAlignConstraintToView:view constant:edgeInset.bottom];
    [self addRightAlignConstraintToView:view constant:edgeInset.right];
}

- (void)addHAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addHAlignConstraintToViews:views constant:constant options:0];
}
- (void)addHAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    [self addLeftAlignConstraintToViews:views constant:constant];
    [self addRightAlignConstraintToViews:views constant:constant];
    [self addConstraintToViews:views options:options];
}

- (void)addVAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addVAlignConstraintToViews:views constant:constant options:0];
}
-(void)addVAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    [self addTopAlignConstraintToViews:views constant:constant];
    [self addBottomAlignConstraintToViews:views constant:constant];
    [self addConstraintToViews:views options:options];
}

- (void)addAllAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addHAlignConstraintToViews:views constant:constant];
    [self addVAlignConstraintToViews:views constant:constant];
}

#pragma mark - 中部约束
- (NSLayoutConstraint *)addCenterXConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    view.centerXConstraint = constraint;
    
    return constraint;
}

- (void)addCenterXConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addCenterXConstraintToViews:views constant:constant options:0];
}
- (void)addCenterXConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addCenterXConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addCenterXConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

- (NSLayoutConstraint *)addCenterYConstraintToView:(UIView *)view constant:(CGFloat)constant{
    if (![self validateAndConfigWithView:view]) {
        return nil;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:constant];
    [view.superview addConstraint:constraint];
    view.centerYConstraint = constraint;
    
    return constraint;
}

- (void)addCenterYConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    [self addCenterYConstraintToViews:views constant:constant options:0];
}
- (void)addCenterYConstraintToViews:(NSArray *)views constant:(CGFloat)constant options:(RJVFLOptions)options{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]] && item != self) {
            [self addCenterYConstraintToView:item constant:constant];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addCenterYConstraintToViews:item constant:constant];
        }
    }
    [self addConstraintToViews:views options:options];
}

/**x=0,y=0*/
- (void)addCenterConstraintToView:(UIView *)view{
    [self addCenterXYConstraintToView:view constantX:0 constantY:0];
}

- (void)addCenterXYConstraintToView:(UIView *)view constantX:(CGFloat)constantX constantY:(CGFloat)constantY{
    [self addCenterXConstraintToView:view constant:constantX];
    [self addCenterYConstraintToView:view constant:constantY];
}

- (void)addCenterXYConstraintToViews:(NSArray *)views constantX:(CGFloat)constantX constantY:(CGFloat)constantY{
    [self addCenterXYConstraintToViews:views constantX:constantX constantY:constantY options:0];
}
- (void)addCenterXYConstraintToViews:(NSArray *)views constantX:(CGFloat)constantX constantY:(CGFloat)constantY options:(RJVFLOptions)options{
    [self addCenterXConstraintToViews:views constant:constantX];
    [self addCenterYConstraintToViews:views constant:constantY];
    [self addConstraintToViews:views options:options];
}

#pragma mark - 对齐约束


+ (UIView *)findViewInViews:(NSArray *)views{
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]]) {
            return item;
        }else if ([item isKindOfClass:[NSArray class]]){
            [UIView findViewInViews:item];
        }
    }
    
    return nil;
}

+ (void)setConstraintToViews:(NSArray *)views options:(RJVFLOptions)options{
    if (!views.count || !options) {
        return;
    }
    
    /**先找到一个view,以它为标准进行约束*/
    UIView *view = [UIView findViewInViews:views];
    
    if (!view) {
        return;
    }
    
    if (options & RJVFLAlignAllLeft || options & RJVFLAlignAllLeading) {
        [view addLeftAlignConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllRight || options & RJVFLAlignAllTrailing) {
        [view addRightAlignConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllTop) {
        [view addTopAlignConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllBottom) {
        [view addBottomAlignConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllCenterX) {
        [view addCenterXConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllCenterY) {
        [view addCenterYConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllWidth) {
        [view addWidthConstraintToViews:views constant:0];
    }
    if (options & RJVFLAlignAllHeight) {
        [view addHeightConstraintToViews:views constant:0];
    }
    if (options & RJVFLBunchAllLeft) {
        [UIView setBunchConstraintsToViews:views constant:0 direction:RJDirectionLeft];
    }
    if (options & RJVFLBunchAllRight) {
        [UIView setBunchConstraintsToViews:views constant:0 direction:RJDirectionRight];
    }
    if (options & RJVFLBunchAllTop) {
        [UIView setBunchConstraintsToViews:views constant:0 direction:RJDirectionTop];
    }
    if (options & RJVFLBunchAllBottom) {
        [UIView setBunchConstraintsToViews:views constant:0 direction:RJDirectionBottom];
    }
}

- (void)addConstraintToViews:(NSArray *)views options:(RJVFLOptions)options{
    /**RJ 2019-02-24 12:17:00 如果想让self也参与其他options的对齐约束,把self加入到数组中*/
    if (options & RJVFLSelf) {
        NSMutableArray *viewsWithSelf = [NSMutableArray arrayWithObject:self];
        [viewsWithSelf addObjectsFromArray:views];
        [UIView setConstraintToViews:viewsWithSelf options:options];
        return;
    }
    
    [UIView setConstraintToViews:views options:options];
}


/***/
//+ (void)setConstraintToViews:(NSArray *)views constraint:(NSLayoutConstraint *)constraint Option:(RJVFLOptions)option{
//    int i = 0;
//    while (option > 1) {
//        option >>=option;
//        i++;
//    }
//
//    if ([views containsObject:constraint.firstItem]) {
//        if (constraint.firstAttribute == i) {
//            [constraint.firstItem addConstraintWithViews:views attribute:constraint.firstAttribute];
//        }
//    }
//    if ([views containsObject:constraint.secondItem]) {
//        if (constraint.secondAttribute == i) {
//            [constraint.secondItem addConstraintWithViews:views attribute:constraint.secondAttribute];
//        }
//    }
//}


#pragma mark - 串形约束

+ (void)setBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction{
    [UIView setBunchConstraintsToViews:views constant:constant direction:direction options:0];
}

+ (void)setBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction options:(RJVFLOptions)options{
    if (views.count <= 1) {
        return;
    }
    
    for (NSInteger i = 0; i < views.count - 1; i++) {
        id item = views[i];
        id nextItem = views[i+1];
        
        if ([item isKindOfClass:[UIView class]]) {
            if ([nextItem isKindOfClass:[UIView class]]) {
                [item addConstraintToView:nextItem constant:constant direction:direction];
            }else if ([nextItem isKindOfClass:[NSArray class]]){
                for (id childItem in nextItem) {
                    [UIView setBunchConstraintsToViews:@[item,childItem] constant:constant direction:direction];
                }
            }
        }else if ([item isKindOfClass:[NSArray class]]){
            if ([nextItem isKindOfClass:[UIView class]]) {
                for (id childItem in item) {
                    [UIView setBunchConstraintsToViews:@[childItem,nextItem] constant:constant direction:direction];
                }
            }else if ([nextItem isKindOfClass:[NSArray class]]){
                NSInteger min = MIN([item count], [nextItem count]);
                for (NSInteger j = 0; j < min; j++) {
                    [UIView setBunchConstraintsToViews:@[item[j],nextItem[j]] constant:constant direction:direction];
                }
            }
        }
    }
}

+ (void)setBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction{
    [UIView setBunchConstraintsToViews:views constants:constants direction:direction options:0];
}

+ (void)setBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction options:(RJVFLOptions)options{
    if (views.count <= 1 || !constants.count) {
        return;
    }
    
    NSInteger sessionCount = MIN(views.count, constants.count + 1);
    
    /**如果是 "☐☐☐|" 或者 "旦" 这两种形状,需要将两个数组反转,以获得正确的队列 */
    NSMutableArray *reverseViews = [views mutableCopy];
    NSMutableArray *reverseConstants = [constants mutableCopy];
    if (direction == RJDirectionRight || direction == RJDirectionBottom) {
        [self reverseWithArray:reverseViews];
        [self reverseWithArray:reverseConstants];
    }
    
    for (NSInteger i = 0; i < sessionCount - 1; i++) {
        id item = reverseViews[i];
        id nextItem = reverseViews[i+1];
        id constantItem = reverseConstants[i];
        
        /**如果是嵌套数组 比如这样 ⿳⿱⿳⿱*/
        if ([item isKindOfClass:[NSArray class]] || [nextItem isKindOfClass:[NSArray class]]) {
            if ([constantItem isKindOfClass:[NSNumber class]]) {
                [UIView setBunchConstraintsToViews:@[item,nextItem] constant:[constantItem floatValue] direction:direction];
            }else if ([constantItem isKindOfClass:[NSArray class]]){
                NSInteger min = [constantItem count];
                
                if ([item isKindOfClass:[NSArray class]]) {
                    min = MIN([item count], min);
                }
                if ([nextItem isKindOfClass:[NSArray class]]) {
                    min = MIN([nextItem count], min);
                }
                for (NSInteger j = 0; j < min; j++) {
                    id subItem = item;
                    id subNextItem = nextItem;
                    id subConstantItem = constantItem[j];
                    if ([item isKindOfClass:[NSArray class]]) {
                        subItem = item[j];
                    }
                    if ([nextItem isKindOfClass:[NSArray class]]) {
                        subNextItem = nextItem[j];
                    }
                    if ([subConstantItem isKindOfClass:[NSNumber class]]) {
                        [UIView setBunchConstraintsToViews:@[subItem,subNextItem] constant:[subConstantItem floatValue] direction:direction];
                    }else if ([subConstantItem isKindOfClass:[NSArray class]]){
                        [UIView setBunchConstraintsToViews:@[subItem,subNextItem] constants:@[subConstantItem] direction:direction];
                    }
                }
            }
        }else if ([item isKindOfClass:[UIView class]] && [nextItem isKindOfClass:[UIView class]]){
            UIView *view = item;
            UIView *nextView = nextItem;
            if ([constantItem isKindOfClass:[NSNumber class]]) {
                [view addConstraintToView:nextView constant:[constantItem floatValue] direction:direction];
            }else if ([constantItem isKindOfClass:[NSArray class]]){
                if ([[constantItem firstObject] isKindOfClass:[NSNumber class]]) {
                    [view addConstraintToView:nextView constant:[[constantItem firstObject] floatValue] direction:direction];
                }else if ([[constantItem firstObject] isKindOfClass:[NSArray class]]){
                    [UIView setBunchConstraintsToViews:@[view,nextView] constants:[constantItem firstObject] direction:direction];
                }
            }
        }
    }
    
    [UIView setConstraintToViews:views options:options];
}


- (void)addBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction{
    [self addBunchConstraintsToViews:views constant:constant direction:direction options:0];
}

- (void)addBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction{
    [self addBunchConstraintsToViews:views constants:constants direction:direction options:0];
}

- (void)addBunchConstraintsToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction options:(RJVFLOptions)options{
    if (!views.count) {
        return;
    }
    
    /**不需要处理了,直接调用可嵌套的方法就行了,所以直接return了*/
    NSMutableArray *constants = [NSMutableArray array];
    for (NSInteger i = 0; i <= views.count; i++) {
        [constants addObject:@(constant)];
    }
    
    [self addBunchConstraintsToViews:views constants:constants direction:direction options:options];
}

- (void)addBunchConstraintsToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction options:(RJVFLOptions)options{
    if (!views.count || !constants.count) {
        return;
    }
    
    NSMutableArray *reverseViews = [views mutableCopy];
    NSMutableArray *reverseConstants = [constants mutableCopy];
    /**如果是 "☐☐☐|" 或者 "旦" 这两种形状,需要将两个数组反转,以获得正确的队列 */
    if (direction == RJDirectionRight || direction == RJDirectionBottom) {
        [UIView reverseWithArray:reverseViews];
        [UIView reverseWithArray:reverseConstants];
    }
    
    /**找到第一个item和最后一个item,并和self进行约束*/
    /**这里是不合理的,因为如果firstItem或者lastItem是一个数组,数组中又存在NULL,就不会寻找下个合适的view和constant进行约束
     这样会产生一个问题,比如@[@[a,b,c],@[null,d,null]],如果我想让a和c与self右边也进行约束,就不能做到了,只对d进行了约束就跳过了
     */
    /**已经不需要那么麻烦了,如上面的那种例子,如果要让a和c也和self右边进行约束,只需要将数组改为@[@[abc],@[a,d,c]]即可,至于a和a之间或者c和c之间的约束,我做了校验,会过滤掉*/
    
    id firstItem = reverseViews.firstObject;
    id firstConstantItem = reverseConstants.firstObject;
    
    if ([firstItem isKindOfClass:[UIView class]]) {
        if ([firstConstantItem isKindOfClass:[NSNumber class]]) {
            [self addAlignConstraintToView:firstItem constant:[firstConstantItem floatValue] direction:direction];
        }else if ([firstConstantItem isKindOfClass:[NSArray class]]){
            [self addAlignConstraintToViews:@[firstItem] constants:firstConstantItem direction:direction];
        }
    }else if ([firstItem isKindOfClass:[NSArray class]]){
        if ([firstConstantItem isKindOfClass:[NSNumber class]]) {
            [self addAlignConstraintToViews:firstItem constant:[firstConstantItem floatValue] direction:direction];
        }else if ([firstConstantItem isKindOfClass:[NSArray class]]){
            [self addAlignConstraintToViews:firstItem constants:firstConstantItem direction:direction];
        }
    }
    
    [reverseConstants removeObjectAtIndex:0];
    
    /**只有constants比views多一排的时候,才需要约束与direction另一边的self的约束*/
    /**这里暂时是和上面代码重复的,现在有很多事要忙,等有时间需要封装一下*/
    if (constants.count > views.count) {
        id lastItem = reverseViews.lastObject;
        id lastConstantItem = reverseConstants.lastObject;
        
        if ([lastItem isKindOfClass:[UIView class]]) {
            if ([lastConstantItem isKindOfClass:[NSNumber class]]) {
                [self addAlignConstraintToView:lastItem constant:[lastConstantItem floatValue] direction:reverseDirection(direction)];
            }else if ([lastConstantItem isKindOfClass:[NSArray class]]){
                [self addAlignConstraintToViews:@[lastItem] constants:lastConstantItem direction:reverseDirection(direction)];
            }
        }else if ([lastItem isKindOfClass:[NSArray class]]){
            if ([lastConstantItem isKindOfClass:[NSNumber class]]) {
                [self addAlignConstraintToViews:lastItem constant:[lastConstantItem floatValue] direction:reverseDirection(direction)];
            }else if ([lastConstantItem isKindOfClass:[NSArray class]]){
                [self addAlignConstraintToViews:lastItem constants:lastConstantItem direction:reverseDirection(direction)];
            }
        }
        [reverseConstants removeLastObject];
    }
    
    //    /**设置self与第一个和最后一个view的align距离constraint*/
    //    [self addAlignConstraintToView:reverseViews.firstObject constant:[reverseConstants.firstObject floatValue] direction:direction];
    //    /**如果确实数组中有给距离才添加*/
    //    if (constants.count > views.count) {
    //        [self addAlignConstraintToView:reverseViews.lastObject constant:[reverseConstants[views.count] floatValue] direction:direction/2?direction-2:direction+2];
    //    }
    /**设置除了self之外的那些view之间的距离constraint,因为views在这个方法中会判断是否需要反转队列,所以不需要传reverse后的队列*/
    //    [reverseConstants reverse];
    /** 因为constants仍然保留着两边的两个item,所以要用reverseConstants才行,不过要重新reverse回来*/
    if (direction == RJDirectionRight || direction == RJDirectionBottom) {
        [UIView reverseWithArray:reverseConstants];
    }
    [UIView setBunchConstraintsToViews:views constants:reverseConstants direction:direction];
    [self addConstraintToViews:views options:options];
}

/** 可以使用一个矩阵完成所有的操作
 
 如:
 1------------
 2-- 3-- 4----
 5----- 6-----
 就是
 @[
 1,
 @[2,3,4],
 @[5,6]
 ]
 
 1--- 2--- 3---
 4--        5----
 6--- 7-- 8----
 
 就是 @[
 @[1,2,3],
 @[4,null,5],
 @[6,7,8]
 ]
 
 CGPint数组,point.x代表该view到左边view的距离,point.y代表view到顶部view的距离,NSNotFound代表不要这条约束
 @[(10,10),@[10,]]
 */

/** 数组可以多层嵌套*/
/** 舍弃,因为多层嵌套不可行,嵌套的数组看做一个整体的话,就会使底部和右边约束都受影响,如果增加属性标识,还不如用addBunch方便*/
/** 可找时间把addBunch改为支持数组嵌套的*/
#if 0
- (void)addMatrixConstraintsToViews:(NSArray *)views rjConstantPoints:(NSArray *)points bottomMargin:(id)bottomMargin rightMargin:(id)rightMargin{
    if (!views.count) {
        return;
    }
    
    /**添加下面和右边的约束*/
    void (^addMarginConstraintsBlock)(id constant,RJDirection direction) =  ^(id constant, RJDirection direction){
        if (!constant) {
            return;
        }
        
        id lastObj;
        if (direction == RJDirectionBottom) {
            lastObj = views.lastObject;
        }else{
            NSMutableArray *tempArr = [NSMutableArray array];
            for (id obj in views) {
                if ([obj isKindOfClass:[UIView class]]) {
                    [tempArr addObject:obj];
                }else if ([obj isKindOfClass:[NSArray class]]){
                    /** 弃用的原因是在这里发现的*/
                }
            }
        }
        
        if ([lastObj isKindOfClass:[UIView class]]) {
            if ([constant isKindOfClass:[NSNumber class]]) {
                if (direction == RJDirectionBottom) {
                    [self addBottomAlignConstraintToView:lastObj constant:[constant floatValue]];
                }else{
                    [self addRightAlignConstraintToView:lastObj constant:[constant floatValue]];
                }
            }else if ([constant isKindOfClass:[NSArray class]]){
                if (direction == RJDirectionBottom) {
                    [self addBottomAlignConstraintToView:lastObj constant:[[constant firstObject] floatValue]];
                }else{
                    [self addRightAlignConstraintToView:lastObj constant:[[constant firstObject] floatValue]];
                }
            }
        }else if ([lastObj isKindOfClass:[NSArray class]]){
            if ([constant isKindOfClass:[NSNumber class]]) {
                for (NSInteger i = 0; i < [lastObj count]; i++) {
                    if (direction == RJDirectionBottom) {
                        [self addMatrixConstraintsToViews:@[lastObj[i]] rjConstantPoints:nil bottomMargin:constant rightMargin:nil];
                    }else{
                        [self addMatrixConstraintsToViews:@[lastObj[i]] rjConstantPoints:nil bottomMargin:nil rightMargin:constant];
                    }
                }
            }else if ([constant isKindOfClass:[NSArray class]]){
                NSInteger min = MIN([lastObj count], [constant count]);
                for (NSInteger i = 0; i < min; i++) {
                    if (direction == RJDirectionBottom) {
                        [self addMatrixConstraintsToViews:@[lastObj[i]] rjConstantPoints:nil bottomMargin:constant[i] rightMargin:nil];
                    }else{
                        [self addMatrixConstraintsToViews:@[lastObj[i]] rjConstantPoints:nil bottomMargin:nil rightMargin:constant[i]];
                    }
                }
            }
        }
    };
    
    /**添加下面和右边的约束*/
    addMarginConstraintsBlock(bottomMargin,RJDirectionBottom);
    addMarginConstraintsBlock(rightMargin,RJDirectionRight);
    
    if (points.count) {
        return;
    }
    
    /**递归*/
    /**解决由于其中一列过于琐碎写起来麻烦的问题*/
    /**如果points缺少,则默认会用(0,0)补位*/
    for (NSInteger i = 0; i < views.count - 1; i++) {
        id obj = views[i];
        id nextObj = views[i + 1];
        id constantItem = points.count >= views.count?points[i]:nil;
        
        if ([obj isKindOfClass:[NSNull class]] || [nextObj isKindOfClass:[NSNull class]] || !constantItem || [constantItem isKindOfClass:[NSNull class]]) {
            break;
        }
        
        if ([obj isKindOfClass:[UIView class]]) {
            if ([nextObj isKindOfClass:[UIView class]]) {
                if ([constantItem isKindOfClass:[RJConstantPoint class]]) {
                    [self addConstraintToView:obj nextView:nextObj constantPoint:constantItem];
                }else if ([constantItem isKindOfClass:[NSArray class]]){
                    [self addMatrixConstraintsToViews:@[obj,nextObj] rjConstantPoints:[constantItem firstObject] bottomMargin:nil rightMargin:nil];
                }
            }else if ([nextObj isKindOfClass:[NSArray class]]){
                if ([constantItem isKindOfClass:[RJConstantPoint class]]) {
                    for (id nextSubObj in nextObj) {
                        [self addMatrixConstraintsToViews:@[obj,nextSubObj] rjConstantPoints:constantItem bottomMargin:nil rightMargin:nil];
                    }
                }else if ([constantItem isKindOfClass:[NSArray class]]){
                    NSInteger min = MIN([nextObj count], [constantItem count]);
                    for (NSInteger j = 0; j < min; j++) {
                        [self addMatrixConstraintsToViews:@[obj,nextObj[j]] rjConstantPoints:constantItem[j] bottomMargin:nil rightMargin:nil];
                    }
                }
            }
        }else if ([obj isKindOfClass:[NSArray class]]){
            if ([nextObj isKindOfClass:[UIView class]]) {
                if ([constantItem isKindOfClass:[RJConstantPoint class]]) {
                    for (id subObj in obj) {
                        [self addMatrixConstraintsToViews:@[subObj,nextObj] rjConstantPoints:constantItem bottomMargin:nil rightMargin:nil];
                    }
                }else if ([constantItem isKindOfClass:[NSArray class]]){
                    NSInteger min = MIN([obj count], [constantItem count]);
                    for (NSInteger j = 0; j < min; j++) {
                        [self addMatrixConstraintsToViews:@[obj[j],nextObj] rjConstantPoints:constantItem[j] bottomMargin:nil rightMargin:nil];
                    }
                }
            }else if ([nextObj isKindOfClass:[NSArray class]]){
                if ([constantItem isKindOfClass:[RJConstantPoint class]]) {
                    NSInteger min = MIN([obj count], [nextObj count]);
                    for (NSInteger j = 0; j < min; j++) {
                        [self addMatrixConstraintsToViews:@[obj[j],nextObj[j]] rjConstantPoints:constantItem bottomMargin:nil rightMargin:nil];
                    }
                }else if ([constantItem isKindOfClass:[NSArray class]]){
                    NSInteger min = MIN(MIN([obj count], [nextObj count]),[constantItem count]);
                    for (NSInteger j = 0; j < min; j++) {
                        [self addMatrixConstraintsToViews:@[obj[j],nextObj[j]] rjConstantPoints:constantItem[j] bottomMargin:nil rightMargin:nil];
                    }
                }
            }
        }
    }
}


- (void)addConstraintToView:(UIView *)view nextView:(UIView *)nextView constantPoint:(RJConstantPoint *)constantPoint{
    if (!constantPoint) {
        return;
    }
    if (constantPoint.isTopValid) {
        [view addBottomConstraintToView:nextView constant:constantPoint.topConstant];
    }
    if (constantPoint.isLeftValid) {
        [nextView addRightConstraintToView:nextView constant:constantPoint.leftConstant];
    }
}
#endif

#pragma mark - private method

/***/
- (void)addConstraintWithViews:(NSArray *)views attribute:(NSLayoutAttribute)attribute{
    switch (attribute) {
        case NSLayoutAttributeLeft: case NSLayoutAttributeLeading:
            [self addLeftAlignConstraintToViews:views constant:0];
            break;
        case NSLayoutAttributeRight: case NSLayoutAttributeTrailing:
            [self addRightAlignConstraintToViews:views constant:0];
        case NSLayoutAttributeTop:
            [self addTopAlignConstraintToViews:views constant:0];
        case NSLayoutAttributeBottom:
            [self addBottomAlignConstraintToViews:views constant:0];
        case NSLayoutAttributeCenterX:
            [self addCenterXConstraintToViews:views constant:0];
        case NSLayoutAttributeCenterY:
            [self addCenterYConstraintToViews:views constant:0];
        default:
            break;
    }
}

+ (void)setTopBunchConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    if (views.count <= 1) {
        return;
    }
    for (NSInteger i = 1; i < views.count; i++) {
        UIView *view = views[i - 1];
        UIView *nextView = views[i];
        [view addBottomConstraintToView:nextView constant:constant];
    }
}

+ (void)setLeftBunchConstraintToViews:(NSArray *)views constant:(CGFloat)constant{
    if (views.count <= 1) {
        return;
    }
    for (NSInteger i = 1; i < views.count; i++) {
        UIView *view = views[i - 1];
        UIView *nextView = views[i];
        [view addRightConstraintToView:nextView constant:constant];
    }
}

+ (void)setLineBunchConstraintToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction options:(RJVFLOptions)options{
    if (views.count <= 1) {
        return;
    }
    for (NSInteger i = 1; i < views.count; i++) {
        id item = views[i - 1];
        /**如果当前的item是一个view*/
        if ([item isKindOfClass:[UIView class]]) {
            /**寻找下一个view,进行layout,并将index也置为下个view的index*/
            for (NSInteger j = i; j < views.count; i++) {
                i = j;
                id nextItem = views[j];
                if ([nextItem isKindOfClass:[UIView class]]) {
                    [item addConstraintToView:nextItem constant:constant direction:direction];
                    break;
                }
            }
        }
    }
    [UIView setConstraintToViews:views options:options];
}

/**寻找下个view*/
+ (UIView *)findNextViewWithReverseViews:(NSArray *)reverseViews session:(NSInteger)session line:(NSInteger)line sessionCount:(NSInteger)sessionCount{
    //    for (NSInteger k = session; k < sessionCount; k++) {
    if (session > reverseViews.count) {
        return nil;
    }
    id nextItem = reverseViews[session];
    if ([nextItem isKindOfClass:[NSArray class]]) {
        /**没有越界,而且是一个View*/
        if (line <= [nextItem count] && [nextItem[line] isKindOfClass:[UIView class]]) {
            return nextItem[line];
        }
    }else if ([nextItem isKindOfClass:[UIView class]]){
        return nextItem;
    }
    //    }
    return nil;
}

/**寻找下个constant,如果不是NULL就对view和nextView进行约束*/
+ (void)findConstantToConstraintWithView:(UIView *)view nextView:(UIView *)nextView constantItem:(id)constantItem line:(NSInteger)line direction:(RJDirection)direction{
    NSNumber *constant;
    /**当前是一个view而且找到了下个view,寻找下个constant*/
    if (view && nextView) {
        if ([constantItem isKindOfClass:[NSArray class]]) {
            constant = constantItem[line];
        }else if ([constantItem isKindOfClass:[NSNumber class]]){
            constant = constantItem;
        }
        /**而且还找到了下个constant*/
        if (constant && [constant isKindOfClass:[NSNumber class]]) {
            [view addConstraintToView:nextView constant:[constant floatValue] direction:direction];
        }
    }
}

- (void)addConstraintToView:(UIView *)view constant:(CGFloat)constant direction:(RJDirection)direction{
    if (!view) {
        return;
    }
    switch (direction) {
        case RJDirectionTop:
            [self addBottomConstraintToView:view constant:constant];
            break;
        case RJDirectionLeft:
            [self addRightConstraintToView:view constant:constant];
            break;
        case RJDirectionRight:
            [self addLeftConstraintToView:view constant:constant];
            break;
        case RJDirectionBottom:
            [self addTopConstraintToView:view constant:constant];
            break;
        default:
            
            break;
    }
}

- (void)addAlignConstraintToView:(UIView *)view constant:(CGFloat)constant direction:(RJDirection)direction{
    if (!view) {
        return;
    }
    switch (direction) {
        case RJDirectionTop:
            [self addTopAlignConstraintToView:view constant:constant];
            break;
        case RJDirectionLeft:
            [self addLeftAlignConstraintToView:view constant:constant];
            break;
        case RJDirectionRight:
            [self addRightAlignConstraintToView:view constant:constant];
            break;
        case RJDirectionBottom:
            [self addBottomAlignConstraintToView:view constant:constant];
            break;
        default:
            break;
    }
}

- (void)addAlignConstraintToViews:(NSArray *)views constant:(CGFloat)constant direction:(RJDirection)direction{
    if (!views.count) {
        return;
    }
    
    for (id item in views) {
        if ([item isKindOfClass:[UIView class]]) {
            [self addAlignConstraintToView:item constant:constant direction:direction];
        }else if ([item isKindOfClass:[NSArray class]]){
            [self addAlignConstraintToViews:item constant:constant direction:direction];
        }
    }
}

- (void)addAlignConstraintToViews:(NSArray *)views constants:(NSArray *)constants direction:(RJDirection)direction{
    if (!views.count || !constants.count) {
        return;
    }
    
    NSInteger min = MIN(views.count,constants.count);
    
    for (NSInteger i = 0; i < min; i++) {
        id item = views[i];
        id constant = constants[i];
        if ([item isKindOfClass:[UIView class]]) {
            if ([constant isKindOfClass:[NSNumber class]]) {
                [self addAlignConstraintToView:item constant:[constant floatValue] direction:direction];
            }else if ([constant isKindOfClass:[NSArray class]]){
                if ([[constant firstObject] isKindOfClass:[NSNumber class]]) {
                    [self addAlignConstraintToView:item constant:[constant floatValue] direction:direction];
                }else if ([[constant firstObject] isKindOfClass:[NSArray class]]){
                    /**RJ 2019-02-24 23:26:15 这里对constants多余的情况进行处理,默认选取第一个constant进行约束*/
                    [self addAlignConstraintToViews:@[item] constants:[constant firstObject] direction:direction];
                }
            }
        }else if ([item isKindOfClass:[NSArray class]]){
            if ([constant isKindOfClass:[NSNumber class]]) {
                [self addAlignConstraintToViews:item constant:[constant floatValue] direction:direction];
            }else if ([constant isKindOfClass:[NSArray class]]){
                [self addAlignConstraintToViews:item constants:constant direction:direction];
            }
        }
    }
}

- (BOOL)validateAndConfigWithView:(UIView *)view{
    if (self == view) {
        //        NSString *str = [NSString stringWithFormat:@"😱😱😱😱😱😱%@自己不能和自己搞约束(这里不会用到自己宽高之间约束的,所以我能肯定不行)",self];
        //        NSLog(@"%@",str);
        //        NSAssert(self != view, str);
        return NO;
    }
    
    if (!self.superview && self != view.superview) {
        NSString *str = [NSString stringWithFormat:@"😱😱😱😱😱😱%@没有superView",self];
        NSLog(@"%@",str);
        //        NSAssert(self.superview || self == view.superview, str);
        return NO;
    }
    
    if (!view.superview && self.superview != view) {
        NSString *str = [NSString stringWithFormat:@"%@😱😱😱😱😱😱没有superView",view];
        NSLog(@"%@",str);
        //        NSAssert(view.superview || self.superview == view, str);
        return NO;
    }
    
    if (![self isKindOfClass:[UIView class]]) {
        NSString *str = [NSString stringWithFormat:@"😱😱😱😱😱😱%@不是一个View",self];
        NSLog(@"%@",str);
        //        NSAssert([self isKindOfClass:[UIView class]], str);
        return NO;
    }
    
    if (![view isKindOfClass:[UIView class]]) {
        NSString *str = [NSString stringWithFormat:@"😱😱😱😱😱😱%@不是一个View",view];
        NSLog(@"%@",str);
        //        NSAssert([view isKindOfClass:[UIView class]], str);
        return NO;
    }
    
    if (self.superview != view.superview && self !=view.superview && self.superview !=view) {
        NSString *str = [NSString stringWithFormat:@"😱😱😱😱😱😱%@和%@没有构建约束的充分条件",self,view];
        NSLog(@"%@",str);
        //        NSAssert(self.superview == view.superview || self ==view.superview || self.superview ==view, str);
        return NO;
    }
    
    //    self.translatesAutoresizingMaskIntoConstraints = NO;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return YES;
}

+ (void)reverseWithArray:(NSMutableArray *)array {
    NSUInteger count = array.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [array exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

@end
