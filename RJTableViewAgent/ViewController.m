//
//  ViewController.m
//  RJTableView
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "RJTableViewAgent.h"
#import "NSObject+RJObject.h"
#import "UIView+RJMBProgressHUD.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RJTableViewAgent *tableViewAgent;
@property (nonatomic, strong) UICollectionView *collectionView;

/**RJ 2019-01-01 16:14:42
    演示bindingString用法,属性必须使用strong策略
 */
@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"RJTableViewAgent";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTableViewAgent];
    [self setCells];
    
}

- (UITableView *)tableView{
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.estimatedRowHeight = 44;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kRJScreenWidth, 0.001)];
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kRJScreenWidth, 0.001)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    UIEdgeInsets inset = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
    [self.view addAllAlignConstraintToView:_tableView edgeInset:UIEdgeInsetsMake(inset.top+44, 0, inset.bottom, 0)];
    
    return _tableView;
}

-(RJTableViewAgent *)setTableViewAgent{
    if (_tableViewAgent) {
        return  _tableViewAgent;
    }
    _tableViewAgent = [[RJTableViewAgent alloc] initWithTableView:self.tableView];
    
    return _tableViewAgent;
}

#pragma mark - setCells
- (void)setCells{
    UIImage *github2 = [UIImage imageNamed:@"rj_github2"];
    
    [_tableViewAgent addLabelCellWithText:@"这是LabelCell" font:kRJFontSize(14)].lineHidden = NO;
    
    RJLabelCellInfo *labelInfo = [_tableViewAgent addLabelCellWithText:@"这是LabelCell2,设置了四周margin,并且设置了选中事件,可以点击该cell试一下,会打印消息" font:kRJFontSize(14)];
    labelInfo.didSelectRowAtIndexPathBlock = ^(__kindof UITableViewCell *cell, NSIndexPath *indexPath, __kindof RJBaseCellInfo *info) {
        [self.view showSuccess:@"点击了LabelCell2"];
    };
    labelInfo.layoutMargins = UIEdgeInsetsMake(5, 40, 15, 15);
    labelInfo.lineHidden = NO;
    
    RJHTwoLabelCellInfo *twoLabelInfo = [_tableViewAgent addHTwoLabelCellWithText:@"这是HTwoLabelCell" font:kRJFontSize(14) detailText:@"这是子文本" detailFont:kRJFontSize(12)];
    twoLabelInfo.detailTextColor = [UIColor blueColor];
    twoLabelInfo.lineHidden = NO;
    
    [self addChooseCell];
    
    [_tableViewAgent addImageCellWithImage:[UIImage imageNamed:@"rj_github"] placeholderImage:nil].cellHeight = 100;
    
    RJLabelButtonCellInfo *labelButtonInfo = [_tableViewAgent addLabelButtonCellWithText:@"这是LabelButtonCell" font:kRJFontSize(14)];
    labelButtonInfo.buttonTitle = @"button1";
    
    [_tableViewAgent addSwitchCellWithText:@"这是SwitchCell" font:kRJFontSize(14) isOn:NO].cellHeight = 50;
    
    RJImageLabelCellInfo *imageLabelInfo = [_tableViewAgent addImageLabelCellWithText:@"这是ImageLabelCell" font:kRJFontSize(14) image:github2 imageSize:CGSizeMake(35, 35)];
    imageLabelInfo.cellHeight = 60;
    imageLabelInfo.lineHidden = NO;
    
    [self addImageLabelButtonCell];
    [self addTwoLabelButtonCell];
    [self addTextFieldCells];
    [self addTextViewCell];
    [self addCollectionViewCell];
    [self addCustomCell];
    [self addButtonCell];
}


- (void)addChooseCell{
    RJChooseCellInfo *chooseCellInfo = [_tableViewAgent addChooseCellWithText:@"尺码" font:kRJFontSize(14) detailText:nil placeholder:@"请选择" detailFont:kRJFontSize(12)];
    __weak __typeof(self) weakSelf = self;
    chooseCellInfo.didSelectRowAtIndexPathBlock = ^(__kindof UITableViewCell *cell, NSIndexPath *indexPath, __kindof RJBaseCellInfo *info) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        RJChooseCellInfo *newInfo = info;
        newInfo.detailText = @"XXL";
        [strongSelf.tableViewAgent reloadCellWithCellInfo:newInfo];
    };
}

- (void)addImageLabelButtonCell{
    RJImageLabelButtonCellInfo *imageLabelButtonInfo = [_tableViewAgent addImageLabelButtonCellWithText:@"这是ImageLabelButtonCell这是哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" font:kRJFontSize(14) image:[UIImage imageNamed:@"rj_github2"] imageSize:CGSizeMake(35, 35)];
    imageLabelButtonInfo.buttonTitle = @"button2";
    imageLabelButtonInfo.lineHidden = NO;
    imageLabelButtonInfo.buttonWidth = 55;
    imageLabelButtonInfo.didTapButtonBlock = ^(UIButton *button, __kindof RJLabelButtonCellInfo *info) {
        NSLog(@"点击了button2");
    };
}

- (void)addTwoLabelButtonCell{
    RJImageVTwoLabelButtonCellInfo *twoLabelButtonInfo = [_tableViewAgent addImageVTwoLabelButtonCellWithText:@"这是ImageVTwoLabelButtonCell" font:kRJFontSize(14) detailText:@"这是子文本这是子文本这是子文本这是子文本这是子文本这是子文本这是子文本" detailFont:kRJFontSize(10) image:[UIImage imageNamed:@"rj_github2"] imageSize:CGSizeMake(35, 35)];
    twoLabelButtonInfo.lineHidden = NO;
    twoLabelButtonInfo.buttonTitle = @"button3";
    twoLabelButtonInfo.buttonWidth = 55;
    twoLabelButtonInfo.detailLabelRightMarginConstant = 60;
    twoLabelButtonInfo.didTapButtonBlock = ^(UIButton *button, __kindof RJImageVTwoLabelButtonCellInfo *info) {
        NSLog(@"点击了button3");
    };
}

- (void)addTextFieldCells{
    RJLabelTextFieldCellInfo *textFieldInfo = [_tableViewAgent addTextFieldCellWithText:@"姓名: " font:kRJFontSize(14) textFieldText:nil textFieldFont:kRJFontSize(14) placeholder:@"请输入姓名(限制输入2-6字符)"];
    /**RJ 2019-09-10 21:03:24 输入最少两个字符*/
    textFieldInfo.bindingStringMinLength = 2;
    /**RJ 2019-01-01 22:47:06 输入最多6个字符*/
    textFieldInfo.maxTextLength = 6;
    /**RJ 2019-09-10 21:18:56 动态绑定*/
    self.name = textFieldInfo.bindingString;
    textFieldInfo.lineHidden = NO;
    
    
    RJLabelTextFieldCellInfo *textFieldInfo2 = [_tableViewAgent addTextFieldCellWithText:@"身高: " font:kRJFontSize(14) textFieldText:nil textFieldFont:kRJFontSize(14) placeholder:@"请输入身高(整数或者不超过两位小数)"];
    /**RJ 2019-01-01 16:20:53 正则限制输入两位小数*/
    textFieldInfo2.textLimit = RJTextLimitNumber | RJTextLimitDecimal2;
    textFieldInfo2.lineHidden = NO;
}


- (void)addTextViewCell{
    RJTextViewCellInfo *textViewInfo = [_tableViewAgent addTextViewCellWithPlaceholder:@"这是textViewCell,随便输入点什么吧"];
    textViewInfo.topMargin = 10;
    textViewInfo.keyboardType = UIKeyboardTypeDefault;
    textViewInfo.textViewCellType = RJTextViewCellTypeBorder;
    /**RJ 2019-09-10 21:14:18 配置提示前缀*/
    textViewInfo.bindingStringValidatePrefix = @"椭圆框框内";
    /**RJ 2019-01-01 16:28:08 用来设置固定cell高度*/
    textViewInfo.cellHeight = 150;
    textViewInfo.maxTextLength = 150;
}

- (void)addCollectionViewCell{
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //定义行和列之间的间距
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 0.0;
    
    RJCollectionCellInfo *collectionCellInfo = [_tableViewAgent addCollectionCellWithDelegateAndDataSource:self cellClass:[UICollectionViewCell class] flowLayout:layout];
    collectionCellInfo.infoCellInitBlock = ^(__kindof UITableViewCell *cell, __kindof RJBaseCellInfo *info) {
        RJCollectionCell *newCell = cell;
        newCell.collectionView.showsHorizontalScrollIndicator = YES;
    };
    collectionCellInfo.cellHeight = 110;
}

- (void)addCustomCell{
//    /**RJ 2019-01-01 23:23:37
//        这种方式的自定义Cell不会复用,如果不需要复用的话,这种方式更方便
//     */
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CustomCell"];
//    cell.textLabel.text = @"这是一个自定义Cell,也可以是继承自UITableViewCell的任何类";
//    cell.detailTextLabel.text = @"子标题";
//    [_tableViewAgent addCustomCellWithCell:cell cellHeight:50];
    
    /**RJ 2019-01-01 23:24:20
        这种方式的Cell会复用
     */
    RJCustomCellInfo *customCellInfo = [_tableViewAgent addCustomCellWithIdentifier:@"CustomCell" cellClass:[UITableViewCell class] cellInitBlock:nil];
    customCellInfo.cellHeight = 60;
    customCellInfo.cellForRowAtIndexPathBlock = ^(__kindof UITableViewCell *cell, NSIndexPath *indexPath, __kindof RJBaseCellInfo *info) {
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = [NSString stringWithFormat:@"这是一个自定义Cell,也可以是继承自UITableViewCell的任何类%zd",indexPath.row];
    };
}

- (void)addButtonCell{
    RJButtonCellInfo *buttonCellInfo = [_tableViewAgent addButtonCellWithBackgroundColor:kRJRGBAColor(32, 149, 242, 1)];
    buttonCellInfo.cellHeight = 60;
    buttonCellInfo.buttonCornerRadius = 8;
    buttonCellInfo.buttonText = @"保存";
    buttonCellInfo.leftMargin = 30;
    buttonCellInfo.rightMargin = 30;
    
    __weak __typeof(self) weakSelf = self;
    buttonCellInfo.didTapButtonBlock = ^(UIButton *button, __kindof RJButtonCellInfo *info) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.view endEditing:YES];
        /**RJ 2019-01-01 22:40:45 由于self.name和bindingString绑定,能够动态取到对应的文本*/
        NSLog(@"你的姓名是:%@",self.name);
        if ([strongSelf.tableViewAgent validateBindingStringWithAlert:YES]) {
            [strongSelf.view showAutohideMessage:@"所有数据合法,可以保存了..."];
        }else{
            NSLog(@"输入有误...");
        }
    };
}

#pragma mark - UICollectionViewDelegates
#pragma mark ---- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[UICollectionViewCell className]  forIndexPath:indexPath];
    CGFloat colorNum = arc4random()%256;
    CGFloat colorNum2 = arc4random()%256;
    cell.backgroundColor = kRJRGBAColor(colorNum, colorNum2, colorNum, 1);
    return cell;
}

#pragma mark ----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 80);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
