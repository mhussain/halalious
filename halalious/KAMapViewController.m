//
//  KAMapViewController.m
//  halalious
//
//  Created by Mujtaba Hussain on 5/04/13.
//  Copyright (c) 2013 Khalida Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "KAMapViewController.h"

@interface KAMapViewController ()

@property (nonatomic, retain) MKMapView *map;

@end

@implementation KAMapViewController

@synthesize map = _map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _map = [[MKMapView alloc] initWithFrame:[[self view] bounds]];
        [_map setUserInteractionEnabled:YES];
        [_map setZoomEnabled:YES];
        [_map setShowsUserLocation:YES];        
        [_map setRegion:[self focusOnMelbourne] animated:YES];

        [[self view] addSubview:_map];
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"updated");
}

-(MKCoordinateRegion)focusOnMelbourne;
{
//    -37.810326,144.963098
    MKCoordinateRegion melbourne;
    melbourne.center.latitude = -37.810326;
    melbourne.center.longitude = 144.963098;
    melbourne.span.latitudeDelta = 0.987654;
    melbourne.span.longitudeDelta = 0.987654;
    return melbourne;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_map setRegion:[self focusOnMelbourne] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
