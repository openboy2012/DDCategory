//
//  NSObject+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 2017/3/15.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "NSObject+DDKit.h"
#include <sys/time.h>

@implementation NSObject (DDKit)

- (void)dd_benchmark:(void (^)(void))block completion:(void (^)(double))completion
{
    struct timeval t0, t1;
    gettimeofday(&t0, NULL);
    block();
    gettimeofday(&t1, NULL);
    double ms = (double)(t1.tv_sec - t0.tv_sec) * 1e3 + (double)(t1.tv_usec - t0.tv_usec) * 1e-3;
    completion(ms);
}

@end
