//
//  FinanceDataProvider.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNRequestManager.h"
#import "FederalPolitician.h"


@interface DonorDataProvider : AFNRequestManager

+ (instancetype) sharedProvider;
- (void) loadFinancialDataWithPolitician: (FederalPolitician *) politician successBlock: (SuccessBlock) successBlock errorBlock: (ErrorBlock) errorBlock;

@end
