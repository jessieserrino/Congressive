//
//  DonorInteractor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DonorInteractor.h"
#import "Donor.h"

@implementation DonorInteractor

+ (instancetype) sharedInteractor
{
    static dispatch_once_t pred;
    static DonorInteractor *sharedInteractor = nil;
    dispatch_once(&pred, ^{
        sharedInteractor = [[[self class] alloc] init];
    });
    return sharedInteractor;
}

- (BOOL) donorsWithData: (NSDictionary *) data
{
    _donors = [self makeDonorsWithData: data];
    return (_donors.count > 0);
}

- (NSArray *) makeDonorsWithData: (NSDictionary *) data
{
    NSMutableArray *donors = [[NSMutableArray alloc] initWithCapacity:data.count];
    
    for(NSDictionary *donorData in data)
        [donors addObject:[[Donor alloc] initWithDictionary:donorData]];

    return donors;
}

@end
