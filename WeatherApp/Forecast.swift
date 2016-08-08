//
//  Forecast.swift
//  WeatherApp
//
//  Created by Mark Booster on 08-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemperature: String!
    private var _lowTemperature: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var highTemperature: String {
        if _highTemperature == nil {
            _highTemperature = ""
        }
        
        return _highTemperature
    }
    
    var lowTemperature: String {
        if _lowTemperature == nil {
            _lowTemperature = ""
        }
        
        return _lowTemperature
    }

}
