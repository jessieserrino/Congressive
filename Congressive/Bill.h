//
//  Bill.h
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bill : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *govTrack;
@property (nonatomic)         NSString* number;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
