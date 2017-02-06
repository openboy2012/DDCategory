//
//  DDBridgeViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/5.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDBridgeViewController.h"

@interface DDBridgeViewController ()

@property (nonatomic, retain) NSArray *ocArray;
@property (nonatomic, assign) CFArrayRef cfArray;
@property (nonatomic, retain) NSDictionary *dict;
@property (nonatomic, retain) NSMutableDictionary *mDict;

@end

@implementation DDBridgeViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc, no memory leak", self);
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _cfArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, NULL);
    CFRelease(_cfArray);
//    self.ocArray = self.cfArray;
    
    
    [self copyExample];
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

- (void)copyExample
{
    _dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"key",nil];
    NSLog(@"dict retainCount is %lu", _dict.retainCount);
    NSDictionary *dict2 = [self.dict copy];
    NSLog(@"dict2 retainCount is %lu, dict retainCount is %lu", dict2.retainCount, self.dict.retainCount);
    NSDictionary *mutableCopyDict = [self.dict mutableCopy];
    NSLog(@"mutableCopyDict retainCount is %lu, dict retainCount is %lu", mutableCopyDict.retainCount, self.dict.retainCount);
    NSLog(@"dict addess is %p dict2 address is %p mutableCopyDict address is %p", self.dict, dict2, mutableCopyDict);
    [_dict release];
    [_dict release]; //因为immutable类型对象copy是指针拷贝，没有产生新的指针，只是在原来的指针retainCount+1，所以可以对_dict进行2次release而不发生崩溃，第二次[_dict release]与[dict2 release]等价
    [mutableCopyDict release]; //内容复制产生了新的指针，需要手动释放才能避免内存泄漏。
    
    _mDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"1",@"key",nil];
    NSLog(@"mDict retainCount is %lu", _mDict.retainCount);
    NSDictionary *dict3 = [self.mDict copy];
    NSLog(@"dict3 retainCount is %lu, mDict retainCount is %lu", dict3.retainCount, self.mDict.retainCount);
    NSDictionary *dict4 = [self.mDict mutableCopy];
    NSLog(@"dict4 retainCount is %lu, mDict retainCount is %lu", dict4.retainCount, self.mDict.retainCount);
    NSLog(@"mDict addess is %p dict3 address is %p, dict4 address is %p", self.mDict, dict3, dict4);
    [_mDict release];
    [dict4 release]; //内容复制产生了新的指针，需要手动释放才能避免内存泄漏。
    [_mDict release]; //因为mutable类型对象copy以后产生了新的指针，对mDict进行释放是发生崩溃
}

@end
