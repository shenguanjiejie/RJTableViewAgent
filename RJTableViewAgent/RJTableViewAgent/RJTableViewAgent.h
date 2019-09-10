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

@protocol RJTableViewAgentDataSource <UITableViewDataSource>

/**RJ 2019-03-25 14:58:03
    使用该方法替代tableView:cellForRowAtIndexPath:
 */
- (__kindof RJBaseCellInfo *)rj_tableView:(UITableView *)tableView infoForRowAtIndexPath:(NSIndexPath *)indexPath;

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

/**RJ 2019-04-14 21:44:05 开启自动适配分割线的长度,默认NO,开启后会将每个group的最后一个Cell的分割线与Cell两端对齐*/
@property (nonatomic, assign) BOOL autoFullLengthLine;

/**
 可以直接使用该数组作为数据源,cell个数为数组count,如果逻辑不复杂,使用这个数组更简洁,
 如果实现了数据源代理方法rj_tableView: infoForRowAtIndexPath:,将忽略该数组
 */
@property (nonatomic, copy, readonly) NSMutableArray<__kindof RJBaseCellInfo *> *infos;

/**数据源,和infos二选一即可,优先级大于infos*/
@property (nonatomic,weak) id<RJTableViewAgentDataSource> dataSource;

/**RJ 2019-01-01 12:44:23
    默认RJTableViewAgent将成为tableView的代理
    如果需要将代理赋值为其他对象,并且享受RJTableViewAgent的附加功能,只需在对应的代理方法中调用一下RJTableViewAgent中同样的方法即可
    对应的方法在最下方可以查看到
 */
- (RJTableViewAgent *)initWithTableView:(UITableView *)tableView;

#pragma mark - 以下这些方法作用类似,调用后会将对应的cellInfo加入到self.infos数组当中
- (RJBaseCellInfo *)addBaseCellWithBackgroundColor:(UIColor *)color;

- (RJBaseCellInfo *)addBaceCellWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)color;

- (RJLabelCellInfo *)addLabelCellWithText:(NSString *)text font:(UIFont *)font;
- (RJLabelCellInfo *)addLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

- (RJLabelButtonCellInfo *)addLabelButtonCellWithText:(NSString *)text font:(UIFont *)font;
- (RJLabelButtonCellInfo *)addLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font;

- (RJLabelSwitchCellInfo *)addSwitchCellWithText:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn;
- (RJLabelSwitchCellInfo *)addSwitchCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn;

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
/**以上这些方法作用类似,调用后会将对应的cellInfo加入到self.infos数组当中*/

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


#pragma mark - 默认情况下,talbeView以及内置的RJCell中的textView、textField、switch等,对应的delegate/dataSource为RJTableViewAgent.如果cellInfo中对应的block能满足需求的话,推荐使用block.如果必须要获取这些delegate的所有权,而且想保留RJTableViewAgent的一些功能,可以在对应的代理方法中调用下方这些对应方法,

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark  UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

- (void)textViewDidChange:(UITextView *)textView;

#pragma mark UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField;

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end

