//
//  SecondViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "SecondViewController.h"
#import "YSIndexButton.h"
#import "DDObject.h"
#include <stdio.h>
#include <queue>
#include <map>
#include <pthread.h>
using namespace std;

@interface SecondViewController ()<CAAnimationDelegate>
{
    NSRecursiveLock *_rLock;
    
    std::queue<unsigned char *> myQueue;
    std::map<char *, char *> myMap;
    
    pthread_mutex_t mutex;
    
    CGFloat x;
    
    CGFloat lastScale;
}

@property (nonatomic, strong) DDObject *arcObj;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;
@property (nonatomic, strong) NSMutableDictionary *mDict;
@property (atomic, assign) BOOL isDisappear;
@property (nonatomic, weak) IBOutlet UIImageView *animateImageView;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinch;


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
    
    NSMutableArray *images = [NSMutableArray new];
    for (int i = 1; i< 11; i++ ) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"battery_s_%d_", i]]];
    }
    self.animateImageView.animationImages = images;
    [self.animateImageView startAnimating];
    
    [self.collectionView addGestureRecognizer:self.pinch];
    x = 10.0f;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _isDisappear = NO;

    YSIndexButton *indexButton = [[YSIndexButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 40.0f)/2.0f, 140, 40, 40.0f)];
    [self.view addSubview:indexButton];
//    [indexButton open];
    
//    if (!_thread1)
//    {
//        _thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop1) object:nil];
//    }
//    
//    if (!_thread2)
//    {
//        _thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop2) object:nil];
//    }
//    
//    if (!_thread3)
//    {
//        _thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(runLoop3) object:nil];
//    }
//    [_thread1 start];
//    [_thread2 start];
//    [_thread3 start];
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

- (void)dd_scale:(id)sender
{
    UIPinchGestureRecognizer *recognizer = sender;
    CGFloat tempScale = recognizer.scale * lastScale;
    
    CGFloat max = 12;
    CGFloat min = 1 / 24;
    if (tempScale > max) {
        tempScale = max;
    }
    
    if (tempScale < min) {
        tempScale = min;
    }
    lastScale = x = x * tempScale;
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 4;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"1234" forIndexPath:indexPath];
    
    if (indexPath.section == 2)
    {
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
        cell.contentView.layer.borderWidth = 1.0/[UIScreen mainScreen].scale;
        //        UITableViewCell *cell = [[UITableViewCell alloc] init];
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //        [cell.contentView addSubview:cell.accessoryView];
    }
    else{
        // Configure the cell
        cell.backgroundColor = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1.0];
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)layout numberOfColumnsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 1;
    }
    return 3;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
 return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 
 }
 */


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(x, x * 9/16.0);
}

#pragma mark - GET/SET Methods

- (UIPinchGestureRecognizer *)pinch
{
    if (!_pinch)
    {
        _pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(dd_scale:)];
    }
    return _pinch;
}

@end
