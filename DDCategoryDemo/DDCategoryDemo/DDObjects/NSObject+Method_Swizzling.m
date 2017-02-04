//
//  NSObject+Method_Swizzling.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/4.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "NSObject+Method_Swizzling.h"
#import "Aspects.h"

@implementation NSObject (Method_Swizzling)

+ (void)load
{
#if !__has_feature(objc_arc)
    [NSObject aspect_hookSelector:@selector(dealloc)
                      withOptions:AspectPositionAfter
                       usingBlock:
                            error:];
#endif
}

@end
