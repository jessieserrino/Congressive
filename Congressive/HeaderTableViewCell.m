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

/* Politician Information */
@property (nonatomic, weak) IBOutlet UILabel *politicianLabel;
@property (nonatomic, weak) IBOutlet UIImageView * thumbnail;
@property (nonatomic, weak) IBOutlet UILabel *partyLabel;
@property (nonatomic, weak) IBOutlet UILabel *chamberLabel;
@property (nonatomic, weak) IBOutlet UIView *paperView;

/* Social Media Buttons */
@property (nonatomic, weak) IBOutlet UIButton *facebookButton;
@property (nonatomic, weak) IBOutlet UIButton *twitterButton;
@property (nonatomic, weak) IBOutlet UIButton *youtubeButton;




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
    _politician = politician;
    
    [self configureVisuals];
}

- (void) configureVisuals
{
    [self configurePoliticianInformation];
    [self enableButtons];
    [self makeShadow];
}

- (void) configurePoliticianInformation
{
    self.thumbnail.image = self.politician.politicianThumbnail;
    self.politicianLabel.text = self.politician.fullName;
    self.partyLabel.text = self.politician.politicalParty;
    self.chamberLabel.text = (self.politician.chamber == Senate)? @"Senate" : @"House of Representatives";
}

- (void) enableButtons
{
    self.facebookButton.enabled = (self.politician.facebookID != nil);
    self.twitterButton.enabled = (self.politician.twitterHandle != nil);
    self.youtubeButton.enabled = (self.politician.youtubeAccount != nil);
}

- (void) makeShadow
{
        self.paperView.layer.masksToBounds = NO;
    //    self.headerBackgroundView.layer.cornerRadius = 8; // rounded corners
        self.paperView.layer.shadowOffset = CGSizeMake(1, 1);
        self.paperView.layer.shadowRadius = 5;
        self.paperView.layer.shadowOpacity = 0.5;
}

- (IBAction)facebookButtonPushed:(id)sender
{
    [ExternalAppManager open:Facebook WithPolitician:self.politician];
}

- (IBAction)twitterButtonPushed:(id)sender
{
    [ExternalAppManager open:Twitter WithPolitician:self.politician];
}

- (IBAction)youtubeButtonPushed:(id)sender
{
    [ExternalAppManager open:YouTube WithPolitician:self.politician];
}

@end
