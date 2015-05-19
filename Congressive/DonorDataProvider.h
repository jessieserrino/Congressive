//
//  FinanceDataProvider.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNRequestManager.h"
#import "Politician.h"


@interface DonorDataProvider : AFNRequestManager

+ (instancetype) sharedProvider;
- (void) loadFinancialDataWithPolitician: (Politician *) politician successBlock: (SuccessBlock) successBlock errorBlock: (ErrorBlock) errorBlock;

@end
