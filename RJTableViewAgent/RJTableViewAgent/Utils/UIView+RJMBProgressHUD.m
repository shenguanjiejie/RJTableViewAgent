//
//  UIView+MBProgressHUD.m
//  innerCloud
//
//  Created by Ruijie on 2017/3/24.
//  Copyright © 2018年 Ruijie. All rights reserved.
//

#import "UIView+RJMBProgressHUD.h"
#import "MBProgressHUD.h"
#import <objc/message.h>

static void const *hudKey = @"hudKey";

@implementation UIView (RJMBProgressHUD)

+ (NSBundle *)bundle {
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[MBProgressHUD class]]  pathForResource:@"RJTableViewAgent" ofType:@"bundle"]];
    });
    return bundle;
}

-(void)setRj_hud:(MBProgressHUD *)rj_hud{
    objc_setAssociatedObject(self, hudKey, rj_hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(MBProgressHUD *)rj_hud{
    return objc_getAssociatedObject(self, hudKey);
}

-(void)show:(NSString *)text icon:(NSString *)icon autohide:(BOOL)autohide
{
    [self hideHud];
    
    self.rj_hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    self.rj_hud.detailsLabel.font = [UIFont systemFontOfSize:16];
    // 再设置模式
    if (!icon) {
        self.rj_hud.mode = MBProgressHUDModeText;
    }else{
        self.rj_hud.mode = MBProgressHUDModeCustomView;
    }
    // 隐藏时候从父控件中移除
    self.rj_hud.removeFromSuperViewOnHide = YES;
    
    self.rj_hud.detailsLabel.text = text;
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[UIView bundle] pathForResource:icon ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.contentMode = UIViewContentModeCenter;
    // 设置图片
    self.rj_hud.customView = imageView;
    
    if (autohide) {
        [self.rj_hud hideAnimated:YES afterDelay:1 + text.length * 0.05];
    }
}

- (void)showError:(NSString *)error{
    [self show:error icon:@"error" autohide:YES];
}

- (void)showWarning:(NSString *)warning{
    [self show:warning icon:@"warning" autohide:YES];
}

- (void)showSuccess:(NSString *)success{
    [self show:success icon:@"done" autohide:YES];
}

- (void)showMessage:(NSString *)message{
    [self show:message icon:nil autohide:NO];
}

- (void)showAutohideMessage:(NSString *)message{
    [self show:message icon:nil autohide:YES];
}

-(void)showHudWithMessage:(NSString *)message{
    if (self.rj_hud) {
        if (self.rj_hud.mode == MBProgressHUDModeIndeterminate) {
            self.rj_hud.detailsLabel.text = message;
            return;
        }else if (self.rj_hud.mode == MBProgressHUDModeCustomView || self.rj_hud.mode == MBProgressHUDModeText){
            [self.rj_hud removeFromSuperview];
            self.rj_hud = nil;
        }
    }

    self.rj_hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//    self.hud.dimBackground = YES;
    self.rj_hud.detailsLabel.font = [UIFont systemFontOfSize:16];
    self.rj_hud.removeFromSuperViewOnHide = YES;
    self.rj_hud.mode = MBProgressHUDModeIndeterminate;
    self.rj_hud.detailsLabel.text = message;
}

- (void)hideHud{
    if (self.rj_hud) {
        [self.rj_hud hideAnimated:YES];
        [self.rj_hud removeFromSuperview];
        self.rj_hud = nil;
    }
}
@end
