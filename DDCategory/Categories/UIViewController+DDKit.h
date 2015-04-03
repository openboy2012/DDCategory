//
//  UIViewController+DDKit.h
//  MBBCommon
//
//  Created by Diaoshu on 15-3-18.
//  Copyright (c) 2015年 MBaoBao inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DDKit)

/**
 *  instance a viewController as use the 'nitWithNibName:bundle:' method with the same name xib file
 *
 *  @return initlialized viewController object
 */
+ (instancetype)loadWithNib;

@end
