//
//  FinanceViewController.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianDetail.h"

@interface DonorViewController : UITableViewController <PoliticianDetailProtocol>

@property (nonatomic, strong) Politician *politician;

@end
