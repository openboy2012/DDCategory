//
//  DDObject.h
//  WakeUpCrashDemo
//
//  Created by DeJohn Dong on 2017/1/23.
//  Copyright © 2017年 hikvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDObject : NSObject<NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger number;

@end
