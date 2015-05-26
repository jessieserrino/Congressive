//
//  PoliticianTableViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianTableViewController.h"
#import "PoliticianInteractor.h"
#import "PoliticianTableViewCell.h"
#import "FederalPolitician.h"
#import "TabBarViewController.h"

static NSUInteger const FederalSection;
static NSUInteger const StateSection;


@interface PoliticianTableViewController ()
    @property (nonatomic, weak) NSArray *politicians;
@property (nonatomic, weak) FederalPolitician *selectedPolitician;
@end

@implementation PoliticianTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSArray *)politicians
{
    if(!_politicians)
    {
        _politicians = [PoliticianInteractor sharedInteractor].politicians;
    }
    return _politicians;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == FederalSection)
        return self.politicians.count;
    return 0;
}

//- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(section == FederalSection)
//        return @"Federal";
//    return @"State";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PoliticianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PoliticianTableViewCell class]) forIndexPath:indexPath];
    
    FederalPolitician *p = self.politicians[indexPath.item];
    
    cell.politician = p;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedPolitician = self.politicians[indexPath.item];
    [self performSegueWithIdentifier:@"SegueToDetailView" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"SegueToDetailView"])
    {
        TabBarViewController *tab = [segue destinationViewController];
        tab.politician = self.selectedPolitician;
    }
    
}


@end
