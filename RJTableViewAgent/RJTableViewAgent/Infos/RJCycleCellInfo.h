//
//  RJCycleCellInfo.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenruijie. All rights reserved.
//

#import "RJBaseCellInfo.h"
#import "RJImage.h"

typedef NS_ENUM(NSUInteger, RJCycleCellType) {
    RJCycleCellTypeNormal,
    RJCycleCellTypeLinear,
    RJCycleCellTypeCoverflow,
};

@interface RJCycleCellInfo : RJBaseCellInfo

@property (nonatomic, strong) NSArray<RJImage *> *cycleImages;

@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, assign) CGSize cycleImageSize;

@property (nonatomic, assign) CGFloat cycleInterval;

@property (nonatomic, assign) RJCycleCellType cycleType;


- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath images:(NSArray<RJImage *> *)images placeholderImage:(UIImage *)placeholderImage;


@end
