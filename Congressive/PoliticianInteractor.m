//
//  PoliticianManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianInteractor.h"
#import "PoliticianProvider.h"
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

- (BOOL) hasPoliticians
{
    return (_politicians == nil);
}

- (BOOL) politiciansWithData: (NSDictionary *) data
{
    // Make politicians
    if(data[@"count"] == 0)
    {
        return NO;
    }
    
    return YES;
}

@end
