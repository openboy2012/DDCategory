//
//  UIView+DDKit.h
//  DDCategory
//
//  Created by DeJohn Dong on 15-3-20.
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

@interface UIView (DDSeparator)

/**
 *  Add the separator line on the view
 *
 *  @param type view-separtor-type
 */
- (void)dd_addSeparatorWithType:(ViewSeparatorType)type;

/**
 *  Add the separator line on the view
 *
 *  @param type  view-separtor-type
 *  @param color line-color
 */
- (void)dd_addSeparatorWithType:(ViewSeparatorType)type color:(UIColor *)color;
- (void)dd_addSeparatorWithType:(ViewSeparatorType)type withColor:(UIColor *)color __deprecated_msg("Use `dd_addSeparatorWithType:color:`");

/**
 *  Add the autolayout separator line on the view.
 *
 *  @param type The view-separator-type.
 */
- (void)dd_addALSeparatorWithType:(ViewSeparatorType)type;

/**
 *  Add the autolayout separator color line on the view.
 *
 *  @param type  The view-separator-type.
 *  @param color The line color.
 */
- (void)dd_addALSeparatorWithType:(ViewSeparatorType)type color:(UIColor *)color;

/**
 *  Instance a horizontal line with the width
 *
 *  @param width line-width
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width;

/**
 *  Instance a horizontal line with the width & color
 *
 *  @param width line-width
 *  @param color line-color
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width color:(UIColor *)color;
+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color __deprecated_msg("Use `dd_instanceHorizontalLine:color:`");

/**
 *  Instance a vertical line with the height
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
+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height color:(UIColor *)color;
+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height andColor:(UIColor *)color __deprecated_msg("Use `dd_instanceVerticalLine:color:`");


@end


@interface UIView (DDNib)

/**
 *  Load a view from nib file
 *
 *  @return initlialized view object
 */
+ (id)dd_loadFromNIB;

@end

@interface UIView (DD_MBProgressHUD)

/**
 *  Show only text HUD View
 *
 *  @param message The message text
 */
- (void)dd_showMessageHUD:(NSString *)message;

/**
 *  Remove the HUD
 */
- (void)dd_removeHUD;

/**
 *  Show only text HUD View with class method
 *
 *  @param message message text
 */
+ (void)dd_showMessage:(NSString *)message;

/**
 *  Show only the HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)dd_showMessage:(NSString *)message onParentView:(UIView *)parentView;

/**
 *  Show detail text HUD View
 *
 *  @param message message text
 */
+ (void)dd_showDetailMessage:(NSString *)message;

/**
 *  Show detail text HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)dd_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView;

@end

@interface UIView (DDScreenshot)

/**
 *  Get a screenshot from a view with Y offset
 *
 *  @param deltaY offset Y
 *
 *  @return The screenshot image.
 */
- (UIImage *)dd_screenshotWithOffsetY:(CGFloat)deltaY;

/**
 *  Get a screenshot with all the partern of view.
 *
 *  @return The screenshot image
 */
- (UIImage *)dd_screenshot;

@end

@interface UIView (DDCornerRadius)

/**
 *  Add corner radius layer on the view
 *
 *  @param radius The radius width
 */
- (void)dd_addCornerRadius:(CGFloat)radius;

/**
 *  Add corner radius layer on the view with line color
 *
 *  @param radius    The radius width
 *  @param lineColor The line color
 */
- (void)dd_addCornerRadius:(CGFloat)radius lineColor:(UIColor *)lineColor;
- (void)dd_addCornerRadius:(CGFloat)radius andLineColor:(UIColor *)lineColor __deprecated_msg("Use `dd_addCornerRadius:lineColor:`");

@end

@interface UIView (DDFrameInfo)

- (CGFloat)dd_top;
- (CGFloat)dd_left;
- (CGFloat)dd_bottom;
- (CGFloat)dd_right;
- (CGFloat)dd_width;
- (CGFloat)dd_height;
- (CGSize)dd_size;
- (CGPoint)dd_origin;

@end
