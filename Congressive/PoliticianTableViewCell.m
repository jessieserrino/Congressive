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
@property (strong, nonatomic) IBOutlet UIView *backdropView;
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
    _politician = politician;
}


- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    UIView *view = self.backdropView;
    view.layer.masksToBounds = NO;
    //    view.layer.cornerRadius = 8; // if you like rounded corners
    view.layer.shadowOffset = CGSizeMake(-2, 2);
    view.layer.shadowRadius = 5;
    view.layer.shadowOpacity = 0.5;
}


@end
