//
//  DDSearchBar.m
//  DDCategoryDemo
//
//  Created by DeJohn Dong on 2017/6/25.
//  Copyright © 2017年 DDKit. All rights reserved.
//

#import "DDSearchBar.h"

@implementation DDSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    for ( UIView *view in [self.subviews[0] subviews])
    {
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")])
        {
            CGRect frame = view.frame;
            frame.origin.y += 3;
            view.frame = frame;
        }
    }
}

@end
