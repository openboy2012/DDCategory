//
//  UIWindow+DDKit.h
//  DDCategory
//
//  Created by DeJohn Dong on 2017/9/26.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (DDKit)

/**
 Get the available window.

 @return the key window
 */
+ (UIWindow *)dd_lastWindow;

@end
