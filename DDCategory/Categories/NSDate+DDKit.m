//
//  NSDate+DDKit.m
//  DDCategory
//
//  Created by DeJohn on 15/5/15.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "NSDate+DDKit.h"

@implementation NSDate (DDKit)

- (BOOL)isSameToDate:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:self];
    NSLog(@"comps = %@",comps);
    return YES;
}

@end
