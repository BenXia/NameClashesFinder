//
//  Ben_LibClass.m
//  TestLib
//
//  Created by Ben on 5/22/14.
//  Copyright (c) 2014 PPTV. All rights reserved.
//

#import "Ben_LibClass.h"
#import <CoreGraphics/CoreGraphics.h>
#import <MapKit/MapKit.h>

@implementation Ben_LibClass

+ (NSString *)getLibString
{
    CGFloat components[4] = {0.2, 0.1, 0.5, 1.0};
    CGColorRef *color = CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    
    MKMapView *mapView = [[MKMapView alloc] init];
    
    return @"Ben_LibClass is a useless library class!";
}

@end
