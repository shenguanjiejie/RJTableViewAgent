//
//  RJTableViewAgentConfig.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RJTableViewAgentConfig : NSObject

/**RJ 2019-01-01 14:36:44 默认占位图,当placeholderImage参数为nil的时候,会使用该占位图*/
@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic, strong) UIImage *rightArrow;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *subTextColor;

@property (nonatomic, strong) UIColor *separateColor;

+ (RJTableViewAgentConfig *)sharedConfig;

@end

NS_ASSUME_NONNULL_END
