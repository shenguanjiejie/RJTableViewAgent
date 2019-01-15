//
//  RJImage.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface RJImage : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *thumbUrl;

@property (nonatomic, copy) NSString *avatarUrl;


+ (instancetype)rj_imageWithImage:(UIImage *)image;

- (instancetype)initWithImage:(UIImage *)image;

+ (NSMutableArray *)rj_imagesWithImageUrls:(NSArray<NSString *> *)imageUrls;

+ (NSArray<UIImage *> *)imagesWithRJImages:(NSArray<RJImage *> *)rj_images;

+ (NSArray<RJImage *> *)rj_imagesWithImages:(NSArray<UIImage *> *)images;


@end
