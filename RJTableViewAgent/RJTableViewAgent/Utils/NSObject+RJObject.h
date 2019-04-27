//
//  NSObject+RJObject.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RJObject)

@property (strong, nonatomic) __kindof NSObject *object;

+ (NSString *)className;

- (NSString *)className;

@end

