//
//  ImageInteractor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/6/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "ImageInteractor.h"
#import "Politician.h"

@implementation ImageInteractor

+ (instancetype) sequencedImageInteractor
{
    static dispatch_once_t pred;
    static ImageInteractor *sequencedImageInteractor = nil;
    dispatch_once(&pred, ^{
        sequencedImageInteractor = [[[self class] alloc] init];
    });
    return sequencedImageInteractor;
}

- (void) requestImageWithPolitician: (Politician *) politician andCompletion: (CompletionBlock) completion andError: (ErrorBlock) error
{
    if(politician)
    {
        
    }
}

@end
