//
//  DonorTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DonorTableViewCell.h"

@implementation DonorTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDonor:(Donor *)donor
{
    self.donorName.text = donor.name;
    self.donationAmount.text = donor.totalDonationAmount;
}

@end
