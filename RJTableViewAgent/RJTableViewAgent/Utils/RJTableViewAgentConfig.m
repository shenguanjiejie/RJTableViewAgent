//
//  RJTableViewAgentConfig.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "RJTableViewAgentConfig.h"
#import "RJTableViewAgentMacros.h"

@implementation RJTableViewAgentConfig

static RJTableViewAgentConfig *_instance;

+ (id)allocWithZone:(NSZone *)zone{
    if (_instance) {
        return _instance;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
        [self config];
    });
    
    return _instance;
}

+ (RJTableViewAgentConfig *)sharedConfig{
    if (_instance) {
        return _instance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        [self config];
    });
    
    return _instance;
}

+ (void)config{
    _instance.textColor = kRJBlackColor;
    _instance.subTextColor = kRJRGBAColor(153, 153, 153, 1);
    _instance.separateColor = kRJSeparateColor;
    _instance.placeholderColor = kRJSeparateColor;
    _instance.placeholderImage = [UIImage imageNamed:@"rj_placeholderImage"];
    _instance.rightArrow = [UIImage imageNamed:@"rj_right_arrow"];
}
@end
