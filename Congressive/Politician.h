//
//  Politician.h
//  Congressive
//
//  Created by Jessie Serrino on 5/3/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>


typedef enum : NSUInteger {
    Senate,
    HouseOfRepresentatives,
} CongressChamber;

@interface Politician : NSObject <NSCoding> //MTLModel <MTLJSONSerializing>

// Basic
@property (nonatomic, strong)         NSString *firstName;
@property (nonatomic, strong)         NSString *lastName;
@property (nonatomic, strong)         NSString *fullName;
@property (nonatomic, strong)         NSString *USState;

@property (nonatomic, strong)         NSString *politicalParty;
@property (nonatomic)                 CongressChamber chamber;

// Contact info
@property (nonatomic, strong)         NSURL *website;
@property (nonatomic, strong)         NSString *email;
@property (nonatomic, strong)         NSString *phoneNumber;

// Social media
@property (nonatomic)                 NSString *facebookID;
@property (nonatomic, strong)         NSString *twitterHandle;
@property (nonatomic, strong)         NSString *youtubeAccount;

// Appearances
@property (nonatomic, strong)         NSString *bioguide;
@property (nonatomic, strong)         UIImage *politicianThumbnail;


- (instancetype)initWithDictionary: (NSDictionary *) dictionary;
+ (instancetype) fakePolitician;


@end
