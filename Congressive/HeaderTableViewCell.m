//
//  HeaderTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/14/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "HeaderTableViewCell.h"

@interface HeaderTableViewCell ()

@property (nonatomic, strong) Politician *politician;


@end

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) prepareWithPolitician: (Politician *) politician
{
    self.politician = politician;
}

- (IBAction)facebookButtonPushed:(id)sender
{
    NSString *urlString = [NSString stringWithFormat:@"fb://profile/%lu", self.politician.facebookID];
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        //Open the url as usual
    }
}

- (IBAction)twitterButtonPushed:(id)sender
{
    
}

- (IBAction)youtubeButtonPushed:(id)sender
{
    
}

@end
