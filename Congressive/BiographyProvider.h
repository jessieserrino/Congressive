//
//  BiographyProvider.h
//  Congressive
//
//  Created by Jessie Serrino on 5/22/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FederalPolitician.h"
#import "AFNRequestManager.h"

@interface BiographyProvider : AFNRequestManager
+ (instancetype) sharedProvider;
- (void)loadBiographyWithPolitician: (FederalPolitician *) politician completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock;
@end
