//
//  PoliticianDetail.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FederalPolitician.h"

@protocol PoliticianDetailProtocol <NSObject>

@property (nonatomic, weak) FederalPolitician *politician;

- (void) requestDataForViewController;

@end
