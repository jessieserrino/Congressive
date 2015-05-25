//
//  DonorTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DonorTableViewCell.h"

@interface DonorTableViewCell()

@property (nonatomic, weak) IBOutlet UIView *paperView;

@end

@implementation DonorTableViewCell

- (void)awakeFromNib {
    [self makeShadow];
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

- (void) makeShadow
{
    self.paperView.layer.masksToBounds = NO;
    //    self.headerBackgroundView.layer.cornerRadius = 8; // rounded corners
    self.paperView.layer.shadowOffset = CGSizeMake(1, 1);
    self.paperView.layer.shadowRadius = 5;
    self.paperView.layer.shadowOpacity = 0.5;
}

@end
