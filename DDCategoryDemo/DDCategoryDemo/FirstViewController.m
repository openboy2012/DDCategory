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
@property (nonatomic, strong) NSTimer *timer;

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
//    dispatch_queue_t dispatchQueue = dispatch_queue_create("ted.queue.next", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t dispatchGroup = dispatch_group_create();
//    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
//        dispatch_semaphore_t s = dispatch_semaphore_create(0);
//        NSLog(@"dispatch-1");
//        dispatch_semaphore_wait(s, DISPATCH_TIME_FOREVER);
//    });
//    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
//        NSLog(@"dispatch-2");
//    });
//    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
//        NSLog(@"end");
//    });
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor; //圆环底色
    layer.frame = CGRectMake(100, 100, 110, 110);
    
    
    //创建一个圆环
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(55, 55) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    //圆环遮罩
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1.0;
    shapeLayer.lineCap = @"round";
    shapeLayer.lineDashPhase = 0.8;
    shapeLayer.path = bezierPath.CGPath;
    
    //颜色渐变
    NSMutableArray *colors = [NSMutableArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor whiteColor].CGColor, nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.shadowPath = bezierPath.CGPath;
    gradientLayer.frame = CGRectMake(50, 50, 60, 60);
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 0);
    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
    [layer addSublayer:gradientLayer]; //设置颜色渐变
    [layer setMask:shapeLayer]; //设置圆环遮罩
    [self.view.layer addSublayer:layer];
    
    //动画
//    CABasicAnimation *scaleAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation1.fromValue = [NSNumber numberWithFloat:1.0];
//    scaleAnimation1.toValue = [NSNumber numberWithFloat:1.5];
//    scaleAnimation1.autoreverses = YES;
//    // scaleAnimation1.fillMode = kCAFillModeForwards;
//    scaleAnimation1.duration = 0.8;
    
    CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation2.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation2.toValue = [NSNumber numberWithFloat:6.0*M_PI];
//    rotationAnimation2.autoreverses = YES;
    // scaleAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation2.repeatCount = MAXFLOAT;
//    rotationAnimation2.beginTime = 0.8; //延时执行，注释掉动画会同时进行
    rotationAnimation2.duration = 2;
    
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = 4;
//    groupAnnimation.autoreverses = YES;
    groupAnnimation.animations = @[rotationAnimation2];
    groupAnnimation.repeatCount = MAXFLOAT;
//    [layer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
    
    DDObject *obj = [[DDObject alloc] init];
    NSLog(@"book is %@", [obj book]);
    CFRunLoopGetCurrent();
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:[self class] selector:@selector(testLog) userInfo:nil repeats:YES];
//    
//    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"123"];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"HH:mm:ss";
}

//+ (void)testLog
//{
//    NSLog(@"12345");
//}

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
    __unused NSUInteger i = -1;
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
