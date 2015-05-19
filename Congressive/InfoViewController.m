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
#import "ExternalAppManager.h"
#import <MapKit/MapKit.h>
#import "MapPin.h"


@interface InfoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *politicianThumbnail;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *partyLabel;
@property (strong, nonatomic) IBOutlet UILabel *chamberLabel;

@property (strong, nonatomic) IBOutlet UIButton *telephoneButton;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UIButton *websiteButton;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UIButton *addressButton;

@property (strong, nonatomic) CLGeocoder *geocoder;


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
    [self configureMap];
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

- (void) configureMap
{
    NSString *addressString = [NSString stringWithFormat:@"%@, D.C.", self.politician.office];
    [self.addressButton setTitle:addressString forState:UIControlStateNormal];
    [self.geocoder geocodeAddressString:addressString
                      completionHandler:^(NSArray* placemarks, NSError* error){
                          if(placemarks.count > 0)
                          {
                              CLPlacemark *placemark = placemarks[0];
                              [self.map setCenterCoordinate:placemark.location.coordinate];
                              MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 1000, 1000);
                              MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];
                              [self.map setRegion:adjustedRegion animated:YES];
                              MapPin *pin = [[MapPin alloc] init];
                              pin.title = [NSString stringWithFormat: @"%@'s Office", self.politician.fullName];
                              pin.coordinate = placemark.location.coordinate;
                              [self.map addAnnotation:pin];

                          }
                      }];
}

- (void) setButtonTitle: (UIButton *) button withTitle: (NSString *) title
{
    CGFloat spacing = 10; // the amount of spacing to appear between image and title
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [button setTitle:title forState:UIControlStateNormal];
}


- (CLGeocoder *)geocoder
{
    if(!_geocoder)
    {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookButtonPressed:(UIButton *)sender {
    [ExternalAppManager open:Facebook WithPolitician:self.politician];
}
- (IBAction)twitterButtonPressed:(UIButton *)sender {
    [ExternalAppManager open:Twitter WithPolitician:self.politician];
}
- (IBAction)youtubeButtonPressed:(UIButton *)sender {
    [ExternalAppManager open:YouTube WithPolitician:self.politician];
}

- (IBAction)telephoneButtonPushed:(UIButton *)sender {
    [ExternalAppManager open:Phone WithPolitician:self.politician];
}
- (IBAction)emailButtonPushed:(UIButton *)sender {
    [ExternalAppManager open:Email WithPolitician:self.politician];
}

- (IBAction)websiteButtonPushed:(UIButton *)sender {
    [ExternalAppManager open:WebBrowser WithPolitician:self.politician];
}

- (IBAction)addressButtonPushed:(id)sender {
    [ExternalAppManager open:Maps WithPolitician:self.politician];
}

- (void) requestDataForViewController
{
    
}

@end
