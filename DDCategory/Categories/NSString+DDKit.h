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

/**
 *  get date info string from a date type object
 *
 *  @param date date type object
 *
 *  @return a date info string
 */
+ (NSString *)dd_formatInfoFromDate:(NSDate *)date;

/**
 *  get sns date info string form date type object
 *
 *  @param date date type object
 *
 *  @return a date info string of sns
 */
+ (NSString *)dd_formatDateFromDate:(NSDate *)date;

@end

@interface NSString (NSPredicate)

/**
 *  check the string is email
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkEmail:(NSString *)input;

/**
 *  check the string is phone Number
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkPhoneNumber:(NSString *)input;

/**
 *  check the string is chinese name
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkChineseName:(NSString *)input;

/**
 *  check the string is valudate code
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkValidateCode:(NSString *)input;

/**
 *  check the string is strong password string
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkPassword:(NSString *)input;


/**
 *  check the string is mobile number
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkMobileNumber:(NSString *)input;

/**
 *  check the string is validate money
 *
 *  @param input input string
 *
 *  @return true/false value
 */
+ (BOOL)dd_checkWithDrawMoney:(NSString *)input;

@end

@interface NSString (md5)

/**
 *  md5 - encrypt method
 *
 *  @return md5 encrypt string
 */
- (NSString *)dd_md5;

@end

@interface NSString (subString)

/**
 *  get substring from origin string with condition
 *
 *  @param bKey begin key
 *  @param eKey end key
 *
 *  @return result string
 */
- (NSString *)dd_getSubStringBeginKey:(NSString *)bKey EndKey:(NSString *)eKey;

@end

@interface NSString (DDPrice)

+ (NSString *)dd_formatPrice:(NSNumber *)price;

@end

