//
//  UIView+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDKit)

@end

typedef NS_OPTIONS(NSUInteger, ViewSeparatorType) {
    ViewSeparatorTypeTop             = 1 << 0,
    ViewSeparatorTypeLeft            = 1 << 1,
    ViewSeparatorTypeBottom          = 1 << 2,
    ViewSeparatorTypeRight           = 1 << 3,
    ViewSeparatorTypeVerticalSide    = 1 << 4,
    ViewSeparatorTypeHorizontalSide  = 1 << 5,
    ViewSeparatorTypeAll             = 1 << 6
};

#ifndef SeparatorWidth
#define SeparatorWidth (1.0/[UIScreen mainScreen].scale)
#endif

@interface UIView (Separator)

- (void)addSeparatorWithType:(ViewSeparatorType)type;

+ (UIImageView *)instanceHorizontalLine:(CGFloat)width;

+ (UIImageView *)instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color;

+ (UIImageView *)instanceVerticalLine:(CGFloat)height;

+ (UIImageView *)instanceVerticalLine:(CGFloat)width andColor:(UIColor *)color;


@end


@interface UIView (nib)

+ (id)loadFromNIB;

@end

@interface UIView (MBProgressHUD)

- (void)showMessageHUD:(NSString *)message;

- (void)removeHUD;

+ (void)showMessage:(NSString *)message;

+ (void)showMessage:(NSString *)message andCarryView:(UIView *)carryView;

+ (void)showDetailMessage:(NSString *)message;

+ (void)showDetailMessage:(NSString *)message andCarryView:(UIView *)carryView;

@end