//
//  UISegmentedControl+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (DDKit)

@end

@interface UISegmentedControl (Flatten)

/**
 *  iOS6中使用UISegmentedControl 扁平化
 */
- (void)flattenIniOS6;

/**
 *  iOS6中使用UISegmentedControl 扁平化 设置选中颜色
 *
 *  @param selectedColor 选中颜色
 */
- (void)flattenIniOS6:(UIColor *)selectedColor;

@end