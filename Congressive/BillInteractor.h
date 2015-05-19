//
//  BillInteractor.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillInteractor : NSObject

@property (nonatomic, strong) NSArray *bills;

+ (instancetype) sharedInteractor;
- (BOOL) billsWithData: (NSDictionary *) data;



@end
