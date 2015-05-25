//
//  BiographyInteractor.m
//  Congressive
//
//  Created by Jessie Serrino on 5/22/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "BiographyInteractor.h"

@implementation BiographyInteractor

+ (instancetype) sharedInteractor
{
    static dispatch_once_t pred;
    static BiographyInteractor *sharedInteractor = nil;
    dispatch_once(&pred, ^{
        sharedInteractor = [[[self class] alloc] init];
    });
    return sharedInteractor;
}

- (NSString *) biographyWithString: (NSString *) biography
{
    return [self filterString:biography];
}


/* This is some hackish regex. Please change.  */
- (NSString *) filterString: (NSString *) unfilteredBiography
{
    // Cutting out the actual bio
    NSString *trimmedBio = [unfilteredBiography componentsSeparatedByString:@"<P><FONT SIZE=4 COLOR="][1];
    trimmedBio = [trimmedBio componentsSeparatedByString:@"</FONT>"][1];
    trimmedBio = [trimmedBio componentsSeparatedByString:@"</TD>"][0];
    
    
    // Dividing the bio into sections
    NSMutableArray *bioSections = [NSMutableArray arrayWithArray: [trimmedBio componentsSeparatedByString:@"; "]];;
    for(int i = 0; i < bioSections.count ; i++)
    {
        NSString *section = bioSections[i];
        bioSections[i] = [self filterMiniString:section];
    }
    NSString *finalString = [bioSections  componentsJoinedByString:@"\n"];
    
    return finalString;
}

- (NSString *) filterMiniString: (NSString *) ministring
{
    // Replacing unwanted characters
    ministring = [ministring stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    ministring = [ministring stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    // Capitalizing first character
    NSString *firstLetterCapitalized = [[ministring substringToIndex:1] capitalizedString];
    ministring = [ministring stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString: firstLetterCapitalized];
    
    // Adding bullet points
    ministring = [NSString stringWithFormat:@"\u2022 %@", ministring];
    
    return ministring;
}

@end
