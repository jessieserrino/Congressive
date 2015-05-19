//
//  FinanceDataProvider.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DonorDataProvider.h"
#import "PoliticianIDProvider.h"

@implementation DonorDataProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseDomain = @"http://transparencydata.com/api/1.0/aggregates/pol/";
        self.defaultParams = [[NSDictionary alloc] initWithObjects:@[@"17f124e252574edf9b8fe5d4b52e0fd4"] forKeys:@[@"apikey"]];
    }
    
    return self;
}



+ (instancetype) sharedProvider
{
    static dispatch_once_t pred;
    static DonorDataProvider *sharedProvider = nil;
    dispatch_once(&pred, ^{
        sharedProvider = [[[self class] alloc] init];
    });
    return sharedProvider;
}

- (void) loadFinancialDataWithPolitician: (Politician *) politician successBlock: (SuccessBlock) successBlock errorBlock: (ErrorBlock) errorBlock
{
    [[PoliticianIDProvider sharedProvider] IDforPolitician:politician withCompletion:^(id data) {
        NSString *identifier = data[0][@"id"];
        [self requestTopContributorsForID:identifier successBlock:successBlock errorBlock:errorBlock];
    } andError:errorBlock];
}

- (void) requestTopContributorsForID: (NSString *) identifier successBlock: (SuccessBlock) successBlock errorBlock: (ErrorBlock) errorBlock
{
    NSString *getString = [NSString stringWithFormat:@"%@/contributors.json", identifier];
        [self GET:getString
       parameters:[[NSDictionary alloc]
                   initWithObjects:@[@"10"]
                   forKeys:@[@"limit"]]
       completion:successBlock
            error:errorBlock];
}

@end
