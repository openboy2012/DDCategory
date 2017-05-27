//
//  UIViewController+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 15-3-18.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UIViewController+DDKit.h"

@implementation UIViewController (DDKit)

+ (instancetype)dd_loadWithNib {
    return [[[self class] alloc] initWithNibName:[self description] bundle:nil];
}

- (void)dd_forceInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"interfaceOrientation is %ld", (long)interfaceOrientation);

    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
#if !__has_feature(objc_arc)

        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        NSInteger value = interfaceOrientation;
        [invocation setArgument:&value atIndex:2];
        [invocation invoke];
#else
        [[UIDevice currentDevice] setValue:@(interfaceOrientation) forKey:@"orientation"];
#endif
    }
}

+ (UIViewController *)dd_findBestViewController:(UIViewController *)viewController
{
    if (viewController.presentedViewController) {
        // Return presented view controller
        return [[self class] dd_findBestViewController:viewController.presentedViewController];
    } else if ([viewController isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)viewController;
        if (svc.viewControllers.count > 0)
            return [[self class] dd_findBestViewController:svc.viewControllers.lastObject];
        else
            return viewController;
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)viewController;
        if (svc.viewControllers.count > 0)
            return [[self class] dd_findBestViewController:svc.topViewController];
        else
            return viewController;
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *)viewController;
        if (svc.viewControllers.count > 0)
            return [[self class] dd_findBestViewController:svc.selectedViewController];
        else
            return viewController;
    } else {
        // Unknown view controller type, return last child view controller
        return viewController;
    }
}

+ (UIViewController *)dd_currentViewController
{
    // Find best view controller
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [[self class] dd_findBestViewController:viewController];
}

@end
