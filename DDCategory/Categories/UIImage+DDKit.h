//
//  UIImage+DDKit.h
//  DDKit
//
//  Created by Diaoshu on 14-12-21.
//  Copyright (c) 2014年 MBaoBao inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDKit)

/**
 *  Create a pure color image only use the code
 *
 *  @param size  size of the image
 *  @param color pure color of the image
 *
 *  @return created image 
 */
+ (UIImage *)createImageWithCGSize:(CGSize)size andColor:(UIColor *)color;

@end
