//
//  UserDistrictViewController.m
//  Congressive
//
//  Created by Jessie Serrino on 5/1/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "UserDistrictViewController.h"
#import "PoliticianTableViewController.h"
#import "SpinningWheelView.h"
#import "PoliticianProvider.h"
#import "PoliticianInteractor.h"
#import "BiographyProvider.h"
#import "BiographyInteractor.h"

@import MapKit;


@interface UserDistrictViewController () <MKMapViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinningWheel;

@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation UserDistrictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.map.delegate = self;
    
    self.searchBar.delegate = self;
    [self prepareLocationManager];
}

- (void) prepareLocationManager
{
    _locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    } else {
        // iOS 7 - We can't use requestWhenInUseAuthorization -- we'll get an unknown selector crash!
        // Instead, you just start updating location, and the OS will take care of prompting the user
        // for permissions.
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    // We only need to start updating location for iOS 8 -- iOS 7 users should have already
    // started getting location updates
    if (status == kCLAuthorizationStatusAuthorizedAlways ||
        status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [manager startUpdatingLocation];
        
        [self setMapCenter: manager.location.coordinate];
    }
    else
    {
        [self setMapCenter:CLLocationCoordinate2DMake(38.8977, -77.0366)];
    }
}

- (CLGeocoder *)geocoder
{
    if(!_geocoder)
    {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
    
}

- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender {
    self.doneButton.enabled = NO;
    [self.spinningWheel startAnimating];

    [[PoliticianProvider sharedProvider] loadPoliticiansFromLocation:self.map.centerCoordinate completion:^(NSDictionary *data) {
        [self.spinningWheel stopAnimating];
        if([[PoliticianInteractor sharedInteractor] politiciansWithData:data])
        {
            
            [self setError:NO];
            [self performSegueWithIdentifier: @"SegueToPoliticianList" sender:self];
        }
        else
        {
            [self setError:YES];
        }
        self.doneButton.enabled = YES;
        
    } error:^(id data, NSError *error) {
        [self.spinningWheel stopAnimating];
        UIAlertController *uialert = [UIAlertController alertControllerWithTitle:@"No Internet Connection" message:@"You appear to be offline. Please connect to Internet to proceed." preferredStyle:UIAlertControllerStyleAlert];
        [uialert addAction:[UIAlertAction
           actionWithTitle:@"Ok"
                     style:UIAlertActionStyleDefault
                   handler:^(UIAlertAction *action)
                     {
                     
                     }]];
        [self presentViewController:uialert animated:YES completion:nil];
        
        self.doneButton.enabled = YES;
    }];
    
}

- (void) setError: (BOOL) active
{
    self.errorLabel.hidden = !active;
}

- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSString *address = searchBar.text;
    [self.geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     if(placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         [self setMapCenter:placemark.location.coordinate];
                     }
                 }];
}


- (void) setMapCenter: (CLLocationCoordinate2D) coordinate
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];
    [self.map setRegion:adjustedRegion animated:YES];
}



@end
