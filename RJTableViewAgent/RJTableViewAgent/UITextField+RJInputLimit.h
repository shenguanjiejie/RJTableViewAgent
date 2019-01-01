//
//  UITextField+JKInputLimit.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextField (RJInputLimit)

/**RJ 2019-01-01 16:49:22 这里改成rj_maxLength是为了防止*/
@property (assign, nonatomic)  NSInteger rj_maxLength;//if <=0, no limit

@end
