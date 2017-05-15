//
//  DDObject.m
//  WakeUpCrashDemo
//
//  Created by DeJohn Dong on 2017/1/23.
//  Copyright © 2017年 hikvision. All rights reserved.
//

#import "DDObject.h"

@implementation DDObject

- (void)dealloc
{
//    NSLog(@"%@",[NSRunLoop currentRunLoop]);
    NSLog(@"[%@]<%p> dealloc", self.class, self);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[%@]<%p> alloc",self.class, self);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ddNotificationTests:) name:@"DDObjectNotification" object:nil];
    }
    return self;
}

- (void)ddNotificationTests:(NSNotification *)notification
{
    NSLog(@"notification is %@", notification);
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    DDObject *obj = [DDObject allocWithZone:zone];
    obj.name = [_name copyWithZone:zone];
    obj.number = _number;
    return obj;
}

- (BOOL)isEqual:(id)object
{
   return [super isEqual:object];
}

- (NSUInteger)hash
{
    return [super hash];
}

@end
