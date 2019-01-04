//
//  RJTableViewAgent.m
//  RJTableView
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "RJTableViewAgent.h"
#import "UITableView+RJCellInit.h"
#import "NSObject+RJObject.h"
#import "RJLabelSwitchCell.h"
#import "UIButton+WebCache.h"
#import "UITableView+RJCellInit.h"
#import "UITextField+RJInputLimit.h"
#import "UITextView+RJPlaceholder.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "RJImage.h"
#import "UIImageView+WebCache.h"
#import "UIView+RJMBProgressHUD.h"

@interface RJTableViewAgent ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RJTableViewAgent

- (RJTableViewAgent *)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        _infos = [NSMutableArray array];
        _tableViewWidth = kRJScreenWidth;
        
        self.tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        tableView.emptyDataSetSource = self;
        tableView.emptyDataSetDelegate = self;
        tableView.estimatedRowHeight = 44;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kRJScreenWidth, 0.001)];
        tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kRJScreenWidth, 0.001)];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    
    return self;
}

- (void)reloadData{
    [self.tableView reloadData];
}

- (void)sortAndReloadData{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"indexPath" ascending:YES];
    [_infos sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [self.tableView reloadData];
}

#pragma mark - Public Methods

-(RJBaseCellInfo *)addBaseCellWithBackgroundColor:(UIColor *)color{
    return [self addBaceCellWithIndexPath:kRJIndexPath(0, _infos.count) backgroundColor:color];
}

- (RJBaseCellInfo *)addBaceCellWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)color{
    RJBaseCellInfo *info = [[RJBaseCellInfo alloc] initWithCellType:CellTypeBase indexPath:indexPath];
    info.backgroundColor = color?:[UIColor clearColor];
    [_infos addObject:info];
    return info;
}

- (RJLabelCellInfo *)addLabelCellWithText:(NSString *)text font:(UIFont *)font{
    return [self addLabelCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font];
}

- (RJLabelCellInfo *)addLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font{
    RJLabelCellInfo *info = [[RJLabelCellInfo alloc] initWithIndexPath:indexPath text:text font:font];
    [_infos addObject:info];
    return info;
}

- (RJLabelButtonCellInfo *)addLabelButtonCellWithText:(NSString *)text font:(UIFont *)font{
    return [self addLabelButtonCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font];
}

- (RJLabelButtonCellInfo *)addLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font{
    RJLabelButtonCellInfo *info = [[RJLabelButtonCellInfo alloc] initWithIndexPath:indexPath text:text font:font];
    [_infos addObject:info];
    return info;
}

- (RJLabelSwitchCellInfo *)addSwitchCellWithText:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn{
    return [self addSwitchCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font isOn:isOn];
}

- (RJLabelSwitchCellInfo *)addSwitchCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font isOn:(BOOL)isOn{
    RJLabelSwitchCellInfo *info = [[RJLabelSwitchCellInfo alloc] initWithIndexPath:indexPath text:text font:font isOn:isOn];
    [_infos addObject:info];
    return info;
}

- (RJTextViewCellInfo *)addTextViewCellWithPlaceholder:(NSString *)placeholder{
    return [self addTextViewCellWithIndexPath:kRJIndexPath(0, _infos.count) placeholder:placeholder];
}

- (RJTextViewCellInfo *)addTextViewCellWithIndexPath:(NSIndexPath *)indexPath placeholder:(NSString *)placeholder{
    RJTextViewCellInfo *info = [[RJTextViewCellInfo alloc] initWithIndexPath:indexPath placeholder:placeholder];
    [_infos addObject:info];
    return info;
}

- (RJButtonCellInfo *)addButtonCellWithBackgroundColor:(UIColor *)backgroundColor{
    return [self addButtonCellWithIndexPath:kRJIndexPath(0, _infos.count) backgroundColor:backgroundColor];
}

- (RJButtonCellInfo *)addButtonCellWithIndexPath:(NSIndexPath *)indexPath backgroundColor:(UIColor *)backgroundColor{
    RJButtonCellInfo *info =  [[RJButtonCellInfo alloc] initWithIndexPath:indexPath backgroundColor:backgroundColor];
    [_infos addObject:info];
    return info;
}

- (RJImageCellInfo *)addImageCellWithImage:(id)image placeholderImage:(UIImage *)placeholderImage{
    return [self addImageCellWithIndexPath:kRJIndexPath(0, _infos.count) image:image placeholderImage:placeholderImage];
}

- (RJImageCellInfo *)addImageCellWithIndexPath:(NSIndexPath *)indexPath image:(id)image placeholderImage:(UIImage *)placeholderImage{
    RJImageCellInfo *info = [[RJImageCellInfo alloc] initWithIndexPath:indexPath image:image placeholderImage:(UIImage *)placeholderImage];
    [_infos addObject:info];
    return info;
}

- (RJCycleCellInfo *)addCycleCellWithImages:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage{
    return [self addCycleCellWithIndexPath:kRJIndexPath(0, _infos.count) images:images placeholderImage:placeholderImage];
}

- (RJCycleCellInfo *)addCycleCellWithIndexPath:(NSIndexPath *)indexPath images:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage{
    RJCycleCellInfo *info = [[RJCycleCellInfo alloc] initWithIndexPath:indexPath images:images placeholderImage:placeholderImage];
    [_infos addObject:info];
    return info;
}

- (RJImageLabelCellInfo *)addImageLabelCellWithText:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize{
    return [self addImageLabelCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font image:image imageSize:imageSize];
}

- (RJImageLabelCellInfo *)addImageLabelCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font :(UIFont *)font image:(id)image imageSize:(CGSize)imageSize{
    RJImageLabelCellInfo *info =  [[RJImageLabelCellInfo alloc] initWithIndexPath:indexPath text:text font:font image:image imageSize:imageSize];
    [_infos addObject:info];
    return info;
}

- (RJImageVTwoLabelCellInfo *)addImageVTwoLabelCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize{
    return [self addImageVTwoLabelCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font detailText:detailText detailFont:detailFont image:image imageSize:imageSize];
}

- (RJImageVTwoLabelCellInfo *)addImageVTwoLabelCellWithIndexPath:indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize{
    RJImageVTwoLabelCellInfo *info = [[RJImageVTwoLabelCellInfo alloc] initWithIndexPath:indexPath text:text font:font detailText:detailText detailFont:detailFont image:image imageSize:imageSize];
    [_infos addObject:info];
    return info;
}

- (RJImageVTwoLabelButtonCellInfo *)addImageVTwoLabelButtonCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize{
    return [self addImageVTwoLabelButtonCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font detailText:detailText detailFont:detailFont image:image imageSize:imageSize];
}

- (RJImageVTwoLabelButtonCellInfo *)addImageVTwoLabelButtonCellWithIndexPath:indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize{
    RJImageVTwoLabelButtonCellInfo *info = [[RJImageVTwoLabelButtonCellInfo alloc] initWithIndexPath:indexPath text:text font:font detailText:detailText detailFont:detailFont image:image imageSize:imageSize];
    [_infos addObject:info];
    return info;
}

- (RJImageLabelButtonCellInfo *)addImageLabelButtonCellWithText:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize{
    return [self addImageLabelButtonCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font image:image imageSize:imageSize];
}

- (RJImageLabelButtonCellInfo *)addImageLabelButtonCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize{
    RJImageLabelButtonCellInfo *info = [[RJImageLabelButtonCellInfo alloc] initWithIndexPath:indexPath text:text font:font image:image imageSize:imageSize];
    [_infos addObject:info];
    return info;
}

- (RJCustomCellInfo *)addCustomCellWithCell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight{
    return [self addCustomCellWithIndexPath:kRJIndexPath(0, _infos.count) cell:cell cellHeight:cellHeight];
}

- (RJCustomCellInfo *)addCustomCellWithIndexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight{
    RJCustomCellInfo *info = [[RJCustomCellInfo alloc] initWithIndexPath:indexPath cell:cell cellHeight:cellHeight];
    [_infos addObject:info];
    return info;
}

- (RJCustomCellInfo *)addCustomCellWithIdentifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock{
    return [self addCustomCellWithIndexPath:kRJIndexPath(0, _infos.count) identifier:identifier cellClass:cellClass cellInitBlock:cellInitBlock];
}

- (RJCustomCellInfo *)addCustomCellWithIndexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier cellClass:(Class)cellClass cellInitBlock:(RJCellInitBlock)cellInitBlock{
    RJCustomCellInfo *info = [[RJCustomCellInfo alloc] initWithIndexPath:indexPath identifier:identifier cellClass:cellClass cellInitBlock:cellInitBlock];
    [_infos addObject:info];
    return info;
}

- (RJLabelTextFieldCellInfo *)addTextFieldCellWithText:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder{
    return [self addTextFieldCellWithIndexPath:kRJIndexPath(0, _infos.count) text:text font:font textFieldText:textFieldText textFieldFont:textFieldFont placeholder:placeholder];
}

- (RJLabelTextFieldCellInfo *)addTextFieldCellWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font textFieldText:(NSString *)textFieldText textFieldFont:(UIFont *)textFieldFont placeholder:(NSString *)placeholder{
    RJLabelTextFieldCellInfo *info = [[RJLabelTextFieldCellInfo alloc] initWithIndexPath:indexPath text:text font:font textFieldText:textFieldText textFieldFont:textFieldFont placeholder:placeholder];
    [_infos addObject:info];
    return info;
}

- (RJHTwoLabelCellInfo *)addHTwoLabelCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont{
    return [self addHTwoLabelCellWithIndexpath:kRJIndexPath(0, _infos.count) text:text font:font detailText:detailText detailFont:detailFont];
}

-(RJHTwoLabelCellInfo *)addHTwoLabelCellWithIndexpath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont{
    RJHTwoLabelCellInfo *info = [[RJHTwoLabelCellInfo alloc] initWithIndexPath:indexPath text:text font:font detailText:detailText detailFont:detailFont];
    [_infos addObject:info];
    return info;
}

- (RJChooseCellInfo *)addChooseCellWithText:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont{
    return [self addChooseCellWithIndexpath:kRJIndexPath(0, _infos.count) text:text font:font detailText:detailText placeholder:placeholder detailFont:detailFont];
}

- (RJChooseCellInfo *)addChooseCellWithIndexpath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText placeholder:(NSString *)placeholder detailFont:(UIFont *)detailFont{
    RJChooseCellInfo *info = [[RJChooseCellInfo alloc] initWithIndexPath:indexPath text:text font:font detailText:detailText placeholder:placeholder detailFont:detailFont];
    [_infos addObject:info];
    return info;
}

- (RJCollectionCellInfo *)addCollectionCellWithDelegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout{
    return [self addCollectionWithIndexpath:kRJIndexPath(0, _infos.count) delegateAndDataSource:delegate cellClass:cellClass flowLayout:flowLayout];
}
- (RJCollectionCellInfo *)addCollectionWithIndexpath:(NSIndexPath *)indexPath delegateAndDataSource:(id<UICollectionViewDelegate,UICollectionViewDataSource>)delegate cellClass:(Class)cellClass flowLayout:(UICollectionViewFlowLayout *)flowLayout{
    RJCollectionCellInfo *info = [[RJCollectionCellInfo alloc] initWithIndexPath:indexPath delegateAndDataSource:delegate cellClass:cellClass flowLayout:flowLayout];
    [_infos addObject:info];
    return info;
}

- (__kindof RJBaseCellInfo *)cellInfoWithIndexPath:(NSIndexPath *)indexPath{
    __kindof RJBaseCellInfo *info;
    if ([self.dataSource respondsToSelector:@selector(rj_tableView:infoForRowAtIndexPath:)]) {
        info = [self.dataSource rj_tableView:self.tableView infoForRowAtIndexPath:indexPath];
    }else{
        info = _infos[indexPath.row];
    }
    return info;
}

- (void)reloadCellWithCellInfo:(RJBaseCellInfo *)info{
    [self.tableView reloadRowsAtIndexPaths:@[info.indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadCellWithCellInfos:(NSArray<__kindof RJBaseCellInfo *> *)infos animation:(UITableViewRowAnimation)animation{
    [self.tableView reloadRowsAtIndexPaths:[infos valueForKey:NSStringFromSelector(@selector(indexPath))] withRowAnimation:animation];
}

#pragma mark - UITableViewDelegate & tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.dataSource respondsToSelector:@selector(rj_numberOfSectionsInRJTableView:)]) {
        return [self.dataSource rj_numberOfSectionsInRJTableView:self.tableView];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.dataSource respondsToSelector:@selector(rj_tableView:numberOfRowsInSection:)]) {
        return [self.dataSource rj_tableView:self.tableView numberOfRowsInSection:section];
    }
    return _infos.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __kindof RJBaseCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    
    if (info.hidden || !info) {
        return 0;
    }
    
    if (info.cellHeight != NSNotFound) {
        return info.cellHeight;
    }
    
    if ([self.delegate respondsToSelector:@selector(rj_tableView:heightForRowAtIndexPath:)]) {
        return [self.delegate rj_tableView:self.tableView heightForRowAtIndexPath:indexPath];
    }
    
    if ([info isKindOfClass:[RJTextViewCellInfo class]]) {
        RJTextViewCellInfo *textViewInfo = info;
        if (textViewInfo.textViewCellCurrentHeight != NSNotFound) {
            return textViewInfo.textViewCellCurrentHeight;
        }
    }
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(rj_didSelectRowAtIndexPath:)]) {
        [self.delegate rj_didSelectRowAtIndexPath:indexPath];
    }
    RJBaseCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (info.didSelectRowAtIndexPathBlock) {
        info.didSelectRowAtIndexPathBlock(cell, indexPath, info);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    NSInteger row = indexPath.row;
    __kindof RJBaseCellInfo *info = [self cellInfoWithIndexPath:indexPath];
    
    if (!info || info.hidden) {
        UITableViewCell *cell = [tableView cellWithIdentifier:@"RJCell" cellClass:[UITableViewCell class] initBlock:nil];
        return cell;
    }
    
    RJBaseCell *cell;
    
    RJCellInitBlock cellInitBlock = ^(__kindof UITableViewCell *initCell) {
        if (info.infoCellInitBlock) {
            info.infoCellInitBlock(initCell,info);
            //            info.infoCellInitBlock = nil;
        }
    };
    
    /**
     现在这里已经变得十分臃肿,需要一次重构
     */
    switch (info.cellType) {
        case CellTypeBase:
        {
            cell = [tableView cellWithIdentifier:info.identifier cellClass:[RJBaseCell class] initBlock:cellInitBlock];
        }
            break;
        case CellTypeLabel:
        case CellTypeLabelSwitch:
        case CellTypeLabelButton:
        case CellTypeImageLabel:
        case CellTypeImageVTwoLabel:
        case CellTypeLabelTextField:
        case CellTypeHTwoLabel:
        case CellTypeChoose:
        case CellTypeImageLabelButton:
        case CellTypeImageVTwoLabelButton:
        {
            RJLabelCell *labelCell;
            RJLabelCellInfo *labelInfo = info;
            if (info.cellType == CellTypeLabel) {
                labelCell = [tableView dequeueReusableCellWithIdentifier:info.identifier];
                if (labelCell == nil) {
                    labelCell = [[RJLabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:info.identifier yyLabelNeed:labelInfo.yyLabelNeed];
                    cellInitBlock(labelCell);
                }
            }else if (info.cellType == CellTypeLabelSwitch){
                RJLabelSwitchCell *switchCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJLabelSwitchCell class] initBlock:^(__kindof UITableViewCell *initCell) {
                    RJLabelSwitchCell *newCell = initCell;
                    [newCell.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
                    if (info.infoCellInitBlock) {
                        info.infoCellInitBlock(initCell,info);
                    }
                }];
                labelCell = switchCell;
                switchCell.switchView.object = info;
                RJLabelSwitchCellInfo *switchInfo = info;
                [switchCell.switchView setOn:switchInfo.isOn animated:NO];
                switchCell.switchView.tintColor = switchInfo.tintColor;
                switchCell.switchView.onTintColor = switchInfo.onTintColor;
                switchCell.switchView.onImage = switchInfo.onImage;
                switchCell.switchView.offImage = switchInfo.offImage;
                switchCell.switchView.thumbTintColor = switchInfo.thumbTintColor;
            }else if (info.cellType == CellTypeLabelButton || info.cellType == CellTypeImageLabelButton || info.cellType == CellTypeImageVTwoLabelButton){
                RJLabelButtonCell *buttonCell;
                __kindof RJLabelButtonCellInfo *buttonInfo = info;
                [buttonCell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                RJCellInitBlock buttonCellInitBlock =  ^(RJLabelButtonCell *cell){
                    if (info.infoCellInitBlock) {
                        info.infoCellInitBlock(cell, info);
                    }
                };
                if (info.cellType == CellTypeLabelButton) {
                    buttonCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJLabelButtonCell class] initBlock:buttonCellInitBlock];
                }else if (info.cellType == CellTypeImageLabelButton || info.cellType == CellTypeImageVTwoLabelButton){
                    RJImageLabelButtonCell *imageLabelButtonCell;
                    RJImageLabelButtonCellInfo *imageLabelButtonInfo = buttonInfo;
                    if (info.cellType == CellTypeImageLabelButton) {
                        imageLabelButtonCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJImageLabelButtonCell class] initBlock:buttonCellInitBlock];
                    }else{
                        RJImageVTwoLabelButtonCellInfo *imageVTwoLabelButtonInfo = buttonInfo;
                        RJImageVTwoLabelButtonCell *imageVTwoLabelButtonCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJImageVTwoLabelButtonCell class] initBlock:cellInitBlock];
                        imageLabelButtonCell = imageVTwoLabelButtonCell;
                        if (imageVTwoLabelButtonInfo.detailAttributeString.length) {
                            imageVTwoLabelButtonCell.detailLab.attributedText = imageVTwoLabelButtonInfo.detailAttributeString;
                        }else if (imageVTwoLabelButtonInfo.detailText) {
                            imageVTwoLabelButtonCell.detailLab.text = imageVTwoLabelButtonInfo.detailText;
                        }
                        
                        imageVTwoLabelButtonCell.detailLab.textColor = imageVTwoLabelButtonInfo.detailTextColor;
                        imageVTwoLabelButtonCell.detailLab.font = imageVTwoLabelButtonInfo.detailFont;
                        imageVTwoLabelButtonCell.detailLab.textAlignment = imageVTwoLabelButtonInfo.detailTextAligment;
                        imageVTwoLabelButtonCell.detailLab.leftConstraint.constant = imageVTwoLabelButtonInfo.twoLabelVInterval;
                        imageVTwoLabelButtonCell.detailLab.rightConstraint.constant = - imageVTwoLabelButtonInfo.detailLabelRightMarginConstant;
                    }
                    buttonCell = imageLabelButtonCell;
                    
                    if (imageLabelButtonInfo.image) {
                        imageLabelButtonCell.rj_imageView.image = imageLabelButtonInfo.image;
                    }else{
                        UIImage *placeholderImage = imageLabelButtonInfo.placeholderImage?:[RJTableViewAgentConfig sharedConfig].placeholderImage;
                        [imageLabelButtonCell.rj_imageView sd_setImageWithURL:[NSURL URLWithString:imageLabelButtonInfo.imageUrl] placeholderImage:placeholderImage completed:nil];
                    }
                    
                    imageLabelButtonCell.rj_imageView.contentMode = imageLabelButtonInfo.imageContentMode;
                    imageLabelButtonCell.imageSize = imageLabelButtonInfo.imageSize;
                    
                    if (imageLabelButtonInfo.imageLabelInterval == NSNotFound) {
                        imageLabelButtonCell.rj_imageView.rightConstraint.active = NO;
                    }else{
                        imageLabelButtonCell.rj_imageView.rightConstraint.active = YES;
                        imageLabelButtonCell.rj_imageView.rightConstraint.constant = -imageLabelButtonInfo.imageLabelInterval;
                    }
                }
                
                labelCell = buttonCell;
                
                [buttonCell.button setTitle:buttonInfo.buttonTitle forState:UIControlStateNormal];
                [buttonCell.button setImage:buttonInfo.buttonImage forState:UIControlStateNormal];
                [buttonCell.button setImage:buttonInfo.buttonSelectImage forState:UIControlStateSelected];
                buttonCell.button.object = buttonInfo;
                
                [buttonCell.button setTitleColor:buttonInfo.buttonTitleColor forState:UIControlStateNormal];
                [buttonCell.button setTitleColor:buttonInfo.buttonTitleSelectColor forState:UIControlStateSelected];
                
                buttonCell.button.backgroundColor = buttonInfo.buttonColor;
                buttonCell.button.titleLabel.font = buttonInfo.buttonFont;
                if (buttonInfo.titleLabButtonInterval == NSNotFound) {
                    buttonCell.button.leftConstraint.active = NO;
                }else{
                    buttonCell.button.leftConstraint.active = YES;
                    buttonCell.button.leftConstraint.constant = -buttonInfo.titleLabButtonInterval;
                }
                
                buttonCell.button.selected = buttonInfo.buttonSelected;
                buttonCell.button.userInteractionEnabled = buttonInfo.buttonUserInteractionEnabled;
                [buttonCell.button setContentHuggingPriority:buttonInfo.buttonHuggingPriority forAxis:UILayoutConstraintAxisHorizontal];
                [buttonCell.button setContentCompressionResistancePriority:buttonInfo.buttonCompressionPriority forAxis:UILayoutConstraintAxisHorizontal];
                
                if (buttonInfo.buttonWidth == 0) {
                    buttonCell.button.widthConstraint.active = NO;
                    if (buttonInfo.yyLabelNeed) {
                        YYLabel *label = buttonCell.titleLab;
                        label.lineBreakMode = NSLineBreakByCharWrapping;
                    }else{
                        UILabel *label = buttonCell.titleLab;
                        label.lineBreakMode = NSLineBreakByCharWrapping;
                    }
                }else{
                    buttonCell.button.widthConstraint.constant = buttonInfo.buttonWidth;
                    buttonCell.button.widthConstraint.active = YES;
                    if (buttonInfo.yyLabelNeed) {
                        YYLabel *label = buttonCell.titleLab;
                        label.lineBreakMode = NSLineBreakByTruncatingTail;
                    }else{
                        UILabel *label = buttonCell.titleLab;
                        label.lineBreakMode = NSLineBreakByTruncatingTail;
                    }
                }
            }else if (info.cellType == CellTypeImageLabel || info.cellType == CellTypeImageVTwoLabel){
                RJImageLabelCell *imageLabelCell;
                __kindof RJImageLabelCellInfo *imageLabelInfo = info;
                if (info.cellType == CellTypeImageLabel) {
                    imageLabelCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJImageLabelCell class] initBlock:cellInitBlock];
                }else{
                    RJImageVTwoLabelCell *imageVTwoLabelCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJImageVTwoLabelCell class] initBlock:cellInitBlock];
                    RJImageVTwoLabelCellInfo *imageVTwoLabelInfo = info;
                    imageLabelCell = imageVTwoLabelCell;
                    imageVTwoLabelCell.detailLab.attributedText = imageVTwoLabelInfo.detailAttributeString;
                    imageVTwoLabelCell.detailLab.text = imageVTwoLabelInfo.detailText;
                    
                    imageVTwoLabelCell.detailLab.textColor = imageVTwoLabelInfo.detailTextColor;
                    imageVTwoLabelCell.detailLab.font = imageVTwoLabelInfo.detailFont;
                    imageVTwoLabelCell.detailLab.textAlignment = imageVTwoLabelInfo.detailTextAligment;
                    imageVTwoLabelCell.detailLab.topConstraint.constant = -imageVTwoLabelInfo.twoLabelVInterval;
                }
                labelCell = imageLabelCell;
                if (imageLabelInfo.image) {
                    imageLabelCell.rj_imageView.image = imageLabelInfo.image;
                }else{
                    UIImage *placeholderImage = imageLabelInfo.placeholderImage?:[RJTableViewAgentConfig sharedConfig].placeholderImage;
                    [imageLabelCell.rj_imageView sd_setImageWithURL:[NSURL URLWithString:imageLabelInfo.imageUrl] placeholderImage:placeholderImage completed:nil];
                }
                
                imageLabelCell.rj_imageView.contentMode = imageLabelInfo.imageContentMode;
                imageLabelCell.imageSize = imageLabelInfo.imageSize;
                if (imageLabelInfo.imageLabelInterval == NSNotFound) {
                    imageLabelCell.rj_imageView.rightConstraint.active = NO;
                }else{
                    imageLabelCell.rj_imageView.rightConstraint.active = YES;
                    imageLabelCell.rj_imageView.rightConstraint.constant = -imageLabelInfo.imageLabelInterval;
                }
            }else if (info.cellType == CellTypeLabelTextField){
                RJLabelTextFieldCellInfo *textFieldInfo = info;
                RJLabelTextFieldCell *textFieldCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJLabelTextFieldCell class] initBlock:^(__kindof UITableViewCell *initCell) {
                    RJLabelTextFieldCell *newCell = initCell;
                    newCell.textField.delegate = self;
                    if (info.infoCellInitBlock) {
                        info.infoCellInitBlock(initCell,info);
                    }
                }];
                labelCell = textFieldCell;
                
                textFieldCell.textField.text = textFieldInfo.textFieldText;
                textFieldCell.textField.placeholder = textFieldInfo.placeholder;
                textFieldCell.textField.rj_maxLength = textFieldInfo.maxLength;
                textFieldCell.textField.object = textFieldInfo;
                if (textFieldInfo.textLimit & RJTextLimitNumber || textFieldInfo.textLimit & RJTextLimitNumberAll) {
                    textFieldInfo.keyboardType = UIKeyboardTypeNumberPad;
                }else if (textFieldInfo.textLimit == RJTextLimitFloat){
                    textFieldInfo.keyboardType = UIKeyboardTypeDecimalPad;
                }
                textFieldCell.textField.keyboardType = textFieldInfo.keyboardType;
                
                textFieldCell.textField.font = textFieldInfo.textFieldFont;
                textFieldCell.textField.textColor = textFieldInfo.textFieldTextColor;
                if (textFieldInfo.titleLabTextFieldInterval == NSNotFound) {
                    textFieldCell.textField.leftConstraint.active = NO;
                }else{
                    textFieldCell.textField.leftConstraint.active = YES;
                    textFieldCell.textField.leftConstraint.constant = -textFieldInfo.titleLabTextFieldInterval;
                }
                [textFieldCell.textField setContentHuggingPriority:textFieldInfo.textFieldHuggingPriority forAxis:UILayoutConstraintAxisHorizontal];
                [textFieldCell.textField setContentCompressionResistancePriority:textFieldInfo.textFieldCompressionPriority forAxis:UILayoutConstraintAxisHorizontal];
                [textFieldCell.textField setSecureTextEntry:textFieldInfo.textFieldIsSecureTextEntry];
                textFieldCell.textField.userInteractionEnabled = textFieldInfo.textFieldUserInteractionEnabled;
            }else if (info.cellType == CellTypeHTwoLabel || info.cellType == CellTypeChoose){
                RJHTwoLabelCellInfo *twoLabelHCellInfo = info;
                RJHTwoLabelCell *twoLabelHCell;
                if (info.cellType == CellTypeHTwoLabel) {
                    twoLabelHCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJHTwoLabelCell class] initBlock:cellInitBlock];
                }else{
                    RJChooseCellInfo *chooseInfo = info;
                    RJChooseCell *chooseCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJChooseCell class] initBlock:^(__kindof UITableViewCell *initCell) {
                        RJChooseCell *newCell = initCell;
                        newCell.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
                        if (cellInitBlock) {
                            cellInitBlock(initCell);
                        }
                    }];
                    twoLabelHCell = chooseCell;
                    if (!chooseInfo.detailText.length && !chooseInfo.detailAttributeString.length) {
                        chooseCell.detailLab.textColor = chooseInfo.detailPlaceholderTextColor;
                        chooseCell.detailLab.text = chooseInfo.detailPlaceholderText;
                    }
                    if ([chooseInfo.image isKindOfClass:[UIImage class]]) {
                        chooseCell.rightImageView.image = chooseInfo.image;
                        /** 暂时不加url情况的判断了,没有空*/
                    }else{
                        chooseCell.rightImageView.image = nil;
                    }
                    
                    chooseCell.rightImageView.hidden = chooseInfo.rightArrowHidden;
                    chooseCell.rightImageView.userInteractionEnabled = chooseInfo.rightImageViewUserInterfaceEnable;
                    chooseCell.detailLab.textAlignment = chooseInfo.detailPlaceholderTextAligment;
                }
                // do something
                labelCell = twoLabelHCell;
                if (twoLabelHCellInfo.detailAttributeString.length) {
                    twoLabelHCell.detailLab.attributedText = twoLabelHCellInfo.detailAttributeString;
                }else if (twoLabelHCellInfo.detailText.length) {
                    twoLabelHCell.detailLab.text = twoLabelHCellInfo.detailText;
                    twoLabelHCell.detailLab.textColor = twoLabelHCellInfo.detailTextColor;
                    twoLabelHCell.detailLab.font = twoLabelHCellInfo.detailFont;
                    twoLabelHCell.detailLab.textAlignment = twoLabelHCellInfo.detailTextAligment;
                    if (twoLabelHCellInfo.twoLabelHInterval == NSNotFound) {
                        twoLabelHCell.twoLabelHIntervalCons.active = NO;
                    }else{
                        twoLabelHCell.twoLabelHIntervalCons.active = YES;
                        twoLabelHCell.twoLabelHIntervalCons.constant = twoLabelHCellInfo.twoLabelHInterval;
                    }
                    [twoLabelHCell.detailLab setContentHuggingPriority:twoLabelHCellInfo.detailLabelHuggingPriority forAxis:UILayoutConstraintAxisHorizontal];
                    [twoLabelHCell.detailLab setContentCompressionResistancePriority:twoLabelHCellInfo.detailLabelCompressionPriority forAxis:UILayoutConstraintAxisHorizontal];
                }
            }
            
            if (labelInfo.yyLabelNeed) {
                YYLabel *label = (YYLabel *)labelCell.titleLab;
                if (!labelInfo.attributeString.length) {
                    label.text = labelInfo.text;
                }
            }else{
                UILabel *label = (UILabel *)labelCell.titleLab;
                if (!labelInfo.attributeString.length) {
                    label.text = labelInfo.text;
                }
            }
            
            labelCell.titleLab.layer.cornerRadius = labelInfo.labelCornerRadius;
            labelCell.titleLab.backgroundColor = labelInfo.labelBackgroundColor;
            
            if (labelInfo.yyLabelNeed) {
                YYLabel *label = (YYLabel *)labelCell.titleLab;
                label.textAlignment = labelInfo.textAligment;
                label.font = labelInfo.font;
                label.textColor = labelInfo.textColor;
                label.numberOfLines = !labelInfo.autoLabelLine;
                label.preferredMaxLayoutWidth = labelInfo.preferredMaxLayoutWidth;
                if (labelInfo.attributeString.length) {
                    label.attributedText = labelInfo.attributeString;
                }else{
                    label.text = labelInfo.text;
                }
            }else{
                UILabel *label = (UILabel *)labelCell.titleLab;
                label.textAlignment = labelInfo.textAligment;
                label.font = labelInfo.font;
                label.textColor = labelInfo.textColor;
                label.numberOfLines = !labelInfo.autoLabelLine;
                if (labelInfo.attributeString.length) {
                    label.attributedText = labelInfo.attributeString;
                }else{
                    label.text = labelInfo.text;
                }
            }
            
            if (labelInfo.titleLabelWidth == NSNotFound) {
                labelCell.titleLabelWidthCons.active = NO;
                if (labelCell.titleLabelRightCons) {
                    labelCell.titleLabelRightCons.active = YES;
                }
            }else{
                labelCell.titleLabelWidthCons.active = YES;
                labelCell.titleLabelWidthCons.constant = labelInfo.titleLabelWidth;
                if (labelCell.titleLabelRightCons) {
                    labelCell.titleLabelRightCons.active = NO;
                }
            }
            
            [labelCell.titleLab setContentHuggingPriority:labelInfo.labelHuggingPriority forAxis:UILayoutConstraintAxisHorizontal];
            [labelCell.titleLab setContentCompressionResistancePriority:labelInfo.labelCompressionPriority forAxis:UILayoutConstraintAxisHorizontal];
            
            cell = labelCell;
            break;
        }
        case CellTypeTextView:
        {
            RJTextViewCellInfo *textViewInfo = info;
            RJTextViewCell *textViewCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJTextViewCell class] initBlock:^(__kindof UITableViewCell *initCell) {
                RJTextViewCell *newCell = initCell;
                newCell.textView.delegate = self;
                if (info.infoCellInitBlock) {
                    info.infoCellInitBlock(initCell,info);
                }
            }];
            textViewCell.textView.object = textViewInfo;
            if (textViewInfo.maxLength == 0){
                textViewCell.numLab.text = @"";
                textViewCell.numLab.hidden = YES;
            }else{
                if (textViewInfo.autoNumLabHidden == YES) {
                    textViewCell.numLab.hidden = textViewCell.textView.isFirstResponder;
                }else{
                    textViewCell.numLab.hidden = NO;
                }
                textViewCell.numLab.text = [NSString stringWithFormat:@"%ld",textViewInfo.maxLength - textViewInfo.text.length];
            }
            textViewCell.textView.text = textViewInfo.text;
            textViewCell.textView.keyboardType = textViewInfo.keyboardType;
            textViewCell.textView.placeholder = textViewInfo.placeholder;
            textViewCell.textView.placeholderColor = textViewInfo.placeholderColor;
            
            textViewCell.topMargin = textViewInfo.topMargin;
            textViewCell.minHeight = textViewInfo.minHeight;
            textViewCell.bottomMargin = textViewInfo.bottomMargin;
            textViewCell.textView.textViewMaxLength = textViewInfo.maxLength;
            textViewCell.textView.font = textViewInfo.font;
            textViewCell.textView.userInteractionEnabled = textViewInfo.textViewUserInteractionEnabled;
            textViewCell.numLab.textColor = textViewInfo.numLabTextColor;
            textViewCell.textViewMaxHeight = textViewInfo.textViewMaxHeight;
            if (textViewInfo.textViewCellType == RJTextViewCellType_Border) {
                textViewCell.textView.layer.borderColor = [RJTableViewAgentConfig sharedConfig].separateColor.CGColor;
                textViewCell.textView.layer.borderWidth = 0.5;
                textViewCell.textView.layer.cornerRadius = 8;
            }else if (textViewInfo.textViewCellType == RJTextViewCellType_UnderLine){
                textViewCell.textView.layer.cornerRadius = 0;
                textViewCell.textView.layer.borderColor = [UIColor clearColor].CGColor;
            }
            
            /**根据设置的textViewMaxHeight,改变info的属性*/
            CGFloat height = [self sizeForString:textViewInfo.text font:textViewInfo.font size:CGSizeMake(self.tableViewWidth - textViewInfo.leftMargin - textViewInfo.rightMargin, CGFLOAT_MAX) mode:NSLineBreakByCharWrapping].height;
            if (height > textViewInfo.textViewMaxHeight + textViewInfo.topMargin + textViewInfo.bottomMargin) {
                textViewInfo.textViewCellCurrentHeight = textViewInfo.textViewMaxHeight + textViewInfo.topMargin + textViewInfo.bottomMargin;
                textViewCell.textView.scrollEnabled = YES;
            }
            cell = textViewCell;
            break;
        }
        case CellTypeImage:
        {
            RJImageCellInfo *imageCellInfo = info;
            RJImageCell *imageCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJImageCell class] initBlock:cellInitBlock];
            
            if (imageCellInfo.image) {
                imageCell.rj_imageView.image = imageCellInfo.image;
            }else{
                UIImage *placeholderImage = imageCellInfo.placeholderImage?:[RJTableViewAgentConfig sharedConfig].placeholderImage;
                [imageCell.rj_imageView sd_setImageWithURL:[NSURL URLWithString:imageCellInfo.imageUrl] placeholderImage:placeholderImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    if (imageCellInfo.shouldRoundImage && image) {
                        imageCell.rj_imageView.image = [self roundIconWithImage:image diameter:MIN(imageCellInfo.imageSize.width, imageCellInfo.imageSize.height)];
                    }
                }];
            }
            
            imageCell.rj_imageView.contentMode = imageCellInfo.imageContentMode;
            
            cell = imageCell;
            break;
        }
        case CellTypeCycle:
        {
            RJCycleCellInfo *cycleCellInfo = info;
            RJCycleCell *cycleCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJCycleCell class] initBlock:cellInitBlock];
            cycleCell.cycleImages = cycleCellInfo.cycleImages;
            cycleCell.placeholderImage = cycleCellInfo.placeholderImage;
            
            cycleCell.cycleImageSize = cycleCellInfo.cycleImageSize;
            cycleCell.cycleInterval = cycleCellInfo.cycleInterval;
            cycleCell.cycleType = (TYCyclePagerTransformLayoutType)cycleCellInfo.cycleType;
            
            cell = cycleCell;
            break;
        }
        case CellTypeButton:
        {
            RJButtonCellInfo *buttonCellInfo = info;
            RJButtonCell *buttonCell = [tableView cellWithIdentifier:info.identifier cellClass:[RJButtonCell class] initBlock:^(__kindof UITableViewCell *initCell) {
                RJButtonCell *newCell = initCell;
                [newCell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                if (info.infoCellInitBlock) {
                    info.infoCellInitBlock(initCell,info);
                }
            }];
            
            buttonCell.button.object = info;
            [buttonCell.button setTitle:buttonCellInfo.buttonText forState:UIControlStateNormal];
            [buttonCell.button setImage:buttonCellInfo.buttonImage forState:UIControlStateNormal];
            [buttonCell.button setImage:buttonCellInfo.buttonSelectedImage forState:UIControlStateSelected];
            
            if (buttonCellInfo.buttonImage) {
                [buttonCell.button setImage:buttonCellInfo.buttonImage forState:UIControlStateNormal];
            }else if(buttonCellInfo.buttonImageUrl.length){
                [buttonCell.button sd_setImageWithURL:[NSURL URLWithString:buttonCellInfo.buttonImageUrl] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    if (buttonCellInfo.shouldRoundImage && image) {
                        [buttonCell.button setImage:[self roundIconWithImage:image diameter:MIN(buttonCellInfo.imageSize.width, buttonCellInfo.imageSize.height)] forState:UIControlStateNormal];
                    }
                }];
            }else{
                [buttonCell.button setImage:nil forState:UIControlStateNormal];
            }
            
            buttonCell.button.layer.cornerRadius = buttonCellInfo.buttonCornerRadius;
            buttonCell.button.backgroundColor = buttonCellInfo.buttonBackgroundColor;
            [buttonCell.button setTitleColor:buttonCellInfo.buttonTextColor forState:UIControlStateNormal];
            //            [buttonCell.button setTitleColor:buttonCellInfo.buttonTitleSelectColor forState:UIControlStateSelected];
            buttonCell.button.titleLabel.font = buttonCellInfo.buttonFont;
            
            cell = buttonCell;
            break;
        }
        case CellTypeCollectionView:
        {
            RJCollectionCellInfo *collectionCellInfo = info;
            RJCollectionCell *collectionCell = [tableView dequeueReusableCellWithIdentifier:info.identifier];
            if (collectionCell == nil) {
                collectionCell = [[RJCollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:info.identifier flowLayout:collectionCellInfo.flowLayout];
                if (info.infoCellInitBlock) {
                    info.infoCellInitBlock(collectionCell,info);
                }
            }
            
            collectionCellInfo.collectionView = collectionCell.collectionView;
            
            [collectionCell.collectionView registerClass:collectionCellInfo.collectionCellClass forCellWithReuseIdentifier:collectionCellInfo.collectionCellIdentifier];
            collectionCell.collectionView.delegate = collectionCellInfo.delegate;
            collectionCell.collectionView.dataSource = collectionCellInfo.dataSource;
            
            collectionCell.collectionView.topConstraint.constant = collectionCellInfo.topMargin;
            collectionCell.collectionView.leftConstraint.constant = collectionCellInfo.leftMargin;
            collectionCell.collectionView.bottomConstraint.constant = -collectionCellInfo.bottomMargin;
            collectionCell.collectionView.rightConstraint.constant = -collectionCellInfo.rightMargin;
            
            cell = collectionCell;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                /** self-sizing*/
//                NSLog(@"%f,%f",collectionCell.collectionView.collectionViewLayout.collectionViewContentSize.height,collectionCell.collectionView.heightConstraint.constant);
                [collectionCell.collectionView reloadData];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (info.cellHeight == NSNotFound && collectionCell.collectionView.collectionViewLayout.collectionViewContentSize.height != collectionCell.collectionView.heightConstraint.constant) {
                        collectionCell.collectionView.heightConstraint.constant = collectionCell.collectionView.collectionViewLayout.collectionViewContentSize.height;
                        collectionCell.collectionView.heightConstraint.active = YES;
                        [self reloadData];
                    }
                });
            });
            break;
        }
        case CellTypeCustom:
        {
            RJCustomCellInfo *customInfo = info;
            __kindof UITableViewCell *tableCell;
            if (customInfo.cell) {
                tableCell = customInfo.cell;
            }else{
                tableCell = [tableView cellWithIdentifier:info.identifier cellClass:customInfo.cellClass initBlock:cellInitBlock];
            }
            
            /** 如果没有继承自RJBaseCell,直接返回该cell*/
            if (![tableCell isKindOfClass:[RJBaseCell class]]) {
                if (info.cellForRowAtIndexPathBlock) {
                    info.cellForRowAtIndexPathBlock(tableCell, indexPath,info);
                }
                return tableCell;
            }
            
            cell = tableCell;
        }
            break;
        default:
            return [tableView cellWithIdentifier:@"RJCell" cellClass:[UITableViewCell class] initBlock:nil];
    }
    
    if (cell.minHeightCons) {
        cell.minHeightCons.active = YES;
        cell.minHeightCons.constant = info.minHeight;
    }else{
        cell.minHeightCons.active = NO;
    }
    
    cell.backgroundColor = info.backgroundColor;
    
    cell.lineView.hidden = info.lineHidden;
    cell.lineViewHeightCons.constant = info.lineHeight;
    cell.lineView.backgroundColor = info.lineColor;
    cell.lineViewLeftMargin = info.lineLeftMargin;
    cell.lineViewRightMargin = info.lineRightMargin;
    
    cell.contentView.layoutMargins = info.layoutMargins;
    
    if (info.cellForRowAtIndexPathBlock) {
        info.cellForRowAtIndexPathBlock(cell, indexPath,info);
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:canEditRowForInfo:)]) {
        RJBaseCellInfo *info = [self cellInfoWithIndexPath:indexPath];
        return [self.delegate rj_tableView:tableView canEditRowForInfo:info];
    }
    return NO;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:editActionsForInfo:)]) {
        RJBaseCellInfo *info = [self cellInfoWithIndexPath:indexPath];
        return [self.delegate rj_tableView:tableView editActionsForInfo:info];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:heightForHeaderInSection:)]) {
        return [self.delegate rj_tableView:tableView heightForHeaderInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:viewForHeaderInSection:)]) {
        return [self.delegate rj_tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:heightForFooterInSection:)]) {
        return [self.delegate rj_tableView:tableView heightForFooterInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(rj_tableView:viewForFooterInSection:)]) {
        return [self.delegate rj_tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

#pragma mark - UISCrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    if ([self.delegate respondsToSelector:@selector(rj_scrollViewDidScroll:)] && (self.tableView.delegate != self)) {
    if ([self.delegate respondsToSelector:@selector(rj_scrollViewDidScroll:)]) {
        [self.delegate rj_scrollViewDidScroll:self.tableView];
    }
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    RJTextViewCellInfo *textViewInfo = textView.object;
    
    RJTextViewCell *cell = [self.tableView cellForRowAtIndexPath:textViewInfo.indexPath];
    
    if (textViewInfo.autoNumLabHidden == YES) {
        cell.numLab.hidden = textView.isFirstResponder;
    }else{
        if (textViewInfo.maxLength == 0) {
            cell.numLab.hidden = YES;
        }else{
            cell.numLab.hidden = NO;
        }
    }
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""]) {
        return YES;
    }
    
    RJTextViewCellInfo *textViewInfo = textView.object;
    if (textViewInfo.textLimit & RJTextLimitFloat) {
        text = [textView.text stringByReplacingCharactersInRange:range withString:text];
    }
    BOOL valid = [RJTextLimit validateWithText:text limit:textViewInfo.textLimit];
    
    /** 验证附加的正则*/
    if (valid && textViewInfo.subRegex.length) {
        valid = [RJTextLimit matchesRegex:textViewInfo.subRegex withString:text options:NSRegularExpressionDotMatchesLineSeparators];
    }
    return valid;
}

/**RJ 2019-01-04 16:29:48
    根据输入动态改变cell高度
 */
- (void)textViewDidChange:(UITextView *)textView{
    
    RJTextViewCellInfo *textViewInfo = textView.object;
    
    if (textViewInfo.maxLength == 0) {
        textViewInfo.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }else{
        RJTextViewCell *cell = (RJTextViewCell *)[self.tableView cellForRowAtIndexPath:textViewInfo.indexPath];
        textViewInfo.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        cell.numLab.text = [NSString stringWithFormat:@"%ld",textViewInfo.maxLength - textView.text.length];
    }
    //    [textViewInfo.textViewBindingString setString:textViewInfo.text];
    
    CGFloat height = [self sizeForString:textView.text font:textViewInfo.font size:CGSizeMake(textView.bounds.size.width, CGFLOAT_MAX) mode:NSLineBreakByCharWrapping].height;
    if (textViewInfo.cellHeight == NSNotFound && textViewInfo.textViewMaxHeight > height) {
        if (textViewInfo.textViewCellCurrentHeight != NSNotFound) {
            /**
             解决删的比maxHeight还要低的时候出现的UI错乱问题
             这种情况不reload不行..
             */
            textViewInfo.textViewCellCurrentHeight = NSNotFound;
            [self reloadCellWithCellInfos:@[textViewInfo] animation:UITableViewRowAnimationTop];
        } else {
            textViewInfo.textViewCellCurrentHeight = NSNotFound;
#ifdef IQKeyboardManagerConstantsInternal_h
            [IQKeyboardManager sharedManager].enable = NO;
#endif
            if (@available(iOS 11.0, *)) {
                [self.tableView performBatchUpdates:nil completion:nil];
            } else {
                [self.tableView beginUpdates];
                [self.tableView endUpdates];
            }
#ifdef IQKeyboardManagerConstantsInternal_h
            [IQKeyboardManager sharedManager].enable = YES;
#endif
        }
        textView.scrollEnabled = NO;
    }else{
        textViewInfo.textViewCellCurrentHeight = textViewInfo.textViewMaxHeight + textViewInfo.topMargin + textViewInfo.bottomMargin;
        textView.scrollEnabled = YES;
    }
    
    if (textViewInfo.textViewDidChangeBlock) {
        textViewInfo.textViewDidChangeBlock(textView, textViewInfo);
    }
}

#pragma mark - UITextFeildDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    RJLabelTextFieldCellInfo *textFieldInfo = textField.object;
    textFieldInfo.textFieldText = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //    [textFieldInfo.textFieldBindingString setString:textFieldInfo.textFieldText];
    /** reload会导致tableView跳动*/
    //    [self reloadCellWithCellInfo:textFieldInfo];
    if (textFieldInfo.textFieldDidEndEditingBlock) {
        textFieldInfo.textFieldDidEndEditingBlock(textField, textFieldInfo);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    RJLabelTextFieldCellInfo *textFieldInfo = textField.object;
    /** 判断小数不能判断输入的内容,需要判断输入完之后的内容*/
    if (textFieldInfo.textLimit & RJTextLimitFloat || textFieldInfo.textLimit & RJTextLimitFloat2 || textFieldInfo.textLimit & RJTextLimitNumber) {
        string = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    BOOL valid = [RJTextLimit validateWithText:string limit:textFieldInfo.textLimit];
    
    /** 验证附加的正则*/
    if (valid && textFieldInfo.subRegex.length) {
        valid = [RJTextLimit matchesRegex:textFieldInfo.subRegex withString:string options:NSRegularExpressionDotMatchesLineSeparators];
    }
    return valid;
}

#pragma mark - Actions
- (void)switchAction:(UISwitch *)switchView{
    RJLabelSwitchCellInfo *info = switchView.object;
    if (!info) {
        return;
    }
    
    info.on = switchView.isOn;
    if (info.switchActionBlock) {
        info.switchActionBlock(switchView, info);
    }
}

- (void)buttonAction:(UIButton *)button{
    button.selected = !button.selected;
    RJBaseCellInfo *info = button.object;
    
    if ([info isKindOfClass:[RJButtonCellInfo class]]) {
        RJButtonCellInfo *buttonInfo = (RJButtonCellInfo *)info;
        buttonInfo.buttonSelected = button.selected;
        if (buttonInfo.didTapButtonBlock) {
            buttonInfo.didTapButtonBlock(button, buttonInfo);
        }
    }else if ([info isKindOfClass:[RJLabelButtonCellInfo class]]){
        RJLabelButtonCellInfo *buttonInfo = (RJLabelButtonCellInfo *)info;
        buttonInfo.buttonSelected = button.selected;
        if (buttonInfo.didTapButtonBlock) {
            buttonInfo.didTapButtonBlock(button, buttonInfo);
        }
    }
}

#pragma mark - Validates
- (BOOL)validateBindingStringWithAlert:(BOOL)alert{
    for (RJBaseCellInfo *info in _infos) {
        if (![self alertWithInfo:info length:info.bindingString.length alert:alert]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)alertWithInfo:(__kindof RJBaseCellInfo *)info length:(NSInteger)length alert:(BOOL)alert{
    if (info.hidden || !info.cellHeight) {
        return YES;
    }
    if ([info isMemberOfClass:[RJLabelCellInfo class]]) {
        RJLabelCellInfo *labelInfo = info;
        
        if (info.bindingStringValidatePrefix.length) {
            if (![self validateInfo:info length:length bindingStringValidatePrefix:info.bindingStringValidatePrefix alert:alert]){
                return NO;
            }
        }else if (labelInfo.bindingEnable){
            if (![self validateInfo:info length:length bindingStringValidatePrefix:labelInfo.text alert:alert]) {
                return NO;
            }
        }
    }else if ([info isKindOfClass:[RJLabelCellInfo class]]){
        RJLabelCellInfo *labelInfo = info;
        BOOL validate = YES;
        if (labelInfo.bindingStringValidatePrefix.length) {
            validate = [self validateInfo:info length:length bindingStringValidatePrefix:labelInfo.bindingStringValidatePrefix alert:alert];
        }else{
            validate = [self validateInfo:info length:length bindingStringValidatePrefix:labelInfo.text alert:alert];
        }
        if (!validate){
            return validate;
        }
    }else if ([info isKindOfClass:[RJTextViewCellInfo class]]){
        if (info.bindingStringValidatePrefix.length) {
            if (![self validateInfo:info length:length bindingStringValidatePrefix:info.bindingStringValidatePrefix alert:alert]) {
                return NO;
            }
        }else{
            if (![self validateInfo:info length:length bindingStringValidatePrefix:@"输入不符合要求,请重新输入" alert:alert]) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)validateInfo:(RJBaseCellInfo *)info length:(NSInteger)length bindingStringValidatePrefix:(NSString *)bindingStringValidatePrefix alert:(BOOL)alert{
    bindingStringValidatePrefix = [bindingStringValidatePrefix stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    bindingStringValidatePrefix = [bindingStringValidatePrefix stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
    if (length > info.bindingStringMaxLength) {
        [self.tableView showWarning:[NSString stringWithFormat:@"%@限制输入%zd个字",bindingStringValidatePrefix,info.bindingStringMaxLength]];
        return NO;
    }else if (length < info.bindingStringMinLength){
        if (info.bindingStringMinLength == 1) {
            [self.tableView showWarning:[NSString stringWithFormat:@"%@不能为空",bindingStringValidatePrefix]];
        }else{
            [self.tableView showWarning:[NSString stringWithFormat:@"%@限制输入%zd个字以上",bindingStringValidatePrefix,info.bindingStringMinLength]];
        }
        return NO;
    }
    return YES;
}


#pragma mark - DZNEmptyDelegate
//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
//    return kEmptyDataImage;
//}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    if (_emptyShowText) {
        return [[NSAttributedString alloc]initWithString:_emptyShowText attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:kRJRGBAColor(153, 153, 153, 1)}];
    }
#ifdef kLocalString
    return kEmptyDataTitle(kLocalString(empty));
#else
    return [[NSAttributedString alloc]initWithString:@"未找到相关数据" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:kRJRGBAColor(153, 153, 153, 1)}];
#endif
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIColor clearColor];
}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    // 解决textField在编辑的时候导致点击事件串行的问题
//    [self endEditing:YES];
//    return [super hitTest:point withEvent:event];
//}
#pragma mark - Tools
- (CGSize)sizeForString:(NSString *)string font:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [string boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [string sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

//画圆形头像
- (UIImage *) roundIconWithImage:(UIImage *)image diameter:(CGFloat)diameter{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(diameter, diameter), NO, 0.0);
    
    // 取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //画圆,裁剪
    CGContextAddArc(ctx,diameter/2.0, diameter/2.0, diameter/2.0, 0, 2*M_PI, 0);
    CGContextClip(ctx);
    
    //保证绘制到上下文中的部分是图片的中间区域
    CGFloat height = image.size.height;
    CGFloat width = image.size.width;
    CGFloat margin = 0;
    if (height > width) {
        margin = height - width;
    }else{
        margin = width - height;
    }
    margin = margin/2.0;
    
    if (height > width) {
        [image drawInRect:CGRectMake(0, - margin / height  * diameter, diameter, diameter * height / width)];
    }else{
        [image drawInRect:CGRectMake(- margin / width * diameter, 0, diameter * width / height, diameter)];
    }
    
    UIImage *NewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    return NewImage;
}
@end
