//
//  ViewController.h
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoliticianDetail.h"

@interface InfoViewController : UITableViewController <PoliticianDetailProtocol>

@property (nonatomic, strong) Politician *politician;

@end

