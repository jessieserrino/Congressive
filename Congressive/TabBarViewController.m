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
}

- (void) passPoliticianInformation
{
    for(UIViewController<PoliticianDetailProtocol> *vc in self.viewControllers)
        vc.politician = self.politician;
}
- (void) loadExtraInformation
{
    [[DonorDataProvider sharedProvider] loadFinancialDataWithPolitician:self.politician successBlock:^(id data) {
        
    } errorBlock:^(id data, NSError *error) {
        
    }];
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
