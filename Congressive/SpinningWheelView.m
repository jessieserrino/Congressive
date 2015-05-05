//
//  SpinningWheelView.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "SpinningWheelView.h"

@interface SpinningWheelView ()

@property (nonatomic, strong) UIActivityIndicatorView *spinningWheel;

@end

@implementation SpinningWheelView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.spinningWheel = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:self.spinningWheel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
