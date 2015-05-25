//
//  PoliticianProvider.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianProvider.h"

static NSString * const kBaseDomain = @"http://congress.api.sunlightfoundation.com";
static NSString * const kAPIKey = @"Sunlight_APIKey";
static NSString * const kAPIKeyQuery = @"apikey";
static NSString * const kLatitudeQuery = @"latitude";
static NSString * const kLongitudeQuery = @"longitude";
static NSString * const kOrderQuery = @"order";
static NSString * const kOrderByChamber = @"chamber";
static NSString * const kLegislatorSubdomain = @"legislators/locate";


@implementation PoliticianProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *apikey = [[NSBundle mainBundle] objectForInfoDictionaryKey:kAPIKey];
        self.baseDomain = kBaseDomain;
        self.defaultParams = [[NSDictionary alloc] initWithObjects:@[apikey, kOrderByChamber] forKeys:@[kAPIKeyQuery, kOrderQuery]];
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

    [self GET:kLegislatorSubdomain
            parameters:[[NSDictionary alloc]
                        initWithObjects:@[latitude, longitude]
                        forKeys:@[kLatitudeQuery, kLongitudeQuery]]
            completion:successBlock
            error:errorBlock];
}

@end
