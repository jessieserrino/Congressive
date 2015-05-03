//
//  AFRequestManager.h
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "RequestManager.h"

@interface AFNRequestManager : NSObject<RequestManager>

- (void)GET:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock;
- (void)POST:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)success error:(ErrorBlock)error;


@end
