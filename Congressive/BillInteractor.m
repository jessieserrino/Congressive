//
//  BillInteractor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BillInteractor.h"
#import "Bill.h"

@implementation BillInteractor

+ (instancetype) sharedInteractor
{
    static dispatch_once_t pred;
    static BillInteractor *sharedInteractor = nil;
    dispatch_once(&pred, ^{
        sharedInteractor = [[[self class] alloc] init];
    });
    return sharedInteractor;
}

- (BOOL) billsWithData: (NSDictionary *) data
{
    NSString *countString = (NSString *)  data[@"count"];
    NSUInteger count = [countString integerValue];
    if(count == 0)
        return NO;
    else{
        _bills = [self makeBillsWithCount:count andData:data];
        return YES;
    }
}

- (NSArray *) makeBillsWithCount: (NSUInteger) count andData: (NSDictionary *) data
{
    NSMutableArray *bills = [[NSMutableArray alloc] initWithCapacity:count];
    NSArray *results = data[@"results"];
    for(NSDictionary *billData in results)
    {
        [bills addObject:[[Bill alloc] initWithDictionary:billData]];
    }
    return bills;
}

@end
