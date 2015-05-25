//
//  ViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "InfoViewController.h"
#import "HeaderTableViewCell.h"
#import "BiographyTableViewCell.h"
#import "ExternalAppManager.h"
#import "DetailCellProtocol.h"


static NSInteger const BiographyCell = 2;

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet BiographyTableViewCell *biographyCell;
@property (nonatomic) BOOL foundBiography;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinningBiographyWheel;
@property (strong, nonatomic) IBOutlet UINavigationItem *politicianTitle;


@end

@implementation InfoViewController


/* Observer necessary to determine if the biography needs expanding */
- (void)viewDidLoad {
    [super viewDidLoad];

    _foundBiography = NO;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.biographyCell addObserver:self forKeyPath:@"self.specialHeight" options:NSKeyValueObservingOptionNew context:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.biographyCell  removeObserver:self forKeyPath:@"self.specialHeight"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"self.specialHeight"]  && !self.foundBiography)
    {
        [self.tableView reloadData];
        [self.tableView layoutIfNeeded];
        _foundBiography = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) requestDataForViewController
{
}


/* Basic methods that set up the table view */


- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell <DetailCellProtocol> *cell =  (UITableViewCell<DetailCellProtocol> *) [super tableView: tableView cellForRowAtIndexPath:indexPath];
    
    [cell prepareWithPolitician:self.politician];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item == BiographyCell && self.biographyCell.specialHeight)
    {
        return self.biographyCell.specialHeight;
    }
    else
    {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
}

@end
