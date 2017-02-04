//
//  DDOperation.m
//  WakeUpCrashDemo
//
//  Created by DeJohn Dong on 2017/1/10.
//  Copyright © 2017年 hikvision. All rights reserved.
//

#import "DDOperation.h"

@implementation DDOperation

- (void)main
{
    for (; ; ) {
        NSLog(@"operation thread runing now");
        usleep(rand() % 10000);
    }
}

@end
