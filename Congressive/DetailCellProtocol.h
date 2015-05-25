//
//  DetailCellProtocol.h
//  Congressive
//
//  Created by Jessie Serrino on 5/24/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Politician.h"
#import "ExternalAppManager.h"

@protocol DetailCellProtocol <NSObject>

- (void) prepareWithPolitician: (Politician *) politician;

@end

