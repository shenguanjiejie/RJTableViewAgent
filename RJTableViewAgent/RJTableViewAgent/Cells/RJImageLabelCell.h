//
//  RJImageLabelCell.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJLabelCell.h"

@interface RJImageLabelCell : RJLabelCell

@property (nonatomic, strong) UIImageView *rj_imageView;

//@property (nonatomic, strong) NSLayoutConstraint *imageLabelIntervalCons;

@property (nonatomic, assign) CGSize imageSize;


@end
