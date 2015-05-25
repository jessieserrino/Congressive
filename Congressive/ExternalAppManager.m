//
//  ExternalAppManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "ExternalAppManager.h"

static NSString * const PhonePrefix = @"telprompt://%@";
static NSString * const EmailPrefix = @"mailto:%@";
static NSString * const WebPrefix = @"%@";
static NSString * const FacebookPrefix = @"https://www.facebook.com/profile.php?id=%@";

static NSString * const TwitterPrefix = @"twitter://user?screen_name=%@";
static NSString * const TwitterBackupPrefix = @"http://www.twitter.com/user?screen_name=%@";

static NSString * const YouTubePrefix = @"youtube://www.youtube.com/user/%@";
static NSString * const YouTubeBackupPrefix = @"https://www.youtube.com/user/%@";
static NSString * const MapsPrefix = @"http://maps.apple.com/?q=%@";



@implementation ExternalAppManager

+ (void) open: (ExternalApplication) application WithPolitician: (Politician *)politician
{
    switch (application) {
        case Phone:
            [self openClientURL: PhonePrefix withID:politician.phoneNumber andBackupURL:nil];
            break;
            
        case Email:
            [self openClientURL: EmailPrefix withID:politician.email andBackupURL:nil];
            break;
            
        case WebBrowser:
            [self openClientURL:WebPrefix withID:politician.website.description andBackupURL:nil];
            break;
            
        case Facebook:
            [self openClientURL: FacebookPrefix withID:politician.facebookID andBackupURL:nil];
            break;
        
        case Twitter:
            [self openClientURL: TwitterPrefix withID:politician.twitterHandle andBackupURL:TwitterBackupPrefix];
            break;
            
        case YouTube:
            [self openClientURL:YouTubePrefix withID:politician.youtubeAccount andBackupURL:YouTubeBackupPrefix];
            break;
            
        case Maps:
            [self openClientURL:MapsPrefix withID:politician.office andBackupURL:nil];
            break;
    }
}

+ (void) openClientURL: (NSString *) prefix withID: (NSString *) identifier andBackupURL: (NSString*) backupPrefix
{
    NSString *urlString = [NSString stringWithFormat:prefix, [identifier stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
    else if(backupPrefix)
    {
        urlString = [NSString stringWithFormat:backupPrefix, identifier];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
