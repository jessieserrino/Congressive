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

@import MapKit;


@interface UserDistrictViewController () <MKMapViewDelegate, UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) CLGeocoder *geocoder;

@property (strong, nonatomic) IBOutlet SpinningWheelView *loadingView;
@end

@implementation UserDistrictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    
    self.map.delegate = self;
    self.searchBar.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.loadingView.hidden = YES;
}

- (CLLocationManager *)locationManager
{
    if(!_locationManager)
    {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return _locationManager;
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender {
    
    
    self.loadingView.hidden = NO;
    
    
//    [self performSegueWithIdentifier: @"SegueToPoliticianList" sender:self];

    [[PoliticianProvider sharedProvider] loadPoliticiansFromLocation:self.map.centerCoordinate completion:^(NSDictionary *data) {
        if([[PoliticianInteractor sharedInteractor] politiciansWithData:data])
        {
            self.loadingView.hidden = YES;
            [self performSegueWithIdentifier: @"SegueToPoliticianList" sender:self];
        }
    } error:^(id data, NSError *error) {
        self.loadingView.hidden = YES;
        UIAlertController *uialert = [UIAlertController alertControllerWithTitle:@"Something went wrong." message:@"Sorry about that" preferredStyle:UIAlertControllerStyleAlert];
        [uialert addAction:[UIAlertAction
           actionWithTitle:@"Ok"
                     style:UIAlertActionStyleDefault
                   handler:^(UIAlertAction *action)
                     {
                     
                     }]];
        [self presentViewController:uialert animated:YES completion:nil];
    }];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *address = searchBar.text;
    [self.geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     for (CLPlacemark* aPlacemark in placemarks)
                     {
                            [self.map setCenterCoordinate:aPlacemark.location.coordinate];
                         // Process the placemark.
                     }
                 }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    PoliticianTableViewController *politicianVC = [segue destinationViewController];
}


@end
