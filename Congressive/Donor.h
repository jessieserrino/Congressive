//
//  Donor.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Donor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *totalDonationAmount;
- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
