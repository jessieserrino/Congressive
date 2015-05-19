//
//  PoliticianTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "PoliticianTableViewCell.h"
#import "ExternalAppManager.h"


@interface PoliticianTableViewCell()
@end

@implementation PoliticianTableViewCell


- (IBAction)phoneButtonPressed:(id)sender {
    [ExternalAppManager open:Phone WithPolitician:self.politician];
    
}
- (IBAction)emailButtonPressed:(UIButton *)sender {
    [ExternalAppManager open:Email WithPolitician:self.politician];
}

- (IBAction)websiteButtonPressed:(id)sender {
    
    [ExternalAppManager open:WebBrowser WithPolitician:self.politician];
}

- (void)setPolitician:(Politician *)politician
{
    self.politicianNameLabel.text = politician.fullName;
    self.politicianLocaleLabel.text = politician.USState;
    self.politicianPartyLabel.text = politician.politicalParty;
    
    self.politicianCongressLabel.text = (politician.chamber == Senate)? @"Senate" : @"House of Representatives";
    
    self.politicianImageView.image = politician.politicianThumbnail;
}


- (void)awakeFromNib {
    // Initialization code
}


@end
