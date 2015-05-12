//
//  PoliticianManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianInteractor.h"
#import "PoliticianProvider.h"
#import "Politician.h"
#import <Foundation/Foundation.h>

@implementation PoliticianInteractor

+ (instancetype) sharedInteractor
{
    static dispatch_once_t pred;
    static PoliticianInteractor *sharedInteractor = nil;
    dispatch_once(&pred, ^{
        sharedInteractor = [[[self class] alloc] init];
    });
    return sharedInteractor;
}

- (BOOL) politiciansWithData: (NSDictionary *) data
{
    NSString *countString = (NSString *)  data[@"count"];
    NSUInteger count = [countString integerValue];
    if(count == 0)
        return NO;
    else{
        _politicians = [self makePoliticiansWithCount:count andData:data];
        return YES;
    }
}

- (NSArray *) makePoliticiansWithCount: (NSUInteger) count andData: (NSDictionary *) data
{
    NSMutableArray *politicians = [[NSMutableArray alloc] initWithCapacity:count];
    NSArray *results = data[@"results"];
    for(NSDictionary *senatorData in results)
    {
        [politicians addObject:[[Politician alloc] initWithDictionary:senatorData]];
    }
    return politicians;
}

@end
