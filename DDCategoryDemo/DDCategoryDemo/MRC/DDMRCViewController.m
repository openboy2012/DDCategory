//
//  DDMRCViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDMRCViewController.h"
#import "DDObject.h"

@interface DDMRCViewController ()

@property (nonatomic, assign) IBOutlet UISwitch *switchAutoRelease; //autorelease关键字开关，MRC下用assign修饰 IBOutlet
@property (nonatomic, assign) IBOutlet UISwitch *switchShowAutoReleasePool; //显式autoreleasepool开关


@end

@implementation DDMRCViewController

@synthesize btnMRC = _btnMRC;

- (void)dealloc
{
    NSLog(@"_btnMRC.retainCount is %lu", _btnMRC.retainCount);
    [_btnMRC release]; //这里release需要注意，如果构建的指针对象是通过实例方法创建如alloc、new等，这里需要release一次，否则
    NSLog(@"_btnMRC.retainCount is %lu", _btnMRC.retainCount);
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"_btnMRC.retainCount is %lu", _btnMRC.retainCount);
//    //_btnMRC = [UIButton buttonWithType:UIButtonTypeCustom]; //类方法创建的对象在ARC的情况下会默认加上autorelease,所以在dealloc不需要再手动释放
//    _btnMRC = [[UIButton alloc] init]; //实例方法创建的对象，需要dealloc的时候进行一次release释放
//    NSLog(@"_btnMRC.retainCount is %lu", _btnMRC.retainCount);
//    [self.view addSubview:_btnMRC]; //addSubView方法会retainCount+1
//    NSLog(@"_btnMRC.retainCount is %lu", _btnMRC.retainCount);
//    
//    [_btnMRC addTarget:self action:@selector(testAutoReleasePool) forControlEvents:UIControlEventTouchUpInside];
    
    [self mrcGlobalBlockExample];
    [self mrcStackBlockExample];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_btnMRC setFrame:CGRectMake(100, 100, 100.0, 20)];
    [_btnMRC setTitle:@"MRC Button" forState:UIControlStateNormal];
    _btnMRC.backgroundColor = [UIColor redColor];
}

- (void)viewDidUnload {
#warning iOS 6.0以前如果收到memory warning的警告，系统会先viewDidUnload来处理view的释放，如果不在viewDidUnload里处理释放操作，然后系统会重新加载viewDidLoad方法，如果那里的UI内存没有处理得很好，很容易造成野指针的内存泄露。iOS 6.0以后已经废弃了这个方法，跟进ARC的进度
//    [self.btnMRC release];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
#warning iOS 6.0 以后在这里处理非UI资源的释放内存
}

- (IBAction)testAutoReleasePool
{
    NSLog(@"====== autoreleasepool method begin ======"); //增加打印分割标识
    NSAutoreleasePool *pool = nil; //声明一个显式的NSAutoReleasePool
    if (self.switchShowAutoReleasePool.on) {//是否初始化显式的NSAutoReleasePool
         pool = [[NSAutoreleasePool alloc] init]; //显式创建一个NSAutoReleasePool
    }
    for (int i = 0; i < 5; i++) {
        if (self.switchAutoRelease.on) {
            __unused DDObject *object = [[[DDObject alloc] init] autorelease]; //有autorelease关键字方法，会自动加标识到NSAutoReleasePool里去：如果有显式创建的pool存在，该对象会在显式的Pool里被标识，当Pool释放时该对象；如果没有显示的Pool，会加到系统自动创建的NSAutoReleasePool（隐式的Pool）里去，跟NSRunLoop有关，该Pool会在当次RunLoop结束时执行release。通常是『{}』的}的时候触发，看打印结果可知。

        } else {
            DDObject *object = [[DDObject alloc] init];
            [object release]; //创建以后就release释放
        }
    }
    if (self.switchShowAutoReleasePool.on) {//是否初始化显式的NSAutoReleasePool
        [pool release];
    }
    NSLog(@"====== autoreleasepool method end ======");  //增加打印分割标识
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - MRC下测试block相关的retain、release、copy操作
//全局内存Block尝试retain、copy、release等方法
- (void)mrcGlobalBlockExample
{
    NSLog(@"===== MRC GlobalBlock retainCount methods begin =====");
    void (^ddkitBlockGlobal)() = ^(){
        int b = 18;
        //没有引用外部变量的block是__NSGlobalBlock__
        NSLog(@"this is global block b is %d", b);
    };
    ddkitBlockGlobal();
    [ddkitBlockGlobal release]; //release操作对全局内存Block无效
    
    NSLog(@"ddkitBlockGlobal retainCount = %lu", [ddkitBlockGlobal retainCount]);
    void (^ddkitBlockGlobalRetain)() = [ddkitBlockGlobal retain]; //尝试retain方法
    NSLog(@"ddkitBlockGlobal[%@] retainCount = %lu, ddkitBlockGlobalRetain[%@] retainCount = %lu", ddkitBlockGlobal, [ddkitBlockGlobal retainCount], ddkitBlockGlobalRetain, [ddkitBlockGlobalRetain retainCount]);
    
    void (^ddkitBlockGlobalCopy)() = [ddkitBlockGlobal copy]; //尝试copy方法
    NSLog(@"ddkitBlockGlobal[%@] retainCount = %lu, ddkitBlockGlobalCopy[%@] retainCount = %lu", ddkitBlockGlobal, [ddkitBlockGlobal retainCount], ddkitBlockGlobalCopy, [ddkitBlockGlobalCopy retainCount]);
    
    NSLog(@"===== MRC GlobalBlock retainCount methods end =====");

}

//栈内存Block尝试retain、copy、release等方法
- (void)mrcStackBlockExample
{
    NSLog(@"===== MRC StackBlock retainCount methods begin =====");

    int a = 10;
    void (^ddkitBlockGlobal)() = ^(){
        int b = 28 + a;
        //引用外部变量的block是__NSStackBlock__
        NSLog(@"this is stack block b is %d", b);
    };
    ddkitBlockGlobal();
    [ddkitBlockGlobal release]; //release操作对栈内存Block无效
    
    NSLog(@"ddkitBlockGlobal retainCount = %lu", [ddkitBlockGlobal retainCount]);
    void (^ddkitBlockGlobalRetain)() = [ddkitBlockGlobal retain]; //尝试retain方法
    NSLog(@"ddkitBlockGlobal[%@] retainCount = %lu, ddkitBlockGlobalRetain[%@] retainCount = %lu", ddkitBlockGlobal, [ddkitBlockGlobal retainCount], ddkitBlockGlobalRetain, [ddkitBlockGlobalRetain retainCount]);
    
    void (^ddkitBlockGlobalCopy)() = [ddkitBlockGlobal copy]; //尝试copy方法
    NSLog(@"ddkitBlockGlobal[%@] retainCount = %lu, ddkitBlockGlobalCopy[%@] retainCount = %lu", ddkitBlockGlobal, [ddkitBlockGlobal retainCount], ddkitBlockGlobalCopy, [ddkitBlockGlobalCopy retainCount]);
    [ddkitBlockGlobalCopy release]; //release操作对堆内存Block有效，所以下一行注释掉代码出现崩溃。
    //NSLog(@"ddkitBlockGlobalCopy = %@",ddkitBlockGlobalCopy);
    
    NSLog(@"===== MRC StackBlock retainCount methods end =====");
}


@end
