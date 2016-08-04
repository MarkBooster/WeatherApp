//
//  Constants.swift
//  WeatherApp
//
//  Created by Mark Booster on 04-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import Foundation

//MARK: -Singleton

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGDITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "90265642db6f0fe7ccca12d416562822"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGDITUDE)128\(APP_ID)\(API_KEY)"


