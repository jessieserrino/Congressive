//
//  Politician.m
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "FederalPolitician.h"

@implementation FederalPolitician

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
        
        _facebookID = dictionary[@"facebook_id"];
        _twitterHandle = dictionary[@"twitter_id"];
        _youtubeAccount = dictionary[@"youtube_id"];
        _bioguide = dictionary[@"bioguide_id"];
        _email = dictionary[@"oc_email"];
        _office = dictionary[@"office"];
        
        
    }
    return self;
}

+ (instancetype) fakePolitician
{
    FederalPolitician * p = [[FederalPolitician alloc] init];
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

- (void)encodeWithCoder:(NSCoder *)encoder
{

    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.fullName forKey:@"fullName"];
    [encoder encodeObject:self.USState forKey:@"USState"];
    
    [encoder encodeObject:self.politicalParty forKey:@"politicalParty"];
    [encoder encodeInteger:self.chamber forKey:@"chamber"];
    
    [encoder encodeObject:self.website forKey:@"website"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];

    [encoder encodeObject:self.facebookID forKey:@"facebookID"];
    [encoder encodeObject:self.twitterHandle forKey:@"twitterHandle"];
    [encoder encodeObject:self.youtubeAccount forKey:@"youtubeAccount"];
    
    [encoder encodeObject:self.bioguide forKey:@"bioguide"];
    [encoder encodeObject:self.office forKey:@"office"];
}

- (id)initWithCoder:(NSCoder *)decoder // NS_DESIGNATED_INITIALIZER
{
    self = [super init];
    _firstName = [decoder decodeObjectForKey:@"firstName"];
    _lastName = [decoder decodeObjectForKey:@"lastName"];
    _fullName = [decoder decodeObjectForKey:@"fullName"];
    _USState = [decoder decodeObjectForKey:@"USState"];
    
    _politicalParty = [decoder decodeObjectForKey:@"politicalParty"];
    _chamber = [decoder decodeIntegerForKey:@"chamber"];
    
    _website = [decoder decodeObjectForKey:@"website"];
    _email = [decoder decodeObjectForKey:@"email"];
    _phoneNumber = [decoder decodeObjectForKey:@"phoneNumber"];
    
    _facebookID = [decoder decodeObjectForKey:@"facebookID"];
    _twitterHandle  = [decoder decodeObjectForKey:@"twitterHandle"];
    _youtubeAccount = [decoder decodeObjectForKey:@"youtubeAccount"];
    
    _bioguide = [decoder decodeObjectForKey:@"bioguide"];
    
    _office = [decoder decodeObjectForKey:@"office"];
    
    
    return self;
}

@end
