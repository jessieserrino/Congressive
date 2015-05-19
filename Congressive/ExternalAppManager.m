//
//  ExternalAppManager.m
//  Congressive
//
//  Created by Jessie Serrino on 5/18/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "ExternalAppManager.h"

@implementation ExternalAppManager

+ (void) open: (ExternalApplication) application WithPolitician: (Politician *) politician
{
    switch (application) {
        case Phone:
            [self openClientURL:@"telprompt://%@" withID:politician.phoneNumber andBackupURL:nil];
            break;
            
        case Email:
            
            [self openClientURL:@"mailto:%@" withID:politician.email andBackupURL:nil];
            break;
            
        case WebBrowser:
            [self openClientURL:@"%@" withID:politician.website.description andBackupURL:nil];
            break;
            
        case Facebook:
            [self openClientURL:@"https://www.facebook.com/profile.php?id=%@" withID:politician.facebookID andBackupURL:nil];
            break;
        
        case Twitter:
            [self openClientURL:@"twitter://user?screen_name=%@" withID:politician.twitterHandle andBackupURL:@"http://www.twitter.com/user?screen_name=%@"];
            break;
            
        case YouTube:
            [self openClientURL:@"youtube://www.youtube.com/user/%@" withID:politician.youtubeAccount andBackupURL:@"https://www.youtube.com/user/%@"];

            break;
        case Maps:
            [self openClientURL:@"http://maps.apple.com/?q=%@" withID:politician.office andBackupURL:nil];
            break;
    }
}

+ (void) openClientURL: (NSString *) clientURL withID: (NSString *) identifier andBackupURL: (NSString*) backupDescriptor
{
    NSString *urlString = [NSString stringWithFormat:clientURL, [identifier stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    
    
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];

    }
    else if(backupDescriptor)
    {
        urlString = [NSString stringWithFormat:backupDescriptor, identifier];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end