//
//  FinanceViewController.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianDetail.h"

@interface DonorViewController : UITableViewController <PoliticianDetailProtocol, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) Politician *politician;
@property (nonatomic, weak) NSArray *donors;

@end
