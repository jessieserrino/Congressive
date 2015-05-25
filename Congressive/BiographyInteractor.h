//
//  BiographyInteractor.h
//  Congressive
//
//  Created by Jessie Serrino on 5/22/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BiographyInteractor : NSObject

+ (instancetype) sharedInteractor;
- (NSString *) biographyWithString: (NSString *) biography;

@end
