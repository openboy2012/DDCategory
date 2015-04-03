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
- (void)removeBadgeValue;

/**
 *  add a badge value view on the button
 *
 *  @param strBadgeValue badge value
 *
 *  @return badge value view
 */
- (UIView *)showBadgeValue:(NSString *)strBadgeValue;

/**
 *  add a badage value view
 *
 *  @param strBadgeValue badge value
 *  @param point  padding offset
 *
 *  @return badge value view
 */
- (UIView *)showBadgeValue:(NSString *)strBadgeValue andPadding:(CGPoint)point;

@end
