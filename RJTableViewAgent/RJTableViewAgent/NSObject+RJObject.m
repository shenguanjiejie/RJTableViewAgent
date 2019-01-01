//
//  NSObject+RJObject.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "NSObject+RJObject.h"
#import <objc/message.h>

static void const *objectKey = @"objectKey";

@implementation NSObject (RJObject)

- (void)setObject:( __kindof __unused NSObject *)object{
    objc_setAssociatedObject(self, objectKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- ( __kindof NSObject *)object{
    return objc_getAssociatedObject(self, objectKey);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}

- (NSString *)className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}


@end
