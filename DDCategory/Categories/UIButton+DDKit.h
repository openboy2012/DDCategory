//
//  UIButton+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DDKit)

@end

@interface UIButton (BadgeView)

/**
 *  remove the badge value
 */
- (void)dd_removeBadgeValue;

/**
 *  add a badge value view on the button
 *
 *  @param strBadgeValue badge value
 *
 *  @return badge value view
 */
- (UIView *)dd_showBadgeValue:(NSString *)strBadgeValue;

/**
 *  add a badage value view
 *
 *  @param strBadgeValue badge value
 *  @param point  padding offset
 *
 *  @return badge value view
 */
- (UIView *)dd_showBadgeValue:(NSString *)strBadgeValue andPadding:(CGPoint)point;

@end


@interface UIButton (UIButtonExt)

/**
 *  set the title & image center in the button bounds
 *
 *  @param space title & image space
 */
- (void)dd_centerImageAndTitle:(float)space;

/**
 *  default method
 */
- (void)dd_centerImageAndTitle;

@end