//
//  DonorTableViewCell.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Donor.h"

@interface DonorTableViewCell : UITableViewCell
@property (strong, nonatomic) Donor *donor;
@property (strong, nonatomic) IBOutlet UILabel *donorName;
@property (strong, nonatomic) IBOutlet UILabel *donationAmount;

@end
