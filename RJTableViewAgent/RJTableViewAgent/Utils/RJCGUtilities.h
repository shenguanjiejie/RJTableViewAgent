//
//  RJCGUtilities.h
//  RJTableViewAgent
//
//  Created by shenruijie on 2018/12/30.
//  Copyright © 2018 shenguanjiejie. All rights reserved.
//  参考YYCategory中的 YYCGUtilities

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Get main screen's size. Height is always larger than width.
CGSize RJScreenSize(void);

// main screen's width (portrait)
#ifndef kRJScreenWidth
#define kRJScreenWidth RJScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kRJScreenHeight
#define kRJScreenHeight RJScreenSize().height
#endif

NS_ASSUME_NONNULL_END
