//
//  UISegmentedControl+DDKit.m
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UISegmentedControl+DDKit.h"
#import "UIImage+DDKit.h"

@implementation UISegmentedControl (DDKit)

@end

@implementation UISegmentedControl (Flatten)

//处理UISegmentedControl 在iOS6及以下的扁平化效果
- (void)flattenIniOS6{
    [self flattenIniOS6:nil];
}

- (void)flattenIniOS6:(UIColor *)selectedColor{
    if([[UIDevice currentDevice].systemVersion floatValue] < 6.9){
        UIImage *image = [UIImage createImageWithCGSize:CGSizeMake(1, 28) andColor:self.tintColor];
        [[UISegmentedControl appearance] setBackgroundImage:image
                                                   forState:UIControlStateSelected
                                                 barMetrics:UIBarMetricsDefault];
        [[UISegmentedControl appearance] setDividerImage:image
                                     forLeftSegmentState:UIControlStateNormal
                                       rightSegmentState:UIControlStateSelected
                                              barMetrics:UIBarMetricsDefault];
        
        image = [UIImage createImageWithCGSize:CGSizeMake(1, 28) andColor:[UIColor clearColor]];
        [[UISegmentedControl appearance] setBackgroundImage:image
                                                   forState:UIControlStateNormal
                                                 barMetrics:UIBarMetricsDefault];
        
        self.layer.borderColor = self.tintColor.CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 4.0f;
        self.layer.masksToBounds = YES;
        
        [[UISegmentedControl appearance] setTitleTextAttributes:@{UITextAttributeTextColor:selectedColor?:[UIColor whiteColor],UITextAttributeFont:[UIFont systemFontOfSize:14],UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]}
                                                       forState:UIControlStateSelected];
        
        [[UISegmentedControl appearance] setTitleTextAttributes:@{UITextAttributeTextColor:self.tintColor?:[UIColor whiteColor],UITextAttributeFont:[UIFont systemFontOfSize:14],UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)]}
                                                       forState:UIControlStateNormal];
        
    }
}

@end