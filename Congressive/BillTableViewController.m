//
//  BillTableViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BillTableViewController.h"
#import "BillProvider.h"
#import "BillInteractor.h"
#import "BillTableViewCell.h"


@interface BillTableViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinningWheel;

@end

@implementation BillTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spinningWheel.center = self.view.center;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.bills.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillTableViewCell" forIndexPath:indexPath];
    return cell;
}

- (void) requestDataForViewController
{
    [self.spinningWheel startAnimating];
    
    [[BillProvider sharedProvider] loadCosponsoredBillsWithPolitician:self.politician completion:^(id data) {
        [self.spinningWheel stopAnimating];
        if([[BillInteractor sharedInteractor] billsWithData:data])
        {
            self.bills  = [BillInteractor sharedInteractor].bills;
            [self.tableView reloadData];
            [self.tableView layoutIfNeeded];
        }
        else
        {
        }
    } error:^(id data, NSError *error) {
        // Error out.
    }];



}


@end
