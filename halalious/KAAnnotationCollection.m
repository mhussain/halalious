//
//  KAAnnotationCollection.m
//  halalious
//
//  Created by Mujtaba Hussain on 5/04/13.
//  Copyright (c) 2013 Khalida Apps. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NSArray+Blocks.h"

#import "KAAnnotationCollection.h"
#import <AFNetworking.h>

@interface KAAnnotationCollection ()

@property (nonatomic, retain) __block NSMutableArray *allPoints;
@property (nonatomic, retain) NSMutableArray *results;

@end

@implementation KAAnnotationCollection

@synthesize allPoints = _allPoints;
@synthesize results = _results;

-(id)init;
{
    self = [super init];
    
    if (self) {
        _allPoints = [[NSMutableArray alloc] init];
//        _results = [[NSMutableArray alloc] init];
//        NSError *__autoreleasing *e = nil;
        __block NSArray *temp;
        
//        NSURL *url = [NSURL URLWithString:@"http://api.sensis.com.au/ob-20110511/test/search?key=dguxft6bzk35e9znys9buruj&query=food&state=vic&productKeyword=Specialty:Halal"];
//        
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        AFJSONRequestOperation *operation = [AFJSONRequestOperation
//                                             JSONRequestOperationWithRequest:request
//                                             success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//                                                 NSLog(@"Status: %@", [JSON valueForKeyPath:@"code"]);
//                                                 NSLog(@"Count: %@", [JSON valueForKeyPath:@"count"]);
//                                                 NSLog(@"Query : %@", [JSON valueForKeyPath:@"originalQuery"]);
//
//                                                 temp = [NSMutableArray arrayWithArray:[JSON valueForKeyPath:@"results"]];
//                                                 
//                                             } failure:nil];
//        [operation start];
//        [operation waitUntilFinished];
        
        _results = [NSArray arrayWithArray:temp];
        
        [self loadAllPoints];
    }
    return self;
}

-(void)createAnnotations;
{
    NSLog(@"Count = %@", (unsigned long)[_results count]);
    [_results each:^(id item) {
        NSMutableDictionary *restaurant = [NSMutableDictionary dictionaryWithDictionary:item];
        NSLog(@"Restaurant name: %@", [restaurant objectForKey:@"name"]);
    }];
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

-(void)err;
{
    NSLog(@"I CAN HAZ ERRPR");
}

-(NSArray *)getAllPoints;
{
    return _allPoints;
}

@end
