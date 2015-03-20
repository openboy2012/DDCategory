//
//  UIViewController+DDKit.m
//  MBBCommon
//
//  Created by Diaoshu on 15-3-18.
//  Copyright (c) 2015年 MBaoBao inc. All rights reserved.
//

#import "UIViewController+DDKit.h"

@implementation UIViewController (DDKit)

+ (instancetype)loadWithNib{
    return [[[self class] alloc] initWithNibName:[self description] bundle:nil];
}

@end
