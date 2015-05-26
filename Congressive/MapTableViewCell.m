//
//  MapTableViewCell.m
//  Congressive
//
//  Created by Jessie Serrino on 5/25/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "MapTableViewCell.h"
#import <MapKit/MapKit.h>
#import "MapPin.h"

@interface MapTableViewCell()

@property (nonatomic, strong) FederalPolitician *politician;

@property (weak, nonatomic) IBOutlet UIView *paperView;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UIButton *addressButton;

@property (strong, nonatomic) CLGeocoder *geocoder;

@end

@implementation MapTableViewCell

- (void)awakeFromNib {

    [self configureMap];
    [self makeShadow];
}


- (void)prepareWithPolitician:(FederalPolitician *)politician
{
    _politician = politician;
//    self.addressButton.titleLabel.text = self.politician.office;
    [self configureMap];
}


- (void) makeShadow
{
    self.paperView.layer.masksToBounds = NO;
    //    self.headerBackgroundView.layer.cornerRadius = 8; // rounded corners
    self.paperView.layer.shadowOffset = CGSizeMake(1, 1);
    self.paperView.layer.shadowRadius = 5;
    self.paperView.layer.shadowOpacity = 0.5;
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


- (CLGeocoder *)geocoder
{
    if(!_geocoder)
    {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (IBAction)addressButtonPressed:(UIButton *)sender
{
    [ExternalAppManager open:Maps WithPolitician:self.politician];
}

@end
