//
//  RJImageCellInfo.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import "RJImageCellInfo.h"

@implementation RJImageCellInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath image:(id)image placeholderImage:(UIImage *)placeholderImage{
    self = [super initWithCellType:CellTypeImage indexPath:indexPath];
    if (self) {
        if ([image isKindOfClass:[UIImage class]]) {
            self.image = image;
        }else if ([image isKindOfClass:[NSString class]]){
            self.imageUrl = image;
        }
        self.imageContentMode = UIViewContentModeScaleAspectFit;
        self.placeholderImage = placeholderImage;
        self.imageSize = CGSizeMake(40, 40);
    }
    
    return self;
}

@end
