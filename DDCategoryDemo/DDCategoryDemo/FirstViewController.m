//
//  FirstViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "FirstViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIViewController+DDKit.h"
#import "NSArray+DDKit.h"
#import "NSObject+DDKit.h"
#import "DDObject.h"
#import <MessageUI/MFMessageComposeViewController.h>

@interface FirstViewController ()<MFMessageComposeViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIButton *buttonClicked;
@property (nonatomic, weak) IBOutlet UIGestureRecognizer *recognizer;
@property (nonatomic, weak) IBOutlet UILabel *lblTap;

@end

@implementation FirstViewController

//+ (BOOL)instancesRespondToSelector:(SEL)aSelector
//{
//    return NO;
//}
//+ (BOOL)conformsToProtocol:(Protocol *)protocol
//{
//    return NO;
//}
//- (IMP)methodForSelector:(SEL)aSelector
//{
//    return [super methodForSelector:aSelector];
//}
//
//+ (IMP)instanceMethodForSelector:(SEL)aSelector
//{
//    return nil;
//}
//
//- (void)doesNotRecognizeSelector:(SEL)aSelector
//{
//    NSLog(@"aSelector = %s", aSelector);
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    return nil;
//}

//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    
//}


+ (void)load
{
    
}

+ (void)initialize
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"data length is %d", [NSData data].length);
//    DDLogDebug(@"1234");
//    DDLogInfo(@"1234");    
    dispatch_queue_t dispatchQueue = dispatch_queue_create("ted.queue.next", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_semaphore_t s = dispatch_semaphore_create(0);
        NSLog(@"dispatch-1");
        dispatch_semaphore_wait(s, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        NSLog(@"dispatch-2");
    });
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
    
    DDObject *obj = [[DDObject alloc] init];
    NSLog(@"book is %@", [obj book]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
//    DDLogDebug(@"[UIScreen mainScreen].bounds = %@ \n self.view.bounds = %@ duration = %.2f", [NSValue valueWithCGRect:[UIScreen mainScreen].bounds], [NSValue valueWithCGRect:self.view.bounds], duration);
//    sleep(2);
    [UIView animateWithDuration:duration animations:^{
        //同步动画，旋转耗时会把这个睡眠时间加上
        sleep(3);
    }];
}

- (IBAction)clicked:(id)sender {
    NSLog(@"clicked");
    

//    [CATransaction begin];
//    
//    //显式事务默认开启动画效果,kCFBooleanTrue关闭
//    
//    [CATransaction setValue:(id)kCFBooleanFalse
//     
//                     forKey:kCATransactionDisableActions];
//    
//    //动画执行时间
//    
//    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
//    
//    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
//    
//    self.buttonClicked.layer.cornerRadius = (self.buttonClicked.layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
//    
//    self.buttonClicked.layer.opacity = (self.buttonClicked.layer.opacity == 1.0f) ? 0.5f : 1.0f;
//    
//    [CATransaction commit];
    
}

- (IBAction)tap:(id)sender {
    NSLog(@"taped");
    
    [self.tabBarController dismissViewControllerAnimated:YES completion:NULL];

//    self.buttonClicked.enabled = !self.buttonClicked.enabled;
//    NSArray *array = @[@(UIInterfaceOrientationLandscapeLeft),@(UIInterfaceOrientationPortrait),@(UIInterfaceOrientationLandscapeRight)];
//    [self dd_benchmark:^{
//        [self dd_forceInterfaceOrientation:[[array dd_objectAtIndex:rand()%3] integerValue]];
//    }
//            completion:^(double ms){
//                DDLogInfo(@"旋转花费时间：%.6fms", ms);
//            }];
//    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc]init];
//    
//    picker.messageComposeDelegate = self;
//    
//    //推荐的电话号码
//    picker.recipients = @[@"1069070069"];
//    
//    picker.body = @"重置密码8502";
//    
//    [self presentViewController:picker animated:YES completion:nil];
    
}

#pragma mark - MFMessageComposeViewControllerDelegate methods

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    if (result != MessageComposeResultSent)
    {
        [controller dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
