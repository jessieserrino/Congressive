//
//  TabBarViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "TabBarViewController.h"
#import "PoliticianDetail.h"
#import "DonorDataProvider.h"
#import "BillProvider.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self passPoliticianInformation];
    [self loadExtraInformation];
    
    [self.tabBar setTintColor:[UIColor whiteColor]];
}

- (void) passPoliticianInformation
{
    for(UIViewController<PoliticianDetailProtocol> *vc in self.viewControllers)
        vc.politician = self.politician;
}
- (void) loadExtraInformation
{
    for(UIViewController<PoliticianDetailProtocol> *vc in self.viewControllers)
        [vc requestDataForViewController];
}

@end
