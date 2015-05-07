//
//  Politician.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "Politician.h"

@implementation Politician

- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if(self)
    {
        _firstName = dictionary[@"first_name"];
        _lastName = dictionary[@"last_name"];
        _USState = dictionary[@"state_name"];
        _politicalParty = dictionary[@"party"];
        _chamber = ([dictionary[@"chamber"] isEqualToString:@"senate"])? Senate : HouseOfRepresentatives;
        _website = [NSURL URLWithString:dictionary[@"website"]];
        _phoneNumber = dictionary[@"phone"];
        //_facebookID = dictionary[@"facebook_id"];
        _twitterHandle = dictionary[@"twitter_id"];
        _youtubeAccount = dictionary[@"youtube_id"];
        _bioguide = dictionary[@"bioguide_id"];
        
    }
    return self;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName ];
}

@end
