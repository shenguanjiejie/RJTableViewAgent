//
//  RJImage.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018年 shenguanjiejie. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface RJImage : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, strong) UIImage *image;

//@property (nonatomic, strong) PHAsset *asset;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSInteger size;

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *thumbUrl;
@property (nonatomic, copy) NSString *avatarUrl;

+ (instancetype)rj_imageWithImage:(UIImage *)image;

- (instancetype)initWithImage:(UIImage *)image;

/**
 使用图片url数组初始化一个RJImage数组
 */
+ (NSMutableArray<RJImage *> *)rj_imagesWithImageUrls:(NSArray<NSString *> *)imageUrls;

/**
 使用图片key数组初始化一个RJImage数组
 */
+ (NSMutableArray<RJImage *> *)rj_imagesWithImageKeys:(NSArray<NSString *> *)imageKeys;

/**
 获得RJImage数组中的images数组
 */
+ (NSArray<UIImage *> *)imagesWithRJImages:(NSArray<RJImage *> *)rj_images;

/**
 给定一个images数组,获得一个RJImage数组
 */
+ (NSArray<RJImage *> *)rj_imagesWithImages:(NSArray<UIImage *> *)images;

/**
 获得RJImage数组中的url数组
 */
+ (NSArray<NSString *> *)urlsWithRJImages:(NSArray<RJImage *> *)rj_images;

/**
 获得RJImage数组中的thumbUrl数组
 */
+ (NSArray<NSString *> *)thumbUrlsWithRJImages:(NSArray<RJImage *> *)rj_images;

/**
 获得RJImage数组中的key数组
 */
+ (NSArray<NSString *> *)keysWithRJImages:(NSArray<RJImage *> *)rj_images;

@end
