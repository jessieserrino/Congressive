//
//  PoliticianProvider.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianProvider.h"


@implementation PoliticianProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseDomain = @"http://congress.api.sunlightfoundation.com";
        self.defaultParams = [[NSDictionary alloc] initWithObjects:@[@"17f124e252574edf9b8fe5d4b52e0fd4", @"chamber"] forKeys:@[@"apikey", @"order"]];
    }

    return self;
}

+ (instancetype) sharedProvider
{
    static dispatch_once_t pred;
    static PoliticianProvider *sharedProvider = nil;
    dispatch_once(&pred, ^{
        sharedProvider = [[[self class] alloc] init];
    });
    return sharedProvider;
}

- (void)loadPoliticiansFromLocation: (CLLocationCoordinate2D) location completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock
{
    NSString *latitude = [NSString stringWithFormat:@"%f", location.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", location.longitude];

    [self GET:@"legislators/locate"
            parameters:[[NSDictionary alloc]
                        initWithObjects:@[latitude, longitude]
                        forKeys:@[@"latitude", @"longitude"]]
            completion:successBlock
            error:errorBlock];
}

@end
