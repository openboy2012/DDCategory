//
//  NSString+DDKit.m
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "NSString+DDKit.h"
#import <CommonCrypto/CommonCrypto.h>

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

@implementation NSString (NSPredicate)

+ (BOOL)isEmail:(NSString *)input{
    return [[self class] input:input andRegex:@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"];
}

+ (BOOL)isChineseName:(NSString *)input{
    return [[self class] input:input andRegex:@"^[\u4E00-\uFA29]{2,8}$"];
}

+ (BOOL)isPhoneNum:(NSString *)input{
    return [[self class] input:input andRegex:@"^(([0\\+]\\d{2,3}-?)?(0\\d{2,3})-?)?(\\d{7,8})"];
}

+ (BOOL)isMobileNum:(NSString *)input{
    return [[self class] input:input andRegex:@"^1\\d{10}$"];
}

+ (BOOL)isValidateCode:(NSString *)input{
    return [[self class] input:input andRegex:@"(\\d{6})"];
}

+ (BOOL)checkPassword:(NSString *)input{
    return [[self class] input:input andRegex:@"^\\w{6,20}"];
}

+ (BOOL)checkWithDrawMoney:(NSString *)input{
    return [[self class] input:input andRegex:@"^[0-9]{3,}|[2-9][0-9]$"];
}

+ (BOOL)input:(NSString *)input andRegex:(NSString *)regex{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:input];
}

@end

@implementation NSString(md5)

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end


