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

/**
 *  add the separator line on the view
 *
 *  @param type view-separtor-type
 */
- (void)addSeparatorWithType:(ViewSeparatorType)type;

/**
 *  instance a horizontal line with the width
 *
 *  @param width line-width
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)instanceHorizontalLine:(CGFloat)width;

/**
 *  instance a horizontal line with the width & color
 *
 *  @param width line-width
 *  @param color line-color
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color;

/**
 *  instance a vertical line with the height
 *
 *  @param height line-height
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)instanceVerticalLine:(CGFloat)height;

/**
 *   instance a vertical line with the height & color
 *
 *  @param height line-height
 *  @param color linet-color
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)instanceVerticalLine:(CGFloat)height andColor:(UIColor *)color;


@end


@interface UIView (nib)

/**
 *  load a view from nib file
 *
 *  @return initlialized view object
 */
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

@interface UIView (Screenshot)

- (UIImage *)screenshotWithOffsetY:(CGFloat)deltaY;

- (UIImage *)screenshot;

@end