//
//  KAMapViewController.m
//  halalious
//
//  Created by Mujtaba Hussain on 5/04/13.
//  Copyright (c) 2013 Khalida Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


#import "KAMapViewController.h"
#import "KAAnnotationCollection.h"
#import "NSArray+Blocks.h"

@interface KAMapViewController ()

@property (nonatomic, retain) MKMapView *map;
@property (nonatomic, retain) KAAnnotationCollection *collection;

@end

@implementation KAMapViewController

@synthesize collection = _collection;

@synthesize map = _map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _map = [[MKMapView alloc] initWithFrame:[[self view] bounds]];
        [self loadData];
        [_map setUserInteractionEnabled:YES];
        [_map setZoomEnabled:YES];
        [_map setShowsUserLocation:YES];        
        [_map setRegion:[self focusOnMelbourne] animated:YES];
        [_map addAnnotations:[_collection getAllPoints]];

        [[self view] addSubview:_map];
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [mapView setCenterCoordinate:[[userLocation location] coordinate] animated:YES];
}

-(void)loadData;
{
    NSURL *url = [NSURL URLWithString:@"http://api.sensis.com.au/ob-20110511/test/search?key=dguxft6bzk35e9znys9buruj&query=food&state=vic&productKeyword=Specialty:Halal"];
    
    __block NSMutableArray *data = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                             data = [NSMutableArray arrayWithArray:[JSON objectForKey:@"results"]];
                                             [self processData:data];
                                         } failure:nil];
    [operation start];
}

-(void)processData:(NSMutableArray *)data;
{
    
    [data each:^(id restaurant) {
        NSDictionary *address = [restaurant objectForKey:@"primaryAddress"];
        
        if((BOOL)[address objectForKey:@"mappable"]) {
            CLLocationCoordinate2D place;
            place.latitude = [[address objectForKey:@"latitude"] doubleValue];
            place.longitude = [[address objectForKey:@"longitude"] doubleValue];

            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
            [point setCoordinate:place];
            [point setTitle:[restaurant objectForKey:@"name"]];
            [point setSubtitle:[restaurant objectForKey:@"mediumDescriptor"]];
            [_map addAnnotation:point];
        }

    }];
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
}

@end
