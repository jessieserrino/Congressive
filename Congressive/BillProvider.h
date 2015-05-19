//
//  BillProvider.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNRequestManager.h"
#import "Politician.h"

@interface BillProvider : AFNRequestManager
+ (instancetype) sharedProvider;
- (void)loadCosponsoredBillsWithPolitician: (Politician *) politician completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock;
@end
