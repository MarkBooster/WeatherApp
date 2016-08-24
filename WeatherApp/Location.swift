//
//  Location.swift
//  WeatherApp
//
//  Created by Mark Booster on 23-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    
}


