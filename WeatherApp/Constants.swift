//
//  Constants.swift
//  WeatherApp
//
//  Created by Mark Booster on 04-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import Foundation

//MARK: - Singleton

let BASE_URL_CURRENT = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGDITUDE = "&lon="
let CNT = "&cnt="
let MODE_JSON = "&mode=json"
let APP_ID = "&appid="
let API_KEY = "90265642db6f0fe7ccca12d416562822"

//MARK: - URL

let CURRENT_WEATHER_URL = "\(BASE_URL_CURRENT)\(LATITUDE)35\(LONGDITUDE)139\(APP_ID)\(API_KEY)"

let FORECAST_URL = "\(BASE_URL_FORECAST)\(LATITUDE)35\(LONGDITUDE)128\(CNT)10\(MODE_JSON)\(APP_ID)\(API_KEY)"


//MARK: - Typealias

typealias DownloadComplete = () -> ()


