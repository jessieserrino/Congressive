//
//  BillProvider.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BillProvider.h"
#import "Politician.h"

@implementation BillProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseDomain = @"http://congress.api.sunlightfoundation.com";
        self.defaultParams = [[NSDictionary alloc] initWithObjects:@[@"17f124e252574edf9b8fe5d4b52e0fd4", @"last_action_at"] forKeys:@[@"apikey", @"order"]];
    }
    
    return self;
}

+ (instancetype) sharedProvider
{
    static dispatch_once_t pred;
    static BillProvider *sharedProvider = nil;
    dispatch_once(&pred, ^{
        sharedProvider = [[[self class] alloc] init];
    });
    return sharedProvider;
}

- (void)loadCosponsoredBillsWithPolitician: (Politician *) politician completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock
{
    
    [self GET:@"bills"
   parameters:[[NSDictionary alloc]
               initWithObjects:@[politician.bioguide]
               forKeys:@[@"cosponsor_ids"]]
   completion:successBlock
        error:errorBlock];
}
- (void) loadSponsoredBillsWithPolitician: (Politician *) politician completion: (SuccessBlock) successBlock error: (ErrorBlock) errorBlock
{
    [self GET:@"bills"
   parameters:[[NSDictionary alloc]
               initWithObjects:@[politician.bioguide]
               forKeys:@[@"sponsor_id"]]
   completion:successBlock
        error:errorBlock];
}

@end
