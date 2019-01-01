//
//  RJImageLabelCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCellInfo.h"

@interface RJImageLabelCellInfo : RJLabelCellInfo


@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, strong) id image;

@property (nonatomic, assign) UIViewContentMode imageContentMode;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, assign) CGFloat imageLabelInterval;

@property (nonatomic, strong) UIImage *placeholderImage;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize;

@end
