//
//  NSString+DDKit.m
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "NSString+DDKit.h"

@implementation NSString (DDKit)

@end

@implementation NSString (NSDate)

+ (NSString *)dateInfoFromDate:(NSDate *)date{
    NSString *returnString = @"";
    NSTimeInterval time = abs([[NSDate date] timeIntervalSinceDate:date]);
    if(time < 60)
        returnString = @"刚刚";
    else if(time >=60 && time < 3600)
        returnString = [NSString stringWithFormat:@"%.0f分钟前",time/60];
    else if(time >= 3600 && time < 3600 * 24)
        returnString = [NSString stringWithFormat:@"%.0f小时前",time/(60 * 60)];
    else if(time >= 3600 * 24 && time < 3600 * 24 * 30)
        returnString = [NSString stringWithFormat:@"%.0f天前",time/(60 * 60 * 24)];
    else if(time >= 3600 * 24 * 30 && time < 3600 * 24 * 30 * 12)
        returnString = [NSString stringWithFormat:@"%.0f月前",time/(60 * 60 * 24 * 30)];
    else if(time >= 3600 * 24 * 30 * 12)
        returnString = [NSString stringWithFormat:@"%.0f年前",time/(60 * 60 * 24 * 30 * 12)];
    return returnString;
}


@end