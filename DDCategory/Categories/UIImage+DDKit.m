//
//  UIImage+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 14-12-21.
//  Copyright (c) 2014年 DDKit. All rights reserved.
//

#import "UIImage+DDKit.h"

@implementation UIImage (DDKit)

+ (UIImage *)dd_createImageWithCGSize:(CGSize)size color:(UIColor *)color {
    CGSize imageSize = size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)dd_createImageWithCGSize:(CGSize)size andColor:(UIColor *)color {
    return [self dd_createImageWithCGSize:size color:color];
}


+ (UIImage *)dd_navigtionBarBackButtonImage:(UIColor *)color {
    CGSize size = CGSizeMake(16.0, 30.0);
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [[UIColor clearColor] set];
    UIRectFill(CGRectMake(0, 0, 16.0, 30.0));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    const CGFloat *cs = CGColorGetComponents(color.CGColor);
    //画四个边角
    CGContextSetLineWidth(ctx, 2.5);
    CGContextSetRGBStrokeColor(ctx, cs[0], cs[1], cs[2], CGColorGetAlpha(color.CGColor));
    
    //左上角
    CGPoint pointA[] = {
        CGPointMake(1, 15.5),
        CGPointMake(10, 6)
    };
    
    CGPoint pointB[] = {
        CGPointMake(1, 14.5),
        CGPointMake(10, 24)
    };
    CGContextAddLines(ctx, pointA, 2);
    CGContextAddLines(ctx, pointB, 2);
    CGContextStrokePath(ctx);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
