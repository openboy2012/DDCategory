//
//  UIView+DDKit.m
//  DDCategory
//
//  Created by Diaoshu on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UIView+DDKit.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

@implementation UIView (DDKit)

@end

@implementation UIView (Separator)

- (void)dd_addSeparatorWithType:(ViewSeparatorType)type{
    [self dd_addSeparatorWithType:type withColor:nil];
}

- (void)dd_addSeparatorWithType:(ViewSeparatorType)type withColor:(UIColor *)color{
    switch (type) {
        case ViewSeparatorTypeVerticalSide:{
            UIImageView *topLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width andColor:color];
            [self addSubview:topLine];
            topLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
            UIImageView *bottomLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width andColor:color];
            bottomLine.frame = CGRectMake(0.0, self.frame.size.height - SeparatorWidth, bottomLine.frame.size.width, SeparatorWidth);
            [self addSubview:bottomLine];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case ViewSeparatorTypeBottom:{
            UIImageView *bottomLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width andColor:color];
            bottomLine.frame = CGRectMake(0.0, self.frame.size.height - SeparatorWidth, bottomLine.frame.size.width, SeparatorWidth);
            [self addSubview:bottomLine];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case ViewSeparatorTypeTop:{
            UIImageView *topLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width andColor:color];
            [self addSubview:topLine];
            topLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        default:
            break;
    }
}


+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width{
    return [self dd_instanceHorizontalLine:width andColor:[UIColor lightGrayColor]];
}


+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height{
    return [self dd_instanceVerticalLine:height andColor:[UIColor lightGrayColor]];
}

+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, SeparatorWidth)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}

+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height andColor:(UIColor *)color{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SeparatorWidth, height)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}

@end

@implementation UIView (nib)

+ (NSString *)nibName{
    return [self description];
}

+ (id)dd_loadFromNIB {
    Class kClass = [self class];
    NSString *nibName = [self nibName];
    
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    
    for (id object in objects) {
        if ([object isKindOfClass:kClass]) {
            return object;
        }
    }
    
    [NSException raise:@"WrongNibFormat" format:@"Nib for '%@' must contain one UIView, and its class must be '%@'", nibName, NSStringFromClass(kClass)];
    
    return nil;
}

@end

static char *hudKey;

@interface UIView()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation UIView (MBProgressHUD)

#pragma mark - runtime

- (void)setHud:(MBProgressHUD *)hud{
    objc_setAssociatedObject(self, &hudKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud{
    return objc_getAssociatedObject(self, &hudKey);
}

#pragma mark - methods

- (void)dd_showMessageHUD:(NSString *)message{
    if(!self.hud)
        self.hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = [message isKindOfClass:[NSString class]]?message:@"";
    self.hud.yOffset = -50.0f;
    self.hud.userInteractionEnabled = NO;
    [self.hud show:YES];
}

- (void)dd_removeHUD{
    [self.hud hide:YES];
    self.hud = nil;
}

#pragma mark - static methods

+ (void)dd_showMessage:(NSString *)message{
    [self dd_showMessage:message onParentView:nil];
}

+ (void)dd_showMessage:(NSString *)message onParentView:(UIView *)parentView{
    if(!parentView){
        UIWindow *topWindows = [[[UIApplication sharedApplication] windows] lastObject];
        parentView = topWindows;
    }
    MBProgressHUD *messageHud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    messageHud.mode = MBProgressHUDModeText;
    messageHud.labelText = [message isKindOfClass:[NSString class]]?message:@"";
    messageHud.yOffset = -50.0f;
    messageHud.userInteractionEnabled = NO;
    [messageHud hide:YES afterDelay:1.0f];
}

+ (void)dd_showDetailMessage:(NSString *)message{
    [self dd_showDetailMessage:message onParentView:nil];
}

+ (void)dd_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView{
    if(!parentView){
        UIWindow *topWindows = [[[UIApplication sharedApplication] windows] lastObject];
        parentView = topWindows;
    }
    MBProgressHUD *messageHud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    messageHud.mode = MBProgressHUDModeText;
    messageHud.labelText = @"提示";
    messageHud.detailsLabelText = [message isKindOfClass:[NSString class]]?message:@"";
    messageHud.yOffset = -50.0f;
    messageHud.userInteractionEnabled = NO;
    [messageHud hide:YES afterDelay:1.0f];
}

@end


@implementation UIView (Screenshot)

- (UIImage *)dd_screenshot
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

- (UIImage *)dd_screenshotWithOffsetY:(CGFloat)deltaY
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //  KEY: need to translate the context down to the current visible portion of the tablview
    CGContextTranslateCTM(ctx, 0, deltaY);
    [self.layer renderInContext:ctx];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

@end

@implementation UIView (CornerRadius)

- (void)dd_addCornerRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

- (void)dd_addCornerRadius:(CGFloat)radius andLineColor:(UIColor *)lineColor{
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    if(lineColor){
        self.layer.borderColor = lineColor.CGColor;
        self.layer.borderWidth = SeparatorWidth;
    }
}

@end



