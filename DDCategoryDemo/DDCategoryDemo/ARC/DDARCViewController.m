//
//  DDARCViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/2/3.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDARCViewController.h"

@interface DDARCViewController ()

@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;

@end

@implementation DDARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btnARC = [UIButton buttonWithType:UIButtonTypeCustom]; //ARC情况下不需要特别关心内存管理，开发门槛大大降低
    //_btnARC = [[UIButton alloc] init];
    [self.view addSubview:_btnARC];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_btnARC setFrame:CGRectMake(100, 100, 100.0, 20)];
    [_btnARC setTitle:@"ARC Button" forState:UIControlStateNormal];
    _btnARC.backgroundColor = [UIColor redColor];
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
