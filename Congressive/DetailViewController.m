//
//  ViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "DetailViewController.h"
#import "HeaderTableViewCell.h"
#import "InformationTableViewCell.h"


@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *politicianThumbnail;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *partyLabel;
@property (strong, nonatomic) IBOutlet UILabel *chamberLabel;

@property (strong, nonatomic) IBOutlet UIButton *telephoneButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIButton *websiteButton;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = self.politician.fullName;
    self.partyLabel.text = self.politician.politicalParty;
    self.chamberLabel.text = (self.politician.chamber == Senate)? @"Senate" : @"House of Representatives";
    self.politicianThumbnail.image = self.politician.politicianThumbnail;

//    self.telephoneButton.titleLabel.text = self.politician.phoneNumber;
//    self.websiteButton.titleLabel.text = self.politician.website.description;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openClient: (NSString *) clientDescriptor withID: (NSUInteger) identifier andBackupURL: (NSString*) backupDescriptor
{
    NSString *urlString = [NSString stringWithFormat:clientDescriptor, identifier];
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
    else
    {
        urlString = [NSString stringWithFormat:backupDescriptor, identifier];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (IBAction)facebookButtonPressed:(UIButton *)sender {
    [self openClient:@"fb://profile/%lu" withID:self.politician.facebookID andBackupURL:@"http://facebook.com/profile.php?id=%lu"];
    
    //    NSString *urlString = [NSString stringWithFormat:@"fb://profile/%lu", self.politician.facebookID];
//    NSURL *url = [NSURL URLWithString:urlString];
//    if ([[UIApplication sharedApplication] canOpenURL:url]){
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    else {
//        //Open the url as usual
//        urlString = [NSString stringWithFormat:@"http://facebook.com/profile.php?id=%lu", self.politician.facebookID];
//        NSURL *url = [NSURL URLWithString:urlString];
//        [[UIApplication sharedApplication] openURL:url];
//    }
}
- (IBAction)twitterButtonPressed:(UIButton *)sender {
    [self openClient:@"twitter://user?id=%@" withID:self.politician.twitterHandle andBackupURL:@"http://twitter.com/%@"];
}
- (IBAction)youtubeButtonPressed:(UIButton *)sender {
}

- (IBAction)telephoneButtonPushed:(UIButton *)sender {
}
- (IBAction)emailButtonPushed:(UIButton *)sender {
}

- (IBAction)websiteButtonPushed:(UIButton *)sender {
}



- (void)setPolitician:(Politician *)politician
{
    _politician = politician;

    
}

@end
