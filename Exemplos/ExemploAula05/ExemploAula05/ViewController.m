//
//  ViewController.m
//  ExemploAula05
//
//  Created by Pedro Henrique on 07/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import <IconFontsKit/IconFontsKit.h>
@import MapKit;
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    
    [_mapa setShowsUserLocation:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
//        [_locationManager requestAlwaysAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *localizacao = [locations firstObject];
    CLLocationCoordinate2D coordenada = localizacao.coordinate;
    
    NSLog(@"Latitude: %f, Longitude: %f", coordenada.latitude, coordenada.longitude);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
