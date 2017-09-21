//
//  YSIndexButton.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/6/5.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "YSIndexButton.h"

@interface YSIndexButton()
{
    BOOL _isOpen; //是否打开
}

@property (nonatomic, strong) UIView *lineOne;
@property (nonatomic, strong) UIView *lineTwo;
@property (nonatomic, strong) UIView *lineThree;
@property (nonatomic, assign) CGFloat originTwoY;
@property (nonatomic, assign) CGFloat originThreeY;
//@property (nonatomic, strong) CABasicAnimation *animateLineOne;
//@property (nonatomic, strong) CABasicAnimation *animateLineTwo;


@end

@implementation YSIndexButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithFrame:frame];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width/2.0f;
    CGFloat height = 2.0f;
    CGFloat originX = frame.size.width/4.0f;
    CGFloat middlePoint = frame.size.height/2.0f - 1.0;
    
    _lineOne = [[UIView alloc] initWithFrame:CGRectMake(originX, middlePoint, width, height)];
    _lineOne.backgroundColor = [UIColor blackColor];
    [self addSubview:_lineOne];
    
    _lineTwo = [[UIView alloc] initWithFrame:CGRectMake(originX, middlePoint - frame.size.height/4.0f, width, height)];
    _lineTwo.backgroundColor = [UIColor blackColor];
    [self addSubview:_lineTwo];
    _originTwoY = middlePoint - frame.size.height/4.0f;
    
    _lineThree = [[UIView alloc] initWithFrame:CGRectMake(originX, middlePoint + frame.size.height/4.0f, width, height)];
    _lineThree.backgroundColor = [UIColor blackColor];
    [self addSubview:_lineThree];
    _originThreeY = middlePoint + frame.size.height/4.0f;
    
    [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)action:(id)sender
{
    if (!_isOpen)
    {
        [self open];
    }
    else
    {
        [self close];
    }
}

- (void)open
{
    if (_isOpen)
    {
        return;
    }
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.lineThree.frame = self.lineTwo.frame = self.lineOne.frame;
                     }
                     completion:^(BOOL finished) {
                         self.lineOne.hidden = YES;
                         [UIView animateWithDuration:0.3 animations:^{
                             self.lineTwo.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/4.0f);
                             self.lineThree.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI/4.0f);
                         } completion:^(BOOL finished) {
                             _isOpen = YES;
                         }];
                     }];
    
//    _animateLineOne = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
//    _animateLineOne.fromValue = [NSNumber numberWithFloat:_lineTwo.bounds.origin.y];
//    _animateLineOne.toValue = [NSNumber numberWithFloat:_lineOne.bounds.origin.y];
//    _animateLineOne.duration = 0.3f;
//    _animateLineOne.repeatCount = 1;
//    _animateLineOne.delegate = self;
//    
//    [_lineTwo addAnimation:_animateLineOne forKey:@"lineTwoFirst"];
    
//    CABasicAnimation *animateLineOneNext = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animateLineOneNext.fromValue = @0;
//    animateLineOneNext.toValue = [NSNumber numberWithFloat:1.0*M_PI/4.0];
//    animateLineOneNext.duration = 1.0f;
//    animateLineOneNext.beginTime = 1.0f;
//    animateLineOneNext.repeatCount = 1;
//    
//    CAAnimationGroup *groupOne = [CAAnimationGroup animation];
//    groupOne.repeatCount = CGFLOAT_MAX;
//    groupOne.duration = 2.0f;
//    groupOne.animations = @[animateLineOne,animateLineOneNext];
//    [_lineTwo addAnimation:groupOne forKey:@"groupAnnimation"];
    
//    _animateLineTwo = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    _animateLineTwo.fromValue = [NSNumber numberWithFloat:_lineThree.bounds.origin.y];
//    _animateLineTwo.toValue = [NSNumber numberWithFloat:_lineOne.bounds.origin.y];
//    _animateLineTwo.duration = 0.3f;
//    _animateLineTwo.repeatCount = 1;
//    _animateLineTwo.delegate = self;
//    [_lineThree addAnimation:_animateLineTwo forKey:@"lineThreeFirst"];
    
//    CABasicAnimation *animateLineTwoNext = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animateLineTwoNext.fromValue = @0;
//    animateLineTwoNext.toValue = [NSNumber numberWithFloat:-1.0*M_PI/4.0];
//    animateLineTwoNext.duration = 1.0f;
//    animateLineTwoNext.beginTime = 1.0f;
//    animateLineTwoNext.repeatCount = 1;
//    
//    CAAnimationGroup *groupTwo = [CAAnimationGroup animation];
//    groupTwo.repeatCount = CGFLOAT_MAX;
//    groupTwo.duration = 2.0f;
//    groupTwo.animations = @[animateLineTwo,animateLineTwoNext];
//    [_lineThree addAnimation:groupTwo forKey:@"groupAnnimation"];
}

- (void)close
{
    if (!_isOpen)
    {
        return;
    }
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.lineTwo.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 0);
                         self.lineThree.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 0);
                     }
                     completion:^(BOOL finished) {
                         self.lineOne.hidden = NO;
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              self.lineTwo.frame = CGRectMake(self.lineTwo.frame.origin.x, _originTwoY, self.lineTwo.frame.size.width, self.lineTwo.frame.size.height);
                                              self.lineThree.frame = CGRectMake(self.lineThree.frame.origin.x, _originThreeY,self.lineThree.frame.size.width, self.lineThree.frame.size.height);
                                          }
                                          completion:^(BOOL finished) {
                                              _isOpen = NO;
                                          }];
                     }];
}

//- (void)openNext
//{
//    CABasicAnimation *animateLineTwoNext = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animateLineTwoNext.fromValue = @0;
//    animateLineTwoNext.toValue = [NSNumber numberWithFloat:-1.0*M_PI/4.0];
//    animateLineTwoNext.duration = 1.0f;
//    animateLineTwoNext.beginTime = 1.0f;
//    animateLineTwoNext.repeatCount = 1;
//    
//    [_lineTwo addAnimation:animateLineTwoNext forKey:nil];
//}
//
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    if (anim == _animateLineOne && flag)
//    {
//        _lineTwo.frame = _lineTwo.frame;
//        [self openNext];
//    }
//}

@end
