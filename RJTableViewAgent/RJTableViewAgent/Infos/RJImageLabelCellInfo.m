//
//  RJImageLabelCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJImageLabelCellInfo.h"

@implementation RJImageLabelCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath text:(NSString *)text font:(UIFont *)font image:(id)image imageSize:(CGSize)imageSize{
    self = [super initWithIndexPath:indexPath text:text font:font];
    if (self) {
        _cellType = CellTypeImageLabel;
        if ([image isKindOfClass:[UIImage class]]) {
            self.image = image;
        }else if ([image isKindOfClass:[NSURL class]]){
            self.imageUrl = image;
        }
        _imageManageable = YES;
        self.imageSize = imageSize;
        self.imageContentMode = UIViewContentModeScaleAspectFit;
        self.imageLabelInterval = 5;
        self.layoutMargins = UIEdgeInsetsMake(15, 15, 15, 15);
    }
    
    return self;
}

@end
