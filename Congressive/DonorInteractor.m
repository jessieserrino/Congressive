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
    NSString *countString = (NSString *)  data[@"count"];
    NSUInteger count = [countString integerValue];
    if(count == 0)
        return NO;
    else{
        _donors = [self makeDonorsWithCount:count andData:data];
        return YES;
    }
}

- (NSArray *) makeDonorsWithCount: (NSUInteger) count andData: (NSDictionary *) data
{
    NSMutableArray *donors = [[NSMutableArray alloc] initWithCapacity:count];
    NSArray *results = data[@"results"];
    for(NSDictionary *donorData in results)
    {
        [donors addObject:[[Donor alloc] initWithDictionary:donorData]];
    }
    return donors;
}

@end
