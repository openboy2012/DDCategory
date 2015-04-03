//
//  UIImageView+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DDKit)

@end


@interface UIImageView (Placeholder)

/**
 *
 *  set a web-cache imageView can use an scale placeholder image;
 *
 *  @param url         web image url
 *  @param placeholder place holder image can scale
 */
- (void)sd_setImageWithURL:(NSURL *)url
     placeholderImageScale:(UIImage *)placeholder;

@end