//
//  PoliticianInteractor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianListInteractor.h"
#import "PoliticianProvider.h"


@interface PoliticianListInteractor()
@property (nonatomic, strong) PoliticianProvider *politicianProvider;

@end

@implementation PoliticianListInteractor

+ (instancetype) sharedInteractor
{
    static dispatch_once_t pred;
    static PoliticianListInteractor *sharedInteractor = nil;
    dispatch_once(&pred, ^{
        sharedInteractor = [[[self class] alloc] init];
    });
    return sharedInteractor;
}

- (PoliticianProvider *)politicianProvider
{
    if(!_politicianProvider) {
        _politicianProvider = [[PoliticianProvider alloc] init];
    }
    return _politicianProvider;
}


@end
