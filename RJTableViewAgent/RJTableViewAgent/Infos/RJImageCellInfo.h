//
//  RJImageCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJBaseCellInfo.h"

@interface RJImageCellInfo : RJBaseCellInfo

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, assign) UIViewContentMode imageContentMode;

@property (nonatomic, assign) BOOL shouldRoundImage;

@property (nonatomic, assign) CGSize imageSize;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath image:(id)image placeholderImage:(UIImage *)placeholderImage;

@end
