//
//  RJCycleCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenruijie. All rights reserved.
//

#import "RJBaseCell.h"
#import "TYCyclePagerView.h"
#import "RJImage.h"

@interface RJCycleCell : RJBaseCell

@property (nonatomic, strong) TYCyclePagerView *cyclePagerView;

@property (nonatomic, strong) NSArray<RJImage *> *cycleImages;

@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, assign) CGSize cycleImageSize;

@property (nonatomic, assign) CGFloat cycleInterval;

@property (nonatomic, assign) TYCyclePagerTransformLayoutType cycleType;


@end
