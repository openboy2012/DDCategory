//
//  UIWindow+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 2017/9/26.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "UIWindow+DDKit.h"

@implementation UIWindow (DDKit)

+ (UIWindow *)dd_lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

@end
