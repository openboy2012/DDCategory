//
//  SecondViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "SecondViewController.h"
#import "DDObject.h"
#include <stdio.h>
#include <queue>
#include <map>
#include <pthread.h>
using namespace std;

@interface SecondViewController ()
{
    NSRecursiveLock *_rLock;
    
    std::queue<unsigned char *> myQueue;
    std::map<char *, char *> myMap;
    
    pthread_mutex_t mutex;
    
}

@property (nonatomic, strong) DDObject *arcObj;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;
@property (nonatomic, strong) NSMutableDictionary *mDict;
@property (atomic, assign) BOOL isDisappear;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (!_mDict)
    {
        _mDict = [NSMutableDictionary new];
    }
    
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    //pthread_mutex_init always return 0
    pthread_mutex_init(&mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _isDisappear = NO;

    if (!_thread1)
    {
        _thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop1) object:nil];
    }
    
    if (!_thread2)
    {
        _thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop2) object:nil];
    }
    
    if (!_thread3)
    {
        _thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop3) object:nil];
    }
    [_thread1 start];
    [_thread2 start];
    [_thread3 start];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.isDisappear = YES;
    [_thread1 cancel];
    _thread1 = nil;
    [_thread2 cancel];
    _thread2 = nil;
    [_thread3 cancel];
    _thread3 = nil;
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runLoop1 {
//    DDObject *object = [[DDObject alloc] init]; //当前线程创建了DDObject对象
//    self.arcObj = object;
    int i = 0;
    for (; ; ) {
        if (self.isDisappear) {
            break;
        }
        i++;
//        pthread_mutex_lock(&mutex);
//        unsigned char *data = new unsigned char[10];
//        NSInteger randNumber = rand() % 100000;
//        NSString *randStr = [NSString stringWithFormat:@"%ld",(long)randNumber];
//        memcpy(data, [randStr UTF8String], 10);
//        myQueue.push(data);
//        printf("thread 1 myQueue's size is %lu \n", myQueue.size());
//        pthread_mutex_unlock(&mutex);
//        usleep(rand() % 100);
//        std::string key("1");
//        myMap.insert(map<char *, char *>::value_type( data, data));
    }
}

- (void)runLoop2 {
    
//    sleep(5); //睡眠5秒，确保该线程能数据同步到arcObj;
//    if (self.arcObj) {
//        self.arcObj = nil; //当前线程做了最后一次release，当前线程会执行DDObject的dealloc方法
//    }
    
    for (; ; ) {
        pthread_mutex_lock(&mutex);
//        if (myQueue.empty()) {
//            pthread_mutex_unlock(&mutex);
//            continue;
//        }
//        unsigned char *data = myQueue.front();
//        printf("thread 2 data value is %s \n",data);
//        if (data) {
//            myQueue.pop();
//            delete data;
//        }
//        printf("thread 2 myQueue's size is %lu \n", myQueue.size());
//        [_mDict setObject:[NSDate date] forKey:@"mDate"];
//        NSInteger randNumber = rand() % 100000;
//        NSString *randStr = [NSString stringWithFormat:@"%ld",(long)randNumber];
        DDObject *ddObject = [[DDObject alloc] init];
        [_mDict setObject:ddObject forKey:@"mDate"];
        pthread_mutex_unlock(&mutex);
        if (self.isDisappear) {
            break;
        }
    }
}

- (void)runLoop3
{
    for (;;) {
        pthread_mutex_lock(&mutex);
//        NSDate *date = [_mDict objectForKey:@"mDate"];
//        NSString *date = [_mDict objectForKey:@"mDate"];
        DDObject *date = [_mDict objectForKey:@"mDate"];
        pthread_mutex_unlock(&mutex);
        NSLog(@"date is %@", date);
        usleep(100);
    }
}



@end
