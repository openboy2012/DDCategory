//
//  DDBlocksViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/4.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDBlocksViewController.h"

@interface DDBlocksViewController ()

@end

@implementation DDBlocksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    void (^ddkitBlockOne)() = ^(){
        int b = 20;
        //没有引用外部变量的block是__NSGlobalBlock__
        NSLog(@"this is global block b is %d", b);
    };
    NSLog(@"this block type is %@", ddkitBlockOne); //block内部没有使用任何的外部变量，所以是__NSGlobalBlock__
    ddkitBlockOne();
    
    int a = 20;
    //因为此处是ARC环境下编译，加上__unsafe_unretained是阻止Clang编译器对block进行copy操作
    __unsafe_unretained void (^ddkitBlockTwo)() = ^(){
        int b = a;
        /*
         因为引用了block之外的外部变量，所以是栈block
         这里运行到了打印ddkitBlockTwo的时侯崩溃，因为使用了__unsafe_unretained关键让ARC环境下不对block进行copy操作。
         结合打印的日志，这里证明了2点：
         1.__unsafe_unretained确实在ARC的环境下让block赋值操作时不自动copy，从而保证了block的内存类型是栈block(__NSStackBlock__);
         2.__unsafe_unretained确实不安全，在运行到}结束时，指针对象已经被清理，但指针还是保存着之前的地址，再访问时造成了EXC_BAD_ACCESS
         */
        NSLog(@"this block type is %@ b is %d", ddkitBlockTwo, b);
    };
    NSLog(@"this block type is %@", ddkitBlockTwo); //这里能正确打印block的类型，此处为__NSStackBlock__
    ddkitBlockTwo();
    
    //ARC环境下，默认关键字是__strong，会对block进行copy操作，所以在MRC环境下需要显示调用copy方法来把GlobalBlock或者StackBlock转换成MallocBlock
    void (^ddkitBlockThree)() = ^(){
        int b = a + a;
        //引用了外部变量，并且把这个block赋值给了ddkitBlockTwo(有copy操作)，所以是__NSMallocBlock__
        NSLog(@"this block type is %@ b is %d", ddkitBlockThree, b); //因为ddkitBlockThree是局部变量，在ARC环境下到了{}之外就会被清理，所以会打印null空指针
    };
    NSLog(@"this block type is %@", ddkitBlockThree);
    ddkitBlockThree();
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

@end
