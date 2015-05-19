//
//  ExternalAppManager.h
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Politician.h"

@interface ExternalAppManager : NSObject

typedef enum : NSUInteger {
    Phone,
    Email,
    WebBrowser,
    Facebook,
    Twitter,
    YouTube,
    Maps
} ExternalApplication;


+ (void) open: (ExternalApplication) application WithPolitician: (Politician *) politician;

@end
