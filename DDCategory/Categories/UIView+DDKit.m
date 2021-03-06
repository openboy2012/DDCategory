//
//  UIView+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 15-3-20.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UIView+DDKit.h"
#import "MBProgressHUD.h"
#import "UIWindow+DDKit.h"
#import <objc/runtime.h>

@implementation UIView (DDKit)

@end

@implementation UIView (DDSeparator)

- (void)dd_addSeparatorWithType:(ViewSeparatorType)type {
    [self dd_addSeparatorWithType:type color:nil];
}

- (void)dd_addSeparatorWithType:(ViewSeparatorType)type color:(UIColor *)color {
    switch (type) {
        case ViewSeparatorTypeTop: {
            UIImageView *topLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width color:color];
            [self addSubview:topLine];
            topLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case ViewSeparatorTypeLeft: {
            UIImageView *leftLine = [[self class] dd_instanceVerticalLine:self.frame.size.height color:color];
            [self addSubview:leftLine];
            leftLine.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleHeight;
        }
            break;
        case ViewSeparatorTypeBottom: {
            UIImageView *bottomLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width color:color];
            bottomLine.frame = CGRectMake(0.0, self.frame.size.height - SeparatorWidth, bottomLine.frame.size.width, SeparatorWidth);
            [self addSubview:bottomLine];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case ViewSeparatorTypeRight: {
            UIImageView *rightLine = [[self class] dd_instanceVerticalLine:self.frame.size.height color:color];
            rightLine.frame = CGRectMake(self.frame.size.width - SeparatorWidth, 0.0, SeparatorWidth, rightLine.frame.size.height);
            [self addSubview:rightLine];
            rightLine.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight;
        }
            break;
        case ViewSeparatorTypeVerticalSide: {
            [self dd_addSeparatorWithType:ViewSeparatorTypeTop color:color];
            [self dd_addSeparatorWithType:ViewSeparatorTypeBottom color:color];
        }
            break;
        case ViewSeparatorTypeHorizontalSide: {
            [self dd_addSeparatorWithType:ViewSeparatorTypeLeft color:color];
            [self dd_addSeparatorWithType:ViewSeparatorTypeRight color:color];
        }
            break;
        default: {
            [self dd_addSeparatorWithType:ViewSeparatorTypeHorizontalSide color:color];
            [self dd_addSeparatorWithType:ViewSeparatorTypeVerticalSide color:color];
        }
            break;
    }
}

- (void)dd_addALSeparatorWithType:(ViewSeparatorType)type {
    [self dd_addALSeparatorWithType:type color:nil];
    
}

- (void)dd_addALSeparatorWithType:(ViewSeparatorType)type color:(UIColor *)color {
    switch (type) {
        case ViewSeparatorTypeTop:{
            UIImageView *topLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width color:color];
            topLine.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:topLine];
            NSArray *hTopContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[topLine]-0-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(topLine)];
            NSArray *vTopContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[topLine(borderWidth)]"
                                                                              options:0
                                                                              metrics:@{@"borderWidth":@(SeparatorWidth)}
                                                                                views:NSDictionaryOfVariableBindings(topLine)];
            [self addConstraints:hTopContraints];
            [self addConstraints:vTopContraints];
        }
            break;
        case ViewSeparatorTypeLeft: {
            UIImageView *leftLine = [[self class] dd_instanceVerticalLine:self.frame.size.height color:color];
            leftLine.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:leftLine];
            NSArray *hLeftContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[leftLine(borderWidth)]"
                                                                                 options:0
                                                                                 metrics:@{@"borderWidth":@(SeparatorWidth)}
                                                                                   views:NSDictionaryOfVariableBindings(leftLine)];
            NSArray *vLeftContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[leftLine]-0-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(leftLine)];
            [self addConstraints:hLeftContraints];
            [self addConstraints:vLeftContraints];
        }
            break;
        case ViewSeparatorTypeBottom: {
            UIImageView *bottomLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width color:color];
            bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:bottomLine];
            NSArray *hBottomContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bottomLine]-0-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(bottomLine)];
            NSArray *vBottomContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomLine(borderWidth)]-0-|"
                                                                                 options:0
                                                                                 metrics:@{@"borderWidth":@(SeparatorWidth)}
                                                                                   views:NSDictionaryOfVariableBindings(bottomLine)];
            [self addConstraints:hBottomContraints];
            [self addConstraints:vBottomContraints];
        }
            break;
        case ViewSeparatorTypeRight: {
            UIImageView *rightLine = [[self class] dd_instanceHorizontalLine:self.frame.size.width color:color];
            rightLine.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview:rightLine];
            NSArray *hRightContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightLine(borderWidth)]-0-|"
                                                                              options:0
                                                                              metrics:@{@"borderWidth":@(SeparatorWidth)}
                                                                                views:NSDictionaryOfVariableBindings(rightLine)];
            NSArray *vRightContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rightLine]-0-|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:NSDictionaryOfVariableBindings(rightLine)];
            [self addConstraints:hRightContraints];
            [self addConstraints:vRightContraints];
        }
            break;
        case ViewSeparatorTypeVerticalSide: {
            [self dd_addALSeparatorWithType:ViewSeparatorTypeTop color:color];
            [self dd_addALSeparatorWithType:ViewSeparatorTypeBottom color:color];
        }
            break;
        case ViewSeparatorTypeHorizontalSide: {
            [self dd_addALSeparatorWithType:ViewSeparatorTypeLeft color:color];
            [self dd_addALSeparatorWithType:ViewSeparatorTypeRight color:color];
        }
            break;
        default: {
            [self dd_addALSeparatorWithType:ViewSeparatorTypeHorizontalSide color:color];
            [self dd_addALSeparatorWithType:ViewSeparatorTypeVerticalSide color:color];
        }
    }
}

- (void)dd_addSeparatorWithType:(ViewSeparatorType)type withColor:(UIColor *)color {
    [self dd_addSeparatorWithType:type color:color];
}

+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width {
    return [self dd_instanceHorizontalLine:width color:[UIColor lightGrayColor]];
}


+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height {
    return [self dd_instanceVerticalLine:height color:[UIColor lightGrayColor]];
}

+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width color:(UIColor *)color {
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, SeparatorWidth)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}

+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height color:(UIColor *)color {
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SeparatorWidth, height)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}

+ (UIImageView *)dd_instanceHorizontalLine:(CGFloat)width andColor:(UIColor *)color {
    return [self dd_instanceHorizontalLine:width color:color];
}

+ (UIImageView *)dd_instanceVerticalLine:(CGFloat)height andColor:(UIColor *)color {
    return [self dd_instanceVerticalLine:height color:color];
}

@end

@implementation UIView (nib)

+ (NSString *)nibName {
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

@interface UIView()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation UIView (DD_MBProgressHUD)

#pragma mark - runtime

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - methods

- (void)dd_showMessageHUD:(NSString *)message {
    if(!self.hud)
        self.hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = [message isKindOfClass:[NSString class]]?message:@"";
    self.hud.yOffset = -50.0f;
    self.hud.userInteractionEnabled = NO;
    [self.hud show:YES];
}

- (void)dd_removeHUD {
    [self.hud hide:YES];
    self.hud = nil;
}

#pragma mark - static methods

+ (void)dd_showMessage:(NSString *)message {
    [self dd_showMessage:message onParentView:nil];
}

+ (void)dd_showMessage:(NSString *)message onParentView:(UIView *)parentView {
    if (!parentView) {
        UIWindow *topWindows = [UIWindow dd_lastWindow];
        parentView = topWindows;
    }
    MBProgressHUD *messageHud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    messageHud.mode = MBProgressHUDModeText;
    messageHud.labelText = [message isKindOfClass:[NSString class]]?message:@"";
    messageHud.yOffset = -50.0f;
    messageHud.userInteractionEnabled = NO;
    [messageHud hide:YES afterDelay:1.0f];
}

+ (void)dd_showDetailMessage:(NSString *)message {
    [self dd_showDetailMessage:message onParentView:nil];
}

+ (void)dd_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView {
    if (!parentView) {
        UIWindow *topWindows = [UIWindow dd_lastWindow];
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


@implementation UIView (DDScreenshot)

- (UIImage *)dd_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

- (UIImage *)dd_screenshotWithOffsetY:(CGFloat)deltaY {
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

@implementation UIView (DDCornerRadius)

- (void)dd_addCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

- (void)dd_addCornerRadius:(CGFloat)radius lineColor:(UIColor *)lineColor {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    if(lineColor){
        self.layer.borderColor = lineColor.CGColor;
        self.layer.borderWidth = SeparatorWidth;
    }
}

- (void)dd_addCornerRadius:(CGFloat)radius andLineColor:(UIColor *)lineColor {
    [self dd_addCornerRadius:radius lineColor:lineColor];
}

@end

@implementation UIView (DDFrameInfo)

- (CGFloat)dd_top {
    return self.frame.origin.y;
}

- (CGFloat)dd_left {
    return self.frame.origin.x;
}

- (CGFloat)dd_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)dd_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGSize)dd_size {
    return self.frame.size;
}

- (CGFloat)dd_width {
    return self.frame.size.width;
}

- (CGFloat)dd_height {
    return self.frame.size.height;
}

- (CGPoint)dd_origin {
    return self.frame.origin;
}

@end

