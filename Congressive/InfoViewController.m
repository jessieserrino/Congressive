//
//  ViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "InfoViewController.h"
#import "HeaderTableViewCell.h"
#import "InformationTableViewCell.h"


@interface InfoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *politicianThumbnail;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *partyLabel;
@property (strong, nonatomic) IBOutlet UILabel *chamberLabel;

@property (strong, nonatomic) IBOutlet UIButton *telephoneButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIButton *websiteButton;


@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self configureHeader];
    [self configureContactInformation];
}

- (void) configureHeader
{
    self.nameLabel.text = self.politician.fullName;
    self.navigationController.navigationItem.title = self.politician.fullName;
    self.partyLabel.text = self.politician.politicalParty;
    self.chamberLabel.text = (self.politician.chamber == Senate)? @"Senate" : @"House of Representatives";
    self.politicianThumbnail.image = self.politician.politicianThumbnail;
}

- (void) configureContactInformation
{
    [self setButtonTitle:self.telephoneButton withTitle:self.politician.phoneNumber];
    [self setButtonTitle:self.websiteButton withTitle:self.politician.website.description];
    [self setButtonTitle:self.emailButton withTitle:self.politician.email];
}

- (void) setButtonTitle: (UIButton *) button withTitle: (NSString *) title
{
    CGFloat spacing = 10; // the amount of spacing to appear between image and title
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [button setTitle:title forState:UIControlStateNormal];
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

@end
