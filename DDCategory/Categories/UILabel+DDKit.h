//
//  UILabel+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DDKit)

/**
 *  calculate the text height with the systemFontSize & constrain width
 *
 *  @param text     calculate text
 *  @param fontSize system font size
 *  @param width    constraint
 *
 *  @return calculated height
 */
+ (CGFloat)heightOfText:(NSString *)text
               fontSize:(CGFloat)fontSize
        constraintWidth:(CGFloat)width;

/**
 *  calculate the text height with the systemFontSize & constrain width then return a minimum height
 *
 *  @param text     calculate text
 *  @param fontSize system font size
 *  @param width    constraint
 *  @param height   minimum height
 *
 *  @return calculated height with the minimum height
 */
+ (CGFloat)heightOfText:(NSString *)text
               fontSize:(CGFloat)fontSize
        constraintWidth:(CGFloat)width
          minimumHeight:(CGFloat)height;

/**
 *  calculate the text height with the font & constrain width then return a minimum height
 *
 *  @param text     calculate text
 *  @param font     font
 *  @param width    constraint
 *  @param height   minimum height
 *
 *  @return calculated height with the minimum height
 */
+ (CGFloat)heightOfText:(NSString *)text
                   font:(UIFont *)font
        constraintWidth:(CGFloat)width
          minimumHeight:(CGFloat)height;

@end

@interface UILabel (AutoSize)

/**
 * 垂直方向固定获取动态宽度的UILabel的方法
 *
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelHorizontal;

/**
 *  水平方向固定获取动态宽度的UILabel的方法
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelVertical;

/**
 *  垂直方向固定获取动态宽度的UILabel的方法
 *
 *  @param minimumWidth minimum width
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelHorizontal:(CGFloat)minimumWidth;

/**
 *  水平方向固定获取动态宽度的UILabel的方法
 *
 *  @param minimumHeigh minimum height
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelVertical:(CGFloat)minimumHeigh;

@end