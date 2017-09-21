//
//  DDTestPageViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/6/7.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDTestPageViewController.h"

@interface DDTestPageViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *contentViewControllers;

@end

@implementation DDTestPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self pageViewController];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.pageViewController setViewControllers:[NSArray arrayWithObjects:_contentViewControllers[2], nil]
                                          direction:UIPageViewControllerNavigationDirectionForward
                                           animated:YES
                                         completion:nil];
    });
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

#pragma mark
#pragma mark ----- UIPageViewControllerDataSource -----
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexForViewController:viewController];
    if (index == 0) {
        index = [self.contentViewControllers count] - 1;
    } else {
        index--;
    }
    return [self viewControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexForViewController:viewController];
    index++;
    if (index == [self.contentViewControllers count]) {
        index = 0;
    }
    return [self viewControllerAtIndex:index];
}
- (NSUInteger)indexForViewController:(UIViewController *)viewController
{
    return [self.contentViewControllers indexOfObject:viewController];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (index > [self.contentViewControllers count]) {
        return nil;
    }
    UIViewController *vc = [self.contentViewControllers objectAtIndex:index];
    return vc;
}
#pragma mark
#pragma mark ----- UIPageViewControllerDelegate -----
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    NSLog(@"pendingViewControllers is %@ ", pendingViewControllers);
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSLog(@"previousViewController is %@ finished reulst is %d, completed is %d", previousViewControllers, finished, completed);
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return UIPageViewControllerSpineLocationMid;
}
#pragma mark
#pragma mark Init
- (UIPageViewController *)pageViewController
{
    if(!_pageViewController)
    {
        NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
                                                           forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                            options:options];
        [[_pageViewController view] setFrame:[[self view] bounds]];
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor = [UIColor redColor];
        UIViewController *vc2 = [UIViewController new];
        vc2.view.backgroundColor = [UIColor orangeColor];
        UIViewController *vc3 = [UIViewController new];
        vc3.view.backgroundColor = [UIColor greenColor];
        UIViewController *vc4 = [UIViewController new];
        vc4.view.backgroundColor = [UIColor blueColor];
        _contentViewControllers = [NSMutableArray arrayWithObjects:vc1,vc2,vc3,vc4,nil];
        // 设置UIPageViewController的配置项
        [_pageViewController setViewControllers:[NSArray arrayWithObjects:_contentViewControllers[0], nil]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        [self addChildViewController:self.pageViewController];
        [self.view addSubview:self.pageViewController.view];
        
    }
    return _pageViewController;
    
}

@end
