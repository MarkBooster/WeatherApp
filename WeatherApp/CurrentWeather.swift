//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Mark Booster on 04-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class CurrentWeather {
    
    private var _date: String!
    private var _cityName: String!
    private var _weatherType: String!
    private var _currentTemperature: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = currentDate
        
        return _date
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        
        return _currentTemperature
    }
    
}
