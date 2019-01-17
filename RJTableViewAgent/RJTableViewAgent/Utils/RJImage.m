//
//  RJImage.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJImage.h"

@implementation RJImage

+ (instancetype)rj_imageWithImage:(UIImage *)image{
    RJImage *rj_image = [[RJImage alloc] initWithImage:image];
    return rj_image;
}

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _image = image;
    }
    return self;
}


- (NSString *)thumbUrl{
    if (_thumbUrl) {
        return _thumbUrl;
    }
    if (self.url) {
        return [self.url stringByAppendingString:@"&style=compress"];
    }
    return nil;
}

- (NSString *)avatarUrl{
    if (_thumbUrl) {
        return _thumbUrl;
    }
    if (self.url) {
        return [self.url stringByAppendingString:@"&style=avatar"];
    }
    return nil;
}

+ (NSMutableArray<RJImage *> *)rj_imagesWithImageUrls:(NSArray<NSString *> *)imageUrls{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0;i < imageUrls.count; i++) {
        NSString *url = imageUrls[i];
        RJImage *image = [[RJImage alloc] init];
        image.url = url;
        image.ID = i;
        
        [arr addObject:image];
    }
    return arr;
}

/**
 使用图片key数组初始化一个RJImage数组
 */
+ (NSMutableArray<RJImage *> *)rj_imagesWithImageKeys:(NSArray<NSString *> *)imageKeys{
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0;i < imageKeys.count; i++) {
        NSString *key = imageKeys[i];
        RJImage *image = [[RJImage alloc] init];
        image.key = key;
        image.ID = i;
        
        [arr addObject:image];
    }
    return arr;
}

+ (NSArray<RJImage *> *)rj_imagesWithImages:(NSArray<UIImage *> *)images{
    
    NSMutableArray *rj_images = [NSMutableArray array];
    for (UIImage *image in images) {
        [rj_images addObject:[RJImage rj_imageWithImage:image]];
    }
    return rj_images;
}

+ (NSArray<UIImage *> *)imagesWithRJImages:(NSArray<RJImage *> *)rj_images{
    return [rj_images valueForKey:@"image"];
}

+(NSArray<NSString *> *)urlsWithRJImages:(NSArray<RJImage *> *)rj_images{
    return [rj_images valueForKey:@"url"];
}

+(NSArray<NSString *> *)keysWithRJImages:(NSArray<RJImage *> *)rj_images{
    return [rj_images valueForKey:@"key"];
}

+(NSArray<NSString *> *)thumbUrlsWithRJImages:(NSArray<RJImage *> *)rj_images{
    return [rj_images valueForKey:@"thumbUrl"];
}


@end
