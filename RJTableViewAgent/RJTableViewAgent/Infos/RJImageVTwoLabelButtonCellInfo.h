//
//  RJImageVTwoLabelButtonCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 diling. All rights reserved.
//

#import "RJImageLabelButtonCellInfo.h"

@interface RJImageVTwoLabelButtonCellInfo : RJImageLabelButtonCellInfo

@property (nonatomic, copy) NSString *detailText;

@property (nonatomic, strong) UIColor *detailTextColor;

@property (nonatomic, strong) UIFont *detailFont;

@property (nonatomic, strong) NSAttributedString *detailAttributeString;

@property (nonatomic, assign) NSTextAlignment detailTextAligment;

/**RJ 2019-01-01 20:59:52
 default: 0
 */
@property (nonatomic, assign) CGFloat detailLabelRightMarginConstant;

/**RJ 2019-01-01 21:00:12
 default: 0
 */
@property (nonatomic, assign) CGFloat twoLabelVInterval;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font detailText:(NSString *)detailText detailFont:(UIFont *)detailFont image:(id)image imageSize:(CGSize)imageSize;

@end
