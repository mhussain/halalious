//
//  KAAnnotationCollection.m
//  halalious
//
//  Created by Mujtaba Hussain on 5/04/13.
//  Copyright (c) 2013 Khalida Apps. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "KAAnnotationCollection.h"

@interface KAAnnotationCollection ()

@property (nonatomic, retain) NSMutableArray *allPoints;

@end

@implementation KAAnnotationCollection

@synthesize allPoints = _allPoints;

-(id)init;
{
    self = [super init];
    
    if (self) {
        _allPoints = [[NSMutableArray alloc] init];
        [self loadAllPoints];
    }
    return self;
}

-(void)loadAllPoints;
{    
    CLLocationCoordinate2D windsor;
    windsor.latitude = -37.848833;
    windsor.longitude = 145.004082;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    [point setCoordinate:windsor];
    [point setTitle:@"Windsor"];
    [point setSubtitle:@"Near St.Kilda"];
    [_allPoints addObject:point];
    
//    MKAnnotation * pin = MKAnnotation all
}

-(NSArray *)getAllPoints;
{
    return _allPoints;
}

@end
