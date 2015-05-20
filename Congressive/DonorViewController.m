//
//  FinanceViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DonorViewController.h"
#import "DonorDataProvider.h"
#import "DonorInteractor.h"
#import "DonorTableViewCell.h"

@interface DonorViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinningWheel;

@end

@implementation DonorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.spinningWheel.center = self.view.center;
    self.tableView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.donors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DonorTableViewCell" forIndexPath:indexPath];
    cell.donor = self.donors[indexPath.item];
    cell.donorName.text = [NSString stringWithFormat:@"%li. %@", (indexPath.item + 1), cell.donorName.text];
    return cell;
}

- (void) requestDataForViewController
{
    [self.spinningWheel startAnimating];
    
    [[DonorDataProvider sharedProvider] loadFinancialDataWithPolitician:self.politician successBlock:^(id data) {
        [self.spinningWheel stopAnimating];
        if([[DonorInteractor sharedInteractor] donorsWithData:data])
        {
            self.donors = [DonorInteractor sharedInteractor].donors;
            [self.tableView reloadData];
            [self.tableView layoutIfNeeded];
        }

    } errorBlock:^(id data, NSError *error) {
        // Error out;
    }];

}




@end
