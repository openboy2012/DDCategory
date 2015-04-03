//
//  NSString+DDKit.h
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDKit)

@end

@interface NSString (NSDate)

+ (NSString *)dateInfoFromDate:(NSDate *)date;

+ (NSString *)snsDateInfoFromDate:(NSDate *)date;

@end

@interface NSString (NSPredicate)

+ (BOOL)isEmail:(NSString *)input;

+ (BOOL)isPhoneNum:(NSString *)input;

+ (BOOL)isChineseName:(NSString *)input;

+ (BOOL)isValidateCode:(NSString *)input;

+ (BOOL)checkPassword:(NSString *)input;

+ (BOOL)isMobileNum:(NSString *)input;

+ (BOOL)checkWithDrawMoney:(NSString *)input;

@end

@interface NSString (md5)

- (NSString *)md5;

@end

@interface NSString (subString)

- (NSString *)getSubStringBeginKey:(NSString *)bKey EndKey:(NSString *)eKey;

@end