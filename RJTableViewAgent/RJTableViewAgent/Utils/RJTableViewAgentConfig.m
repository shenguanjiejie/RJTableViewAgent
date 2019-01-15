//
//  RJTableViewAgentConfig.m
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#import "RJTableViewAgentConfig.h"

@implementation RJTableViewAgentConfig

static RJTableViewAgentConfig *_instance;

+ (id)allocWithZone:(NSZone *)zone{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (RJTableViewAgentConfig *)sharedConfig{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

@end
