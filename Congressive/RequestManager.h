//
//  RequestManager.h
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id data);
typedef void (^ErrorBlock)(id data,NSError *error);

@protocol RequestManager <NSObject>
@property (copy,nonatomic) NSString *baseDomain;
@property (copy,nonatomic) NSDictionary *defaultParams;
- (void)GET:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock;
- (void)POST:(NSString *)endpoint parameters:(NSDictionary *)parameters completion:(SuccessBlock)successBlock error:(ErrorBlock)errorBlock;
@end
