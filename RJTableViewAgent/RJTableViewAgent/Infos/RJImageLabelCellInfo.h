//
//  RJImageLabelCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"

@interface RJImageLabelCellInfo : RJLabelCellInfo

/**RJ 2019-04-23 18:36:23
 default:YES
 是否允许自动管理imageView的图片加载
 */
@property (nonatomic, assign) BOOL imageManageable;

@property (nonatomic, copy) NSURL *imageUrl;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) UIViewContentMode imageContentMode;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, assign) CGFloat imageLabelInterval;

@property (nonatomic, strong) UIImage *placeholderImage;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;

@end
