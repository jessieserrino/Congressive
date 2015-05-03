//
//  AFRequestManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "AFNRequestManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation AFNRequestManager
@synthesize baseDomain = _baseDomain;
@synthesize defaultParams = _defaultParams;

- (void)GET:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *params = [self.defaultParams mutableCopy];
    if (parameters) {
        [params addEntriesFromDictionary:parameters];
    }
    
    [manager GET:[self.baseDomain stringByAppendingPathComponent:endpoint] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(nil,error);
    }];
}
- (void)POST:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)success error:(ErrorBlock)error{
    
}
@end
