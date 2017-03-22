//
//  NSObject+DDKit.h
//  DDCategory
//
//  Created by DeJohn Dong on 2017/3/15.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DDKit)

/**
 Calculate the time cost about the method executed.

 @param block the method execute block
 @param completion the result block, this reuslt
 */
- (void)dd_benchmark:(void (^)(void))block
          completion:(void (^)(double milliseconds))completion;


@end
