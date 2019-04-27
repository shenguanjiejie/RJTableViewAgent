//
//  RJBaseCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "RJCGUtilities.h"
#import "RJTableViewAgentMacros.h"
#import "RJTableViewAgentConfig.h"

@class RJBaseCellInfo;

typedef NS_ENUM(NSUInteger, CellType) {
    CellTypeBase,
    CellTypeLabel,
    CellTypeHTwoLabel,
    CellTypeVTwoLabel,
    CellTypeLabelButton,
    CellTypeImageLabelButton,
    CellTypeImageVTwoLabelButton,
    CellTypeImage,
    CellTypeCycle,
    CellTypeImageLabel,
    CellTypeImageVTwoLabel,
    CellTypeLabelSwitch,
    CellTypeLabelTextField,
    CellTypeChoose,
    CellTypeTextView,
    CellTypeButton,
    CellTypeCustom,
    CellTypeCollectionView,
};

typedef NS_ENUM(NSUInteger, RJCellVariety) {
    RJCellVarietyNone = 0,
    /**eg:backgroundColor,hidden ...*/
    RJCellVarietyCell = 1 << 0,
    RJCellVarietyLayoutMargins = 1 << 1,
    RJCellVarietyLine = 1 << 2,
    RJCellVarietySubviewConfig = 1 << 3,
    /** eg:text,placeholder,image ...*/
    RJCellVarietySubviewValues = 1 << 4,
    RJCellVarietyAll = RJCellVarietyCell | RJCellVarietyLayoutMargins | RJCellVarietyLine | RJCellVarietySubviewConfig | RJCellVarietySubviewValues,
};


typedef void (^RJCellInitBlock)(__kindof UITableViewCell *cell);

typedef void (^RJInfoCellInitBlock)(__kindof UITableViewCell *cell,__kindof RJBaseCellInfo *info);

typedef void (^RJDidSelectRowAtIndexPathBlock)(__kindof UITableViewCell *cell,NSIndexPath *indexPath,__kindof RJBaseCellInfo *info);

typedef void (^RJCellForRowAtIndexPathBlock)(__kindof UITableViewCell *cell,NSIndexPath *indexPath,__kindof RJBaseCellInfo *info);


@interface RJBaseCellInfo : NSObject{
    @protected
    /**
        bindingString所绑定的属性名称
     */
    NSString *_bindingStringKVOPropertyName;
    CellType _cellType;
}

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) NSInteger cellTag;

@property (nonatomic, strong) NSIndexPath *indexPath;

/**default:YES 如果改为NO,则该info不再生效*/
//@property (nonatomic, assign) BOOL enable;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign, readonly) CellType cellType;

@property (nonatomic, assign) CGFloat cellHeight;

/**
 default:RJCellVarietyAll
 该属性针对同identifier的cell,精确地使用该参数能够灵活地创建样式多变并且敏捷的cell,提升RJTableView的性能
 如果对性能要求极高,可以用一用,否则可以忽略该属性.
 */
@property (nonatomic, assign) RJCellVariety cellVariety __deprecated_msg("弃用");

/**default:NO*/
@property (nonatomic, assign, getter=isHidden) BOOL hidden;

@property (nonatomic, assign) UIEdgeInsets layoutMargins;

@property (nonatomic, assign) CGFloat topMargin;
@property (nonatomic, assign) CGFloat leftMargin;
@property (nonatomic, assign) CGFloat bottomMargin;
@property (nonatomic, assign) CGFloat rightMargin;

/**default:YES*/
@property (nonatomic, assign) BOOL lineHidden;

@property (nonatomic, assign) CGFloat lineHeight;

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) CGFloat lineLeftMargin;
@property (nonatomic, assign) CGFloat lineRightMargin;

@property (nonatomic, assign) CGFloat minHeight;

@property (nonatomic, copy) RJDidSelectRowAtIndexPathBlock didSelectRowAtIndexPathBlock;

/**RJ 2019-04-23 18:01:13
    该block会在设置info中参数之前调用,所以可以在这里更改info中的参数,以达到更改cell的效果
 */
@property (nonatomic, copy) RJCellForRowAtIndexPathBlock cellForRowAtIndexPathBlock;

/**
 default:nil
 1.可以在该block中对RJTableView中自带的cell进行定制
 2.在该block中对cell的设置,是会被复用的
 ps:本来打算调用完该block置为nil以免内存泄露,但是考虑到初始化的block很可能会被复用,所以不能这样做,因此仍然要你自己处理
 */
@property (nonatomic, copy) RJInfoCellInitBlock infoCellInitBlock;

/**
 绑定一个字符串,当text变动之后,该字符串也会动态变动
 如果是RJLabelCellInfo,则默认binding的是label的text
 如果是其他子类,则默认binding的是对应的detail控件的text
 如果是custom的cell,则bindingString默认为"",需要你自己手动改变bindingString的值
 使用方法:string = info.bindingString 这样反向赋值属于绑定操作
 ps:由于该参数一般用于网络请求参数的构建,所以初始化为"",防止为nil时,导致作为字典的value的时候崩溃
 @warning 参数模型中需要进行binding的属性,必须使用strong策略,不能使用copy策略,否则无法动态变动其值
 */
@property (nonatomic, strong) NSString *bindingString;

/** 这种方式比相比上面那种,用起来逻辑更清晰,
 但是由于Model一般是使用属性取值,不对外暴露成员变量,所以这种方式用起来有局限性,还是需要选择上面那个方式
 */
//@property (nonatomic, assign) NSString *__strong *bindingString;

/**
 在bindingString验证失败的时候,提示语所要提示的前缀
 eg:需要提示"用户名输入限制4个字" 其中"用户名"就是bindingStringValidatePrefix,4对应bindingStringMaxLength
 default:默认情况下,RJLabelTextFieldCellInfo和RJHTwoLabelCellInfo对应的bindingStringValidatePrefix是titleLabel对应的text
 */
@property (nonatomic, copy) NSString *bindingStringValidatePrefix;

/**
 用来自动alert
 一般默认为0,即不限制,RJLabelTextFieldCellInfo,RJTextViewCellInfo,RJChooseCellInfo默认为1,即不可为空
 绑定的字符串的长度限制,如果多于这个长度,会有hud提示
 */
@property (nonatomic, assign) NSInteger bindingStringMinLength;

/**
 用来自动alert
 默认为NSNotFound,即不限制
 绑定的字符串的长度限制,如果多于这个长度,会有hud提示
 */
@property (nonatomic, assign) NSInteger bindingStringMaxLength;

//- (void)setBindingStringString:(NSString *)string;

- (instancetype)initWithCellType:(CellType)cellType indexPath:(NSIndexPath *)indexPath;

- (void)removeRJCellObserver __attribute__((objc_requires_super));

@end
