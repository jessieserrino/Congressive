//
//  Donor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "Donor.h"

@implementation Donor
- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if(self)
    {
        _totalDonationAmount = [self formatDonation:dictionary[@"total_amount"]];
        _name = dictionary[@"name"];
    }
    
    return self;
}

- (NSString *) formatDonation: (NSString *) donation
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *newDonationValue = [formatter stringFromNumber:[NSNumber numberWithDouble:[donation doubleValue] ]];
    return newDonationValue;
}


@end
