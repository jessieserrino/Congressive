//
//  DonorInteractor.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DonorInteractor : NSObject

@property (nonatomic, strong) NSArray *donors;
+ (instancetype) sharedInteractor;
- (BOOL) donorsWithData: (NSDictionary *) data;

@end
