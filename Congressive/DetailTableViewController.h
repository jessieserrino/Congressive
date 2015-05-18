//
//  DetailTableViewController.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Politician.h"


@protocol PoliticianDetailProtocol <NSObject>

@property (nonatomic, strong) Politician *politician;

@end

//@interface DetailTableViewController : UITableViewController
//
//@property (nonatomic, strong) Politician *politician;
//
//@end
