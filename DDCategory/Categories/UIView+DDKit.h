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
- (void)dd_addSeparatorWithType:(ViewSeparatorType)type;

/**
 *  add the separator line on the view
 *
 *  @param type  view-separtor-type
 *  @param color line-color
 */
- (void)dd_addSeparatorWithType:(ViewSeparatorType)type withColor:(UIColor *)color;

/**
 *  instance a horizontal line with the width
 *
 *  @param width line-width
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width;

/**
 *  instance a horizontal line with the width & color
 *
 *  @param width line-width
 *  @param color line-color
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color;

/**
 *  instance a vertical line with the height
 *
 *  @param height line-height
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height;

/**
 *   instance a vertical line with the height & color
 *
 *  @param height line-height
 *  @param color linet-color
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height andColor:(UIColor *)color;


@end


@interface UIView (nib)

/**
 *  load a view from nib file
 *
 *  @return initlialized view object
 */
+ (id)dd_loadFromNIB;

@end

@interface UIView (MBProgressHUD)

/**
 *  show only text HUD View
 *
 *  @param message message text
 */
- (void)dd_showMessageHUD:(NSString *)message;

/**
 *  remove the HUD
 */
- (void)dd_removeHUD;

/**
 *  show only text HUD View with class method
 *
 *  @param message message text
 */
+ (void)dd_showMessage:(NSString *)message;

/**
 *  show only the HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)dd_showMessage:(NSString *)message onParentView:(UIView *)parentView;

/**
 *  show detail text HUD View
 *
 *  @param message message text
 */
+ (void)dd_showDetailMessage:(NSString *)message;

/**
 *  show detail text HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)dd_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView;

@end

@interface UIView (Screenshot)

/**
 *  screenshot with Y offset
 *
 *  @param deltaY offset Y
 *
 *  @return image
 */
- (UIImage *)dd_screenshotWithOffsetY:(CGFloat)deltaY;

/**
 *  screentshot all the view
 *
 *  @return image
 */
- (UIImage *)dd_screenshot;

@end

@interface UIView(CornerRadius)

/**
 *  add corner radius layer on the view
 *
 *  @param radius radius width
 */
- (void)dd_addCornerRadius:(CGFloat)radius;

/**
 *  add corner radius layer on the view with line color
 *
 *  @param radius    radius width
 *  @param lineColor line color
 */
- (void)dd_addCornerRadius:(CGFloat)radius andLineColor:(UIColor *)lineColor;

@end