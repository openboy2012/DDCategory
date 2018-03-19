//
//  DDOrientationViewController.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/3/30.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDOrientationViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DDOrientationViewController ()

@property (nonatomic, weak) IBOutlet UIView *playerView;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation DDOrientationViewController

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"player"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doTest:) name:@"DDNotificationTests" object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doTest:) name:UIKeyboardWillShowNotification object:nil];
    
    [self addObserver:self forKeyPath:@"player" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"456" ofType:@"mov"]]];
    self.player = [AVPlayer playerWithPlayerItem:playItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    playerLayer.frame = self.playerView.bounds;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.playerView.layer addSublayer:playerLayer];
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndPause;
    [self.player play];
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

- (BOOL)shouldAutorotate {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    //是否横屏
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        [self.navigationController.navigationBar setHidden:YES];
        self.playerView.translatesAutoresizingMaskIntoConstraints = YES;
        [UIView animateWithDuration:duration
                         animations:^{
                             self.playerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
                         }
                         completion:^(BOOL finished) {
                             self.playerView.frame = [UIScreen mainScreen].bounds;
                         }];
    } else {
        [self.navigationController.navigationBar setHidden:NO];
        self.playerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.playerView layoutIfNeeded];
        [self.playerView setNeedsLayout];
    }
    
//    DDLogInfo(@"bounds = %@", [NSValue valueWithCGRect:[UIScreen mainScreen].bounds]);
}

#pragma mark - Notification Methods

- (void)doTest:(NSNotification *)notification
{
//    DDLogInfo(@"notification = %@", notification);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
}

@end
