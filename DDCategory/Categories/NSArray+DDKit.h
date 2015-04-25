//
//  NSArray+DDKit.h
//  DDCategory
//
//  Created by diaoshu on 15/4/25.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DDKit)

/**
 *  fixed the issue of array index beyond bounds
 *
 *  @param index array index
 *
 *  @return return object in array
 */
- (id)objectAtIndexCheck:(NSUInteger)index;

@end
