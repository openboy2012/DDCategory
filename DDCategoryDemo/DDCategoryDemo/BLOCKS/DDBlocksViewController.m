//
//  DDBlocksViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/4.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDBlocksViewController.h"

typedef void(^ CycleReferenceBlock)(void);

@interface DDBlocksViewController ()

@property (nonatomic, weak) IBOutlet UIButton *btnCrash; //Crash按钮
@property (nonatomic) BOOL isUseCrashCode; //是否运行崩溃的代码
@property (nonatomic, copy) CycleReferenceBlock block; //声明block成员变量，ARC环境下，用strong与copy关键字都一样，都会对block内存进行copy
@property (nonatomic, weak) IBOutlet UISwitch *switchCycleReferen; //循环引用开关

@end

@implementation DDBlocksViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc, no memory leak", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //block内存变化示例
    //[self blockMemoryChangeExample];
    
    //block关键字变化引用示例
    [self blockExample];
    
    //block循环引用示例
    //[self cycleReferenceBlockExample];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(doDelayEvent) withObject:nil afterDelay:2.0f];
    [self performSelector:@selector(doDelayEvent) withObject:nil afterDelay:2.0f];
}

- (void)doDelayEvent
{
    NSLog(@"delay event finished");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickCrashButton:(id)sender {
    self.isUseCrashCode = YES; //设置打印崩溃的代码
    [self blockExample];
}

/**
 block内存变化示例 内存的变化顺序为{->[alloc]GlobalBlock、->[alloc]StackBlock->[copy]MallocBlock}, block最初被设定的内存类型为全局内存类型（无外部变量），当block内部出现外部变量时转换为栈内存类型，再当此栈内存block被外部持有（copy）操作时会变成堆内存类型。
 */
- (void)blockMemoryChangeExample {
    
    void (^ddkitBlockGlobal)() = ^(){
        int b = 18;
        //没有引用外部变量的block是__NSGlobalBlock__
        NSLog(@"this is global block b is %d", b);
    };
    NSLog(@"this block type is %@", ddkitBlockGlobal); //block内部没有使用任何的外部变量，所以是__NSGlobalBlock__
    ddkitBlockGlobal();
    
    int a = 28;
    
    //使用__weak能阻止编译器对block进行copy操作，从而保证了block的内存类型是栈block(__NSStackBlock__)
    __weak void (^ddkitBlockStack)() = ^(){
        int b = a;
        //使用外部变量的block是__NSStackBlock__
        NSLog(@"this is stack block, b is %d", b);
    };
    NSLog(@"this block type is %@", ddkitBlockStack); //block内部使用了的外部变量a，所以是__NSStackBlock__
    ddkitBlockStack();
    
    //block赋值操作
    void (^blockMemoryType)(void) = ddkitBlockGlobal; //对全局内存block copy不会形成堆内存block，内存地址也没有发生改变
    NSLog(@"copy from ddkitBlockGlobal blockMemoryType is %@, ddkitBlockGlobal is %@", blockMemoryType, ddkitBlockGlobal);
    blockMemoryType = ddkitBlockStack; //对栈内存block copy会形成堆内存block, 会产生新的地址
    NSLog(@"copy from ddkitBlockStack blockMemoryType is %@, ddkitBlockStack is %@", blockMemoryType, ddkitBlockStack);
}

- (void)blockExample {
    int a = 49;
    
//    __weak //使用__weak也能阻止编译器对block进行copy操作，而且更加安全，这里使用__unsafe_unretained只是试验关键字的效果
    __unsafe_unretained //此处加上__unsafe_unretained是因为在ARC环境下可以阻止Clang编译器对block进行copy操作，从而保持block的内存类型是栈类型
    void (^ddkitBlockNoCopy)() = ^(){
        int b = a;
        /*
         因为引用了block之外的外部变量，所以是栈block
         这里运行到了打印ddkitBlockTwo的时侯崩溃，因为使用了__unsafe_unretained关键让ARC环境下不对block进行copy操作。
         结合打印的日志，这里证明了2点：
         1.__unsafe_unretained确实在ARC的环境下让block赋值操作时不自动copy，从而保证了block的内存类型是栈block(__NSStackBlock__);
         2.__unsafe_unretained确实不安全，在运行到}结束时，指针对象已经被清理，但指针还是保存着之前的地址，再访问时造成了EXC_BAD_ACCESS
         */
        #warning 因为ddkitBlockTwo是局部变量，不存在循环引用的问题，可以放心地在{}引用self
        if (self.isUseCrashCode) {
            NSLog(@"this block type is %@ b is %d", ddkitBlockNoCopy, b);
        } else {
            NSLog(@"this is stack block, b is %d", b);
        }
    };
    NSLog(@"this block type is %@", ddkitBlockNoCopy); //这里能正确打印block的类型，此处为__NSStackBlock__
    ddkitBlockNoCopy();
    
    //在ARC环境下，默认关键字是__strong，会对block进行copy操作，所以block的内存类型会变成堆类型；同理在MRC环境下需要显示调用copy方法来把GlobalBlock或者StackBlock转换成MallocBlock
    void (^ddkitBlockMalloc)() = ^(){
        int b = a + a;
        //引用了外部变量，并且把这个block赋值给了ddkitBlockTwo(有copy操作)，所以是__NSMallocBlock__
        NSLog(@"this block type is %@ b is %d", ddkitBlockMalloc, b); //因为ddkitBlockThree是局部变量，在ARC环境下到了{}之外就会被清理，所以会打印null空指针
    };
    NSLog(@"this block type is %@", ddkitBlockMalloc);
    ddkitBlockMalloc();
}

- (IBAction)cycleReferenceBlockExample {
    if (self.switchCycleReferen.on) {
        __weak __typeof(self) bSelf = self; //因为block是self的成员变量，会造成循环引用的问题，所以在block外部先__weak一次打破循环引用
        self.block = ^() {
            NSLog(@"this is cycle reference in blocks, result is %d, cycle reference is broken, this viewContoller can dealloc", bSelf.isUseCrashCode);
        };
        self.block();
    } else {
        self.block = ^() {
            NSLog(@"this is cycle reference in blocks, result is %d, cycle reference is happened, this viewContoller can't dealloc", self.isUseCrashCode);
        };
        self.block();
    }
}

@end
