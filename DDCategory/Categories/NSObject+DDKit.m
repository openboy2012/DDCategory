//
//  NSObject+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 2017/3/15.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "NSObject+DDKit.h"

@implementation NSObject (DDKit)

- (void)dd_benchmark:(void (^)(void))block completion:(void (^)(double))completion
{
    double begin, end, ms;
    begin = CFAbsoluteTimeGetCurrent();
    block();
    end = CFAbsoluteTimeGetCurrent();
    ms = (end - begin) * 1000.0;
    completion(ms);
}

@end
