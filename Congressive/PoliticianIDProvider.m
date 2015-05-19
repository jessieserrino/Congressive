//
//  PoliticianIDProvider.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianIDProvider.h"

@implementation PoliticianIDProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseDomain = @"http://transparencydata.com/api/1.0/entities/";
        self.defaultParams = [[NSDictionary alloc] initWithObjects:@[@"17f124e252574edf9b8fe5d4b52e0fd4"] forKeys:@[@"apikey"]];
    }
    
    return self;
}

+ (instancetype) sharedProvider
{
    static dispatch_once_t pred;
    static PoliticianIDProvider *sharedProvider = nil;
    dispatch_once(&pred, ^{
        sharedProvider = [[[self class] alloc] init];
    });
    return sharedProvider;
}

- (void) IDforPolitician: (Politician *) politician withCompletion: (SuccessBlock) successBlock andError: (ErrorBlock) errorBlock
{
    [self GET:@"id_lookup.json"
   parameters:[[NSDictionary alloc]
               initWithObjects:@[politician.bioguide]
               forKeys:@[@"bioguide_id"]]
   completion:successBlock
        error:errorBlock];
}

@end
