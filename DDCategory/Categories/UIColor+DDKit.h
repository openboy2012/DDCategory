//
//  UIColor+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DDKit)

@end

@interface UIColor(HexString)

+ (UIColor *)hexStringToColor:(NSString *)stringToConvert;

@end