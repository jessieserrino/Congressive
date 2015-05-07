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
#import "Politician.h"

@interface PoliticianTableViewController ()
@property (nonatomic, weak) NSArray *politicians;
@end

@implementation PoliticianTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.tableView.hidden = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}


- (NSArray *)politicians
{
    if(!_politicians)
    {
        _politicians = [PoliticianInteractor sharedInteractor].politicians;
    }
    return _politicians;
}

- (void) loadCells
{
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mapButtonClicked:(UIBarButtonItem *)sender {

    [self performSegueWithIdentifier:@"SegueUnwind" sender:self];
}


#pragma mark - Table view delegate


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.politicians.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PoliticianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PoliticianTableViewCell class]) forIndexPath:indexPath];
    
    Politician *p = self.politicians[indexPath.item];
    
    cell.politicianNameLabel.text = p.fullName;
    cell.politicianLocaleLabel.text = p.USState;
    cell.politicianPartyLabel.text = p.politicalParty;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        cell.politicianImageView.image = p.politicianThumbnail;
    });
    
    cell.politicianImageView.image = p.politicianThumbnail;
//    [cell setCellImageWithPolitician:p];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"SegueToDetailView" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
