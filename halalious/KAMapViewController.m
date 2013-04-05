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
        [_map setZoomEnabled:YES];
        [_map setUserInteractionEnabled:YES];
        [_map setShowsUserLocation:YES];
        [[self view] addSubview:_map];
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
