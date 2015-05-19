//
//  Bill.m
//  Congressive
//
//  Created by Jessie Serrino on 5/19/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "Bill.h"

@implementation Bill

- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if(self)
    {
        _title =  (dictionary[@"nickname"])? dictionary[@"nickname"] : dictionary[@"popular_title"];
        if(!_title)
            _title = (dictionary[@"short_title"])? dictionary[@"short_title"] : dictionary[@"official_title"];
        _govTrack = dictionary[@"govtrack"];
        _number = dictionary[@"number"];
    }
    
    return self;
}


@end
