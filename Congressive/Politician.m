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
        
        NSString *politicalParty = dictionary[@"party"];
        if([politicalParty isEqualToString:@"R"])
            _politicalParty = @"Republican Party";
        else if([politicalParty isEqualToString:@"D"])
            _politicalParty = @"Democratic Party";
        else
            _politicalParty = @"Independent";

        _chamber = ([dictionary[@"chamber"] isEqualToString:@"senate"])? Senate : HouseOfRepresentatives;
        _website = [NSURL URLWithString:dictionary[@"website"]];
        _phoneNumber = dictionary[@"phone"];
        
//        /* THIS SHOULD WORK  */
//        NSNumber *num = dictionary[@"facebook_id"];
//        _facebookID = [num integerValue];
        _facebookID = dictionary[@"facebook_id"];
        _twitterHandle = dictionary[@"twitter_id"];
        _youtubeAccount = dictionary[@"youtube_id"];
        _bioguide = dictionary[@"bioguide_id"];
        _email = dictionary[@"oc_email"];
        
    }
    return self;
}

+ (instancetype) fakePolitician
{
    Politician * p = [[Politician alloc] init];
    p.firstName = @"Elizabeth";
    p.lastName = @"Fairfield";
    p.phoneNumber = @"847-309-9966";
    p.email = @"RepFairfield@opencongress.org";
    p.website = [NSURL URLWithString: @"http://www.elizabethfairfield.com"];
    p.politicalParty = @"Democratic Party";
    p.chamber = HouseOfRepresentatives;
    
    
    
    return p;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName ];
}

- (UIImage *)politicianThumbnail
{
    if(!_politicianThumbnail)
    {
        NSURL *req = [NSURL URLWithString:[NSString stringWithFormat:@"https://theunitedstates.io/images/congress/225x275/%@.jpg", self.bioguide]];
        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:req]];
        
        if(image)
            _politicianThumbnail = image;
        else
            _politicianThumbnail = [UIImage imageNamed:@"NoPicture"];
    }
    return _politicianThumbnail;
}


@end
