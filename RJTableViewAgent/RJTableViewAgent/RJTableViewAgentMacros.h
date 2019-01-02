//
//  Macros.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//

#ifndef RJTableViewAgentMacros_h
#define RJTableViewAgentMacros_h

#define kRJIsiPhone           ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define kRJIsSmalliPhone  (kRJIsiPhone && kRJScreenHeight <= 667.0)
#define kRJFontSize(size)   [UIFont systemFontOfSize:kRJIsSmalliPhone ? (size):(size)+1]

#define kRJRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kRJBlackColor kRJRGBAColor(50,50,50,1)
#define kRJSeparateColor kRJRGBAColor(200, 199, 204,1)


#endif /* Macros_h */
