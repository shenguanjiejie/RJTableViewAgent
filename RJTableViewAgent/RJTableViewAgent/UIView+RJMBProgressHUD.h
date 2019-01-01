//
//  UIView+MBProgressHUD.h
//  RJTableViewAgent
//
//  Created by Ruijie on 2017/3/24.
//  Copyright © 2018年 Ruijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@class RJMBProgressHUD;

@interface UIView (RJMBProgressHUD)

@property (nonatomic,strong) MBProgressHUD *rj_hud;

- (void)showError:(NSString *)error;

- (void)showWarning:(NSString *)warning;

- (void)showSuccess:(NSString *)success;

- (void)showMessage:(NSString *)message;

- (void)showAutohideMessage:(NSString *)message;

- (void)hideHud;

-(void)showHudWithMessage:(NSString *)message;


@end
