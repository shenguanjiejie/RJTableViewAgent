//
//  RJTableViewAgent.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RJLabelButtonCell.h"
#import "RJLabelButtonCellInfo.h"
#import "RJButtonCell.h"
#import "RJButtonCellInfo.h"
#import "RJChooseCell.h"
#import "RJChooseCellInfo.h"
#import "RJCollectionCell.h"
#import "RJCollectionCellInfo.h"
#import "RJCustomCellInfo.h"
#import "RJCycleCell.h"
#import "RJCycleCellInfo.h"
#import "RJHTwoLabelCell.h"
#import "RJHTwoLabelCellInfo.h"
#import "RJImageCell.h"
#import "RJImageCellInfo.h"
#import "RJImageLabelButtonCell.h"
#import "RJImageLabelButtonCellInfo.h"
#import "RJImageLabelCell.h"
#import "RJImageLabelCellInfo.h"
#import "RJImageVTwoLabelCell.h"
#import "RJImageVTwoLabelCellInfo.h"
#import "RJLabelCellInfo.h"
#import "RJLabelCell.h"
#import "RJLabelSwitchCellInfo.h"
#import "RJLabelTextFieldCell.h"
#import "RJLabelTextFieldCellInfo.h"
#import "RJTextViewCellInfo.h"
#import "RJTextViewCell.h"
#import "UITableView+RJCellInit.h"
#import "RJImageVTwoLabelButtonCell.h"
#import "RJImageVTwoLabelButtonCellInfo.h"

#define kRJIndexPath(section,row) [NSIndexPath indexPathForRow:row inSection:section]


@class RJTableViewAgent;

@protocol RJTableViewAgentDataSource <NSObject>

@optional

- (NSInteger)rj_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (__kindof RJBaseCellInfo *)rj_tableView:(UITableView *)tableView infoForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)rj_numberOfSectionsInRJTableView:(UITableView *)tableView;

- (NSString *)rj_tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
- (NSString *)rj_tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

@end

@protocol RJTableViewAgentDelegate <NSObject>

@optional
- (CGFloat)rj_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)rj_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
- (CGFloat)rj_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (nullable UIView *)rj_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)rj_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

- (void)rj_didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (BOOL)rj_tableView:(UITableView *)tableView canEditRowForInfo:(RJBaseCellInfo *)info;

- (NSArray<UITableViewRowAction *> *)rj_tableView:(UITableView *)tableView editActionsForInfo:(RJBaseCellInfo *)info;

- (void)rj_scrollViewDidScroll:(UIScrollView *)scrollView;

@end

@interface RJTableViewAgent : NSObject

/**RJ 2019-01-01 12:18:40
    赋值tableView的宽度
    仅当需要自动计算RJTextViewCell的高度时需要,不需要时可忽略
    default:kRJScreenWidth
 */
@property (nonatomic, assign) CGFloat tableViewWidth;

/**数据为空时要提示的文字*/
@property (nonatomic, copy) NSString *emptyShowText;

/**
 可以直接使用该数组作为数据源,cell个数为数组count,如果逻辑不复杂,使用这个数组更简洁,
 如果实现了数据源代理方法rj_tableView: infoForRowAtIndexPath:,将忽略该数组
 */
@property (nonatomic, copy, readonly) NSMutableArray<__kindof RJBaseCellInfo *> *infos;

/**RJ 2019-01-01 13:53:14 目前只加入了常用的一些代理方法*/
@property (nonatomic,weak) id<RJTableViewAgentDelegate> delegate;
/**RJ 2019-01-01 13:53:14 目前只加入了常用的一些代理方法*/
@property (nonatomic,weak) id<RJTableViewAgentDataSource> dataSource;

/**RJ 2019-01-01 12:44:23
    RJTableViewAgent将成为tableView的代理
 */
- (RJTableViewAgent *)initWithTableView:(UITableView *)tableView;

/**以下这些方法作用类似,调用后会将对应info加入到self.infos数组当中*/
- (RJBaseCellInfo *)addBaseCellWithBackgroundColor:(UIColor *)color;

- (RJBaseCellInfo *)addBaceCellWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)color;

- (RJLabelCellInfo *)addLabelCellWithText:(NSString *)text font:(UIFont *)font;
- (RJLabelCellInfo *)addLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

- (RJLabelButtonCellInfo *)addLabelButtonCellWithText:(NSString *)text font:(UIFont *)font;
- (RJLabelButtonCellInfo *)addLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

- (RJLabelSwitchCellInfo *)addSwitchCellWithText:(NSString *)text size:(CGSize)size font:(UIFont *)font isOn:(BOOL)isOn;
- (RJLabelSwitchCellInfo *)addSwitchCellWithIndexPath:(NSIndexPath *)indexPath size:(CGSize)size text:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn;

- (RJTextViewCellInfo *)addTextViewCellWithPlaceholder:(NSString *)placeholder;
- (RJTextViewCellInfo *)addTextViewCellWithIndexPath:(NSIndexPath *)indexPath placeholder:(NSString *)placeholder;

- (RJButtonCellInfo *)addButtonCellWithBackgroundColor:(UIColor *)backgroundColor;
- (RJButtonCellInfo *)addButtonCellWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)backgroundColor;

- (RJCustomCellInfo *)addCustomCellWithCell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight;
- (RJCustomCellInfo *)addCustomCellWithIndexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight;

- (RJCustomCellInfo *)addCustomCellWithIdentifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock;
- (RJCustomCellInfo *)addCustomCellWithIndexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock;

- (RJImageCellInfo *)addImageCellWithImage:(id)image placeholderImage:(UIImage *)placeholderImage;
- (RJImageCellInfo *)addImageCellWithIndexPath:(NSIndexPath *)indexPath image:(id)image placeholderImage:(UIImage *)placeholderImage;

- (RJCycleCellInfo *)addCycleCellWithImages:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage;
- (RJCycleCellInfo *)addCycleCellWithIndexPath:(NSIndexPath *)indexPath images:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage;

- (RJImageLabelCellInfo *)addImageLabelCellWithText:(NSString *)text font :(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;
- (RJImageLabelCellInfo *)addImageLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font :(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;

- (RJImageVTwoLabelCellInfo *)addImageVTwoLabelCellWithText:(NSString *)text font :(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize;
- (RJImageVTwoLabelCellInfo *)addImageVTwoLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font :(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize;

- (RJImageVTwoLabelButtonCellInfo *)addImageVTwoLabelButtonCellWithText:(NSString *)text font :(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize;
- (RJImageVTwoLabelButtonCellInfo *)addImageVTwoLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font :(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize;

- (RJImageLabelButtonCellInfo *)addImageLabelButtonCellWithText:(NSString *)text font :(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;
- (RJImageLabelButtonCellInfo *)addImageLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font :(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;

- (RJLabelTextFieldCellInfo *)addTextFieldCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder;
- (RJLabelTextFieldCellInfo *)addTextFieldCellWithText:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder;

- (RJHTwoLabelCellInfo *)addHTwoLabelCellWithIndexpath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont;
- (RJHTwoLabelCellInfo *)addHTwoLabelCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont;

- (RJChooseCellInfo *)addChooseCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont;
- (RJChooseCellInfo *)addChooseCellWithIndexpath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont;

- (RJCollectionCellInfo *)addCollectionCellWithDelegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout;
- (RJCollectionCellInfo *)addCollectionWithIndexpath:(NSIndexPath *)indexPath delegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout;
/**以上这些方法作用类似,调用后会将对应info加入到self.infos数组当中*/

/**取到对应indexPath的info */
- (__kindof RJBaseCellInfo *)cellInfoWithIndexPath:(NSIndexPath *)indexPath;

/**使用info,reload对应cell,info中有缓存indexPath*/
- (void)reloadCellWithCellInfo:(RJBaseCellInfo *)info;

- (void)reloadCellWithCellInfos:(NSArray<__kindof RJBaseCellInfo *> *)infos animation:(UITableViewRowAnimation)animation;

/**RJ 2019-01-01 12:41:27 和直接调用tableView的reloadData是一样的*/
- (void)reloadData;

/**排序并reload,一般不会用到,自己在self.infos中按顺序添加就行了,没必用用这个方法*/
- (void)sortAndReloadData;

/**这个方法的使用场景是,在可编辑保存的页面,点击保存时调用,检查数据的有效性,BindingString的逻辑可以在RJBaseCellInfo中查看*/
- (BOOL)validateBindingStringWithAlert:(BOOL)alert;

@end

