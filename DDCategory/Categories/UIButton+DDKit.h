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

- (void)removeBadgeValue;

- (UIView *)showBadgeValue:(NSString *)strBadgeValue;

- (UIView *)showBadgeValue:(NSString *)strBadgeValue andPadding:(CGPoint)point;

@end
