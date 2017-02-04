//
//  DDARCViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDARCViewController.h"
#import "DDObject.h"

@interface DDARCViewController ()

@property (nonatomic, weak) IBOutlet UISwitch *switchAutoRelease; //__autorelease关键字开关
@property (nonatomic, weak) IBOutlet UISwitch *switchShowAutoReleasePool; //显式@autoreleasepool开关

@property (nonatomic, strong) NSThread *thread1; //线程1
@property (nonatomic, strong) NSThread *thread2; //线程2
@property (nonatomic, strong) DDObject *arcObj;

@end

@implementation DDARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btnARC = [UIButton buttonWithType:UIButtonTypeCustom]; //ARC情况下不需要特别关心内存管理，开发门槛大大降低
    //_btnARC = [[UIButton alloc] init];
    [self.view addSubview:_btnARC];
    
    if (!_thread1)
    {
        _thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop1) object:nil];
    }
    [_thread1 start];
    
    if (!_thread2)
    {
        _thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop2) object:nil];
    }
    [_thread2 start];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_btnARC setFrame:CGRectMake(100, 100, 100.0, 20)];
    [_btnARC setTitle:@"ARC Button" forState:UIControlStateNormal];
    _btnARC.backgroundColor = [UIColor redColor];
    [_btnARC addTarget:self action:@selector(testAutoReleasePool) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAutoReleasePool
{
    NSLog(@"====== autoreleasepool method begin ======"); //增加打印分割标识
    
    if (self.switchShowAutoReleasePool.on) {//是否初始化显式的@autoreleasepool
        @autoreleasepool { //创建显示autorelease pool，与NSAutoReleasePool的效果一样
            [self doForMethod]; //执行for循环方法
        }
    } else {
        [self doForMethod];
    }
    
    NSLog(@"====== autoreleasepool method end ======");  //增加打印分割标识
}

- (void)doForMethod {
    for (int i = 0; i < 5; i++) {
        if (self.switchAutoRelease.on) { //是否使用__autoreleasing关键字
            __unused __autoreleasing DDObject *object = [[DDObject alloc] init]; //有__autoreleasing关键字方法,与MRC下的autorelease效果一样
        } else {
            __unused DDObject *object = [[DDObject alloc] init]; //编译器会自动加上release
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)runLoop1 {
    DDObject *object = [[DDObject alloc] init];
    self.arcObj = object;
}

- (void)runLoop2 {
    sleep(5);
    if (self.arcObj)
    {
        self.arcObj = nil;
    }
}

@end
