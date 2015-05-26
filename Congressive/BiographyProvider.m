//
//  BiographyProvider.h
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BiographyProvider.h"
#import "BiographyInteractor.h"
#import "AFNetworking.h"

static NSString * const kBaseDomain = @"http://bioguide.congress.gov/scripts/biodisplay.pl?index=%@";


@implementation BiographyProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseDomain = kBaseDomain;
    }
    
    return self;
}

+ (instancetype) sharedProvider
{
    static dispatch_once_t pred;
    static BiographyProvider *sharedProvider = nil;
    dispatch_once(&pred, ^{
        sharedProvider = [[[self class] alloc] init];
    });
    return sharedProvider;
}


// Gross code, will change.
- (void)loadBiographyWithPolitician: (FederalPolitician *) politician completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock {
    
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat: kBaseDomain, politician.bioguide]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *stringResponse = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        successBlock([[BiographyInteractor sharedInteractor] biographyWithString:stringResponse]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        errorBlock(nil, error);
    }];
    [op start];
}

@end