//
//  UILabel+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DDKit)

@end

@interface UILabel (AutoSize)

/*
 * @brief 垂直方向固定获取动态宽度的UILabel的方法
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelHorizontal;

/*
 * @brief 水平方向固定获取动态宽度的UILabel的方法
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelVertical;

@end