//
//  TabBarViewController.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Politician.h"

@interface TabBarViewController : UITabBarController

@property (nonatomic, strong) Politician *politician;

@end
