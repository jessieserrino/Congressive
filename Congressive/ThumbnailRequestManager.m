//
//  ThumbnailRequestManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/6/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

//#import "ThumbnailRequestManager.h"

//@implementation ThumbnailRequestManager
//
//+ (instancetype) sharedManager
//{
//    static dispatch_once_t pred;
//    static ThumbnailRequestManager *sharedManager = nil;
//    dispatch_once(&pred, ^{
//        sharedManager = [[[self class] alloc] init];
//    });
//    return sharedManager;
//}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.baseDomain = @"https://theunitedstates.io/images/congress/original/";
//    }
//    
//    return self;
//}
//
//- (void)loadImageWithBioguide: (NSString *) bioguide completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock
//{
//    
//    
//    NSURL *req = [NSURL URLWithString:[NSString stringWithFormat:@"https://theunitedstates.io/images/congress/225x275/%@.jpg", bioguide]];
//    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:req]];
//    if(image)
//        successBlock(image);
//    else
//        errorBlock()
////    [self GET:[NSString stringWithFormat:@"%@.jpg", bioguide]
////   parameters:nil
////   completion:successBlock
////        error:errorBlock];
//}

//@end
