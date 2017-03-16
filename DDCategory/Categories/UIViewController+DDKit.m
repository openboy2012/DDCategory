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
    NSLog(@"interfaceOrientation is %d", interfaceOrientation);

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

@end
